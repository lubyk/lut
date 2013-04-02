--[[--------------------
  # Lubyk utility module

  Currently, this module contains a documentation generator and
  testing facilities.

--]]--------------------
local lub = require 'lub'
local lib = lub.Autoload 'lut'
lut = lib

-- Current version for 'lut' module. Minor version numbers are never released
-- and are used during development.
lib.VERSION = '1.0.0'

return lib
