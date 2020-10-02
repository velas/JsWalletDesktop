require! {
    \react
    \../tools.ls : { cut, money }
    \./project-links.ls
    \../menu-funcs.ls
    \./your-account.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \./icon.ls
    \../icons.ls
    \../add-coin.ls
}
module.exports = ({ store, web3t })->
    return null if not store?
    { current, open-account, lock, wallet-style, info, activate-s1, activate-s2, activate-s3, switch-network, refresh, lock } = menu-funcs store, web3t
    style = get-primary-info store
    button-add=
        color: style.app.text
        border-radius: "50px"
        border: "0"
        background: style.app.bg-btn
        filter: style.app.icon2
        line-height: "25px"
        padding: "10px"
        width: "20%"
        height: "40px"
        margin: "10px 0 0"
        position: "relative"
    lang = get-lang store
    syncing = 
        | store.current.refreshing => \syncing
        | _ => ""
    placeholder = 
        | store.current.refreshing => "placeholder"
        | _ => ""
    react.create-element 'button', { on-click: add-coin(store), style: button-add, className: 'button lock mt-5' }, children = 
        react.create-element 'img', { src: "#{icons.create}", className: 'icon-svg-plus' }