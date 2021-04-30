mainnet-config = 
    disabled: false 
    decimals: 9
    txFee: '0.000005'
    txFeeOptions:
        auto: '0.000005'
        cheap: '0.000005'   
    messagePrefix: 'Ethereum'
    mask: '3000000000000000000000000000000000'
    api:  
        provider: 'solana'
        web3Provider: 'https://api.velas.com'
        url: 'https://native.velas.com',
        apiUrl: 'https://api.velas.com'
    networks:
        legacy:
            id: "legacy"
            name: "Velas"
            referTo             : "vlx2" 
        evm:
            id: "evm"
            name: "Velas EVM"
            referTo             : "vlx_evm" 
testnet-config = 
    decimals: 9
    txFee: '0.000005'
    txFeeOptions: 
        auto: '0.000005'
        cheap: '0.000005'   
    messagePrefix: 'Ethereum'
    mask: '3000000000000000000000000000000000'
    api: 
        provider: 'solana'
        web3Provider: 'https://explorer.testnet.velas.com/rpc'
        url: 'https://native.velas.com'
        apiUrl: 'https://explorer.testnet.velas.com/api'
        cluster: 'testnet'    
    networks:
        legacy:
            id: "legacy"
            name: "Velas"
            referTo             : "vlx2" 
        evm:
            id: "evm"
            name: "Velas EVM"
            referTo             : "vlx_evm"   
export mainnet = mainnet-config
export testnet = testnet-config       
export color = '#9E4FEB'
export type = 'coin'
export enabled = true
export name = 'Velas Native'
export token = 'vlx_native'
export nickname = 'vlx'
export image = 'data:image/png;base64,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'
export usdInfo = 'url(https://explorer.velas.com/ticker).price_usd'