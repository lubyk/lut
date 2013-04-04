--[[------------------------------------------------------

  lub.Doc test

--]]------------------------------------------------------
local lub    = require 'lub'
local lut    = require 'lut'
local should = lut.Test('lut.Test', { coverage = false })

function should.assertTrue()
  assertTrue(true)
end

should:test()

