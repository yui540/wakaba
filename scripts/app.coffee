nicoJS  = require 'nicoJS'
twitter = require 'twitter'

window.addEventListener 'load', ->
	nico = new nicoJS {
		app       : document.getElementById 'screen'
		width     : window.innerWidth
		height    : window.innerHeight
		font_size : 50
	}
	nico.listen()

	client = new twitter {
		consumer_key        : 'jWPk84vDTgEhcBfmA9XIDh0OI'
		consumer_secret     : 'FHqMvhlbDSNDc7J34LAXMStKjPRCd6oIEhC6S70GrkFiQWUu5l'
		access_token_key    : '522391433-MDNwKgmoy9WGl3JqXSafLoI3QGW8vpuqyR1CyG1v'
		access_token_secret : 'cxgoymkBtjsILnwo28NQlMrcpRr2ypHnRjgj0BqzLBDeL'
	}
	stream = client.stream 'statuses/filter', { track: '#Arcaea' }

	stream.on 'data', (event) ->
		nico.send { text: event.text }
, false