-- Isometric Tiles

function love.load()
   grass = love.graphics.newImage("grass.png")
   dirt = love.graphics.newImage("dirt.png")

   draw_size = 50
   tile_scale = draw_size / grass:getWidth()

   block_width, block_height = draw_size, draw_size
   block_depth = block_height / 2
   
   -- Build grid of tiles
   grid_size = 20
   grid = {}
   for i = 1, grid_size do
      grid[i] = {}
      for j = 1, grid_size do
         grid[i][j] = 1
      end
   end

   -- Sprinkle in some dirt
   grid[2][4] = 2
   grid[6][5] = 2
end

function love.update()
   -- Move grid to the center of the screen
   window = {}
   window.width, window.height = love.window.getMode()
   grid_x, grid_y = window.width / 2, window.height / 2
end

function love.draw()
   for i = 1, grid_size do
      for j = 1, grid_size do
         -- Pick tile
         if grid[i][j] == 1 then
            tile = grass
         else
            tile = dirt
         end

         -- Draw tile
         love.graphics.draw(
            tile,
            grid_x + ((j - i) * (block_width / 2)),
            grid_y + ((i + j) * (block_depth / 2))
                   - (block_depth * (grid_size / 2)),
            0,
            tile_scale, tile_scale
         )
      end
   end
end
