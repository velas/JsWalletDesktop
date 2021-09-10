require! {
    \react
    \prelude-ls : { map, filter, group-by, keys, obj-to-pairs, sortWith }
    \./loading2.ls
    \../web3.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \./icon.ls
    \../icons.ls
    \../../web3t/providers/superagent.ls : { get }
}
# .manage-account-190683866
#     @import scheme
#     @keyframes bounceIn
#         from
#             opacity: 0
#             transform: scale3d(0.8, 0.8, 0.8)
#         to
#             opacity: 1
#             transform: scale3d(1, 1, 1)
#     position: fixed 
#     width: 100%
#     top: 0
#     bottom: 0    
#     z-index: 999
#     padding-top: 5%
#     box-sizing: border-box
#     padding: 10px
#     background: rgba(black, 0.08)
#     backdrop-filter: blur(5px)
#     height: 100vh
#     >.account-body
#         max-width: 600px
#         display: inline-block
#         animation-duration: 0.5s
#         animation-name: bounceIn
#         background: white
#         width: 100%
#         margin-top: 5vh
#         margin-bottom: 25vh
#         border-radius: var(--border-btn)
#         position: relative
#         height: 65vh
#         overflow: hidden
#         box-shadow: 17px 10px 13px #0000001f, -6px 10px 13px #00000024
#         >.title
#             background-color: var(--bgspare)
#             position: absolute
#             z-index: 999
#             top: 0
#             box-sizing: border-box
#             width: 100%
#             height: 100px
#             color: gray
#             font-size: 22px
#             padding: 10px
#             .closed
#                 position: absolute
#                 padding: 10px 20px
#                 font-size: 20px
#                 right: 0
#                 top: 0
#                 cursor: pointer
#                 &:hover
#                     color: #CCC
#             .search-content
#                 position: relative
#                 padding: 0 10px
#                 @media (max-width: 580px)
#                     padding: 0
#                 .search
#                     margin-top: 10px
#                     border: 1px solid #CCC
#                     padding: 9px
#                     border-radius: var(--border-btn)
#                     width: 100%
#                     padding-left: 35px
#                     box-sizing: border-box
#                     font-size: 13px
#                     outline: none
#                 .icon
#                     top: 6px
#                     left: 20px
#                     position: absolute
#                     @media (max-width: 580px)
#                         left: 10px
#         >.settings
#             padding-top: 90px
#             padding-bottom: 90px
#             height: calc(65vh - 180px)
#             overflow-y: scroll
#             .section
#                 position: relative
#                 min-height: 200px
#                 .legacy-tokens.title
#                     margin-top: 20px
#                     opacity: 0.2
#                 .list
#                     display: flex;
#                     flex-wrap: wrap;
#                     height: 80%
#                     padding: 10px
#                     margin: auto 10px
#                     @media (max-width: 580px)
#                         padding: 10px 0
#                     .wallet-group
#                         width: 100%   
#                         text-align: left 
#                         .group-name
#                             text-align: left
#                             padding: 5px 12px 5px 10px
#                             color: #7f818a
#                             text-transform: uppercase
#                             font-size: 12px
#                         .item
#                             width: calc(49% - 10px)
#                             margin: 5px 5px 10px
#                             display: inline-block
#                             background: #642dbd
#                             border-radius: var(--border-btn)
#                             padding: 10px
#                             text-align: left
#                             box-sizing: border-box
#                             @media (max-width: 580px)
#                                 width: 100%
#                                 float: none
#                             &:nth-child(odd)
#                                 margin-right: 10px
#                                 @media (max-width: 580px)
#                                     margin-right: 0
#                             >*
#                                 display: inline-block
#                                 vertical-align: middle
#                                 height: 40px
#                                 box-sizing: border-box
#                             input
#                                 margin: 0 5px
#                                 border-radius: var(--border-btn)
#                                 width: calc(100% - 90px)
#                                 border: 0
#                                 padding: 5px 10px
#                                 outline: none
#                                 font-size: 15px
#                             img
#                                 width: 40px
#                                 border-radius: 0px
#                             .title
#                                 margin-left: 10px
#                                 color: gray
#                                 width: calc(100% - 90px)
#                                 height: auto
#                             button
#                                 width: 40px
#                                 height: 40px
#                                 line-height: 45px
#                                 border-radius: var(--border-btn)
#                                 border: 0 !important
#                                 box-sizing: border-box
#                                 padding: 0
#                                 margin: 0
#                                 cursor: pointer
#                                 color: black
#                                 background: transparent
#                                 outline: none
#                                 &:hover
#                                     color: white
#                                     opacity: .6
#                                     transition: .5s
#                                 >*
#                                     vertical-align: middle
#                 &.legacy-tokens
#                     margin-top: 10px

create-item = ({ store, web3t }, item)-->
    add = ->
        store.current.add-coin = no
        err <- web3t.install-quick item
        console.error "[add] err" err if err?   
    title = "#{item.name}"
    style = get-primary-info store
    button-style =
        border: "1px solid #{style.app.text}"
        color: style.app.text
    background =
        background: style.app.input
    menu-style=
        color: style.app.text
    react.create-element 'div', { style: background, className: 'item' }, children = 
        react.create-element 'img', { src: "#{item.image}" }
        react.create-element 'span', { style: menu-style, className: 'title' }, ' ' + title
        react.create-element 'button', { on-click: add, style: button-style }, children = 
            icon \Plus, 20
filter-item = (store)-> (item)->
    return yes if (store.current.filter-plugins ? "").length is 0
    (item.token ? "").index-of(store.current.filter-plugins) > -1
add-by-address = (store, web3t)->
    coin-contract = (e)->
        store.contract-address = e.target.value
    not-found = ->
        store.contract-address = "Not Found"
        <- set-timeout _, 1000
        store.contract-address = ""
    add = ->
        err, data <- get "https://registry.web3.space/token/#{store.contract-address}" .end
        return not-found! if err? or not data.body?token?
        <- web3t.install-quick data.body
        store.current.add-coin = no
    style = get-primary-info store
    button-style =
        border: "1px solid #{style.app.text}"
        color: style.app.text
    input-style=
        color: style.app.text
        background: style.app.bg-primary-light
        border: "0"
    erc-bg=
        background: style.app.bg-primary-light
    background =
        background: style.app.input
    react.create-element 'div', { style: background, className: 'item' }, children = 
        react.create-element 'img', { src: "#{icons.erc20-token}", style: erc-bg }
        react.create-element 'input', { placeholder: "0x....", value: "#{store.contract-address}", on-change: coin-contract, style: input-style, className: 'search' }
        react.create-element 'button', { on-click: add, style: button-style }, children = 
            icon \Plus, 20
add-by-vlxaddress = (store, web3t)->
    coin-contract = (e)->
        store.contract-vlxaddress = e.target.value
    not-found = ->
        store.contract-vlxaddress = "Not Found"
        <- set-timeout _, 1000
        store.contract-vlxaddress = ""
    add = ->
        err, data <- get "https://registry.web3.space/token/#{store.contract-vlxaddress}" .end
        return not-found! if err? or not data.body?token?
        <- web3t.install-quick data.body
        store.current.add-vlxcoin = no
    style = get-primary-info store
    button-style =
        border: "1px solid #{style.app.text}"
        color: style.app.text
    input-style=
        color: style.app.text
        background: style.app.bg-primary-light
        border: "0"
    erc-bg=
        background: style.app.bg-primary-light
    background =
        background: style.app.input
    react.create-element 'div', { style: background, className: 'item' }, children = 
        react.create-element 'img', { src: "#{icons.vlx-icon}", style: erc-bg }
        react.create-element 'input', { placeholder: "V....", value: "#{store.contract-vlxaddress}", on-change: coin-contract, style: input-style, className: 'search' }
        react.create-element 'button', { on-click: add, style: button-style }, children = 
            icon \Plus, 20
            
            
module.exports = ({ store, web3t } )->
    return null if store.current.add-coin isnt yes
    current-network = store.current.network   
    close = ->
        store.current.add-coin = no
    filter-registery = (event)->
        store.current.filter-plugins = event.target.value
    style = get-primary-info store
    account-body-style =
        background: style.app.background
        background-color: style.app.bgspare
        color: style.app.text
    color =
        color: style.app.text
    lang = get-lang store
    input-style=
        color: style.app.text
        background: style.app.input
        border: "0"

    plugins = store.registry
          
    
    groups =    
        plugins
            |> filter (it)->
                it[current-network]?
            |> filter (it)->
                (it[current-network]?disabled is no) or (not it[current-network]?disabled?)
            |> filter filter-item store
            |> group-by (-> it[current-network].group)
    
    velas-group = 
        | groups.Velas? => { groups.Velas } 
        | _ => null   
    delete groups.Velas    
    
    create-group = ({ store, web3t }, item)--> 
        group-name =
            | item?0? => item.0
            | _ => ''
        wallets = item.1
        
        react.create-element 'div', { className: 'wallet-group' }, children = 
            react.create-element 'div', { className: 'group-name' }, ' ' + group-name + ' Network         '
            wallets |> map create-item { store, web3t }  
    
    
    react.create-element 'div', { className: 'manage-account manage-account-190683866' }, children = 
        react.create-element 'div', { style: account-body-style, className: 'account-body' }, children = 
            react.create-element 'div', { style: color, className: 'title' }, children = 
                react.create-element 'div', {}, children = 
                    react.create-element 'div', {}, ' ' + lang.your-wallets
                    react.create-element 'div', { on-click: close, className: 'closed' }, children = 
                        icon \X, 20
                react.create-element 'div', { className: 'search-content' }, children = 
                    react.create-element 'input', { placeholder: "#{lang.search}", on-change: filter-registery, style: input-style, className: 'search' }
                    react.create-element 'div', { className: 'icon' }, children = 
                        icon \Search, 15
            react.create-element 'div', { className: 'settings' }, children = 
                if store.registry.length > 0
                    react.create-element 'div', { className: 'section' }, children = 
                        react.create-element 'div', { className: 'list' }, children = 
                            if velas-group? 
                                velas-group
                                    |> obj-to-pairs
                                    |> map create-group { store, web3t }
                            groups
                                |> obj-to-pairs
                                |> map create-group { store, web3t }

                
