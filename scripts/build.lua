--
-- Update build files for this project
--
package.path = './?.lua;'..package.path
local lut = require 'lut'
local lib = lut

lut.Builder(lib):make()
