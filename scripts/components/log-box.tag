log-box
	comment(
		each="{ comments }"
		name="{ name }"
		icon="{ icon }"
		message="{ message }"
	)

	style(scoped).
		:scope {
			position: absolute;
			top: 30px;
			left: 0;
			display: block;
			width: 400px;
			height: 240px;
			overflow: auto;
		}

	script(type="coffee").
		@comments = []

		# tweet ----------------------------------------------------------
		observer.on 'tweet', (data) =>
