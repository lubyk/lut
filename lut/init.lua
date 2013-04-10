--[[--------------------
  # Lubyk utility module

  Currently, this module contains a documentation generator and
  testing facilities.

  This module is part of [lubyk](http://lubyk.org) project.  
  Install with [luarocks](http://luarocks.org) or [luadist](http://luadist.org).

    $ luarocks install lut    or    luadist install lut
  
--]]--------------------
local lub = require 'lub'
local lib = lub.Autoload 'lut'

-- Current version of 'lut' respecting [semantic versioning](http://semver.org).
lib.VERSION = '1.0.3'

return lib
