require! {
    \react
    \./middle-ellipsis : MiddleEllipsis
    \../get-primary-info.ls
    \../icons.ls
    \./identicon.ls
    \./button.ls
    \../math.ls : { div, times, plus, minus }
}
# .table-pagination948035967
#     @import scheme
#     .pagination-holder
#         position: relative
#         text-align: center
#         padding: 20px
#         @media screen and (max-width: 540px)
#             padding: 10px 0
#             display: flex
#             align-items: flex-start
#         .current-page
#             flex: 2
#         button                      
#             margin: 0 20px 0 !important
#             min-width: 50px
#             &:first-of-type
#                 @media screen and (max-width: 540px)
#                     margin-left: 0 !important
#                     flex: 1
#             &:last-of-type
#                 @media screen and (max-width: 540px)
#                     margin-right: 0 !important
#                     flex: 1
#         .per-page-selector
#             position: absolute
#             left: 0
#             padding: 5px 10px
#             border: 1px solid #555668
#             cursor: pointer
#             @media screen and (max-width: 540px)
#                 position: relative
#                 margin-right: 10px
#                 padding: 5px
#             &:hover
#                 .per-page-options
#                     display: block !important
#             .per-page-options
#                 position: relative
#                 &.hidden
#                     display: none
#                 .per-page-option
#                     padding: 2px 5px
#                     &:hover
#                         background: #555668
module.exports = ({ store, type, disabled, config })->
    { array } = config
    new-array = ^^array
    page = store.staking["current_#{type}_page"] ? 1
    store.staking["#{type}_per_page"] = 10 if not store.staking?["#{type}_per_page"]
    per-page = store.staking["#{type}_per_page"]
    allPages = Math.ceil(array.length `div` perPage)
    style = get-primary-info store
    page$ = page - 1
    new-array.slice page$ * per-page, (page$ + 1) * per-page
    entities = new-array.length
    #Props
    prev-button-disabled = (+page <= 1) or disabled is yes
    next-button-disabled = (allPages <= +page) or disabled is yes
    $class = if store.staking["visible_per_page_#{type}_selector"] then "visible" else "hidden"
    # Listeners
    go-back = ->
        store.staking["current_#{type}_page"] = 
            | page > 1 => page - 1
            | _ => 1
    go-forward = ->
        page = store.staking["current_#{type}_page"]
        store.staking["current_#{type}_page"] = 
            | page < allPages => page + 1
            | _ => allPages
    normalize-current-page = ->
        allPages = Math.ceil(config.array.length `div` store.staking["#{type}_per_page"])
        store.staking["current_#{type}_page"] =
            | (+page > +allPages) and +allPages > 0 => allPages
            | +allPages < 1 => 1
            | _ => store.staking["current_#{type}_page"]
        store.staking["visible_per_page_#{type}_selector"] = no
        window.scroll-to 0, 0
    set-per-page = (per-page, cb=null)!-->
        store.staking["#{type}_per_page"] = per-page
        normalize-current-page!
        <- set-timeout _, 1
        store.staking["visible_per_page_#{type}_selector"] = no
    switch-per-page-selector = ->
        store.staking["visible_per_page_#{type}_selector"] = !store.staking["visible_per_page_#{type}_selector"]
    close-per-page-selector = ->
        store.staking["visible_per_page_#{type}_selector"] = no
    p-style =
        background-color: style.app.background
        background: style.app.background
        zIndex: 2
    # Render
    react.create-element 'div', { className: 'table-pagination table-pagination948035967' }, children = 
        react.create-element 'div', { className: 'pagination-holder' }, children = 
            react.create-element 'span', { key: "#{type}-selector", id: "#{type}-selector", on-click: switch-per-page-selector, onMouseLeave: close-per-page-selector, style: p-style, className: 'per-page-selector' }, children = 
                react.create-element 'div', { className: 'to-show' }, ' Show ' + per-page
                if store.staking["visible_per_page_#{type}_selector"] is yes
                    react.create-element 'div', { style: p-style, className: 'per-page-options' }, children = 
                        react.create-element 'div', { on-click: set-per-page(5), className: 'span per-page-option' }, ' 5'
                        react.create-element 'div', { on-click: set-per-page(10), className: 'span per-page-option' }, ' 10'
                        react.create-element 'div', { on-click: set-per-page(20), className: 'span per-page-option' }, ' 20'
            if +entities > +store.staking["#{type}_per_page"]
                react.create-element 'div', {}, children = 
                    button {store, classes: "width-auto", text: "<", no-icon:yes, on-click: go-back, style: {width: \auto, display: \block}, makeDisabled: prev-button-disabled}
                    react.create-element 'span', { className: 'current-page' }, children = 
                        react.create-element 'span', {}, ' Page'
                            """ #{page}"""
                            """ /"""
                            """ #{allPages}"""
                    button {store, classes: "width-auto", text: ">", no-icon:yes, on-click: go-forward, style: {width: \auto, display: \block}, makeDisabled: next-button-disabled}