view-box
	section.area.log-area

	section.area.main-rea
		menu-box
		editor
	section.area.settings-area


	style(scoped).
		:scope {
			position: absolute;
			top: 30px;
			left: -400px;
			display: block;
			width: 1200px;
			height: 240px;
		}
		:scope[data-state="show-log-area"] {
			animation: show_log_area 0.5s ease 0s forwards;
		}
		:scope[data-state="hidden-log-area"] {
			animation: hidden_log_area 0.5s ease 0s forwards;	
		}
		:scope[data-state="show-settings-area"] {
			animation: show_settings_area 0.5s ease 0s forwards;
		}
		:scope[data-state="hidden-settings-area"] {
			animation: hidden_settings_area 0.5s ease 0s forwards;	
		}
		:scope:after {
			content: "";
			display: block;
			clear: both;
		}
		:scope .area {
			float: left;
			width: 400px;
			height: 240px;
		}

		@keyframes show_log_area {
			0%   { left: -400px; }
			100% { left: 0px; } 
		}
		@keyframes close_log_area {
			0%   { left: 0px; }
			100% { left: -400px; } 
		}

		@keyframes show_settings_area {
			0%   { left: -400px; }
			100% { left: -800px; } 
		}
		@keyframes close_settings_area {
			0%   { left: -800px; }
			100% { left: -400px; } 
		}

	script(type="coffee").
		# show log area -----------------------------------------------
		observer.on 'show-log-area', (data) =>
			@root.setAttribute 'data-state', 'show-log-area'

		# hidden log area ---------------------------------------------
		observer.on 'hidden-log-area', (data) =>
			@root.setAttribute 'data-state', 'hidden-log-area'

		# show settings area ------------------------------------------
		observer.on 'show-settings-area', (data) =>
			@root.setAttribute 'data-state', 'show-settings-area'

		# hidden settings area ----------------------------------------
		observer.on 'hidden-settings-area', (data) =>
			@root.setAttribute 'data-state', 'hidden-settings-area'