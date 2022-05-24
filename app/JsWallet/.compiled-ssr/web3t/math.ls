require! {
    \bignumber.js
    \prelude-ls : { map, pairs-to-obj }
}
math = ($)-> (x, y)->
    return '..' if x is '..' or y is '..'
    try
        #if window.location.origin is not \https://wallet.velas.com
            #if typeof x is \number
            #    console.warn "Bignumber operation with number argument. It is dangerous as number->bignumber convertion causes exception sometimes"
            #    #debugger
            #if typeof y is \number
            #    console.warn "Bignumber operation with number argument. It is dangerous as number->bignumber convertion causes exception sometimes"
            #    #debugger
        new bignumber(x+'')[$](y+'').to-fixed!
    catch err
        throw "#{x} #{$} #{y} = #{err}"
module.exports =
    <[ plus minus times div ]>
        |> map -> [it, math(it)]
        |> pairs-to-obj
module.exports.from-hex = (hex)->
    new bignumber(hex + '', 16).to-fixed!
