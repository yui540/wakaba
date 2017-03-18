status-bar
	div#people.status-li(onclick="{ onClick }")
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
			float: right;
			width: 60px;
			height: 20px;
			margin-top: 5px;
			margin-right: 10px;
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
			width: 35px;
			height: 15px;
			font-size: 10px;
			color: #ccc;
			text-align: right;
			line-height: 15px;
			background-color: #4c4c4c;
			margin-top: 2.5px;
			padding: 0 5px;
			box-sizing: border-box;
		}

	script(type="coffee").
		@count_1  = 0
		@count_2  = 0
		@user     = []

		# tweet -----------------------------------------------------
		observer.on 'tweet', (data) =>
			# 人数
			bool = @user.indexOf data.name
			if bool is -1
				@count_1 += 1
				@user.push data.name

			# コメント数
			@count_2 += 1

			@update()

