export mainnet =
    decimals: 18
    tx-fee: \0.0014
    tx-fee-options:
        auto: \0.0014
        cheap: \0.00014
    message-prefix: 'Ethereum'
    mask: \0x0000000000000000000000000000000000000000
    api:
        provider: \eth
        web3Provider : \https://ethereumclassic.network
        url : \http://gastracker.io
        address-sub-url: \addr
        apiUrl : \https://api.etherscan.io/api
export testnet =
    decimals: 18
    disabled: yes
    tx-fee: \0.0014
    tx-fee-options:
        auto: \0.0014
        cheap: \0.00014
    message-prefix: 'Ethereum'
    mask: \0x0000000000000000000000000000000000000000
    api:
        provider: \eth
        web3Provider : \https://ropsten.infura.io/UoCkF4efTrbEGU8Qpcs0
        url : \https://ropsten.etherscan.io
        apiUrl : \https://api-ropsten.etherscan.io/api
export color = \#71DF8F
export type = \coin
export enabled = yes
export name = 'Ethereum Classic'
export token = \etc
export image = "data:image/png;base64,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"
export usd-info = "url(https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,LTC,DASH,XEM,USDT,ETC&tsyms=USD).ETC.USD"
