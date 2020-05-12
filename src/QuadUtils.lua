--[[
  A utility class for quad generation.
]]

--[[
  Generic generation of quads/frames.
]]
function generateQuads(atlas, width, height)

  local sheetWidth = atlas:getWidth() / width
  local sheetHeight = atlas:getHeight() / height

  local counter = 1
  local quads = {}

  for y = 0, sheetHeight - 1 do
    for x = 0, sheetWidth - 1 do
      quads[counter] = love.graphics.newQuad(x * width, y * height, width, height, atlas:getDimensions())
      counter = counter + 1
    end
  end

  return quads
end

--[[
  Generation of grouped tiles. Requires the offset coordinates for their particular group.
]]
function generateGroupedTiles(atlas, offsetX, offsetY)

  local quads = {}
  local counter = 1

  for y = 0, TILE_GROUP_HEIGHT - 1 do
    for x = 0, TILE_GROUP_WIDTH - 1 do
      quads[counter] = love.graphics.newQuad(
        x * TILE_WIDTH + offsetX,  -- Offset the X for each group.
        y * TILE_HEIGHT + offsetY, -- Offset the Y for each group
        TILE_WIDTH,
        TILE_HEIGHT,
        atlas:getDimensions()
      )
      counter = counter + 1
    end
  end

  return quads
end

--[[
  Specific quad generation for tile groups.
]]
function generateTileGroups(atlas)

  local quadGroups = {}
  local groupCounter = 1

  for y = 0, 9 do
    for x = 0, 5 do
      quadGroups[groupCounter] = generateGroupedTiles(
        atlas,
        x * TILE_WIDTH * TILE_GROUP_WIDTH,
        y * TILE_HEIGHT * TILE_GROUP_HEIGHT
      )
      groupCounter = groupCounter + 1
    end
  end

  return quadGroups
end

--[[
  Specific quad generation for backgrounds.
]]
function generateBackgroundQuads(background, width, height)

  local quads = {}
  local counter = 1

  for y = 0, 2 do
    quads[counter] = love.graphics.newQuad(0, y * height, width, height, background:getDimensions())
    counter = counter + 1
  end

  return quads
end