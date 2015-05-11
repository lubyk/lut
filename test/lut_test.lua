--[[------------------------------------------------------

  lut test

--]]------------------------------------------------------
package.path = './?.lua;'..package.path
local lut    = require 'lut'
local should = lut.Test('lut', { coverage = false })

function should.loadLib()
  assertType('table', lut)
end

should:test()


