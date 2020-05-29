const md5File = require('md5-file');
const fs = require('fs');

let ext = null;

switch (process.platform) {
  case "darwin":
    ext = '.dmg';
    break;
  case "win32":
    ext = '.exe';
    break;
  default:
    ext = '.snap';
    break;
}

const fn = fs.readdirSync('./dist').find(fn => fn.endsWith(ext));
const fpath = './dist/' + fn;
const md5fn = fn + '.md5';
fs.writeFileSync('./dist/' + md5fn, md5File.sync(fpath));
console.log(md5fn);
