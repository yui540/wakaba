comment
	div.icon(
		style="background-image:url({ opts.icon })"
	)
	div.rect
	div.info
		h3.name   { opts.name }
		p.message { opts.message }

	style(scoped).
		:scope {
			display: block;
			width: 400px;
			padding: 10px;
			box-sizing: border-box;
		}
		:scope:after {
			content: "";
			display: block;
			clear: both;
		}
		:scope .icon {
			float: left;
			width: 50px;
			height: 50px;
			border-radius: 3px;
			background-size: cover;
		}
		:scope .rect {
			float: left;
			border-style: solid;
			border-width: 10px 10px 10px 0;
			border-color: transparent #fff transparent transparent;
			margin-left: 10px;
			margin-top: 15px;
		}
		:scope .info {
			float: left;
			width: 310px;
			border-radius: 3px;
			background-color: #fff;
			padding: 5px;
			box-sizing: border-box;
		}
		:scope .info .name {
			font-size: 10px;
			color: #222;
			border-bottom: solid 1px #eee;
			padding-bottom: 5px;
			margin-bottom: 5px;
		}
		:scope .info .message {
			font-size: 12px;
			color: #4c4c4c;
		}