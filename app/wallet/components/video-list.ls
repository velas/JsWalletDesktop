require! {
    \react
    \../get-primary-info.ls
    \../get-lang.ls
    \../pages/icon.ls
    \../navigate.ls
    \../icons.ls
}
module.exports = ({ store, web3t } )->
    file-descriptions = store.video.uploading-files.filter ({status}) -> status == 'uploaded'
    info = get-primary-info store
    goto-details = ->
        navigate store, web3t, \videostoragedetails
    video-style = 
        background: \black
    videos = 
        file-descriptions.map (desc) ->
            goto-details = -> 
                location.href = "https://video.velas.com/#{desc.id}/#{desc.key}"
            layout = 
                react.create-element 'div', { className: 'section' }, children = 
                    react.create-element 'div', { on-click: goto-details, className: 'source' }, children = 
                        react.create-element 'span', { className: 'play' }, children = 
                            icon \TriangleRight, 15
                        react.create-element 'video', { width: '224', height: '150', controls: 'controls', poster: "#{desc.thumbnail}", style: video-style }, children = 
                            react.create-element 'source', { src: "/#{desc.id}/#{desc.key}", type: "#{desc.file.type}", preload: "metadata" }
                        react.create-element 'div', { className: 'title-video' }, children = 
                            react.create-element 'span', {}, children = 
                                react.create-element 'img', { src: "#{info.branding.logo}", className: 'account' }
                            react.create-element 'span', {}, children = 
                                react.create-element 'div', { className: 'header' }, ' ' + desc.file.name
                                react.create-element 'ul', { className: 'stat' }, children = 
                                    react.create-element 'li', {}, children = 
                                        react.create-element 'span', {}, ' 2K views'
                                    react.create-element 'li', {}, children = 
                                        react.create-element 'span', {}, ' 5 days ago'
            return layout
    return videos