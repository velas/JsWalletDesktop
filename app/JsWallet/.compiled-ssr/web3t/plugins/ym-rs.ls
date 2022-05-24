#require! {
#    \../config-public.json : { web3stable: { url } }
#}
url = \https://royalswap.com
export mainnet =
    decimals: 2
    tx-fee: 0
    tx-fee-options:
        withdraw: "50 + 2%"
    message-prefix: 'Ethereum'
    mask: \0x0000000000000000000000000000000000000000
    api:
        provider: \rst
        url : "#{url}/fiat/explorer"
        apiUrl : "#{url}/fiat-token/ym_rs"
        web3Provider : "#{url}/fiat-token/ym_rs"
export testnet =
    disabled: yes
export color = \#F8C600
export type = \coin
export enabled = yes
export token = \ym_rs
export image = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAMAAACahl6sAAAAdVBMVEX/////zADZrQAAAADdsAD9ygDltwD5xwDhtADvvwDywQDesQD2xADouQDrvADtvQAOCwDBmgDPpQAfGABlUAC3kgCsiQC+mACnhQCTdQBjTwAmHgChgABvWACCaAB+ZAB0XABBNABPPwBVRAAaFACzjwA/MgAt6XdQAAAD6ElEQVR4nO3b6U7bUBAFYG6cxNkJWykpgUIp7/+IBdSWYN99mzNXM78ty5/G9jmOlLMzGZnRKOoLyDSqEYhqBKLagCjVBkQ1AlFtQJRqA6Iagag2IEq1AVGNQFQjkKGDKWTEYArROFhCdA6GEC2DIcTgYAcxOZhBjAxmEIuDFcTm4ASxOvhA7Aw+EJeDC8Tp4AFxM3hAfBwcIF4OfIgfAx/i60CHeDvAIf4OaEgAAxoS5ACGhDlgIYEMWEiwAxQS7oCERDAgIVEOQEicAw8S6UCDxDLQIPEOLEiCAwmSwkCCpDlwIIkOFEgqAwWS7sCAZHAgQHIwECB5HPSQTA5ySC4HMSQbgxiS0UEKyekghGRlEEIyO8gguR1EkOwMIkgBBwmkhIMCUsRRH1KGUR9SylEbUsxRF1KOUReSdqWX9w+Pd5cIkBTF+njVfcyPW3JIAmN+6D7njhiS4Pi+707nghQSz+ivu6/zTAmJd2yeu+Es6SDxjv5p5Oi0ry5whxreV+9zQwVJcNxrHHQbiXfM9zrInAgS71C/dI4r7aHQkInO0R21x04n+sknjneogxaiD0RkSK99Qp70BxeHxDvURcBCoCF3Ose14eDSkASH+ql7Za0YQo5jx974ZYUMeRhDtO0EHvJ7tA/T52F5SIpD9S+D58P8xY4NGVTGg+k5x4ecvrdeLbcVPkTdvH4oXq4NMcgG8tbkL77drj2Og4f4jkAEIhCBCEQgAhGIQAQiEIEIRCACEYhABCIQgQhEIAIRiEAEQgrpG4EsDQxmkH5udLCCrEy3FS/IzLIOTpCNbR18ILOtncEFslm7HDwgOyeDBaRfeDgYQM59GPgQv3XgQ8yVhBXEex3gEGsl4QNxVBI2EFclYQJxVxIeEI9KwgLiU0kYQPrwdUBCPCsJOiQkA5Eh/pUEGhK9jsli/E9rQkhQJTmZ+XKmORsZJLCS/FesdApCSGgleZ+pUUEGCa8kk+l2Yz0lCSS4krgURJDASrLeORUkkLB1+CkoICGVZLHrvc9bGRKQgYulv6I6xLuSBCoqQ3zXoY9uHIhfJbGFHgTEp5JYoxsE4l7HdGv90y4GxFlJPKIbAeJoiOmKOpCZtZJ4Rzc5xFZJQqKbGmJex+I8m6I8xJiB4dFNCjFUkuyKwhD9OqIKCClEl4EJ0U0FGVeSt+gupSgIGa4jS+jVhwwqSXFFKciXSpIruutDTivJOl90V4d8VpKMBcQ92SH/1lEi9GyTGfI3A2srVG7IsmB0OyYOope8r6NcdDsmI2SV8ttB8kRCNJJNlbgwTj4I8cRC4CTREDRJPARMkgDBoiRBkCypEJl68wf0n238vgGZKQAAAABJRU5ErkJggg=="
export usd-info = "1/url(https://api.exchangeratesapi.io/latest?base=USD).rates.RUB"