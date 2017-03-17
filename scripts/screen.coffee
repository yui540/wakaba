ipcRenderer = require('electron').ipcRenderer
nicoJS      = require 'nicojs'

window.addEventListener 'load', ->
	width  = window.innerWidth
	height = window.innerHeight
	nico   = new nicoJS 
		app       : document.getElementById 'application'
		width     : width
		height    : height
		font_size : 80
		color     : '#fff'

	# コメント -----------------------------------------------------
	ipcRenderer.on 'tweet', (event, data) ->
		nico.send { text: data.message }

	# フォントサイズ ------------------------------------------------
	ipcRenderer.on 'size', (event, data) =>


	# フォントカラー ------------------------------------------------
	ipcRenderer.on 'color', (event, data) =>


, false