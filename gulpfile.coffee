gulp       = require 'gulp'
riot       = require 'gulp-riot'
jade       = require 'gulp-jade'
coffee     = require 'gulp-coffee'
plumber    = require 'gulp-plumber'
browserify = require 'browserify'

# CoffeeScript
gulp.task 'coffee', ->
	gulp.src './src/bin/*.coffee'
		.pipe plumber()
		.pipe coffee()
		.pipe gulp.dest './src/bin'

# Riot.js
gulp.task 'riot', ->
	gulp.src './src/scripts/components/*.tag'
		.pipe plumber()
		.pipe riot 
			compact  : true
			type     : 'coffeescript'
			template : 'jade'
		.pipe gulp.dest './src/scripts/components'

# Jade
gulp.task 'jade', ->
	gulp.src './src/views/*.jade'
		.pipe plumber()
		.pipe jade()
		.pipe gulp.dest './src/views'

gulp.task 'default', ['coffee', 'riot', 'jade']

gulp.task 'watch', ->
	gulp.watch [
		'./src/bin/*.coffee'
		'./src/scripts/components/*.tag'
		'./src/views/*.jade'
	],
	[
		'coffee'
		'riot'
		'jade'
	]