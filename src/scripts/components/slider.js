
riot.tag2('slider', '<div riot-style="width:{per * 100}%" class="load"></div><div riot-style="left:{per * (width - 10)}px" onmousedown="{onDown}" class="picker"></div>', 'slider,[data-is="slider"]{ position: relative; height: 5px; background-color: #666; display: block; } slider .load,[data-is="slider"] .load{ position: absolute; top: 0; left: 0; height: 5px; background-color: #D57774; } slider .picker,[data-is="slider"] .picker{ position: absolute; top: -7.5px; left: 0; width: 10px; height: 20px; background-color: #ccc; border-radius: 3px; cursor: pointer; }', 'riot-style="width:{width}px"', function(opts) {
var down;

this.width = parseInt(opts.width);

this.min = parseInt(opts.min);

this.max = parseInt(opts.max);

this["default"] = parseInt(opts["default"]);

this.range = this.max - this.min;

this.per = this["default"] / this.range;

down = false;

this.onDown = function(e) {
  var left, x;
  left = e.target.getBoundingClientRect().left;
  x = e.clientX;
  return down = x - left;
};

window.addEventListener('mousemove', (function(_this) {
  return function(e) {
    var font_size, left, x;
    if (down === false) {
      return false;
    }
    left = _this.root.getBoundingClientRect().left;
    x = e.clientX - left - down;
    _this.per = x / (_this.width - 10);
    if (_this.per > 1) {
      _this.per = 1;
    } else if (_this.per < 0) {
      _this.per = 0;
    }
    font_size = _this.range * _this.per + _this.min;
    font_size = font_size.toFixed(0);
    observer.trigger('font-size', font_size);
    ipc.send('font-size', font_size);
    return _this.update();
  };
})(this), false);

window.addEventListener('mouseup', (function(_this) {
  return function(e) {
    return down = false;
  };
})(this), false);
});