require! {
    \react
    \react-dom
    \bignumber.js
    \../../get-primary-info.ls
    \../../get-lang.ls
    \../../history-funcs.ls
    \../../stake-funcs.ls : { query-pools }
    \../icon.ls
    \prelude-ls : { map, split, filter, find, foldl, sort-by, unique, head, each }
    \../../math.ls : { div, times, plus, minus }
    \../../../web3t/providers/deps.js : { hdkey, bip39 }
    \md5
    \safe-buffer : { Buffer }
    \../../../web3t/addresses.js : { ethToVlx }
    \../../round-human.ls
    \./request-stake.ls
    \../../components/checkbox.ls
    \../../icons.ls
    \../placeholder.ls
    \../../staking/can-make-staking.ls
    \../../components/button.ls
    \../../components/address-holder.ls
    \../alert-txn.ls
    \../../components/amount-field.ls
    \../../seed.ls : seedmem
    \moment
}
txs-content = (store, web3t)->
    react.create-element 'div', { className: 'history-content' }
txs-history = ({ store, web3t })->
    react.create-element 'div', { className: 'section' }, children = 
        react.create-element 'div', { className: 'title' }, children = 
            react.create-element 'h3', {}, ' History'
        react.create-element 'div', { className: 'description' }, children = 
            txs-content store, web3t
module.exports = txs-history