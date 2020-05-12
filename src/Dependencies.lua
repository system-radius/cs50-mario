--[[
  Library requirements
]]
push = require 'lib/push'
Class = require 'lib/class'
Timer = require 'lib/knife.timer'

--[[
  Source requirements
]]
require 'src/constants'
require 'src/StateMachine'
require 'src/QuadUtils'
require 'src/LevelMaker'

-- Objects
require 'src/objects/Tile'
require 'src/objects/Player'

-- States
require 'src/states/BaseState'
require 'src/states/StartState'
require 'src/states/PlayState'