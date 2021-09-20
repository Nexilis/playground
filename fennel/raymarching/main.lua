local M = {}
local camera = {["x-rotate"] = 0.0, ["z-rotate"] = 0.0, pos = {0.0, 0.0, 0.0}}
local scene = {}
local camera_x_rotation = ("Camera x rotation is: " .. tostring(camera["x-rotate"]))
M["sphere-distance"] = function(_1_, _4_)
  local _arg_2_ = _1_
  local _arg_3_ = _arg_2_["pos"]
  local sx = _arg_3_[1]
  local sy = _arg_3_[2]
  local sz = _arg_3_[3]
  local radius = _arg_2_["radius"]
  local _arg_5_ = _4_
  local x = _arg_5_[1]
  local y = _arg_5_[2]
  local z = _arg_5_[3]
  return (math.sqrt((((sx - x) ^ 2) + ((sy - y) ^ 2) + ((sz - z) ^ 2))) - radius)
end
M.sphere = function(radius, pos, color)
  local _let_6_ = (pos or {0, 0, 0})
  local x = _let_6_[1]
  local y = _let_6_[2]
  local z = _let_6_[3]
  local _let_7_ = (color or {1, 1, 1})
  local r = _let_7_[1]
  local g = _let_7_[2]
  local b = _let_7_[3]
  return {color = {(r or 0), (g or 0), (b or 0)}, pos = {(x or 0), (y or 0), (z or 0)}, radius = (radius or 5), sdf = __fnl_global__sphere_2ddistance}
end
love.draw = function()
  love.graphics.print(M["sphere-distance"](M.sphere(5), {5, 0, 0}), 0, 0)
  love.graphics.print(M["sphere-distance"](M.sphere(5), {0, 15, 0}), 0, 15)
  love.graphics.print(M["sphere-distance"](M.sphere(5), {0, 0, 0}), 0, 30)
  return love.graphics.print(camera_x_rotation, 0, 40)
end
return M
