const binanceBscRpc = Object.freeze({
    mainnet: {
      api: {
        web3Provider: 'https://bsc-dataseed.binance.org',
        // From https://docs.binance.org/smart-chain/developer/rpc.html
        extraWeb3Providers: [
          // Recommend
          'https://bsc-dataseed1.defibit.io',
          'https://bsc-dataseed1.ninicoin.io',
          // Backups
          'https://bsc-dataseed2.defibit.io',
          'https://bsc-dataseed3.defibit.io',
          'https://bsc-dataseed4.defibit.io',
          'https://bsc-dataseed2.ninicoin.io',
          'https://bsc-dataseed3.ninicoin.io',
          'https://bsc-dataseed4.ninicoin.io',
          'https://bsc-dataseed1.binance.org',
          'https://bsc-dataseed2.binance.org',
          'https://bsc-dataseed3.binance.org',
          'https://bsc-dataseed4.binance.org',
        ],
      },
    },
    testnet: {
      api: {
        web3Provider: 'https://data-seed-prebsc-1-s2.binance.org:8545',
        extraWeb3Providers: [
          'https://data-seed-prebsc-2-s1.binance.org:8545',
          'https://data-seed-prebsc-2-s2.binance.org:8545',
          'https://data-seed-prebsc-1-s3.binance.org:8545',
          'https://data-seed-prebsc-2-s3.binance.org:8545',
          'https://data-seed-prebsc-1-s1.binance.org:8545',
        ],
      },
    },
  });
  
 module.exports = binanceBscRpc;