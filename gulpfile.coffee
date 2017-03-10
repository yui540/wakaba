gulp       = require 'gulp'
coffee     = require 'gulp-coffee'
uglify     = require 'gulp-uglify'
plumber    = require 'gulp-plumber'
jade       = require 'gulp-jade'
browserify = require 'browserify'
source     = require 'vinyl-source-stream'

gulp.task 'bin', ->
	gulp.src './bin/bin.coffee'
		.pipe plumber()
		.pipe coffee()
		.pipe uglify()
		.pipe gulp.dest './'

gulp.task 'jade', ->
	gulp.src './views/jade/*.jade'
		.pipe plumber()
		.pipe jade()
		.pipe gulp.dest './views/'

gulp.task 'watch', ->
	gulp.watch './bin/*.coffee', ['bin']
	gulp.watch './views/jade/*.jade', ['jade']