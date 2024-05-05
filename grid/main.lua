-- Grid Test

function love.load()
   -- Scale of the tiles
   scale = 50

   last_clicked = nil
end

function love.update(dt)
   -- Get mouse position
   mouse = {}
   mouse.x, mouse.y = love.mouse.getPosition()
   
   -- Get window width and height
   window = {}
   window.x, window.y = love.window.getMode()

   -- Number of rows/columns to draw, if the max is not even
   -- then go one tile above
   max = {}
   max.x = window.x / scale
   max.y = window.y / scale

   -- Get clicked tile location
   if love.mouse.isDown(1) then
      last_clicked = {
         x = math.floor(mouse.x / scale),
         y = math.floor(mouse.y / scale)
      }
   end
end

function love.draw()
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

   -- Show mouse position
   local mouse_message =
      string.format("Mouse: (%d, %d)", mouse.x, mouse.y)
   
   love.graphics.setColor(1, 1, 1)
   love.graphics.print(mouse_message, 10, window.y - 25)

   -- Show last tile clicked
   if last_clicked ~= nil then
      local clicked_message = string.format("Clicked tile: (%d, %d)",
                                            last_clicked.x, last_clicked.y)
      
      love.graphics.print(clicked_message, 10, window.y - 40)
   end
end

function mouse_inside_tile(mouse, x, y)
   -- < and not <= so you can't select multiple tiles at once
   return
      (mouse.x >= x * scale and mouse.x < x * scale + scale) and
      (mouse.y >= y * scale and mouse.y < y * scale + scale)
end
