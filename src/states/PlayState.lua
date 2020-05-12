PlayState = Class{__includes = BaseState}

function PlayState:enter(params)

  self.map = params.map
  self.background = params.background

  self.player = Player(((VIRTUAL_WIDTH / 2) - (PLAYER_WIDTH / 2)) / PLAYER_WIDTH, 3)

  self.scrollX = 0
  self.scrollY = 0

end

function PlayState:update(dt)

  Timer.update(dt)

  if love.keyboard.wasPressed('escape') then
    love.event.quit()
  elseif love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then

    local group = math.random(#gFrames[TILE_GROUPS])
    -- self.group = self.group + 1

    love.window.setTitle(tostring(group))
    self.map = LevelMaker:createLevel(group, 1)
    self.background = math.random(#gFrames[BACKGROUNDS])
    love.keyboard.keysPressed = {}
  end

  if love.keyboard.wasPressed('a') or love.keyboard.wasPressed('left') then
    self.player.x = self.player.x - MOVE_SPEED_X * dt
  elseif love.keyboard.wasPressed('d') or love.keyboard.wasPressed('right') then
    self.player.x = self.player.x + MOVE_SPEED_X * dt
  end

  -- Center the player character
  self.scrollX = -((self.player.x * PLAYER_WIDTH) - (VIRTUAL_WIDTH / 2) + (PLAYER_WIDTH / 2))

  self.player:update(dt)

end

function PlayState:render()

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

  love.graphics.translate(math.floor(self.scrollX), math.floor(self.scrollY))

  for i, layer in pairs(self.map) do
    for j, tile in pairs(layer) do
      tile:render()
    end
  end

  self.player:render()
end