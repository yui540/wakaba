'use strict'

const ipcRenderer   = require('electron').ipcRenderer
,     TwitterClient = require('../scripts/components/twitter-client')

window.addEventListener('load', () => {

	/* close ----------------------------------------------------------- */
	document.getElementById('close').addEventListener('click', (e) => {

	})

	/* mini ------------------------------------------------------------ */
	document.getElementById('mini').addEventListener('click', (e) => {

	})

	/* show-log -------------------------------------------------------- */
	document.getElementsByClassName('log-btn')[0].addEventListener('click', (e) => {
		let inner = document.getElementsByClassName('inner')[0]
		inner.setAttribute('data-state', 'show_log')
	})

	/* hidden-log ------------------------------------------------------ */

	/* show-settings --------------------------------------------------- */
	document.getElementsByClassName('settings-btn')[0].addEventListener('click', (e) => {
		let inner = document.getElementsByClassName('inner')[0]
		inner.setAttribute('data-state', 'show_settings')
	})

	/* hidden-settings ------------------------------------------------- */


	/* comment-btn ----------------------------------------------------- */
	document.getElementsByClassName('comment-btn')[0].addEventListener('click', (e) => {
		let btn   = document.getElementsByClassName('comment-btn')[0]
		,   state = btn.getAttribute('data-state')

		// コメント表示
		if(state === 'hidden') {
			btn.setAttribute('data-state', '')
			btn.children[1].innerHTML = 'SHOW'

		// コメント非表示
		} else {
			btn.setAttribute('data-state', 'hidden')
			btn.children[1].innerHTML = 'HIDDEN'
		}
	})
})