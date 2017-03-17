
title-bar
	div#close(
		onclick="{ onClose }"
	)
	div#mini(
		onclick="{ onMini }"
	)

	style(scoped).
		:scope {
			position: absolute;
			top: 0;
			left: 0;
			width: 400px;
			height: 30px;
			display: block;
			-webkit-user-select: none;
			-webkit-app-region: drag;
			box-sizing: border-box;
			border-bottom: solid 1px #D57774;
		}
		:scope:after {
			content: "";
			display: block;
			clear: both;
		}
		:scope #close,
		:scope #mini {
			position: relative;
			float: left;
			width: 15px;
			height: 15px;
			margin-top: 7.5px;
			margin-left: 7.5px;
		}
		:scope #close:before,
		:scope #close:after,
		:scope #mini:after {
			position: absolute;
			top: 7px;
			width: 15px;
			height: 1px;
			background-color: #D57774;
			display: block;
			content: "";
		}
		:scope #close:before {
			transform: rotate(-45deg);
		}
		:scope #close:after {
			transform: rotate(45deg);
		}

	script.
		@onClose = ->
			ipc.send 'close', ID

		@onMini = ->
			ipc.send 'mini', ID
		