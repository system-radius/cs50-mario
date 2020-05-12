LevelMaker = Class{}

function LevelMaker:createLevel(group, level)
  
  -- For now, choose between 3 and 5 to decide the tiles.

  -- Randomize the tile group. For future reference, this should be passed as parameter.
  -- local group = math.random(#gFrames[TILE_GROUPS])
  
  -- The map object. This will contain everything that needs to be generated.
  local map = {}
  for y = 1, VIRTUAL_HEIGHT / TILE_HEIGHT do

    table.insert(map, {})
    for x = 1, VIRTUAL_WIDTH / TILE_WIDTH do
      
      local class = GROUND
      if (y < VIRTUAL_HEIGHT / TILE_HEIGHT / 2) then
        class = BLANK
      end
      
      table.insert(map[y], Tile(x - 1, y - 1, group, class, false))
    end
    
  end
  
  -- Loop that will check for the top tiles.
  for y = 2, VIRTUAL_HEIGHT / TILE_HEIGHT do
    for x = 1, VIRTUAL_WIDTH / TILE_WIDTH do
      
      if map[y][x] == nil then
        goto continue
      end
      
      if map[y - 1][x].class == BLANK and map[y][x].class == GROUND then
        -- If the tile above is blank and the current tile is a ground tile
        -- then it is a top tile.
        map[y][x].top = true
      end

      ::continue::
    end
  end

  return map
end