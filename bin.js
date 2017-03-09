'use strict'

const electron      = require('electron')
,     app           = electron.app
,     BrowserWindow = electron.BrowserWindow
,     ipcMain       = electron.ipcMain

/* ready --------------------------------------------------------------------------- */
app.on('ready', () => {
	initWindow()
})

/* window-all-closed -------------------------------------------------------------- */
app.on('window-all-closed', () => {
	app.quit()
})

/**
 * 起動ウィンドウ
 */
function initWindow() {
	let win = new BrowserWindow({
		width       : 600,
		height      : 400,
		transparent : true,
		resizable   : false,
		frame       : false,
		show        : false
	})
	win.loadURL('file://' + __dirname + '/views/init.html')

	/* ready-to-show ------------------------------------ */
	win.on('ready-to-show', () => {
		win.show()
	})

	/* closed ------------------------------------------- */
	win.on('closed', () => {
		win = null
	})	
}

/**
 * スクリーンウィンドウ
 */
function screenWindow() {
	let size = electron.screen.getPrimaryDisplay().workArea
	,   win  = new BrowserWindow({
		width       : size.width,
		height      : size.height,
		transparent : true,
		resizable   : false,
		frame       : false,
		alwaysOnTop : true,
		show        : false
	})
	win.loadURL('file://' + __dirname + '/views/screen.html')
	win.setIgnoreMouseEvents(true)

	/* ready-to-show ------------------------------------ */
	win.on('ready-to-show', () => {
		win.show()
	})

	/* closed ------------------------------------------- */
	win.on('closed', () => {
		win = null
	})
}
