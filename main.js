process.env['NODE_TLS_REJECT_UNAUTHORIZED'] = '0';

// const Bugsnag = require('@bugsnag/electron');

// Modules to control application life and create native browser window
const {app, BrowserWindow, protocol, Menu} = require('electron')
const path = require('path');

// Bugsnag.start({
//   apiKey: '1d913c7a0fc0bfbe9e0c56a84b867048',
// });

// Keep a global reference of the window object, if you don't, the window will
// be closed automatically when the JavaScript object is garbage collected.
let mainWindow;

function createWindow () {
  // Create the browser window.
  const height = 900;
  const width = 1000;
  mainWindow = new BrowserWindow({
    width: width,
    height: height,
    webPreferences: {
      nodeIntegration: true,
      enableRemoteModule: false,
    },
    enableLargerThanScreen: false,
    fullscreenable: true,
    maximizable: true,
    resizable: true,
    center: true,
    movable: true,
    title: "Velas Wallet",
    // icon: path.join(__dirname, 'res/Icon-1024.png')
  });
  // and load the index.html of the app.
  mainWindow.loadFile(path.join(__dirname, './index.html'))
    .catch(err => {
      console.log('[mainWindow.loadFile] error', err);
      // Bugsnag.notify(err);
    });

  // Open the DevTools.
  if (app.commandLine.hasSwitch('debug') || process.env.debug) {
   mainWindow.webContents.openDevTools();
  }

  // Open external url in native browser window
  mainWindow.webContents.on('new-window', function(e, url) {
    e.preventDefault();
    require('electron').shell.openExternal(url);
  });

  // Emitted when the window is closed.
  mainWindow.on('closed', function () {
    // Dereference the window object, usually you would store windows
    // in an array if your app supports multi windows, this is the time
    // when you should delete the corresponding element.
    mainWindow = null
    //app.quit()
  });

  var template = [{
    label: "Wallet",
    submenu: [
        { label: "Quit", accelerator: "Command+Q", click: function() { app.quit(); }}
    ]}, {
    label: "Edit",
    submenu: [
        { label: "Undo", accelerator: "CmdOrCtrl+Z", selector: "undo:" },
        { label: "Redo", accelerator: "Shift+CmdOrCtrl+Z", selector: "redo:" },
        { type: "separator" },
        { label: "Cut", accelerator: "CmdOrCtrl+X", selector: "cut:" },
        { label: "Copy", accelerator: "CmdOrCtrl+C", selector: "copy:" },
        { label: "Paste", accelerator: "CmdOrCtrl+V", selector: "paste:" },
        { label: "Select All", accelerator: "CmdOrCtrl+A", selector: "selectAll:" }
    ]}
  ];
  Menu.setApplicationMenu(Menu.buildFromTemplate(template));
}

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some APIs can only be used after this event occurs.
app.whenReady().then(() => {
    protocol.interceptFileProtocol('file', function(req, callback) {
        var url = req.url.substr(7);
        if (url.indexOf('static/media/') > -1) {
			let lastPart = url.substr(url.search('/static/media'));
			url = `${__dirname}${lastPart}`;
			console.log('url', url);
        }
        if (url.indexOf('Contents/Resources/app.asar/index.html') > -1) {
            console.log('Contents/Resources/app.asar/index.html error', url);
            //let lastPart = url.substr(url.search('/static/media'));
            url = `${__dirname}/index.html`;
            console.log('normalize', path.normalize(url))
            return callback({path: url})
        }
        callback({path: path.normalize(url)})
      },function (error) {
        if (error)
          console.error('Failed to register protocol')
      });
	createWindow();
	app.on('activate', () => {
        if (BrowserWindow.getAllWindows().length === 0) {
            createWindow()
        }
    });
})
// Quit when all windows are closed.

app.on('window-all-closed', () => {
  // On OS X it is common for applications and their menu bar
  // to stay active until the user quits explicitly with Cmd + Q
  if (process.platform !== 'darwin') {
    app.quit()
  }
})

// In this file you can include the rest of your app's specific main process
// code. You can also put them in separate files and require them here.
