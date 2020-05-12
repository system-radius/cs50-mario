Tile = Class{}

function Tile:init(x, y, group, class, top)

  self.group = group
  self.class = class

  -- These are the coordinates on the grid
  self.x = x
  self.y = y

  self.displayX = x * TILE_WIDTH
  self.displayY = y * TILE_HEIGHT

  self.top = top
end

function Tile:update(dt)

end

function Tile:render()

  love.graphics.draw(gTextures[TILES], gFrames[TILE_GROUPS][self.group][self.class], self.displayX, self.displayY)
  if self.top then
    love.graphics.draw(gTextures[TILE_TOPS], gFrames[TILE_TOPS][self.group][self.class], self.displayX, self.displayY)
  end
end