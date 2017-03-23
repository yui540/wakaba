status-bar
	div#people.status-li(onclick="{ onClick }")
		p.title people:
		p.val { count_1 }
	div#count.status-li
		p.title comment:
		p.val { count_2 }
	div#count.status-li
		p.title color:
		div.color(style="background-color:{ color }")
	div#count.status-li
		p.title size:
		p.val { font_size + 'px' }
	div#count.status-li
		p.title status:
		p.val { status }

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
			height: 20px;
			margin-top: 5px;
			margin-right: 10px;
		}
		:scope .status-li:after {
			content: "";
			display: block;
			clear: both;
		}
		:scope .status-li .title {
			float: left;
			font-size: 9px;
			color: #ccc;
			line-height: 15px;
			margin-top: 2.5px;
			display: block;
		}
		:scope .status-li .val {
			float: left;
			height: 15px;
			font-size: 9px;
			color: #ccc;
			text-align: right;
			line-height: 15px;
			background-color: #4c4c4c;
			margin-top: 2.5px;
			margin-left: 5px;
			padding: 0 5px;
			box-sizing: border-box;
		}
		:scope .status-li .color {
			float: left;
			width: 15px;
			height: 15px;
			margin-top: 2.5px;
			margin-left: 5px;
			border-radius: 3px;
		}

	script(type="coffee").
		@status    = 'NO'
		@font_size = 50
		@color     = '#fff'
		@count_1   = 0
		@count_2   = 0
		@user      = []

		# font size -------------------------------------------------
		observer.on 'font-size', (font_size) =>
			@font_size = font_size

			# 描画
			@update()

		# color -----------------------------------------------------
		observer.on 'color', (color) =>
			@color = color

			# 描画
			@update()

		# tweet -----------------------------------------------------
		observer.on 'tweet', (data) =>
			# 人数
			bool = @user.indexOf data.name
			if bool is -1
				@count_1 += 1
				@user.push data.name

			# コメント数
			@count_2 += 1

			# ステータス
			@status = 'OK'

			# 描画
			@update()

		# tweet -----------------------------------------------------
		observer.on 'tweet-error', (data) =>
			# ステータス
			@status = 'NO'

			# 描画
			@update()