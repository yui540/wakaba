settings-box
	div.back-settings(
		onclick="{ toggleSettings }"
	)
	div.inner

	style(scoped).
		:scope {
			position: absolute;
			display: block;
			width: 400px;
			height: 240px;
		}
		:scope .inner {
			position: absolute;
			top: 0;
			left: 0;
			width: 400px;
			height: 240px;
			overflow: auto;
		}
		:scope .back-settings {
			position: absolute;
			bottom: 10px;
			left: 10px;
			width: 40px;
			height: 40px;
			background-color: #222;
			border: solid 1px #D57774;
			border-radius: 50%;
			cursor: pointer;
			background-image: url(../images/back_settings.png);
			background-size: 60%;
			background-position: center;
			background-repeat: no-repeat;
			z-index: 1;
		}

	script(type="coffee").
		@toggleSettings = =>
			observer.trigger 'hidden-settings-area'