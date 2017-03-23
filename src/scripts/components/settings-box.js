
riot.tag2('settings-box', '<div onclick="{toggleSettings}" class="back-settings"></div><div class="inner"><section class="settings-li"><div class="title">文字サイズ</div><div class="val"><slider width="200" min="20" max="150" default="50"></slider></div></section><section class="settings-li"><div class="title">文字色</div><div class="val"><color each="{colors}" color="{color}"></color></div></section><section onclick="{logout}" class="logout">ログアウト </section></div>', 'settings-box,[data-is="settings-box"]{ position: absolute; display: block; width: 400px; height: 240px; } settings-box .inner,[data-is="settings-box"] .inner{ position: absolute; top: 0; left: 50px; width: 300px; height: 240px; overflow: auto; } settings-box .settings-li,[data-is="settings-box"] .settings-li{ width: 300px; height: 35px; margin-top: 10px; } settings-box .settings-li:after,[data-is="settings-box"] .settings-li:after{ content: ""; display: block; clear: both; } settings-box .settings-li .title,[data-is="settings-box"] .settings-li .title{ float: left; width: 80px; height: 35px; font-size: 10px; line-height: 35px; color: #ccc; text-align: center; border-radius: 3px; background-color: #4c4c4c; } settings-box .settings-li .val,[data-is="settings-box"] .settings-li .val{ float: right; width: 215px; height: 35px; border-radius: 3px; background-color: #4c4c4c; } settings-box .settings-li .val slider,[data-is="settings-box"] .settings-li .val slider{ margin-top: 15px; margin-left: 7.5px; } settings-box .logout,[data-is="settings-box"] .logout{ width: 150px; height: 35px; background-color: #D57774; border-radius: 3px; margin: 0 auto; margin-top: 10px; font-size: 12px; text-align: center; color: #fff; line-height: 35px; cursor: pointer; } settings-box .back-settings,[data-is="settings-box"] .back-settings{ position: absolute; top: 10px; left: 10px; width: 30px; height: 30px; background-color: #222; border: solid 1px #D57774; border-radius: 50%; cursor: pointer; background-image: url(../images/back_settings.png); background-size: 60%; background-position: center; background-repeat: no-repeat; z-index: 1; }', '', function(opts) {
this.colors = [
  {
    color: "#ffffff"
  }, {
    color: "#000000"
  }, {
    color: "#ed588d"
  }, {
    color: "#86c351"
  }, {
    color: "#ff8100"
  }, {
    color: "rgb(0,180,255)"
  }, {
    color: "#ff0000"
  }
];

this.toggleSettings = function() {
  return observer.trigger('hidden-settings-area');
};

this.logout = function() {
  return ipc.send('logout');
};
});