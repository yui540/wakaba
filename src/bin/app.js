(function() {
  var Accounts, _controller, _screen, app, electron, ipc, path, win;

  path = require('path');

  win = require('./window');

  Accounts = require('./accounts');

  electron = require('electron');

  app = electron.app;

  ipc = electron.ipcMain;

  _controller = path.join('file://', __dirname, '../views/controller.html');

  _screen = path.join('file://', __dirname, '../views/screen.html');

  app.on('ready', function() {
    return Accounts.read((function(_this) {
      return function(data) {
        if (data === false) {
          return win.showLogin(function() {
            win.showController(_controller);
            win.showScreen(_screen);
            return win.close('login');
          });
        } else {
          win.showController(_controller);
          return win.showScreen(_screen);
        }
      };
    })(this));
  });

  app.on('window-all-closed', function() {
    return app.quit();
  });

  ipc.on('close', function(event, name) {
    win.close(name);
    if (name === 'login') {
      return app.quit();
    }
  });

  ipc.on('mini', function(event, name) {
    return win.mini(name);
  });

  ipc.on('tweet', function(event, data) {
    return win.send('screen', 'tweet', data);
  });

  ipc.on('font-size', function(event, data) {
    return win.send('screen', 'font-size', data);
  });

  ipc.on('color', function(event, data) {
    return win.send('screen', 'color', data);
  });

  ipc.on('show-comment', function(event, data) {
    return win.send('screen', 'show-comment', data);
  });

  ipc.on('hidden-comment', function(event, data) {
    return win.send('screen', 'hidden-comment', data);
  });

  ipc.on('logout', function(event, data) {
    return Accounts.remove((function(_this) {
      return function() {
        win.close('controller');
        return app.quit();
      };
    })(this));
  });

}).call(this);
