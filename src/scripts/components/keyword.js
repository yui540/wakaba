
riot.tag2('keyword', '<div></div><h1>{keyword}</h1>', 'keyword,[data-is="keyword"]{ display: block; width: 300px; height: 50px; margin: 0 auto; margin-bottom: 20px; } keyword,[data-is="keyword"]{ content: ""; display: block; clear: both; } keyword div,[data-is="keyword"] div{ float: left; border-style: solid; border-width: 25px 25px 25px 0; border-color: transparent #D57774 transparent transparent; } keyword h1,[data-is="keyword"] h1{ float: right; width: 275px; font-size: 18px; line-height: 50px; text-align: center; color: #fff; background-color: #D57774; }', '', function(opts) {
this.keyword = opts.keyword;

observer.on('change-keyword', (function(_this) {
  return function(keyword) {
    _this.keyword = keyword;
    return _this.update();
  };
})(this));
});