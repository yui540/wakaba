'use strict'

const config        = require('../config/window.json')
,     credentials   = require('../config/credentials.json')
,     AccountsUtill = require('../scripts/utills/accounts.utill')
,     TwitterAPI    = require('node-twitter-api')
,     Browser       = require('electron').BrowserWindow

/**
 * ウィンドウ管理
 */
let views = {
	login      : null,
	controller : null,
	screen     : null
}

module.exports = {
	/**
	 * ウィンドウを閉じる
	 * @param name : window名
	 */
	close: (name) => {
		views[name].close()
		views[name] = null
	},

	/**
	 * コントローラ画面
	 * @param url : URL
	 */
	showController: (url) => {
		views.controller = new Browser(config.controller)
		views.controller.loadURL(url)
	},

	/**
	 * ログイン画面
	 * @param fn : コールバック関数
	 */
	showLogin: (fn) => {
		let api = new TwitterAPI({
			consumerKey    : credentials.consumer_key,
			consumerSecret : credentials.consumer_secret,
			callback       : 'http://yuki540.com'
		})

		/* request-token ------------------------------------------------- */
		api.getRequestToken((err, req_token, req_token_secret) => {
			let url = api.getAuthUrl(req_token)

			views.login = new Browser(config.login)
			views.login.loadURL(url + '&force_login=true')

			/* will-navigate ----------------------------------------------- */
			views.login.webContents.on('will-navigate', (event, url) => {
				event.preventDefault()
				let match = url.match(/\?oauth_token=([^&]*)&oauth_verifier=([^&]*)/)

				if(!match) {
					views.login.close()
					views.login = null
					return false
				}

				/* access-token ---------------------------------------------- */
				api.getAccessToken(req_token, req_token_secret, match[2], (err, access_token, access_token_secret) => {
					if(err) {
						views.login.close()
						views.login = null
						return false
					}

					AccountsUtill.write(access_token, access_token_secret)
					fn()
				})
			})
		})
	}
}