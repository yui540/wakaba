gulp       = require 'gulp'
coffee     = require 'gulp-coffee'
uglify     = require 'gulp-uglify'
jade       = require 'gulp-jade'
browserify = require 'browserify'
source     = require 'vinyl-source-stream'

gulp.task 'bin', ->
	gulp.src './bin/bin.coffee'
		.pipe coffee()
		.pipe uglify()
		.pipe gulp.dest './'

gulp.task 'jade', ->
	gulp.src './views/jade/*.jade'
		.pipe jade()
		.pipe gulp.dest './views/'

gulp.task 'watch', ->
	gulp.watch './bin/*.coffee', ['bin']
	gulp.watch './views/jade/*.jade', ['jade']