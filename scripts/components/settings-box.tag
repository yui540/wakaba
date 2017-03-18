settings-box
	div.back-settings(
		onclick="{ toggleSettings }"
	)
	div.inner
		section.settings-li
			div.title 文字サイズ
			div.val
				slider(width="200", min="20", max="150", default="50")
		section.settings-li
			div.title 文字色
			div.val
				color(
					each="{ colors }"
					color="{ color }"
				)
		section.logout(onclick="{ logout }") ログアウト 

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
			left: 50px;
			width: 300px;
			height: 240px;
			overflow: auto;
		}
		:scope .settings-li {
			width: 300px;
			height: 35px;
			margin-top: 10px;
		}
		:scope .settings-li:after {
			content: "";
			display: block;
			clear: both;
		}
		:scope .settings-li .title {
			float: left;
			width: 80px;
			height: 35px;
			font-size: 10px;
			line-height: 35px;
			color: #ccc;
			text-align: center;
			border-radius: 3px;
			background-color: #4c4c4c;
		}
		:scope .settings-li .val {
			float: right;
			width: 215px;
			height: 35px;
			border-radius: 3px;
			background-color: #4c4c4c;
		}
		:scope .settings-li .val slider {
			margin-top: 15px;
			margin-left: 7.5px;
		}
		:scope .logout {
			width: 150px;
			height: 35px;
			background-color: #D57774;
			border-radius: 3px;
			margin: 0 auto;
			margin-top: 10px;
			font-size: 12px;
			text-align: center;
			color: #fff;
			line-height: 35px;
			cursor: pointer;
		}
		:scope .back-settings {
			position: absolute;
			top: 10px;
			left: 10px;
			width: 30px;
			height: 30px;
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
		@colors = [
			{ color : "#ffffff" }
			{ color : "#000000" }
			{ color : "#ed588d" }
			{ color : "#86c351" }
			{ color : "#ff8100" }
			{ color : "rgb(0,180,255)" }
			{ color : "#ff0000" }
		]

		##
		# メインエリアに戻る
		##
		@toggleSettings = ->
			observer.trigger 'hidden-settings-area'

		##
		# ログアウト
		##
		@logout = ->
			observer.trigger 'logout'