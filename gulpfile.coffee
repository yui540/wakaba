gulp       = require 'gulp'
riot       = require 'gulp-riot'
jade       = require 'gulp-jade'
coffee     = require 'gulp-coffee'
plumber    = require 'gulp-plumber'
browserify = require 'browserify'

# CoffeeScript
gulp.task 'coffee', ->
	gulp.src './bin/*.coffee'
		.pipe plumber()
		.pipe coffee()
		.pipe gulp.dest './bin'

# Riot.js
gulp.task 'riot', ->
	gulp.src './scripts/components/*.tag'
		.pipe plumber()
		.pipe riot 
			compact  : true
			type     : 'coffeescript'
			template : 'jade'
		.pipe gulp.dest './scripts/components'

# Jade
gulp.task 'jade', ->
	gulp.src './views/*.jade'
		.pipe plumber()
		.pipe jade()
		.pipe gulp.dest './views'

gulp.task 'default', ['coffee', 'riot', 'jade']

gulp.task 'watch', ->
	gulp.watch [
		'./bin/*.coffee'
		'./scripts/components/*.tag'
		'./views/*.jade'
	],
	[
		'coffee'
		'riot'
		'jade'
	]