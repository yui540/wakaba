editor
	input#keyword(
		type="text"
		placeholder="#Hello world"
		maxlength="20"
	)
	div#submit(
		onclick="{ onSubmit }"
	) 

	style(scoped).
		:scope {
			display: block;
			width: 300px;
			height: 50px;
			margin: 0 auto;
			margin-bottom: 50px;
		}
		:scope:after {
			content: "";
			display: block;
			clear: both;
		}
		:scope #keyword {
			float: left;
			width: 250px;
			height: 50px;
			box-sizing: border-box;
			border: solid 1px #D57774;
			border-top-left-radius: 5px;
			border-bottom-left-radius: 5px;
			background-color: transparent;
			margin: 0 auto;
			display: block;
			font-size: 18px;
			text-align: center;
			color: #fff;
			transition: all 0.3s ease 0s;
		}
		:scope #keyword::-webkit-input-placeholder {
			color: #666;
		}
		:scope #keyword:focus {
			outline: none;
			box-shadow: 0 0 10px 5px #000 inset;
		}
		:scope #submit {
			float: right;
			width: 50px;
			height: 50px;
			background-color: #D57774;
			border-top-right-radius: 5px;
			border-bottom-right-radius: 5px;
			background-image: url(../images/search.png);
			background-position: center;
			background-size: 60%;
			background-repeat: no-repeat;
		}

	script.
		@onSubmit = (e) =>
			keyword = @root.children[0].value.replace /(<|>|\(|\)|{|})/g, ''

			twitter.on keyword, (data) =>
				console.log data




