process.env['NODE_TLS_REJECT_UNAUTHORIZED'] = '0';

// Modules to control application life and create native browser window
const {app, BrowserWindow, Menu} = require('electron')
const path = require('path');

//var sslRootCAs = require('ssl-root-cas/latest')
//sslRootCAs.inject()

//global.window = {};
//global.XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;
//global.self = {};
//global.btoa = {}


//console.log(process.versions.node);


//var wallet = require('./main-bundle.js');
// Keep a global reference of the window object, if you don't, the window will
// be closed automatically when the JavaScript object is garbage collected.
let mainWindow

function createWindow () {
  // Create the browser window.
  //console.log(path.join(__dirname, '/res/Icon-256.png'));
  const height = 900;
  const width = 1000;
  mainWindow = new BrowserWindow({
    width: width,
    height: height,
    // minHeight: height,
    // maxHeight: height,
    webPreferences: {
      nodeIntegration: true
    },
    enableLargerThanScreen: false,
    fullscreenable: true,
    maximizable: true,
    resizable: true,
    center: true,
    movable: true,
    title: "Velas Wallet",
    icon: path.join(__dirname, 'res/Icon-1024.png')
  })
  // and load the index.html of the app.
  mainWindow.loadFile('index.html')

  // Open the DevTools.
  if (app.commandLine.hasSwitch('debug') || process.env.debug) {
   mainWindow.webContents.openDevTools();
  }


  // Emitted when the window is closed.
  mainWindow.on('closed', function () {
    // Dereference the window object, usually you would store windows
    // in an array if your app supports multi windows, this is the time
    // when you should delete the corresponding element.
    mainWindow = null
    //app.quit()
  })

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
app.on('ready', createWindow)

// Quit when all windows are closed.
app.on('window-all-closed', function () {
  // On OS X it is common for applications and their menu bar
  // to stay active until the user quits explicitly with Cmd + Q
  if (process.platform !== 'darwin') {
    app.quit()
  }
})

app.on('activate', function () {
  // On OS X it's common to re-create a window in the app when the
  // dock icon is clicked and there are no other windows open.
  if (mainWindow === null) {
    createWindow()
  }
})

// In this file you can include the rest of your app's specific main process
// code. You can also put them in separate files and require them here.
