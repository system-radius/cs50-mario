Player = Class{}

--[[
  This class represents the player's avatar in the world.
  It should be created in the Play State.
]]
function Player:init(x, y)

  self.x = x
  self.y = y

  self.image = gTextures[CHARACTER]
  self.frame = gFrames[CHARACTER][1]
end

function Player:update(dt)

  -- Updates for animation
end

function Player:render()

  resetColor()
  love.graphics.draw(self.image, self.frame, math.floor(self.x * PLAYER_WIDTH), math.floor(self.y * TILE_HEIGHT - 4))
end