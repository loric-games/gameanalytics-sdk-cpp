#!lua

include "conanutils.premake5.lua"

t_conandeps = {}
t_conandeps["debug_x86_64"] = {}
t_conandeps["debug_x86_64"]["libcurl"] = {}
t_conandeps["debug_x86_64"]["libcurl"]["includedirs"] = {"/home/focus/.conan2/p/libcu002c0f7910f36/p/include"}
t_conandeps["debug_x86_64"]["libcurl"]["libdirs"] = {"/home/focus/.conan2/p/libcu002c0f7910f36/p/lib"}
t_conandeps["debug_x86_64"]["libcurl"]["bindirs"] = {"/home/focus/.conan2/p/libcu002c0f7910f36/p/bin"}
t_conandeps["debug_x86_64"]["libcurl"]["libs"] = {"curl"}
t_conandeps["debug_x86_64"]["libcurl"]["system_libs"] = {"rt", "pthread"}
t_conandeps["debug_x86_64"]["libcurl"]["defines"] = {"CURL_STATICLIB=1"}
t_conandeps["debug_x86_64"]["libcurl"]["cxxflags"] = {}
t_conandeps["debug_x86_64"]["libcurl"]["cflags"] = {}
t_conandeps["debug_x86_64"]["libcurl"]["sharedlinkflags"] = {}
t_conandeps["debug_x86_64"]["libcurl"]["exelinkflags"] = {}
t_conandeps["debug_x86_64"]["libcurl"]["frameworks"] = {}

if conandeps == nil then conandeps = {} end
conan_premake_tmerge(conandeps, t_conandeps)
