class Window
	constructor: ->
		@Browser = require('electron').BrowserWindow
		@config  = require '../config/window.json'

		@views =
			login      : null
			controller : null
			screen     : null

		@api              = null
		@fn               = null
		@req_token        = null
		@req_token_secret = null

	##
	# ウィンドウを閉じる
	# @param name : window名
	##
	close: (name) ->
		@views[name].close()
		@views[name] = null

		if name is 'controller'
			@views['screen'].close()
			@views['screen'] = null

	##
	# ウィンドウを最小化
	# @param name : window名
	##
	mini: (name) ->
		@views[name].minimize()

	##
	# ipc通信
	# @param name  : window名
	# @param event : イベント名
	# @param data  : データ
	##
	send: (name, event, data) ->
		@views[name].webContents.send event, data

	##
	# コントーラ画面
	# @param url : URL
	##
	showController: (url) ->
		@views.controller = new @Browser @config.controller
		@views.controller.loadURL url

	##
	# スクリーン
	# @param url : URL
	##
	showScreen: (url) ->
		screen  = require('electron').screen
		display = screen.getPrimaryDisplay().workArea
		option  = @config.screen

		option.width  = display.width
		option.height = display.height

		@views.screen = new @Browser option
		@views.screen.loadURL url
		@views.screen.setIgnoreMouseEvents true

	##
	# ログイン画面
	# @param ufn : コールバック関数
	##
	showLogin: (fn) ->
		TwitterAPI  = require 'node-twitter-api'
		credentials = require '../config/credentials.json'
		@fn         = fn

		@api = new TwitterAPI
			consumerKey    : credentials.consumer_key
			consumerSecret : credentials.consumer_secret
			callback       : 'http://yuki540.com'

		# request tokenの取得
		@api.getRequestToken @getRequestToken.bind this

	##
	# リクエストトークンの取得
	# @param err : エラー
	# @param req_token : リクエストトークン
	# @param req_token_secret
	##
	getRequestToken: (err, req_token, req_token_secret) ->
		@req_token        = req_token
		@req_token_secret = req_token_secret

		url = @api.getAuthUrl req_token

		@views.login = new @Browser @config.login
		@views.login.loadURL url + '&force_login=true'

		# will navigate
		@views.login.webContents.on 'will-navigate', @willNavigate.bind this

	##
	# リダイレクト
	# @param event : イベント
	# @param url   : URL
	##
	willNavigate: (event, url) ->
		event.preventDefault()

		match = url.match(/\?oauth_token=([^&]*)&oauth_verifier=([^&]*)/)
		if not match
			@views.login.reload()
			return false

		# アクセストークンの取得
		@api.getAccessToken(
			@req_token, 
			@req_token_secret, 
			match[2], 
			@getAccessToken.bind this
		)

	##
	# アクセストークンの取得
	# @param err                 : エラー
	# @param access_token        : アクセストークン
	# @param access_token_secret : アクセストークンシークレット
	##
	getAccessToken: (err, access_token, access_token_secret) ->
		if err
			@views.login.reload()
			return false

		# アカウントの書き込み
		Accounts = require './accounts'
		Accounts.write access_token, access_token_secret, =>
			@fn()

module.exports = new Window()