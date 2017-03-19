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
		win.showScreen     _screen

# close ----------------------------------------------------------------
ipc.on 'close', (event, name) ->
	win.close name

	if name is 'login'
		app.quit()

# mini -----------------------------------------------------------------
ipc.on 'mini', (event, name) ->
	win.mini name

# tweet ----------------------------------------------------------------
ipc.on 'tweet', (event, data) ->
	win.send 'screen', 'tweet', data 

# font size ------------------------------------------------------------
ipc.on 'font-size', (event, data) ->
	win.send 'screen', 'font-size', data 

# color ----------------------------------------------------------------
ipc.on 'color', (event, data) ->
	win.send 'screen', 'color', data 

# show comment ---------------------------------------------------------
ipc.on 'show-comment', (event, data) ->
	win.send 'screen', 'show-comment', data 

# hidden comment -------------------------------------------------------
ipc.on 'hidden-comment', (event, data) ->
	win.send 'screen', 'hidden-comment', data 

# logout ---------------------------------------------------------------
ipc.on 'logout', (event, data) ->
	Accounts.remove()
	win.close 'controller'
	app.quit()