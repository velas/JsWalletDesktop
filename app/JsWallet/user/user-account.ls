require! {
    \prelude-ls : { map, split, filter, find, foldl, sort-by, unique, head, each }
}
export get-token-balance = (store, token)->
    wallet =
        store.current.account.wallets
            |> find -> it.coin.token is token
    wallet.balance