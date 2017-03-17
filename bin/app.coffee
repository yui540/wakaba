path     = require 'path'
win      = require './window'
Accounts = require './accounts'
electron = require 'electron'
app      = electron.app
ipc      = electron.ipcMain

# path
_controller = path.join 'file://', __dirname, '../views/controller.html'
_screen     = path.join 'file://', __dirname, '../views/screen.html'

# ready ----------------------------------------------------------------
app.on 'ready', ->
	# ログインしていない
	if not Accounts.isAccounts()
		win.showLogin ->
			win.showController _controller
			win.showScreen     _screen
			win.close 'login'

	# ログインしている
	else
		win.showController _controller
		#win.showScreen     _screen

# close ----------------------------------------------------------------
ipc.on 'close', (event, name) ->
	win.close name

# mini -----------------------------------------------------------------
ipc.on 'mini', (event, name) ->
	win.mini name

# tweet ----------------------------------------------------------------
ipc.on 'tweet', (event, data) ->
	win.send 'screen', 'tweet', data 