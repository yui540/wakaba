
riot.tag2('menu-box', '<div id="log" onclick="{toggleLog}" name="log" class="menu-btn"></div><div id="comment" data-state="show" onclick="{toggleComment}" name="comment" class="menu-btn"></div><div id="settings" onclick="{toggleSettings}" name="settings" class="menu-btn"></div>', 'menu-box,[data-is="menu-box"]{ display: block; width: 400px; margin: 20px 0; } menu-box:after,[data-is="menu-box"]:after{ content: ""; display: block; clear: both } menu-box .menu-btn,[data-is="menu-box"] .menu-btn{ float: left; width: 60px; height: 60px; margin-left: 55px; background-size: 60%; background-position: center; background-repeat: no-repeat; border-radius: 50%; box-sizing: border-box; cursor: pointer; border: solid 1px #D57774; transition: all 0.3s ease 0s; } menu-box .menu-btn:hover,[data-is="menu-box"] .menu-btn:hover{ transform: scale(1.1); } menu-box #log,[data-is="menu-box"] #log{ background-image: url(\'../images/log.png\'); } menu-box #comment[data-state="show"],[data-is="menu-box"] #comment[data-state="show"]{ background-image: url(\'../images/comment_01.png\'); } menu-box #comment[data-state="hidden"],[data-is="menu-box"] #comment[data-state="hidden"]{ background-image: url(\'../images/comment_02.png\'); } menu-box #settings,[data-is="menu-box"] #settings{ background-image: url(\'../images/settings.png\'); }', '', function(opts) {
this.toggleLog = (function(_this) {
  return function(e) {
    return observer.trigger('show-log-area');
  };
})(this);

this.toggleSettings = (function(_this) {
  return function(e) {
    return observer.trigger('show-settings-area');
  };
})(this);

this.toggleComment = (function(_this) {
  return function(e) {
    var ele, state;
    ele = e.target;
    state = ele.getAttribute('data-state');
    if (state === 'show') {
      ipc.send('hidden-comment');
      return ele.setAttribute('data-state', 'hidden');
    } else {
      ipc.send('show-comment');
      return ele.setAttribute('data-state', 'show');
    }
  };
})(this);
});