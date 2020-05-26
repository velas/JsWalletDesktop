require! {
    \./reviewwords.ls
    \./restorewords.ls
}
#TODO refactor
newseed = ({ store, web3t })->
    if store.current.seed-generated
        reviewwords { store, web3t }
    else
        restorewords { store, web3t }
module.exports = newseed