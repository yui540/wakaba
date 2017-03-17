status-bar
	div#people.status-li
		img(src="../images/people.png", width="15")
		p { count_1 }
	div#count.status-li
		img(src="../images/count.png", width="15")
		p { count_2 }

	style(scoped).
		:scope {
			position: absolute;
			bottom: 0;
			left: 0;
			display: block;
			width: 400px;
			height: 30px;
			box-sizing: border-box;
			border-top: solid 1px #4c4c4c;
		}
		:scope:after {
			content: "";
			display: block;
			clear: both;
		}
		:scope .status-li {
			float: left;
			width: 80px;
			height: 20px;
			margin-top: 5px;
			margin-left: 10px;
		}
		:scope .status-li:after {
			content: "";
			display: block;
			clear: both;
		}
		:scope .status-li img {
			float: left;
			width: 15px;
			margin-top: 2.5px;
			display: block;
		}
		:scope .status-li p {
			float: right;
			width: 55px;
			height: 20px;
			font-size: 12px;
			color: #999;
			line-height: 20px;
		}

	script.
		@on 'mount', ->
			@count_1 = 0
			@count_2 = 0
