local camera = {["x-rotate"] = 0.0, ["z-rotate"] = 0.0, pos = {0.0, 0.0, 0.0}}
local camera_x_rotation = ("Camera x rotation is: " .. tostring(camera["x-rotate"]))
love.draw = function()
  return love.graphics.print(camera_x_rotation)
end
return love.draw
