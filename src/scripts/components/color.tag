color(
	style="background-color:{ color }"
	onclick="{ onClick }"
)
	
	style(scoped).
		:scope {
			float: left;
			display: block;
			width: 25px;
			height: 25px;
			margin-top: 5px;
			margin-left: 5px;
			border-radius: 5px;
			cursor: pointer;
		}

	script(type="coffee").
		@color = opts.color

		##
		# 文字色の変更
		##
		@onClick = ->
			# イベント発火
			observer.trigger 'color', @color
			ipc.send 'color', @color