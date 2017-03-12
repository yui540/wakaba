'use strict'

const path          = require('path')
,     electron      = require('electron')
,     app           = electron.app
,     win           = require('./window')
,     AccountsUtill = require('../scripts/utills/accounts.utill')

/* ready --------------------------------------------------------- */
app.on('ready', () => {
	// ログインされていない
	if(!AccountsUtill.isAccounts()) {
		win.showLogin(() => {
			win.showController(path.join('file://', __dirname, '../views/controller.html'))
			win.close('login')
		})

	// ログインされている
	} else {
		win.showController(path.join('file://', __dirname, '../views/controller.html'))
	}
})

/* window-all-closed --------------------------------------------- */
app.on('window-all-closed', () => {
	app.quit()
})