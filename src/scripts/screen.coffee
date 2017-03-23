ipc    = require('electron').ipcRenderer
nicoJS = require 'nicojs'

window.addEventListener 'load', ->
	width  = window.innerWidth
	height = window.innerHeight

	nico = new nicoJS 
		app       : document.getElementById 'application'
		width     : width
		height    : height
		font_size : 50
		color     : '#fff'
	nico.listen()

	# コメント -----------------------------------------------------
	ipc.on 'tweet', (event, data) ->
		nico.send data.message

	# フォントサイズ ------------------------------------------------
	ipc.on 'font-size', (event, font_size) =>
		nico.font_size = font_size

	# フォントカラー ------------------------------------------------
	ipc.on 'color', (event, color) =>
		nico.color = color

	# コメントの表示 ------------------------------------------------
	ipc.on 'show-comment', (event, data) =>
		document.getElementById('application').style.display = 'block'

	# コメントの非表示 ----------------------------------------------
	ipc.on 'hidden-comment', (event, data) =>
		document.getElementById('application').style.display = 'none'		

, false