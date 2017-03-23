(function() {
  var Accounts;

  Accounts = (function() {
    function Accounts() {
      this.storage = require('electron-json-storage');
    }

    Accounts.prototype.write = function(access_token, access_token_secret, fn) {
      var json;
      json = JSON.stringify({
        access_token: access_token,
        access_token_secret: access_token_secret
      });
      return this.storage.set('accounts', json, (function(_this) {
        return function(err) {
          return fn();
        };
      })(this));
    };

    Accounts.prototype.read = function(fn) {
      return this.storage.get('accounts', (function(_this) {
        return function(err, data) {
          if (err) {
            fn(false);
            return;
          }
          if (data === void 0 || Object.keys(data).length === 0) {
            return fn(false);
          } else {
            return fn(data);
          }
        };
      })(this));
    };

    Accounts.prototype.remove = function(fn) {
      return this.storage.set('accounts', {}, (function(_this) {
        return function(err) {
          return fn();
        };
      })(this));
    };

    return Accounts;

  })();

  module.exports = new Accounts();

}).call(this);
