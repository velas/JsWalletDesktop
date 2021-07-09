const velasSolanaWeb3 = require("../../web3t/providers/solana/index.cjs");
let PublicKey, Connection, StakeProgram, Authorized, Lockup, STAKE_INSTRUCTION_LAYOUTS, TransactionInstruction;
PublicKey = velasSolanaWeb3.PublicKey;
Connection = velasSolanaWeb3.Connection;
StakeProgram = velasSolanaWeb3.StakeProgram;
Authorized = velasSolanaWeb3.Authorized;
Lockup = velasSolanaWeb3.Lockup;
SystemProgram = velasSolanaWeb3.SystemProgram;
Transaction = velasSolanaWeb3.Transaction;
Account = velasSolanaWeb3.Account;
STAKE_INSTRUCTION_LAYOUTS = velasSolanaWeb3.STAKE_INSTRUCTION_LAYOUTS;
TransactionInstruction = velasSolanaWeb3.TransactionInstruction;

class VelasStaking {

    // validate options.authorization;
    constructor(options) {
        this.connection    = new Connection(options.NODE_HOST, 'singleGossip');
        this.authorization = {}
        this.sol           = 1000000000;
        this.min_stake     = 1;
        this.max_epoch     = '18446744073709551615';
        this.secretKey     = options.secretKey;
        this.accounts   = [];
        this.validators = [];
    }

    getAccountPublicKey() {
        return new PublicKey(this.authorization.publicKey)
    };

    setAccountPublicKey(publicKey) {
        this.authorization.publicKey = publicKey;
    }
    setAccountSecretKey(secretKey) {
        this.secretKey = secretKey;
    }

    async getCurrentEpochInfo() {
        const info = await this.connection.getEpochInfo();
        return info;
    }
    async getConfirmedBlocks(start_slot, end_slot) {
        return await this.connection.getConfirmedBlocks(start_slot, end_slot);
    }
    async getBlockProduction(identity) {
        return await this.connection.getBlockProduction(identity);
    }
    async getLeaderSchedule(identity) {
        return await this.connection.getLeaderSchedule(identity);
    }
    async getEpochSchedule() {
        return await this.connection.getEpochSchedule();
    }
    async getSlot() {
        return await this.connection.getSlot();
    }
    async getFirstAvailableBlock() {
        return await this.connection.getFirstAvailableBlock(); 
    }
    async getConfirmedBlock(slot) {
        return await this.connection.getConfirmedBlock(slot);
    }
    async getConfirmedBlocksWithLimit(slot, limit) {
        return await this.connection.getConfirmedBlocksWithLimit(slot, limit)
    }
    async getBlockTime(blockNum) {
        return this.connection.getBlockTime(blockNum);
    }

    async getStakeActivation(address) {
        try {
            const publicKey  = new PublicKey(address);
            const activation = await this.connection.getStakeActivation(publicKey);


            //activation.state    =  activation.state === "Inactive" ? "Not delegated" : activation.state;
            //activation.state    =  activation.state === "Active"   ? "Delegated"     : activation.state;

            activation.active   = activation.active;
            activation.inactive = activation.inactive;

            return activation;
        } catch(_) {
            return undefined;
        };
    };
    
    async splitStakeAccount(stakeAccount, splitStakePubkey, lamports){
        let transaction = new Transaction();
        const authorizedPubkey = this.getAccountPublicKey();
        const stakePubkey = new PublicKey(stakeAccount);
        const rent       = await this.connection.getMinimumBalanceForRentExemption(200);
        let seed = await this.getNextSeed();
        const params = {
            stakePubkey,
            authorizedPubkey,
            splitStakePubkey,
            lamports: lamports + rent,
            seed,
            base: authorizedPubkey
        };
        
        try {
            transaction.add(StakeProgram.split(params));
        } catch (e) {
            return {
                error: "split_stake_account_error",
                description: e.message,
            };    
        }
        return this.sendTransaction(transaction);
    }

    async getVoteAccounts() {
        const voteAccounts = await this.connection.getVoteAccounts();
        const validators = voteAccounts.current.concat(voteAccounts.delinquent);
        return validators;
    };

    async getStakingValidators() {
        const voteAccounts = await this.connection.getVoteAccounts();

        const validators = voteAccounts.current.concat(voteAccounts.delinquent);

        for (var i in validators) {
            validators[i].key   = validators[i].votePubkey;
            validators[i].stake = `${ Math.round((validators[i].activatedStake / this.sol) * 100) / 100} VLX`;
        };

        return validators;
    };

    async withdraw(account, amount = 10000002282880) {

        const transaction = new Transaction();

        try {
            const authorizedPubkey = this.getAccountPublicKey();
            const stakePubkey = new PublicKey(account);

            transaction.add(StakeProgram.withdraw({
                authorizedPubkey,
                stakePubkey,
                lamports: amount,
                toPubkey: authorizedPubkey,
            }));
        } catch(e) {
            return {
                error: "prepare_transaction_error",
                description: e.message,
            };
        };

        return this.sendTransaction(transaction);
    };

    async undelegate(account) {

        const transaction = new Transaction();

        try {
            const authorizedPubkey = this.getAccountPublicKey();
            const stakePubkey      = new PublicKey(account);

            transaction.add(StakeProgram.deactivate({
                authorizedPubkey,
                stakePubkey,
            }));
        } catch(e) {
            return {
                error: "prepare_transaction_error",
                description: e.message,
            };
        };

        return this.sendTransaction(transaction);
    };

    async delegate(account, validator) {

        const transaction = new Transaction();

        try {
            const authorizedPubkey = this.getAccountPublicKey();
            const stakePubkey = new PublicKey(account);
            const votePubkey = new PublicKey(validator);

            transaction.add(StakeProgram.delegate({
                authorizedPubkey,
                stakePubkey,
                votePubkey,
            }));
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
    
    async createNewStakeAccountWithSeed(){

        let stakeAccountWithSeed;

        try {
            const seed       = await this.getNextSeed();

            stakeAccountWithSeed = await PublicKey.createWithSeed(
                this.getAccountPublicKey(),
                seed,
                StakeProgram.programId,
            );

        } catch(e) {
            return {
                error: "prepare_transaction_error",
                description: e.message,
            };
        };

        return stakeAccountWithSeed;   
    }

    async createAccount(amount_sol = (this.min_stake * this.sol)) {

        // check balance and amount

        const transaction = new Transaction();

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
            
            const config = {
                authorized,
                basePubkey: fromPubkey,
                fromPubkey,
                lamports,
                lockup,
                seed,
                stakePubkey: stakeAccountWithSeed,
            };

            transaction.add(StakeProgram.createAccountWithSeed(config));
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

    async getOwnStakingAccounts(accounts) {
        var ref$, ref1$, ref2$, ref3$, ref4$, ref5$;
        let owner = this.getAccountPublicKey();
        accounts = accounts.filter(item => {
            if (deepEq$(typeof item != 'undefined' && item !== null ? (ref$ = item.account) != null ? (ref1$ = ref$.data) != null ? (ref2$ = ref1$.parsed) != null ? (ref3$ = ref2$.info) != null ? (ref4$ = ref3$.meta) != null ? (ref5$ = ref4$.authorized) != null ? ref5$.staker : void 8 : void 8 : void 8 : void 8 : void 8 : void 8 : void 8, owner.toBase58(), '===')) {
                return true;
            }
            return false;
        });
        return accounts;
    }

    async getStakingAccountBySeed(seed) {
        var  ref$, ref1$, ref2$, ref3$, ref4$, ref5$;
        let owner = this.getAccountPublicKey();
        let accounts = await this.getParsedProgramAccounts();
        accounts = accounts.filter(item => {
            if (deepEq$(typeof item != 'undefined' && item !== null ? (ref$ = item.account) != null ? (ref1$ = ref$.data) != null ? (ref2$ = ref1$.parsed) != null ? (ref3$ = ref2$.info) != null ? (ref4$ = ref3$.meta) != null ? (ref5$ = ref4$.authorized) != null ? ref5$.staker : void 8 : void 8 : void 8 : void 8 : void 8 : void 8 : void 8, owner.toBase58(), '===')) {
                return true;
            }
            return false;
        });
        for (var i in accounts) {
            accounts[i].seed    = await this.checkSeed(accounts[i].pubkey.toBase58());
            accounts[i].address = accounts[i].pubkey.toBase58();
            accounts[i].key     = accounts[i].address;
            if(accounts[i].seed === "stake:"+seed){
                return accounts[i]
            }
        }
        return null;
    }

    async getStakingAccounts(accounts) {
        var  ref$, ref1$, ref2$, ref3$, ref4$, ref5$;
        console.log("[getStakingAccounts]")
        let owner = this.getAccountPublicKey();
        console.log("owner", owner)

        accounts = accounts.filter(item => {
            if (deepEq$(typeof item != 'undefined' && item !== null ? (ref$ = item.account) != null ? (ref1$ = ref$.data) != null ? (ref2$ = ref1$.parsed) != null ? (ref3$ = ref2$.info) != null ? (ref4$ = ref3$.meta) != null ? (ref5$ = ref4$.authorized) != null ? ref5$.staker : void 8 : void 8 : void 8 : void 8 : void 8 : void 8 : void 8, owner.toBase58(), '===')) {
                return true;
            }
            return false;
        });

        for (var i in accounts) {
            var rent, ref$, ref1$, ref2$, ref3$, ref4$;
            rent = (ref$ = accounts[i].account) != null ? (ref1$ = ref$.data) != null ? (ref2$ = ref1$.parsed) != null ? (ref3$ = ref2$.info) != null ? (ref4$ = ref3$.meta) != null ? ref4$.rentExemptReserve : void 8 : void 8 : void 8 : void 8 : void 8;
            accounts[i].seed    = await this.checkSeed(accounts[i].pubkey.toBase58());
            accounts[i].address = accounts[i].pubkey.toBase58();
            accounts[i].key     = accounts[i].address;
            accounts[i].balance = rent ? `${(Math.round((accounts[i].account.lamports - rent) / this.sol) * 100) / 100 } VLX` : `-`;
            accounts[i].rent    = rent ? `${ Math.round((rent / this.sol) * 100) / 100 } VLX` : `-`;
            accounts[i].status  = `inactive`;
            accounts[i].validator = `-`;

            if ((ref$ = accounts[i].account) != null && ((ref1$ = ref$.data) != null && ((ref2$ = ref1$.parsed) != null && ((ref3$ = ref2$.info) != null && ref3$.stake)))) {
                const activationEpoch = Number((ref$ = accounts[i].account) != null ? (ref1$ = ref$.data) != null ? (ref2$ = ref1$.parsed) != null ? (ref3$ = ref2$.info) != null ? ref3$.stake.delegation.activationEpoch : void 8 : void 8 : void 8 : void 8);
                const deactivationEpoch = Number((ref$ = accounts[i].account) != null ? (ref1$ = ref$.data) != null ? (ref2$ = ref1$.parsed) != null ? (ref3$ = ref2$.info) != null ? ref3$.stake.delegation.deactivationEpoch : void 8 : void 8 : void 8 : void 8);

                if (deactivationEpoch > activationEpoch || activationEpoch === this.max_epoch) {
                    accounts[i].status    = `loading`;
                    if((ref4$ = ref3$.delegation) != null) {
                        accounts[i].validator = ref4$.voter;
                    }
                };
            };
        };
        
        this.accounts = accounts;

        return accounts;
    };
    
    async getParsedProgramAccounts(){
        const accounts = await this.connection.getParsedProgramAccounts(StakeProgram.programId);
        const delegators = {};
        for (var a in accounts) {
            var ref$, ref1$, ref2$, ref3$, ref4$, ref5$;
            if (((ref$ = accounts[a].account) != null ? (ref1$ = ref$.data) != null ? (ref2$ = ref1$.parsed) != null ? (ref3$ = ref2$.info) != null ? (ref4$ = ref3$.stake) != null ? ref4$.delegation : void 8 : void 8 : void 8 : void 8 : void 8) != null) {
                const voter = (ref$ = accounts[a].account) != null ? (ref1$ = ref$.data) != null ? (ref2$ = ref1$.parsed) != null ? (ref3$ = ref2$.info) != null ? (ref4$ = ref3$.stake) != null ? (ref5$ = ref4$.delegation) != null ? ref5$.voter : void 8 : void 8 : void 8 : void 8 : void 8 : void 8;
                const activationEpoch = Number(ref5$.activationEpoch || 0);
                const deactivationEpoch = Number(ref5$.deactivationEpoch || 0);

                if (voter && (deactivationEpoch > activationEpoch || activationEpoch === this.max_epoch)) {
                    delegators[voter] = delegators[voter] ? delegators[voter] + 1 : 1;
                }
                ;
            }
        }; 
        return accounts;
    }
    
    async getInfo() {
        const accounts = await this.connection.getParsedProgramAccounts(StakeProgram.programId);
        console.log("accounts", accounts)
        const delegators = {};
        const stakes     = {};

        for (var a in accounts) {
            var ref$, ref1$, ref2$, ref3$, ref4$, ref5$;
            if (((ref$ = accounts[a].account) != null ? (ref1$ = ref$.data) != null ? (ref2$ = ref1$.parsed) != null ? (ref3$ = ref2$.info) != null ? (ref4$ = ref3$.stake) != null ? ref4$.delegation : void 8 : void 8 : void 8 : void 8 : void 8) != null) {
                const voter = (ref$ = accounts[a].account) != null ? (ref1$ = ref$.data) != null ? (ref2$ = ref1$.parsed) != null ? (ref3$ = ref2$.info) != null ? (ref4$ = ref3$.stake) != null ? (ref5$ = ref4$.delegation) != null ? ref5$.voter : void 8 : void 8 : void 8 : void 8 : void 8 : void 8;
                const activationEpoch = Number(ref5$.activationEpoch || 0);
                const deactivationEpoch = Number(ref5$.deactivationEpoch || 0);

                if (voter && (deactivationEpoch > activationEpoch || activationEpoch === this.max_epoch)) {
                    delegators[voter] = delegators[voter] ? delegators[voter] + 1 : 1;
                }
                ;
            }
        };
        this.accounts   = await this.getStakingAccounts(accounts);
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
       
        const payAccount = new Account(this.secretKey);
        let result = await this.connection.sendTransaction(
            transaction,
            [payAccount]
        );
        console.log("result !", result);
         
        return result;
        
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

function deepEq$(x, y, type){
    var toString = {}.toString, hasOwnProperty = {}.hasOwnProperty,
        has = function (obj, key) { return hasOwnProperty.call(obj, key); };
    var first = true;
    return eq(x, y, []);
    function eq(a, b, stack) {
        var className, length, size, result, alength, blength, r, key, ref, sizeB;
        if (a == null || b == null) { return a === b; }
        if (a.__placeholder__ || b.__placeholder__) { return true; }
        if (a === b) { return a !== 0 || 1 / a == 1 / b; }
        className = toString.call(a);
        if (toString.call(b) != className) { return false; }
        switch (className) {
            case '[object String]': return a == String(b);
            case '[object Number]':
                return a != +a ? b != +b : (a == 0 ? 1 / a == 1 / b : a == +b);
            case '[object Date]':
            case '[object Boolean]':
                return +a == +b;
            case '[object RegExp]':
                return a.source == b.source &&
                    a.global == b.global &&
                    a.multiline == b.multiline &&
                    a.ignoreCase == b.ignoreCase;
        }
        if (typeof a != 'object' || typeof b != 'object') { return false; }
        length = stack.length;
        while (length--) { if (stack[length] == a) { return true; } }
        stack.push(a);
        size = 0;
        result = true;
        if (className == '[object Array]') {
            alength = a.length;
            blength = b.length;
            if (first) {
                switch (type) {
                    case '===': result = alength === blength; break;
                    case '<==': result = alength <= blength; break;
                    case '<<=': result = alength < blength; break;
                }
                size = alength;
                first = false;
            } else {
                result = alength === blength;
                size = alength;
            }
            if (result) {
                while (size--) {
                    if (!(result = size in a == size in b && eq(a[size], b[size], stack))){ break; }
                }
            }
        } else {
            if ('constructor' in a != 'constructor' in b || a.constructor != b.constructor) {
                return false;
            }
            for (key in a) {
                if (has(a, key)) {
                    size++;
                    if (!(result = has(b, key) && eq(a[key], b[key], stack))) { break; }
                }
            }
            if (result) {
                sizeB = 0;
                for (key in b) {
                    if (has(b, key)) { ++sizeB; }
                }
                if (first) {
                    if (type === '<<=') {
                        result = size < sizeB;
                    } else if (type === '<==') {
                        result = size <= sizeB
                    } else {
                        result = size === sizeB;
                    }
                } else {
                    first = false;
                    result = size === sizeB;
                }
            }
        }
        stack.pop();
        return result;
    }
}

module.exports = VelasStaking;