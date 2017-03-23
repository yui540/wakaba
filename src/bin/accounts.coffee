class Accounts
	constructor: () ->
		@storage = require 'electron-json-storage'

	##
	# アカウントの書き込み
	# @param access_token        : アクセストークン
	# @param access_token_secret : アクセストークンシークレット
	# @param fn                  : コールバック関数
	##
	write: (access_token, access_token_secret, fn) ->
		json = JSON.stringify
			access_token        : access_token
			access_token_secret : access_token_secret

		@storage.set 'accounts', json, (err) =>
			fn()

	##
	# アクセストークンの読み込み
	# @param fn : コールバック関数
	##
	read: (fn) ->
		@storage.get 'accounts', (err, data) =>
			if err
				fn false
				return
			if data is undefined or Object.keys(data).length is 0
				fn false
			else
				fn data

	##
	# アカウントの消去
	# @param fn : コールバック関数
	##
	remove: (fn) ->
		@storage.set 'accounts', {}, (err) =>
			fn()

module.exports = new Accounts()