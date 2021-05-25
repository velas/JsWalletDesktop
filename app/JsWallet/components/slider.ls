require! {
    \react
    \../get-primary-info.ls
    \../round5.ls
    \../round.ls
    \prelude-ls : { find }
    \../math.ls : { times }
    \./keyboard.ls
    \../icons.ls
}
module.exports = ({ ref, style, value, on-change, type, on-key-down, id })->
    #style = get-primary-info store
    #style2 = color: "#{style.app.icon}"
    #button-primary2-style=
        #border: "1px solid #{style.app.wallet}"
        #color: style.app.text
        #background: style.app.primary2
        #background-color: style.app.primary2-spare
    react.create-element 'div', { className: 'slider network-slider form-group' }, children = 
        react.create-element 'label', { className: 'control-label' }, ' Choose Network'
        react.create-element 'div', {}, children = 
            react.create-element 'span', { on-click: '', className: 'button left' }, children = 
                icon \ChevronLeft, 15
            react.create-element 'span', { className: 'bold' }, children = 
                react.create-element 'input', { value: "#{value}", on-change: '', className: 'change-index' }
            react.create-element 'span', { on-click: '', className: 'button right' }, children = 
                icon \ChevronRight, 15