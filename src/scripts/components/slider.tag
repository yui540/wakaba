slider(style="width:{ width }px")
	div.load(
		style="width:{ per * 100 }%"
	)
	div.picker(
		style="left:{ per * (width - 10) }px"
		onmousedown="{ onDown }"
	)

	style(scoped).
		:scope {
			position: relative;
			height: 5px;
			background-color: #666;
			display: block;
		}
		:scope .load {
			position: absolute;
			top: 0;
			left: 0;
			height: 5px;
			background-color: #D57774;
		}
		:scope .picker {
			position: absolute;
			top: -7.5px;
			left: 0;
			width: 10px;
			height: 20px;
			background-color: #ccc;
			border-radius: 3px;
			cursor: pointer;
		}

	script(type="coffee").
		@width   = parseInt opts.width
		@min     = parseInt opts.min
		@max     = parseInt opts.max
		@default = parseInt opts.default
		@range   = @max - @min
		@per     = @default / @range

		down = false
		# mouse down ----------------------------------------------------
		@onDown = (e) ->
			left = e.target.getBoundingClientRect().left
			x    = e.clientX

			down = x - left

		# mouse move ----------------------------------------------------
		window.addEventListener 'mousemove', (e) =>
			if down is false
				return false

			left = @root.getBoundingClientRect().left
			x    = e.clientX - left - down
			@per = x / (@width - 10)

			# 0 ~ 1に制御
			if @per > 1
				@per = 1
			else if @per < 0
				@per = 0

			font_size = @range * @per + @min
			font_size = font_size.toFixed 0

			# イベント発火
			observer.trigger 'font-size', font_size
			ipc.send         'font-size', font_size

			# 描画
			@update()
		, false

		# mouse up ------------------------------------------------------
		window.addEventListener 'mouseup', (e) =>
			down = false
		, false

