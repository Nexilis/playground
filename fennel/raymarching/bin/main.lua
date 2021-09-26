local logic = require("logic")
love.draw = function()
  love.graphics.print(logic["sphere-distance"](logic.sphere(5), {5, 0, 0}), 0, 0)
  love.graphics.print(logic["sphere-distance"](logic.sphere(5), {0, 15, 0}), 0, 15)
  return love.graphics.print(logic["sphere-distance"](logic.sphere(5), {0, 0, 0}), 0, 30)
end
return love.draw
