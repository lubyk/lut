--[[------------------------------------------------------
  # Build configuration generator

  This class helps setup CMake and luarocks configuration
  files from a single configuration table and some conventions
  regarding file location.

  # Conventions

  ## Lua files

  Lua files all live into a folder with the same name as the library's "require"
  name ('library type'). The library itself is named "init.lua":

    [library type]
      + init.lua
      + SomeClass.lua

  ## Assets

  All assets files (css, templates, etc) that need to be installed along with
  lua files should live into "[library type]/assets":

    [library type]
      + assets
        + style.css
        + etc

  ## C++ headers

  C++ headers live inside the "include" folder. Vendor headers needed by the
  project can live in "src" folder.

    include
      + [library type]
        + SomeClass.h

  ## C++ source files

  Source files live into "src". Generated bindings in "src/bind". Platform
  specific files in "src/[plat]".

    src
      + bind
        + dub
        + [library type].cpp
        + [library type]_SomeClass.cpp
      + SomeClass.cpp
      + macosx
        + SomeClass.cpp  -- macosx specific code for the class
      + linux
        + SomeClass.cpp

  # Configuration format
  
  All table fields have detailed descriptions below.
  
  + `type`       : the name of the library used with 'require'.
  + `DESCRIPTION`: a table with descriptive fields.
  + `VERSION`    : version string respecting semantic versionning (ex. '2.3.1').
  + `DEPENDS`    : a table with a list of dependency information.
  + `BUILD`      : a table with build information.
  
  ## DESCRIPTION

  The description entry contains basic information on the library displayed in
  software distributions such as luarocks.

  + `summary`   : a short summary (think "long title").
  + `detailed`  : a couple of phrases describing the library (not a full documentation)
  + `homepage`  : the url where the full documentation is located (starts with 'http').
  + `author`    : author name.
  + `maintainer`: optional maintainer name (author is used if this is not set).
  + `license`   : license.
  
  ## VERSION
  
  A version string with `MAJOR.MINOR.PATCH` numbers. Major number changes can
  introduce backward incompatible changes. Minor changes add features without
  breaking compatibility and patch changes do not change the API (bug fixes,
  code improvements).

  Every released version must be tagged with 'REL-[Major.Minor.Patch]' tag.
  
  ## DEPENDS

  A list of strings defining dependency. The format of a dependency is:

    '[library type] >= [min version number], < [max version number]'

  or

    '[library type] ~> [major number]'
  
  ## BUILD

  + `github`   : name of github account (for source url) (can be replaced by `source`)
  + `url`      : full url to "tar.gz" file for this version. Not needed if
                 github is used and version tagging is respected.
  + `dir`      : name of extracted source directory. Only needed with `url`.
  + `includes` : list of header include paths (relative to project root).
  + `libraries`: libraries common to all platforms.
  + `platlibs` : platform specific library dependencies.
  + `platdefs` : platform specific defines.
  + `pure_lua` : set to `true` if the library does not contain any C/C++ code.

  # Example

  Here is a complete example taken from [lens](http://doc.lubyk.org/lens.html)
  scheduler library. Actually, for all lubyk libraries, the configuration table
  is the library itself (all fields exist in the library table).

    local builder = lut.Builder {

      type = 'lens',

      DESCRIPTION = {
        summary = "Lubyk networking and scheduling.",
        detailed = [=[
          lens.Scheduler: core scheduling class.

          lens.Poller: fast poller with nanosecond precision.

          lens.Thread: threading class to use with scheduler.

          lens.Timer: precise non-drifting timer.

          lens.Finalizer: run code on garbage collection.

          lens.Popen: pipe working with scheduler (non-blocking).
        ]=],
        homepage = "http://doc.lubyk.org/lens.html",
        author   = "Gaspard Bucher",
        license  = "MIT",      
      },

      VERSION = '1.0.0',

      DEPENDS = {
        'lua >= 5.1, < 5.3',
        'lub ~> 1',
      },

      BUILD = {
        includes  = {'include', 'src/bind'},
        libraries = {'stdc++'},
        platlibs = {
          linux   = {'stdc++', 'rt'},
          macosx  = {
            'stdc++',
            '-framework Foundation',
            '-framework Cocoa',
            'objc',
          },
        },                 
      },
      
    }
  
--]]------------------------------------------------------
local lub     = require 'lub'
local lib     = lub.class 'lut.Builder'
local private = {}

-- Create a new builder object from a configuration table (see above for config
-- format and options).
function lib.new(config)
  local self = {
    config = config,
  }
  return setmetatable(self, lib)
end

function lib:make()
  local config = self.config
  local tmp = lub.Template(lub.content(lub.path '|assets/builder/rockspec.in'))
  local path = config.type..'-'..config.VERSION..'-1.rockspec'
  lub.writeall(path, tmp:run(config))
  print("Generated '"..path.."'")


  tmp  = lub.Template(lub.content(lub.path '|assets/builder/dist.info.in'))
  path = 'dist.info'
  lub.writeall(path, tmp:run(config))
  print("Generated '"..path.."'")

  tmp  = lub.Template(lub.content(lub.path '|assets/builder/CMakeLists.txt.in'))
  path = 'CMakeLists.txt'
  lub.writeall(path, tmp:run(config))
  print("Generated '"..path.."'")
end

return lib
