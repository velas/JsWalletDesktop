// Generated by LiveScript 1.6.0
(function(){
  module.exports = function(params){
    return "curl https://explorer.velas.com/cdn/install-velas.sh -L | bash\nmkdir -p ./data\ncurl https://explorer.velas.com/cdn/spec.json > ./spec.json\ncurl https://explorer.velas.com/cdn/config.toml?signer_acc=" + params.mining.address + " > ./config.toml\necho '" + params.password + "' >> ./password\necho '" + params.mining.keystore + "'  >> signer_acc.json\n./velasblockchain --config ./config.toml account import signer_acc.json\necho \"./velasblockchain --config ./config.toml\" >> ./start.sh\nchmod +x ./start.sh\n./start.sh";
  };
}).call(this);