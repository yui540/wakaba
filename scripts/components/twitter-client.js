function TwitterClient() {
	this.credentials = require('../../config/credentials.json')
	this.accounts    = require('../../config/accounts.json')

	let Twitter = require('twitter')
	this.client = new Twitter({
		consumer_key        : this.credentials.consumer_key,
		consumer_secret     : this.credentials.consumer_secret,
		access_token_key    : this.accounts.access_token,
		access_token_secret : this.accounts.access_token_secret
	})
	this.stream = null
}

/**
 * ストリーミング
 * @param keyword : キーワード
 */
TwitterClient.prototype.getStream = function(keyword) {
	if(this.stream) 
		this.stream.destroy()

	this.stream = this.client.stream('statuses/filter', { track: keyword })

	/* data ------------------------------------------------------------- */
	this.stream.on('data', (event) => {
		let message = event.text
		,   name    = event.user.name
		,   icon    = event.user.profile_image_url

		console.log(message)
		console.log()
	})
}

module.exports = TwitterClient