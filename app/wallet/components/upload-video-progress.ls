require! {
    \react
    \../get-primary-info.ls
    \../pages/icon.ls
}
module.exports = ({ store, web3t } )->
    info = get-primary-info store
    file-descriptions = store.video.uploading-files.filter ({status}) -> status != 'uploaded'
    row = (desc) ->
        react.create-element 'div', { key: "#{desc.file.name}", className: 'table-row-menu' }, children = 
            react.create-element 'div', { className: 'col folder-menu pending' }, children = 
                react.create-element 'img', { src: "#{store.filestore.extension-icons.txt}" }
                react.create-element 'div', { className: 'file-name' }, ' ' + desc.file.name
            react.create-element 'div', { className: 'col folder-menu progress' }, children = 
                react.create-element 'progress', { value: "#{Math.floor desc.uploaded / desc.file.size * 100}", max: "100" }
    filter-body =
        border: "1px solid #{info.app.border}"
        background: info.app.header
    header-table-style=
        border-bottom: "1px solid #{info.app.border}"
        background: info.app.wallet-light
        position: "sticky"
    hide-progress =
        if store.current.progress then \hide-progress else \ ""
    active =
        if store.current.active then \active else \ ""
    switch-progress = ->
        store.current.progress = not store.current.progress
    box =
        react.create-element 'div', { style: filter-body, className: 'active-download' }, children = 
            react.create-element 'div', { style: header-table-style, className: 'top' }, children = 
                react.create-element 'div', { className: 'table-row-menu' }, children = 
                    react.create-element 'span', { className: 'col folder-menu' }, children = 
                        react.create-element 'div', {}, ' Uploading ' + file-descriptions.length + ' item(s)'
                    react.create-element 'ul', { className: "#{active} action col" }, children = 
                        react.create-element 'li', { on-click: switch-progress, className: "#{hide-progress}" }, children = 
                            react.create-element 'span', {}, children = 
                                icon "ChevronDown", 15
                        react.create-element 'li', {}, children = 
                            react.create-element 'span', {}, children = 
                                icon \X, 15
            react.create-element 'div', { style: header-table-style, className: "#{hide-progress}" }, children = 
                react.create-element 'div', { className: 'table-row-menu' }, children = 
                    react.create-element 'span', { className: 'col folder-menu' }, children = 
                        react.create-element 'div', {}, ' Left ?min.'
                    react.create-element 'span', { className: 'col cancel' }, ' Cancel'
            react.create-element 'div', { className: "#{hide-progress}" }, children = 
                file-descriptions.map row
    return box