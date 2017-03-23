
riot.tag2('view-box', '<section class="area log-area"><log-box></log-box></section><section class="area main-rea"><menu-box></menu-box><editor></editor><keyword keyword="#Hello world"></keyword></section><section class="area settings-area"><settings-box></settings-box></section>', 'view-box,[data-is="view-box"]{ position: absolute; top: 30px; left: -400px; display: block; width: 1200px; height: 240px; } view-box[data-state="show-log-area"],[data-is="view-box"][data-state="show-log-area"]{ animation: show_log_area 0.3s ease 0s forwards; } view-box[data-state="hidden-log-area"],[data-is="view-box"][data-state="hidden-log-area"]{ animation: hidden_log_area 0.3s ease 0s forwards; } view-box[data-state="show-settings-area"],[data-is="view-box"][data-state="show-settings-area"]{ animation: show_settings_area 0.3s ease 0s forwards; } view-box[data-state="hidden-settings-area"],[data-is="view-box"][data-state="hidden-settings-area"]{ animation: hidden_settings_area 0.3s ease 0s forwards; } view-box:after,[data-is="view-box"]:after{ content: ""; display: block; clear: both; } view-box .area,[data-is="view-box"] .area{ float: left; width: 400px; height: 240px; } @keyframes show_log_area { 0% { left: -400px; } 100% { left: 0px; } } @keyframes hidden_log_area { 0% { left: 0px; } 100% { left: -400px; } } @keyframes show_settings_area { 0% { left: -400px; } 100% { left: -800px; } } @keyframes hidden_settings_area { 0% { left: -800px; } 100% { left: -400px; } }', '', function(opts) {
observer.on('show-log-area', (function(_this) {
  return function(data) {
    return _this.root.setAttribute('data-state', 'show-log-area');
  };
})(this));

observer.on('hidden-log-area', (function(_this) {
  return function(data) {
    return _this.root.setAttribute('data-state', 'hidden-log-area');
  };
})(this));

observer.on('show-settings-area', (function(_this) {
  return function(data) {
    return _this.root.setAttribute('data-state', 'show-settings-area');
  };
})(this));

observer.on('hidden-settings-area', (function(_this) {
  return function(data) {
    return _this.root.setAttribute('data-state', 'hidden-settings-area');
  };
})(this));
});