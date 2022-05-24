var BN = require("bn.js").BN;
var bs58 = require("bs58");
var Layout =  require("./layout");
var BufferLayout = require("buffer-layout");
var out$ = typeof exports != 'undefined' && exports || this;
ref$ = require("buffer"), Buffer = ref$.Buffer;

var PublicKey;
PublicKey = (function(){
    PublicKey.displayName = 'PublicKey';
    var prototype = PublicKey.prototype, constructor = PublicKey;
    function PublicKey(value){
        var decoded;
        if (typeof value === 'string') {
            decoded = bs58.decode(value);
            if (decoded.length !== 32) {
                throw new Error('Invalid public key input');
            }
            this._bn = new BN(decoded);
        } else {
            this._bn = new BN(value);
        }
        if (this._bn.byteLength() > 32) {
            throw new Error('Invalid public key input');
        }
    }
    return PublicKey;
}());

var programId = function(){
    return new PublicKey('11111111111111111111111111111111');
}

const SYSTEM_INSTRUCTION_LAYOUTS = Object.freeze({
    Transfer: {
        index: 2,
        layout: BufferLayout.struct([
            BufferLayout.u32('instruction'),
            BufferLayout.ns64('lamports'),
        ]),
    },
    TransferWithSeed: {
        index: 11,
        layout: BufferLayout.struct([
            BufferLayout.u32('instruction'),
            BufferLayout.ns64('lamports'),
            Layout.rustString('seed'),
            Layout.publicKey('programId'),
        ]),
    },
});

function getAlloc(type, fields) {
    let alloc = 0;
    type.layout.fields.forEach((item) => {
        if (item.span >= 0) {
            alloc += item.span;
        } else if (typeof item.alloc === 'function') {
            alloc += item.alloc(fields[item.property]);
        }
    });
    return alloc;
}
function encodeData(type, fields) {
    const allocLength =
        type.layout.span >= 0 ? type.layout.span : getAlloc(type, fields);
    const data = Buffer.alloc(allocLength);
    const layoutFields = Object.assign({instruction: type.index}, fields);
    type.layout.encode(layoutFields, data);
    return data;
}

out$.TransactionInstruction = TransactionInstruction = class TransactionInstruction {
    /**
     * Public keys to include in this transaction
     * Boolean represents whether this pubkey needs to sign the transaction
     */
    //keys;

    /**
     * Program Id to execute
     */
    //programId;

    /**
     * Program input
     */
    //data = Buffer.alloc(0);

    constructor(opts) {
        this.data = Buffer.alloc(0);
        this.programId = opts.programId;
        this.keys = opts.keys;
        if (opts.data) {
            this.data = opts.data;
        }
    }
}


/**
 * Generate a transaction instruction that transfers lamports from one account to another
 */
module.exports.transfer = function(
    params
){
    let data;
    let keys;
    if ('basePubkey' in params) {
        const type = SYSTEM_INSTRUCTION_LAYOUTS.TransferWithSeed;
        data = encodeData(type, {
            lamports: params.lamports,
            seed: params.seed,
            programId: params.programId.toBuffer(),
        });
        keys = [
            {pubkey: params.fromPubkey, isSigner: false, isWritable: true},
            {pubkey: params.basePubkey, isSigner: true, isWritable: false},
            {pubkey: params.toPubkey, isSigner: false, isWritable: true},
        ];
    } else {
        const type = SYSTEM_INSTRUCTION_LAYOUTS.Transfer;
        data = encodeData(type, {lamports: params.lamports});
        keys = [
            {pubkey: params.fromPubkey, isSigner: true, isWritable: true},
            {pubkey: params.toPubkey, isSigner: false, isWritable: true},
        ];
    }

    return new TransactionInstruction({
        keys,
        programId: programId(),
        data,
    });
}

