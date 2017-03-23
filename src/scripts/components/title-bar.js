
riot.tag2('title-bar', '<div id="close" onclick="{onClose}"></div><div id="mini" onclick="{onMini}"></div>', 'title-bar,[data-is="title-bar"]{ position: absolute; top: 0; left: 0; width: 400px; height: 30px; display: block; -webkit-user-select: none; -webkit-app-region: drag; box-sizing: border-box; border-bottom: solid 1px #D57774; } title-bar:after,[data-is="title-bar"]:after{ content: ""; display: block; clear: both; } title-bar #close,[data-is="title-bar"] #close,title-bar #mini,[data-is="title-bar"] #mini{ position: relative; float: left; width: 15px; height: 15px; margin-top: 7.5px; margin-left: 7.5px; } title-bar #close:before,[data-is="title-bar"] #close:before,title-bar #close:after,[data-is="title-bar"] #close:after,title-bar #mini:after,[data-is="title-bar"] #mini:after{ position: absolute; top: 7px; width: 15px; height: 1px; background-color: #D57774; display: block; content: ""; } title-bar #close:before,[data-is="title-bar"] #close:before{ transform: rotate(-45deg); } title-bar #close:after,[data-is="title-bar"] #close:after{ transform: rotate(45deg); }', '', function(opts) {
this.onClose = function() {
  return ipc.send('close', ID);
};

this.onMini = function() {
  return ipc.send('mini', ID);
};
});