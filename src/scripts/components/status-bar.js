
riot.tag2('status-bar', '<div id="people" onclick="{onClick}" class="status-li"><p class="title">people:</p><p class="val">{count_1}</p></div><div id="count" class="status-li"><p class="title">comment:</p><p class="val">{count_2}</p></div><div id="count" class="status-li"><p class="title">color:</p><div riot-style="background-color:{color}" class="color"></div></div><div id="count" class="status-li"><p class="title">size:</p><p class="val">{font_size + \'px\'}</p></div><div id="count" class="status-li"><p class="title">status:</p><p class="val">{status}</p></div>', 'status-bar,[data-is="status-bar"]{ position: absolute; bottom: 0; left: 0; display: block; width: 400px; height: 30px; box-sizing: border-box; border-top: solid 1px #4c4c4c; } status-bar:after,[data-is="status-bar"]:after{ content: ""; display: block; clear: both; } status-bar .status-li,[data-is="status-bar"] .status-li{ float: right; height: 20px; margin-top: 5px; margin-right: 10px; } status-bar .status-li:after,[data-is="status-bar"] .status-li:after{ content: ""; display: block; clear: both; } status-bar .status-li .title,[data-is="status-bar"] .status-li .title{ float: left; font-size: 9px; color: #ccc; line-height: 15px; margin-top: 2.5px; display: block; } status-bar .status-li .val,[data-is="status-bar"] .status-li .val{ float: left; height: 15px; font-size: 9px; color: #ccc; text-align: right; line-height: 15px; background-color: #4c4c4c; margin-top: 2.5px; margin-left: 5px; padding: 0 5px; box-sizing: border-box; } status-bar .status-li .color,[data-is="status-bar"] .status-li .color{ float: left; width: 15px; height: 15px; margin-top: 2.5px; margin-left: 5px; border-radius: 3px; }', '', function(opts) {
this.status = 'NO';

this.font_size = 50;

this.color = '#fff';

this.count_1 = 0;

this.count_2 = 0;

this.user = [];

observer.on('font-size', (function(_this) {
  return function(font_size) {
    _this.font_size = font_size;
    return _this.update();
  };
})(this));

observer.on('color', (function(_this) {
  return function(color) {
    _this.color = color;
    return _this.update();
  };
})(this));

observer.on('tweet', (function(_this) {
  return function(data) {
    var bool;
    bool = _this.user.indexOf(data.name);
    if (bool === -1) {
      _this.count_1 += 1;
      _this.user.push(data.name);
    }
    _this.count_2 += 1;
    _this.status = 'OK';
    return _this.update();
  };
})(this));

observer.on('tweet-error', (function(_this) {
  return function(data) {
    _this.status = 'NO';
    return _this.update();
  };
})(this));
});