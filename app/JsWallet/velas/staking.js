const velasSolanaWeb3 = require("../../web3t/providers/solana/index.cjs");
let PublicKey, Connection, StakeProgram, Authorized, Lockup;
PublicKey = velasSolanaWeb3.PublicKey;
Connection = velasSolanaWeb3.Connection;
StakeProgram = velasSolanaWeb3.StakeProgram;
Authorized = velasSolanaWeb3.Authorized;
Lockup = velasSolanaWeb3.Lockup;

class Staking {

    // validate options.authorization;
    constructor(options) {
        this.connection    = new Connection(options.NODE_HOST, 'singleGossip');
        this.authorization = {}
        this.sol           = 1000000000;
        this.min_stake     = 10000;
        this.max_epoch     = '18446744073709551615';

        this.accounts   = [];
        this.validators = [];
    }

    getAccountPublicKey() {
        return new PublicKey(this.authorization.publicKey)
    };

    setAccountPublicKey(publicKey) {
        this.authorization.publicKey = publicKey;
    }

    async getStakeActivation(address) {
        try {
            const publicKey  = new PublicKey(address);
            const activation = await this.connection.getStakeActivation(publicKey);


            activation.state    =  activation.state.charAt(0).toUpperCase() + activation.state.slice(1);
            activation.state    =  activation.state === "Inactive" ? "Not delegated" : activation.state;
            activation.state    =  activation.state === "Active"   ? "Delegated"     : activation.state;

            activation.active   = `${ Math.round((activation.active / this.sol) * 100) / 100} VLX`;
            activation.inactive = `${ Math.round((activation.inactive / this.sol) * 100) / 100} VLX`;

            return activation;
        } catch(_) {
            return undefined;
        };
    };

    async getStakingValidators() {
        console.log("[getStakingValidators]")
        const voteAccounts = await this.connection.getVoteAccounts();
        console.log("vote accoutns",voteAccounts)

        const validators = voteAccounts.current.concat(voteAccounts.delinquent);

        for (var i in validators) {
            validators[i].key   = validators[i].votePubkey;
            validators[i].stake = `${ Math.round((validators[i].activatedStake / this.sol) * 100) / 100} VLX`;
        };

        return validators;
    };

    async withdraw(account, amount = 10000002282880) {

        let transaction;

        try {
            const authorizedPubkey = this.getAccountPublicKey();
            const stakePubkey = new PublicKey(account);

            transaction = StakeProgram.withdraw({
                authorizedPubkey,
                stakePubkey,
                lamports: amount,
                toPubkey: authorizedPubkey,
            });
        } catch(e) {
            return {
                error: "prepare_transaction_error",
                description: e.message,
            };
        };

        return this.sendTransaction(transaction);
    };

    async undelegate(account) {

        let transaction;

        try {
            const authorizedPubkey = this.getAccountPublicKey();
            const stakePubkey      = new PublicKey(account);

            transaction = StakeProgram.deactivate({
                authorizedPubkey,
                stakePubkey,
            });
        } catch(e) {
            return {
                error: "prepare_transaction_error",
                description: e.message,
            };
        };

        return this.sendTransaction(transaction);
    };

    async delegate(account, validator) {

        let transaction;

        try {
            const authorizedPubkey = this.getAccountPublicKey();
            const stakePubkey = new PublicKey(account);
            const votePubkey = new PublicKey(validator);

            transaction = StakeProgram.delegate({
                authorizedPubkey,
                stakePubkey,
                votePubkey,
            });
        } catch(e) {
            return {
                error: "prepare_transaction_error",
                description: e.message,
            };
        };

        return this.sendTransaction(transaction);
    };

    async getNextSeed() {
        const fromPubkey = this.getAccountPublicKey();

        for (let i = 0; i < 1000; i++) {
            const stakeAccountWithSeed = await PublicKey.createWithSeed(
                fromPubkey,
                i.toString(),
                StakeProgram.programId,
            );

            if (this.accounts.filter(item => { return item.address === stakeAccountWithSeed.toBase58()}).length === 0) {
                return i.toString();
            };
        };
    };

    async createAccount(amount_sol = (this.min_stake * this.sol)) {

        // check balance and amount

        let transaction;

        try {
            const rent       = await this.connection.getMinimumBalanceForRentExemption(200);
            const fromPubkey = this.getAccountPublicKey();
            const authorized = new Authorized(fromPubkey, fromPubkey);
            const lamports   = amount_sol + rent;
            const seed       = await this.getNextSeed();

            const stakeAccountWithSeed = await PublicKey.createWithSeed(
                fromPubkey,
                seed,
                StakeProgram.programId,
            );

            const lockup = new Lockup(0,0, fromPubkey);

            transaction = StakeProgram.createAccountWithSeed({
                authorized,
                basePubkey: fromPubkey,
                fromPubkey,
                lamports,
                lockup,
                seed,
                stakePubkey: stakeAccountWithSeed,
            });
        } catch(e) {
            return {
                error: "prepare_transaction_error",
                description: e.message,
            };
        };

        return this.sendTransaction(transaction);
    };

    async checkSeed(base58PublicKey) {
        const fromPubkey = this.getAccountPublicKey();
        for (let i = 0; i < 1000; i++) {
            const stakeAccountWithSeed = await PublicKey.createWithSeed(
                fromPubkey,
                i.toString(),
                StakeProgram.programId,
            );
            if (stakeAccountWithSeed.toBase58() === base58PublicKey) return `stake:${i}`;
        };
        return base58PublicKey.slice(0,6);
    };

    async getStakingAccounts(accounts) {
        console.log("[getStakingAccounts]")
        let owner = this.getAccountPublicKey();
        console.log("owner", owner)

        accounts = accounts.filter(item => {
            if (item?.account?.data?.parsed?.info?.meta?.authorized?.staker === owner.toBase58()) return true;
            return false;
        });

        for (var i in accounts) {
            const rent = accounts[i].account?.data?.parsed?.info?.meta?.rentExemptReserve;
            accounts[i].seed    = await this.checkSeed(accounts[i].pubkey.toBase58());
            accounts[i].address = accounts[i].pubkey.toBase58();
            accounts[i].key     = accounts[i].address;
            accounts[i].balance = rent ? `${(Math.round((accounts[i].account.lamports - rent) / this.sol) * 100) / 100 } VLX` : `-`;
            accounts[i].rent    = rent ? `${ Math.round((rent / this.sol) * 100) / 100 } VLX` : `-`;
            accounts[i].status  = `Not delegated`;
            accounts[i].validator = `-`;

            if (accounts[i].account?.data?.parsed?.info?.stake) {
                const activationEpoch   = Number(accounts[i].account?.data?.parsed?.info?.stake.delegation.activationEpoch);
                const deactivationEpoch = Number(accounts[i].account?.data?.parsed?.info?.stake.delegation.deactivationEpoch);

                if (deactivationEpoch > activationEpoch || activationEpoch === this.max_epoch) {
                    accounts[i].status    = `loading`;
                    accounts[i].validator = accounts[i].account?.data?.parsed?.info?.stake?.delegation?.voter;
                };
            };
        };

        return accounts;
    };

    async getInfo() {
        const accounts = await this.connection.getParsedProgramAccounts(StakeProgram.programId);
        console.log("accounts", accounts)
        const delegators = {};
        const stakes     = {};

        for (var a in accounts) {
            const voter             =        accounts[a].account?.data?.parsed?.info?.stake?.delegation?.voter
            const activationEpoch   = Number(accounts[a].account?.data?.parsed?.info?.stake?.delegation?.activationEpoch   || 0);
            const deactivationEpoch = Number(accounts[a].account?.data?.parsed?.info?.stake?.delegation?.deactivationEpoch || 0);

            if (voter && (deactivationEpoch > activationEpoch || activationEpoch === this.max_epoch)) {
                delegators[voter] = delegators[voter] ? delegators[voter] + 1 : 1;
            };
        };
        console.log("delegators", delegators)
        this.accounts   = await this.getStakingAccounts(accounts);
        console.log("this.accounts", this.accounts)
        this.validators = await this.getStakingValidators();

        for (var s in this.accounts) {
            if (this.accounts[s].validator !== '-') {
                if (!stakes[this.accounts[s].validator]) stakes[this.accounts[s].validator] = [];

                stakes[this.accounts[s].validator].push({
                    key:  this.accounts[s].key,
                    seed: this.accounts[s].seed,
                });
            };
        };

        for (var i in this.validators) {
            this.validators[i].delegators = delegators[this.validators[i].votePubkey] || 0;
            this.validators[i].stakes     = stakes[this.validators[i].votePubkey] || [];
        };

        return {
            accounts: this.accounts,
            validators: this.validators,
        };
    };

    async sendTransaction(transaction) {
        try {
            const feePayer      = this.getAccountPublicKey();
            const { blockhash } = await this.connection.getRecentBlockhash();

            transaction.recentBlockhash = blockhash;
            transaction.feePayer        = feePayer;

        } catch(e) {
            return {
                error: "cunstruct_transaction_error",
                description: e.message,
            };
        };

        return new Promise((resolve) => {
            // this.client.sendTransaction( this.authorization.access_token, { transaction: transaction.serializeMessage() }, (err, result) => {
            //     if (err) {
            //         resolve(err);
            //     } else {
            //         resolve(result);
            //     };
            // });
        });
    };

    async userinfo() {
        return new Promise((resolve) => {
            // this.client.userinfo(this.authorization.access_token, (err, result) => {
            //     if (err) {
            //         resolve(err);
            //     } else {
            //         resolve(result);
            //     }
            //     ;
            // })
        });
    };
};

module.exports = Staking;