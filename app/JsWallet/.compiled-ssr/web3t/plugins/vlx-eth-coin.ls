mainnet-config =
    disabled: no 
    decimals: 18
    tx-fee: \0.0014
    tx-fee-options:
        auto: \0.0020
        cheap: \0.00014
    message-prefix: 'Ethereum'
    mask: \0x0000000000000000000000000000000000000000
    txBridgeFeeIn: "vlx_evm"
    txFeeIn: "vlx_evm"
    
    address: "0x85219708c49aa701871Ad330A94EA0f41dFf24Ca"
    FOREIGN_BRIDGE       : "0x69Eb299cf9D9E09aD40630c691D65fF5B1B078e0"
    FOREIGN_BRIDGE_TOKEN : "0x85219708c49aa701871Ad330A94EA0f41dFf24Ca" 
    
    api:
        provider: \velas_eth    
        web3Provider: 'https://evmexplorer.velas.com/rpc',
        url: 'https://evmexplorer.velas.com',
        apiUrl: 'https://evmexplorer.velas.com/api'
    group: "Velas"
    
    networks:
        eth:
            id: "eth"
            name: "Ethereum (ETH)"
            referTo: "eth"

testnet-config =
    disabled: no 
    decimals: 18
    tx-fee: \0.0014
    tx-fee-options:
        auto: \0.0020
        cheap: \0.0020
    message-prefix: 'Ethereum'
    mask: \0x0000000000000000000000000000000000000000
    txBridgeFeeIn: "vlx_evm"
    txFeeIn: "vlx_evm"
    
    address: "0x3538C7f88aDbc8ad1F435f7EA70287e26b926344"    
    
    FOREIGN_BRIDGE       : "0xA5D512085006867974405679f2c9476F4F7Fa903"
    FOREIGN_BRIDGE_TOKEN : "0x3538C7f88aDbc8ad1F435f7EA70287e26b926344"  
    
    api:
        provider: \velas_eth 
        web3Provider: 'https://evmexplorer.testnet.velas.com/rpc',
        url: 'https://evmexplorer.testnet.velas.com',
        apiUrl: 'https://evmexplorer.testnet.velas.com/api'

    group: "Velas"

    networks:
        eth:
            id: "eth"
            name: "Ethereum (ETH)"
            referTo: "eth"   

export mainnet =  mainnet-config
export testnet = testnet-config
export color = \#9E4FEB
export type = \coin
export enabled = yes  
export name = 'Ethereum'
export wallet-index = 4
export token = \vlx_eth   
export nickname = \eth 
export market = "https://api.coinmarketcap.com/data-api/v3/cryptocurrency/detail/chart?id=4747&range=ALL" 
export image = "data:image/png;base64,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"
export usd-info = "url(https://explorer.velas.com/ticker).eth_price"