class TwitterUtill
	constructor: ->
		Twitter     = require 'twitter'
		credentials = require '../../config/credentials.json'
		accounts    = require '../../config/accounts.json'

		@client = new Twitter
			consumer_key        : credentials.consumer_key
			consumer_secret     : credentials.consumer_secret
			access_token_key    : accounts.access_token
			access_token_secret : accounts.access_token_secret

		@stream = null

	##
	# 受信
	# @param keyword : キーワード
	# @param fn_1    : コールバック関数（成功）
	# @param fn_2    : コールバック関数（失敗）
	##
	on: (keyword, fn_1, fn_2) ->
		@off()

		@stream = @client.stream 'statuses/filter', { track: keyword }

		# data -------------------------------------------------------
		@stream.on 'data', (event) =>
			data = 
				keyword : keyword
				message : event.text
				name    : event.user.name
				icon    : event.user.profile_image_url

			fn_1 data

		# error ------------------------------------------------------
		@stream.on 'error', (err) =>
			fn_2 err

	##
	# 受信を中断
	##
	off: ->
		if @stream isnt null
			@stream.destroy()
			@stream = null

module.exports = TwitterUtill