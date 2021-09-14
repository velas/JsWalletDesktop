require! {
    \react
    \localStorage
}
# .export-import-seed-91684277
#     border: 1px solid white
#     .header
#         font-size: 15px
module.exports = (store)->
    return null if not store.url-params.backupseed?
    spinbkp = (localStorage.get-item \spinbkp) || ""
    sseedbkp = (localStorage.get-item \sseedbkp) || ""
    restore-spin = ->
        new-spin = prompt 'Please enter previously saved value from first (left) field. This will override your current data. Try this on your secondary browser or in private/guest mode first! DO IT ON YOUR OWN RISK!!!', ''
        localStorage.set-item \spin, new-spin
    restore-seed = ->
        new-seed = prompt 'Please enter previously saved value from second (right) field. This will override your current data. Try this on your secondary browser or in private/guest mode first! DO IT ON YOUR OWN RISK!!!', ''
        localStorage.set-item \sseed, new-seed
    react.create-element 'div', { className: 'export-import-seed export-import-seed-91684277' }, children = 
        react.create-element 'div', { className: 'section' }, children = 
            react.create-element 'div', { className: 'header' }, ' Export Seed Backup'
            react.create-element 'div', {}, children = 
                react.create-element 'input', { value: "#{spinbkp}" }
                react.create-element 'input', { value: "#{sseedbkp}" }
        react.create-element 'div', { className: 'section' }, children = 
            react.create-element 'div', { className: 'header' }, ' Restore Seed Backup'
            react.create-element 'div', {}, children = 
                react.create-element 'button', { on-click: restore-spin }, ' Restore spin'
                react.create-element 'button', { on-click: restore-seed }, ' Restore seed'