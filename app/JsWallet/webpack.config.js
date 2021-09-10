const HtmlWebpackPlugin = require("html-webpack-plugin");
const TerserPlugin = require('terser-webpack-plugin');

const path = require('path');
const webpack = require('webpack');

module.exports = {
    node: {
        global: true,
        __filename: false,
        __dirname: false,
    },
    resolve: {
        fallback: { 
            crypto: false,
            Buffer: "/Users/a1/VelasWalet/wallet-area/wallet/.compiled-ssr/wallet/node_modules/buffer/index.js",
            assert : require.resolve('assert'),
            events: require.resolve("events/"), 
            process: require.resolve("/Users/a1/VelasWalet/wallet-area/wallet/.compiled-ssr/wallet/node_modules/process/index.js")
            //SharedArrayBuffer: require.resolve('/Users/a1/VelasWalet/wallet-area/wallet/.compiled-ssr/wallet/node_modules/ArrayBuffer')
        },
    },
    mode: "development", // "production" | "development" | "none"
    devtool: "source-map",
    // Chosen mode tells webpack to use its built-in optimizations accordingly.
    entry: ['babel-polyfill', "./main.js"] , // string | object | array
    // defaults to ./src
    // Here the application starts executing
    // and webpack starts bundling
    output: {
        path: "/Users/a1/VelasWalet/wallet-area/wallet/dist", // string (default)
        // the target directory for all output files
        // must be an absolute path (use the Node.js path module)
        filename: "output.js", // string (default)
        // the filename template for entry chunks
    },
    // externalsPresets:{
    //   node: false  
    // },
    plugins: [
        new webpack.DefinePlugin({
            'process.env.NODE_ENV': JSON.stringify('development'),
            'process.env.NODE_DEBUG': "true"
        }),
        // new HtmlWebpackPlugin({
        //     filename: 'index.html',
        //     template: path.resolve(__dirname, './main.js'),
        //     minify: {
        //         collapseWhitespace: true,
        //         removeAttributeQuotes: true,
        //         removeComments: true
        //     },
        //     isBrowser: true,
        //     isDevelopment: process.env.NODE_ENV !== 'production',
        //     nodeModules: process.env.NODE_ENV !== 'production'
        //         ? path.resolve(__dirname, '../node_modules')
        //         : false
        // })
    ],
    module: {
        // configuration regarding modules
        rules: [
            // rules for modules (configure loaders, parser options, etc.)
            {
                test: /\.js$/,
                exclude: /(node_modules|bower_components)/,
                //include: /node_modules\/keccak/,
                use: {
                    loader: 'babel-loader',
                    options: {
                        presets: [
                            '@babel/preset-env',
                            '@babel/preset-react',
                            {
                                'plugins': ['@babel/plugin-proposal-class-properties']
                            }
                        ]
                    }
                }
            }

        ]
    },
    optimization: {
        minimizer: [
            new TerserPlugin({
                terserOptions: { keep_fnames: false },
            }),
        ],  
    },
    target: "web",

    // Don't follow/bundle these modules, but request them at runtime from the environment
    

}