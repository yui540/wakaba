menu-box
	div#log.menu-btn(
		onclick="{ toggleLog }" 
		name="log"
	)
	div#comment.menu-btn(
		data-state="show"
		onclick="{ toggleComment }"
		name="comment"
	)
	div#settings.menu-btn(
		onclick="{ toggleSettings }"
		name="settings"
	)

	style(scoped).
		:scope {
			display: block;
			width: 400px;
			margin: 20px 0;
		}
		:scope:after {
			content: "";
			display: block;
			clear: both
		}
		:scope .menu-btn {
			float: left;
			width: 60px;
			height: 60px;
			margin-left: 55px;
			background-size: 60%;
			background-position: center;
			background-repeat: no-repeat;
			border-radius: 50%;
			box-sizing: border-box;
			cursor: pointer;
			border: solid 1px #D57774;
			transition: all 0.3s ease 0s;
		}
		:scope .menu-btn:hover {
			transform: scale(1.1);
		}
		:scope #log {
			background-image: url('../images/log.png');
		}
		:scope #comment[data-state="show"] {
			background-image: url('../images/comment_01.png');
		}
		:scope #comment[data-state="hidden"] {
			background-image: url('../images/comment_02.png');
		}
		:scope #settings {
			background-image: url('../images/settings.png');
		}

	script(type="coffee").
		##
		# 履歴の表示・非表示
		##
		@toggleLog = (e) =>
			observer.trigger 'show-log-area'

		##
		# 設定画面の表示・非表示
		##
		@toggleSettings = (e) =>
			observer.trigger 'show-settings-area'

		##
		# コメントの表示・非表示
		##
		@toggleComment = (e) =>
			ele   = e.target
			state = ele.getAttribute 'data-state'

			# 表示
			if state is 'show'
				ipc.send 'hidden-comment'
				ele.setAttribute 'data-state', 'hidden'

			# 非表示
			else
				ipc.send 'show-comment'
				ele.setAttribute 'data-state', 'show'
