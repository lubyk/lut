--
-- Generate documentation for this project into 'html' folder
--
-- Use local version to build docs.
package.path = './?.lua;'..package.path
local lut = require 'lut'
lut.Doc.make {
  sources = {
    {'lut', ignore='assets'},
  },
  target = 'html',
  format = 'html',
  header = [[<h1><a href='http://lubyk.org'>Lubyk</a> documentation</h1> ]],
  index  = [=[
--[[--
  # Lubyk documentation

  ## List of available modules
--]]--
]=]
}
