--[[--------------------
  # Lubyk utility module <a href="https://travis-ci.org/lubyk/lut"><img src="https://travis-ci.org/lubyk/lut.png" alt="Build Status"></a> 

  Currently, this module contains a documentation generator and
  testing facilities.
  
  <html><a href="https://github.com/lubyk/lut"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://s3.amazonaws.com/github/ribbons/forkme_right_green_007200.png" alt="Fork me on GitHub"></a></html>

  This module is part of the [lubyk](http://lubyk.org) project. *MIT license*
  &copy; Gaspard Bucher 2014.

  ## Installation
  
  With [luarocks](http://luarocks.org):

    $ luarocks install lut
  
  With [luadist](http://luadist.org):

    $ luadist install lut
  
--]]--------------------
local lub = require 'lub'
local lib = lub.Autoload 'lut'

-- Current version of 'lut' respecting [semantic versioning](http://semver.org).
lib.VERSION = '1.0.3'

-- Library dependencies
lib.DEPENDS = { -- doc
  -- Compatible with Lua 5.1, 5.2 and LuaJIT
  'lua >= 5.1, < 5.3',
  -- Uses [Lubyk base library](http://doc.lubyk.org/lub.html)
  'lub >= 1.0.3, < 1.1',
}

return lib
