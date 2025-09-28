#!lua

include "conanutils.premake5.lua"

t_conandeps = {}
t_conandeps["debug_x86_64"] = {}
t_conandeps["debug_x86_64"]["libcurl"] = {}
t_conandeps["debug_x86_64"]["libcurl"]["includedirs"] = {"C:/Users/phocu/.conan2/p/libcu4930d3292277b/p/include"}
t_conandeps["debug_x86_64"]["libcurl"]["libdirs"] = {"C:/Users/phocu/.conan2/p/libcu4930d3292277b/p/lib"}
t_conandeps["debug_x86_64"]["libcurl"]["bindirs"] = {"C:/Users/phocu/.conan2/p/libcu4930d3292277b/p/bin"}
t_conandeps["debug_x86_64"]["libcurl"]["libs"] = {"libcurl"}
t_conandeps["debug_x86_64"]["libcurl"]["system_libs"] = {"ws2_32"}
t_conandeps["debug_x86_64"]["libcurl"]["defines"] = {"CURL_STATICLIB=1"}
t_conandeps["debug_x86_64"]["libcurl"]["cxxflags"] = {}
t_conandeps["debug_x86_64"]["libcurl"]["cflags"] = {}
t_conandeps["debug_x86_64"]["libcurl"]["sharedlinkflags"] = {}
t_conandeps["debug_x86_64"]["libcurl"]["exelinkflags"] = {}
t_conandeps["debug_x86_64"]["libcurl"]["frameworks"] = {}

if conandeps == nil then conandeps = {} end
conan_premake_tmerge(conandeps, t_conandeps)
