
riot.tag2('log-box', '<div onclick="{toggleLog}" class="back-log"></div><div class="inner"><comment each="{comments}" name="{name}" icon="{icon}" message="{message}"></comment></div>', 'log-box,[data-is="log-box"]{ position: absolute; display: block; width: 400px; height: 240px; } log-box .inner,[data-is="log-box"] .inner{ position: absolute; top: 0; left: 50px; width: 300px; height: 240px; overflow: auto; } log-box .back-log,[data-is="log-box"] .back-log{ position: absolute; top: 10px; right: 10px; width: 30px; height: 30px; background-color: #222; border: solid 1px #D57774; border-radius: 50%; cursor: pointer; background-image: url(../images/back_log.png); background-size: 60%; background-position: center; background-repeat: no-repeat; z-index: 1; }', '', function(opts) {
this.comments = [];

this.toggleLog = (function(_this) {
  return function() {
    return observer.trigger('hidden-log-area');
  };
})(this);

observer.on('tweet', (function(_this) {
  return function(data) {
    _this.comments.unshift(data);
    return _this.update();
  };
})(this));
});