require! {
    \react
    \../icons.ls
    \../get-primary-info.ls
    \../get-lang.ls
}
# .btn-259320763
#     @import scheme
#     width: auto
#     min-width: 80px
#     padding: 0 6px
#     line-height: 36px
#     height: 36px
#     text-transform: uppercase
#     text-align: center
#     font-weight: bold
#     border: 0
#     margin: 5px
#     font-size: 10px
#     border-radius: $border
#     display: inline-block
#     cursor: pointer
#     box-sizing: border-box
#     transaction: all 0.5s
#     @media(min-width: 920px)
#         &:last-child
#             margin-right: 0
#     &:hover
#         background: rgba(#6CA7ED, 0.2)
#         opacity: 0.9
button-loading = ({ store, text, loading, on-click, icon, type })->
    style = get-primary-info store
    lang = get-lang store
    button-style = get-button-style store, type
    react.create-element 'button', { style: button-style, className: 'btn btn-primary loading btn-259320763' }, children = 
        react.create-element 'span', {}, ' ...'
get-button-style = (store, type)->
    style = get-primary-info store
    button-primary1-style=
        border: "1px solid #{style.app.primary1}"
        color: style.app.text
        background: style.app.primary1
    button-primary3-style=
        border: "1px solid #{style.app.primary3}"
        color: style.app.text2
        background: style.app.primary3
    button-primary2-style=
        border: "1px solid #{style.app.primary2}"
        color: style.app.text
        background: style.app.primary2
    button-style =
        | type is \primary => button-primary1-style
        | type is \secondary => button-primary2-style
        | _ => button-primary3-style
    button-style
button-active = ({ store, text, loading, on-click, icon, type })->
    lang = get-lang store
    applied-text = lang[text] ? text ? ""
    applied-icon = icons[icon ? text] ? icons.more
    button-style = get-button-style store, type
    react.create-element 'button', { on-click: on-click, style: button-style, className: 'btn btn-259320763' }, children = 
        if store.current.device is \mobile
            react.create-element 'img', { src: "#{applied-icon}", title: "#{applied-text}", className: 'icon-svg' }
        else
            react.create-element 'span', {}, children = 
                react.create-element 'img', { src: "#{applied-icon}", className: 'icon-svg' }
                react.create-element 'span', {}, ' ' + applied-text
component = (config)->
    return button-loading(config) if config.loading is yes
    button-active config
module.exports = component