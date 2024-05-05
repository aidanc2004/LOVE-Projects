-- Grid Test

function love.load()
   -- Scale of the tiles
   scale = 50
end

function love.update(dt)
   -- Get window width and height
   window = {}
   window.x, window.y = love.window.getMode()

   -- Number of rows/columns to draw, if the max is not even
   -- then go one tile above
   max = {}
   max.x = window.x / scale
   max.y = window.y / scale
end

function love.draw()
   -- Get and show mouse position
   local mouse = {}
   mouse.x, mouse.y = love.mouse.getPosition()
   
   love.graphics.setColor(1, 1, 1)
   love.graphics.print("Mouse: " .. mouse.x .. ", " .. mouse.y,
                       10, window.y - 25)
   
   -- Draw grid
   love.graphics.setColor(.2, .2, .2)
   
   for i = 0, max.x do
      for j = 0, max.y do
         -- Fill square if mouse is hovering on it
         local draw_mode
         if mouse_inside_tile(mouse, i, j) then
            draw_mode = "fill"
         else
            draw_mode = "line"
         end
         
         love.graphics.rectangle(draw_mode, i * scale, j * scale, scale, scale)
      end
   end
end

function mouse_inside_tile(mouse, x, y)
   -- < and not <= so you can't select multiple tiles at once
   return
      (mouse.x >= x * scale and mouse.x < x * scale + scale) and
      (mouse.y >= y * scale and mouse.y < y * scale + scale)
end
