--[[
  A recreation of the Super Mario Bros. game.

  Author: Darius Orias
]]

require 'src/Dependencies'

--[[
  Load the game
]]
function love.load()

  math.randomseed(os.time())
  love.graphics.setDefaultFilter('nearest', 'nearest')

  -- Setup the virtual window
  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    fullscreen = false,
    vsync = true,
    resizable = true
  })

  -- Load the fonts.
  gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 32)
  }

  -- Load the textures.
  gTextures = {
    [BACKGROUNDS] = love.graphics.newImage('graphics/backgrounds.png'),
    [TILES] = love.graphics.newImage('graphics/tiles.png'),
    [TILE_TOPS] = love.graphics.newImage('graphics/tile_tops.png'),
    [CHARACTER] = love.graphics.newImage('graphics/green_alien.png')
  }

  -- Create the quads for the textures.
  gFrames = {
    [BACKGROUNDS] = generateBackgroundQuads(gTextures[BACKGROUNDS], 256, 128),
    [TILE_GROUPS] = generateTileGroups(gTextures[TILES]),
    [TILE_TOPS] = generateTileGroups(gTextures[TILE_TOPS]),
    [CHARACTER] = generateQuads(gTextures[CHARACTER], PLAYER_WIDTH, PLAYER_HEIGHT)
  }

  -- Load the sound files.

  -- Create the state machine.
  gStateMachine = StateMachine{
    ['start'] = function() return StartState() end,
    ['play'] = function() return PlayState() end
  }

  gStateMachine:change('start')

  love.keyboard.keysPressed = {}
  love.window.setTitle('Super 50 Bros.')
  
end

--[[
  In-case of window resize
]]
function love.resize(w, h)
  push:resize(w, h)
end

function love.keypressed(key)
  love.keyboard.keysPressed[key] = true
end

function love.keyreleased(key)
  love.keyboard.keysPressed[key] = false
end

function love.keyboard.wasPressed(key)
  return love.keyboard.keysPressed[key]
end

--[[
  Update the entire game
]]
function love.update(dt)

  -- Update the current state.
  gStateMachine:update(dt)
end

--[[
  Draw the game
]]
function love.draw()
  push:start()

  -- Render the current state.
  gStateMachine:render()

  push:finish()
end

function resetColor()
  love.graphics.setColor(255, 255, 255, 255)
end