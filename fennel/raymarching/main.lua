local camera = {["x-rotate"] = 0.0, ["z-rotate"] = 0.0, pos = {0.0, 0.0, 0.0}}
local scene = {}
local camera_x_rotation = ("Camera x rotation is: " .. tostring(camera["x-rotate"]))
local function sphere(radius, pos, color)
  local _let_1_ = (pos or {0, 0, 0})
  local x = _let_1_[1]
  local y = _let_1_[2]
  local z = _let_1_[3]
  local _let_2_ = (color or {1, 1, 1})
  local r = _let_2_[1]
  local g = _let_2_[2]
  local b = _let_2_[3]
  return {color = {(r or 0), (g or 0), (b or 0)}, pos = {(x or 0), (y or 0), (z or 0)}, radius = (radius or 5), sdf = __fnl_global__sphere_2ddistance}
end
love.draw = function()
  return love.graphics.print(camera_x_rotation)
end
return love.draw
