--[[--------------------
  # Lubyk utility module

  Currently, this module contains a documentation generator and
  testing facilities.

--]]--------------------
local lub = require 'lub'
local lib = lub.Autoload 'lut'

-- Current version for 'lut' module. Odd minor version numbers are never
-- released and are used during development.
lib.VERSION = '1.0.2'

return lib
