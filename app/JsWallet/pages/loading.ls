require! {
    \react
    \../get-lang.ls
}
# .loading-page-1437163893
#     @import scheme
#     $gradient: $primary - 20
#     text-align: center
#     overflow: hidden
#     min-height: 100px
#     height: 100%
#     $base-line-height: 34px
#     $white: #7153e8
#     $off-white: rgba($white, 0.2)
#     $spin-duration: 1s
#     $pulse-duration: 750ms
#     z-index: 1
#     background: transparent
#     .loading-pulse
#         position: absolute
#         top: calc(50% - 32px)
#         left: 50%
#         width: ($base-line-height / 4)
#         height: $base-line-height
#         background: $off-white
#         animation: pulse $pulse-duration infinite
#         animation-delay: ($pulse-duration / 3)
#         &:before, &:after
#             content: ''
#             position: absolute
#             display: block
#             height: ($base-line-height / 1.5)
#             width: ($base-line-height / 4)
#             background: $off-white
#             top: 50%
#             transform: translateY(-50%)
#             animation: pulse $pulse-duration infinite
#         &:before
#             left: -($base-line-height / 2)
#         &:after
#             left: ($base-line-height / 2)
#             animation-delay: ($pulse-duration / 1.5)
    
    
module.exports = (isLoading)->
    return null if not isLoading
    react.create-element 'div', { key: "loading", className: 'loading-page loading-page-1437163893' }, children = 
        react.create-element 'div', { className: 'loading-pulse' }
        if no
            react.create-element 'div', { className: 'loader-ios' }, children = 
                react.create-element 'svg', { xmlns: 'http://www.w3.org/2000/svg', width: '27', height: '27', viewbox: '0 0 27 27' }, children = 
                    react.create-element 'path', { d: 'M18.696,10.5c-0.275-0.479-0.113-1.09,0.365-1.367l4.759-2.751c0.482-0.273,1.095-0.11,1.37,0.368 c0.276,0.479,0.115,1.092-0.364,1.364l-4.764,2.751C19.583,11.141,18.973,10.977,18.696,10.5z' }
                    react.create-element 'path', { d: 'M16.133,6.938l2.75-4.765c0.276-0.478,0.889-0.643,1.367-0.366c0.479,0.276,0.641,0.886,0.365,1.366l-2.748,4.762 C17.591,8.415,16.979,8.58,16.5,8.303C16.021,8.027,15.856,7.414,16.133,6.938z' }
                    react.create-element 'path', { d: 'M13.499,7.5c-0.552,0-1-0.448-1-1.001V1c0-0.554,0.448-1,1-1c0.554,0,1.003,0.447,1.003,1v5.499 C14.5,7.053,14.053,7.5,13.499,7.5z' }
                    react.create-element 'path', { d: 'M8.303,10.5c-0.277,0.477-0.888,0.641-1.365,0.365L2.175,8.114C1.697,7.842,1.532,7.229,1.808,6.75 c0.277-0.479,0.89-0.642,1.367-0.368l4.762,2.751C8.416,9.41,8.58,10.021,8.303,10.5z' }
                    react.create-element 'path', { d: 'M9.133,7.937l-2.75-4.763c-0.276-0.48-0.111-1.09,0.365-1.366c0.479-0.277,1.09-0.114,1.367,0.366l2.75,4.765 c0.274,0.476,0.112,1.088-0.367,1.364C10.021,8.581,9.409,8.415,9.133,7.937z' }
                    react.create-element 'path', { d: 'M6.499,14.5H1c-0.554,0-1-0.448-1-1c0-0.554,0.447-1.001,1-1.001h5.499c0.552,0,1.001,0.448,1.001,1.001 C7.5,14.052,7.052,14.5,6.499,14.5z' }
                    react.create-element 'path', { d: 'M8.303,16.502c0.277,0.478,0.113,1.088-0.365,1.366l-4.762,2.749c-0.478,0.273-1.091,0.112-1.368-0.366 c-0.276-0.479-0.111-1.089,0.367-1.368l4.762-2.748C7.415,15.856,8.026,16.021,8.303,16.502z' }
                    react.create-element 'path', { d: 'M10.866,20.062l-2.75,4.767c-0.277,0.475-0.89,0.639-1.367,0.362c-0.477-0.277-0.642-0.886-0.365-1.365l2.75-4.764 c0.277-0.477,0.888-0.638,1.366-0.365C10.978,18.974,11.141,19.585,10.866,20.062z' }
                    react.create-element 'path', { d: 'M13.499,19.502c0.554,0,1.003,0.448,1.003,1.002v5.498c0,0.55-0.448,0.999-1.003,0.999c-0.552,0-1-0.447-1-0.999v-5.498 C12.499,19.95,12.946,19.502,13.499,19.502z' }
                    react.create-element 'path', { d: 'M17.867,19.062l2.748,4.764c0.275,0.479,0.113,1.088-0.365,1.365c-0.479,0.276-1.091,0.112-1.367-0.362l-2.75-4.767 c-0.276-0.477-0.111-1.088,0.367-1.365C16.979,18.424,17.591,18.585,17.867,19.062z' }
                    react.create-element 'path', { d: 'M18.696,16.502c0.276-0.48,0.887-0.646,1.365-0.367l4.765,2.748c0.479,0.279,0.64,0.889,0.364,1.368 c-0.275,0.479-0.888,0.64-1.37,0.366l-4.759-2.749C18.583,17.59,18.421,16.979,18.696,16.502z' }
                    react.create-element 'path', { d: 'M25.998,12.499h-5.501c-0.552,0-1.001,0.448-1.001,1.001c0,0.552,0.447,1,1.001,1h5.501c0.554,0,1.002-0.448,1.002-1 C27,12.946,26.552,12.499,25.998,12.499z' }