require! {
    \react
}
# .error-1446800785
#     color: red
#     padding: 20px
#     border: 1px solid red
#     background: rgba(red, 0.1)
module.exports = (err)->
    message = "UI Rendering Error: #{err?message ? err}. Please contract to wallet developer"
    react.create-element 'div', { className: 'error error-1446800785' }, ' ' + message