-- hello world
-- testing out the basics of love2d

function love.load()
   msg = "hello world"
   x = 0

   -- image
   image = {
      img = love.graphics.newImage("love-app-icon.png"),
      x = 500,
      y = 80,
      rotation = 0
   }
   
   -- background color
   love.graphics.setBackgroundColor(.2, .2, .2)
   
   -- set up font
   love.graphics.setNewFont(28)
end

function love.update(dt)
   -- update text position
   y = math.sin(x / 15) * 15 + 300
   x = x + 2
   
   -- set the text back to the start
   if x > 600 then x = 0 end

   -- update image position
   if love.keyboard.isDown("up") then
      image.y = image.y - 4
   elseif love.keyboard.isDown("down") then
      image.y = image.y + 4
   end

   if love.keyboard.isDown("left") then
      image.x = image.x - 4
   elseif love.keyboard.isDown("right") then
      image.x = image.x + 4
   end

   if love.keyboard.isDown("space") then
      image.rotation = image.rotation + math.pi / 32
   end
end

function love.draw()
   -- text
   love.graphics.setColor(1, .2, .2)
   love.graphics.print(msg, x, y)

   -- circle
   love.graphics.setColor(.2, .2, 1)
   love.graphics.circle("fill", 200, 150, 45)

   -- image
   love.graphics.setColor(1, 1, 1)
   love.graphics.draw(image.img, image.x, image.y,
		      image.rotation, .15, .15, 512/2, 512/2)
end
