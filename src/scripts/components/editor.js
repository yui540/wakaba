
riot.tag2('editor', '<input id="keyword" type="text" placeholder="#Hello world" maxlength="20"><div id="submit" onclick="{onSubmit}"></div>', 'editor,[data-is="editor"]{ display: block; width: 300px; height: 50px; margin: 0 auto; margin-bottom: 20px; } editor:after,[data-is="editor"]:after{ content: ""; display: block; clear: both; } editor #keyword,[data-is="editor"] #keyword{ float: left; width: 250px; height: 50px; box-sizing: border-box; border: solid 1px #D57774; border-top-left-radius: 5px; border-bottom-left-radius: 5px; background-color: transparent; margin: 0 auto; display: block; font-size: 18px; text-align: center; color: #fff; transition: all 0.3s ease 0s; } editor #keyword::-webkit-input-placeholder,[data-is="editor"] #keyword::-webkit-input-placeholder{ color: #666; } editor #keyword:focus,[data-is="editor"] #keyword:focus{ outline: none; box-shadow: 0 0 10px 5px #000 inset; } editor #submit,[data-is="editor"] #submit{ float: right; width: 50px; height: 50px; background-color: #D57774; border-top-right-radius: 5px; border-bottom-right-radius: 5px; background-image: url(../images/search.png); background-position: center; background-size: 60%; background-repeat: no-repeat; cursor: pointer; }', '', function(opts) {
this.onSubmit = (function(_this) {
  return function(e) {
    var keyword;
    keyword = _this.root.children[0].value.replace(/(<|>|\(|\)|{|})/g, '');
    if (keyword === '') {
      alert('キーワードを入力してください。');
    }
    twitter.on(keyword, function(data) {
      observer.trigger('tweet', data);
      return ipc.send('tweet', data);
    }, function(err) {
      return observer.trigger('tweet-error', err);
    });
    return observer.trigger('change-keyword', keyword);
  };
})(this);
});