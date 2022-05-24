"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.getAlloc = exports.lockup = exports.authorized = exports.rustString = exports.uint64 = exports.publicKey = void 0;
var buffer_1 = require("buffer");
var BufferLayout = require("buffer-layout");
/**
 * Layout for a public key
 */
exports.publicKey = function (property) {
    if (property === void 0) { property = 'publicKey'; }
    return BufferLayout.blob(32, property);
};
/**
 * Layout for a 64bit unsigned value
 */
exports.uint64 = function (property) {
    if (property === void 0) { property = 'uint64'; }
    return BufferLayout.blob(8, property);
};
/**
 * Layout for a Rust String type
 */
exports.rustString = function (property) {
    if (property === void 0) { property = 'string'; }
    var rsl = BufferLayout.struct([
        BufferLayout.u32('length'),
        BufferLayout.u32('lengthPadding'),
        BufferLayout.blob(BufferLayout.offset(BufferLayout.u32(), -8), 'chars'),
    ], property);
    var _decode = rsl.decode.bind(rsl);
    var _encode = rsl.encode.bind(rsl);
    rsl.decode = function (buffer, offset) {
        var data = _decode(buffer, offset);
        return data.chars.toString('utf8');
    };
    rsl.encode = function (str, buffer, offset) {
        var data = {
            chars: buffer_1.Buffer.from(str, 'utf8'),
        };
        return _encode(data, buffer, offset);
    };
    rsl.alloc = function (str) {
        return (BufferLayout.u32().span +
            BufferLayout.u32().span +
            buffer_1.Buffer.from(str, 'utf8').length);
    };
    return rsl;
};
/**
 * Layout for an Authorized object
 */
exports.authorized = function (property) {
    if (property === void 0) { property = 'authorized'; }
    return BufferLayout.struct([exports.publicKey('staker'), exports.publicKey('withdrawer')], property);
};
/**
 * Layout for a Lockup object
 */
exports.lockup = function (property) {
    if (property === void 0) { property = 'lockup'; }
    return BufferLayout.struct([
        BufferLayout.ns64('unixTimestamp'),
        BufferLayout.ns64('epoch'),
        exports.publicKey('custodian'),
    ], property);
};
function getAlloc(type, fields) {
    var alloc = 0;
    type.layout.fields.forEach(function (item) {
        if (item.span >= 0) {
            alloc += item.span;
        }
        else if (typeof item.alloc === 'function') {
            alloc += item.alloc(fields[item.property]);
        }
    });
    return alloc;
}
exports.getAlloc = getAlloc;
