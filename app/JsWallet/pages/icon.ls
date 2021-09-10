require! {
    \@primer/octicons-react
    \react
}
Octicon = octicons-react.default
module.exports = (name, size=32)->
    icon = octicons-react[name]
    react.create-element Octicon, { icon: icon, size: size }