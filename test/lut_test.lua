--[[------------------------------------------------------

  lut test

--]]------------------------------------------------------
package.path = './?/init.lua;'..package.path
local lut    = require 'lut'
local should = lut.Test('lut', { coverage = false })

function should.loadLib()
  assertType('table', lut)
end

should:test()


