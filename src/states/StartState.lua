StartState = Class{__includes = BaseState}

--[[
  Functions inherited from BaseState
]]

function StartState:init()

  -- At the start, display the title of the game.
  -- Along with a sample level.
  -- You could actually use that sample level as the starting level. Just a thought
  
  -- Randomize a background
  self.background = math.random(3)
  
  self.scrollX = 0
  self.scrollY = 0
end

function StartState:update(dt)

  if love.keyboard.wasPressed('escape') then
    love.event.quit()
  elseif love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
    gStateMachine:change('play', {
      map = LevelMaker:createLevel(1),
      background = self.background
    })
  end
  
  Timer.update(dt)
end

function StartState:render()
  
  -- Draw the background as it is.
  love.graphics.draw(gTextures[BACKGROUNDS], gFrames[BACKGROUNDS][self.background], 0, 0)
  
  -- Draw a flipped version of the background as continuation of the previous.
  love.graphics.draw(
    gTextures[BACKGROUNDS], -- The texture to be drawn
    gFrames[BACKGROUNDS][self.background], -- The particular background, a frame of the texture.
    0, -- Position on X-axis
    gTextures[BACKGROUNDS]:getHeight() / 3 * 2, -- Position on Y-axis
    0, -- Rotation of the texture
    1, -- Scale on X-axis (1 means there is no change size)
    -1 -- Scale on Y-axis (-1 means there is no change in size, but the image is flipped along X-axis)
  )

  -- Display title here.
  love.graphics.setFont(gFonts['large'])
  love.graphics.printf('Super 50 Bros.', 0, VIRTUAL_HEIGHT / 3, VIRTUAL_WIDTH, 'center')

  love.graphics.setFont(gFonts['small'])
  love.graphics.printf('Press Enter to start!', 0, VIRTUAL_HEIGHT - 20, VIRTUAL_WIDTH, 'center')
  
  -- -- The following are for play state.
  -- love.graphics.translate(math.floor(self.scrollX), math.floor(self.scrollY))

  -- love.graphics.setFont(gFonts['small'])
  -- love.graphics.printf('Waddup!', 0, VIRTUAL_HEIGHT / 2 - 4, VIRTUAL_WIDTH, 'center')
  
end