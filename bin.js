(function() {
  var BrowserWindow, app, electron, ipcMain, screenWindow, settingsWindow;

  electron = require('electron');

  app = electron.app;

  BrowserWindow = electron.BrowserWindow;

  ipcMain = electron.ipcMain;

  app.on('ready', function() {
    return settingsWindow();
  });

  app.on('window-all-closed', function() {
    return app.quit();
  });

  settingsWindow = function() {
    var win;
    win = new BrowserWindow({
      width: 600,
      height: 400,
      transparent: true,
      resizable: false,
      frame: false,
      show: false
    });
    win.loadURL('file://' + __dirname + '/views/settings.html');
    win.on('ready-to-show', function() {
      return win.show();
    });
    return win.on('closed', function() {
      return win = null;
    });
  };

  screenWindow = function() {
    var size, win;
    size = electron.screen.getPrimaryDisplay().workArea;
    win = new BrowserWindow({
      width: size.width,
      height: size.height,
      transparent: true,
      resizable: false,
      frame: false,
      alwaysOnTop: true,
      show: false
    });
    win.loadURL('file://' + __dirname + '/views/screen.html');
    win.setIgnoreMouseEvents(true);
    win.on('ready-to-show', function() {
      return win.show();
    });
    return win.on('closed', function() {
      return win = null;
    });
  };

}).call(this);
