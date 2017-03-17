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
	# @param fn      : コールバック関数
	##
	on: (keyword, fn) ->
		@stream = @client.stream 'statuses/filter', { track: keyword }

		# data -------------------------------------------------------
		@stream.on 'data', (event) =>
			data = 
				message : event.text
				name    : event.user.name
				icon    : event.user.profile_image_url

			fn data

		# erro -------------------------------------------------------
		@stream.on 'error', (err) =>
			console.log 'ツイート取得失敗'

	##
	# 受信を中断
	##
	off: ->
		if @stream isnt null
			@stream.destroy()

module.exports = TwitterUtill