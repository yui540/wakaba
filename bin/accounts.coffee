class Accounts
	constructor: () ->
		@fs     = require 'fs'
		@path   = require 'path'
		@f_path = @path.join __dirname, '../config/accounts.json'

	##
	# アカウントがあるか
	##
	isAccounts: ->
		try
			@fs.readFileSync @f_path, 'utf8'
			return true
		catch e
			return false

	##
	# アカウントの書き込み
	# @param access_token : アクセストークン
	# @param access_token_secret : アクセストークンシークレット
	##
	write: (access_token, access_token_secret) ->
		try
			json = JSON.stringify
				access_token        : access_token
				access_token_secret : access_token_secret

			@fs.writeFileSync @f_path, json, 'utf8'
			return true
		catch e
			return false

	##
	# アクセストークンの読み込み
	##
	read: ->
		try
			return JSON.parse @fs.readFileSync @f_path, 'utf8'
		catch
			return false

module.exports = new Accounts()