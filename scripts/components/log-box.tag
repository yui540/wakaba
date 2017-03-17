log-box
	comment(
		each="{ comments }"
		name="{ name }"
		icon="{ icon }"
		message="{ message }"
	)

	style(scoped).
		:scope {
			display: block;
			width: 400px;
			height: 240px;
			overflow: auto;
		}

	script(type="coffee").
		@comments = [
			{
				name    : 'yuki540'
				icon    : 'https://pbs.twimg.com/profile_images/803212533800701954/d76ZFsX-_400x400.jpg'
				message : 'Hello world...' 
			}
		]

		# tweet ----------------------------------------------------------
		observer.on 'tweet', (data) =>
