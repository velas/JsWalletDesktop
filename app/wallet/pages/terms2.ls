require! {
    \react
    \superagent : { get }
    \../navigate.ls
    \../get-primary-info.ls
    \../web3.ls
    \../get-lang.ls
    \../history-funcs.ls
    \../icons.ls
}
# .terms-780672038
#     @import scheme
#     text-align: center
#     .terms-body
#         >.header
#             font-size: 19px
#             padding: 10px
#         display: inline-block
#         min-width: 250px
#         >.buttons
#             color: inherit
#             text-align: center
#             button
#                 display: inline-block
#                 cursor: pointer
#                 width: auto
#                 margin: 15px 5px 0
#                 text-transform: uppercase
#                 font-weight: bold
#                 padding: 0px 6px
#                 height: 36px
#                 border: 0
#                 background: #248295
#                 border-radius: $border
#                 font-size: 10px
#                 min-width: 80px
#                 width: auto
#                 white-space: nowrap
#                 text-overflow: ellipsis
#                 overflow: hidden
#         textarea
#             padding: 10px
#             overflow: auto
#             width: 100%
#             box-sizing: border-box
#             height: 350px
#             width: 300px
#             border: 0
#             border-radius: $border
#             outline: none
terms = ({ store, web3t })->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
    info = get-primary-info store
    style=
        background: info.app.wallet
        color: info.app.text
    button-style=
        color: info.app.text
    button-primary1-style=
        border: "1px solid #{info.app.primary1}"
        color: info.app.text
        background: info.app.primary1
    btn-icon =
        filter: info.app.btn-icon
    accept = ->
        navigate store, web3t, \:init
        <- web3t.refresh
    react.create-element 'div', { className: 'terms terms-780672038' }, children = 
        react.create-element 'div', { className: 'terms-body' }, children = 
            react.create-element 'div', { className: 'header' }, ' ' + lang.terms-of-use ? 'Terms of Use'
            react.create-element 'textarea', { value: "#{store.terms}", style: style }
            react.create-element 'div', { className: 'buttons' }, children = 
                react.create-element 'button', { on-click: go-back, style: button-primary1-style }, children = 
                    react.create-element 'span', {}, children = 
                        react.create-element 'img', { src: "#{icons.arrow-left}", className: 'icon-svg' }
                        """ #{lang.back}"""
terms.init = ({ store }, cb)->
    err, res <- get \https://raw.githubusercontent.com/okhrimenkoalexey/Velas/master/terms.md .end
    return cb err if err?
    store.terms = res.text
    cb null
module.exports = terms