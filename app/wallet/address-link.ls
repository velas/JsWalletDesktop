get-address-label = (wallet)->
    | wallet.coin.token in <[ xem eos ]> => \account
    | _ => \address
export get-address-link = (wallet)->
    | typeof! wallet?address is \String => "#{wallet.network.api.url}/#{get-address-label(wallet)}/#{wallet.address}"
    | typeof! wallet?address is \Null and wallet.public-key? =>  wallet.network.register-account-link.replace(':public-key', wallet.public-key)
    | _ => "#"
export get-address-title = (wallet)->
    | typeof! wallet?address is \String => wallet.address
    | typeof! wallet?address is \Null => "Register Your Account"
    | _ => "Unknown Address"