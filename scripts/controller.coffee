top.ID = 'controller'

##
# module
##
top.riot     = require 'riot'
top.ipc      = require('electron').ipcRenderer
TwitterUtill = require('../scripts/utills/twitter')
top.twitter  = new TwitterUtill()
top.observer = riot.observable()

##
# components
##
require './components/title-bar'
require './components/view-box'
require './components/log-box'
require './components/comment'
require './components/settings-box'
require './components/slider'
require './components/color'
require './components/menu-box'
require './components/editor'
require './components/status-bar'

window.addEventListener 'load', ->
	riot.mount '*'
, false