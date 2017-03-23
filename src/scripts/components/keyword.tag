keyword
	div
	h1 { keyword }

	style(scoped).
		:scope {
			display: block;
			width: 300px;
			height: 50px;
			margin: 0 auto;
			margin-bottom: 20px;
		}
		:scope {
			content: "";
			display: block;
			clear: both;
		}
		:scope div {
			float: left;
			border-style: solid;
			border-width: 25px 25px 25px 0;
			border-color: transparent #D57774 transparent transparent;
		}
		:scope h1 {
			float: right;
			width: 275px;
			font-size: 18px;
			line-height: 50px;
			text-align: center;
			color: #fff;
			background-color: #D57774;
		}

	script(type="coffee").
		@keyword = opts.keyword

		# change keyword --------------------------------------------
		observer.on 'change-keyword', (keyword) =>
			@keyword = keyword

			# 描画
			@update()