const md5File = require('md5-file');
const fs = require('fs');


exports.default = function () {
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
  const md5fn = './dist/' + fn + '.md5';
  fs.writeFileSync( md5fn, md5File.sync(fpath));
  console.log(md5fn);

  return [md5fn];
}
