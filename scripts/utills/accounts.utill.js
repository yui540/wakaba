'use strict'

const fs   = require('fs')
,     path = require('path')

let file_path = path.join(__dirname, '../../config/accounts.json')

module.exports = {
	/**
	 * アカウントがあるか
	 */
	isAccounts: () => {
		try {
			fs.readFileSync(file_path, 'utf8')
			return true
		} catch(e) {
			return false
		}
	},

	/**
	 * accounts.jsonへの書き込み
	 * @param access_token        : アクセストークン
	 * @param access_token_secret : アクセストークンシークレット
	 */
	write: (access_token, access_token_secret) => {
		try {
			let json = JSON.stringify({
				access_token        : access_token,
				access_token_secret : access_token_secret
			})

			fs.writeFileSync(file_path, json, 'utf8')
			return true
		}	catch(e) {
			return false
		}
	},

	/**
	 * accounts.jsonの読み込み
	 */
	read: () => {
		try {
			return JSON.parse(fs.readFileSync(file_path, 'utf8'))
		} catch(e) {
			return false
		}
	}
}