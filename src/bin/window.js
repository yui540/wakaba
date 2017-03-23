(function() {
  var Window;

  Window = (function() {
    function Window() {
      this.Browser = require('electron').BrowserWindow;
      this.config = require('../config/window.json');
      this.views = {
        login: null,
        controller: null,
        screen: null
      };
      this.api = null;
      this.fn = null;
      this.req_token = null;
      this.req_token_secret = null;
    }

    Window.prototype.close = function(name) {
      this.views[name].close();
      this.views[name] = null;
      if (name === 'controller') {
        this.views['screen'].close();
        return this.views['screen'] = null;
      }
    };

    Window.prototype.mini = function(name) {
      return this.views[name].minimize();
    };

    Window.prototype.send = function(name, event, data) {
      return this.views[name].webContents.send(event, data);
    };

    Window.prototype.showController = function(url) {
      this.views.controller = new this.Browser(this.config.controller);
      return this.views.controller.loadURL(url);
    };

    Window.prototype.showScreen = function(url) {
      var display, option, screen;
      screen = require('electron').screen;
      display = screen.getPrimaryDisplay().workArea;
      option = this.config.screen;
      option.width = display.width;
      option.height = display.height;
      this.views.screen = new this.Browser(option);
      this.views.screen.loadURL(url);
      return this.views.screen.setIgnoreMouseEvents(true);
    };

    Window.prototype.showLogin = function(fn) {
      var TwitterAPI, credentials;
      TwitterAPI = require('node-twitter-api');
      credentials = require('../config/credentials.json');
      this.fn = fn;
      this.api = new TwitterAPI({
        consumerKey: credentials.consumer_key,
        consumerSecret: credentials.consumer_secret,
        callback: 'http://yuki540.com'
      });
      return this.api.getRequestToken(this.getRequestToken.bind(this));
    };

    Window.prototype.getRequestToken = function(err, req_token, req_token_secret) {
      var url;
      this.req_token = req_token;
      this.req_token_secret = req_token_secret;
      url = this.api.getAuthUrl(req_token);
      this.views.login = new this.Browser(this.config.login);
      this.views.login.loadURL(url + '&force_login=true');
      return this.views.login.webContents.on('will-navigate', this.willNavigate.bind(this));
    };

    Window.prototype.willNavigate = function(event, url) {
      var match;
      event.preventDefault();
      match = url.match(/\?oauth_token=([^&]*)&oauth_verifier=([^&]*)/);
      if (!match) {
        this.views.login.reload();
        return false;
      }
      return this.api.getAccessToken(this.req_token, this.req_token_secret, match[2], this.getAccessToken.bind(this));
    };

    Window.prototype.getAccessToken = function(err, access_token, access_token_secret) {
      var Accounts;
      if (err) {
        this.views.login.reload();
        return false;
      }
      Accounts = require('./accounts');
      return Accounts.write(access_token, access_token_secret, (function(_this) {
        return function() {
          return _this.fn();
        };
      })(this));
    };

    return Window;

  })();

  module.exports = new Window();

}).call(this);
