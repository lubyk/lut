--[[------------------------------------------------------

  lub.Doc test

--]]------------------------------------------------------
require 'lut'
local should = lut.Test('lut.Test', { coverage = false })

function should.assertTrue()
  assertTrue(true)
end

should:test()

