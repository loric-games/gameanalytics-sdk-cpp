#!lua

include "conanutils.premake5.lua"

t_conandeps = {}
t_conandeps["release_x86_64"] = {}
t_conandeps["release_x86_64"]["zlib"] = {}
t_conandeps["release_x86_64"]["zlib"]["includedirs"] = {"/home/focus/.conan2/p/zlibf1bf21fff6145/p/include"}
t_conandeps["release_x86_64"]["zlib"]["libdirs"] = {"/home/focus/.conan2/p/zlibf1bf21fff6145/p/lib"}
t_conandeps["release_x86_64"]["zlib"]["bindirs"] = {"/home/focus/.conan2/p/zlibf1bf21fff6145/p/bin"}
t_conandeps["release_x86_64"]["zlib"]["libs"] = {"z"}
t_conandeps["release_x86_64"]["zlib"]["system_libs"] = {}
t_conandeps["release_x86_64"]["zlib"]["defines"] = {}
t_conandeps["release_x86_64"]["zlib"]["cxxflags"] = {}
t_conandeps["release_x86_64"]["zlib"]["cflags"] = {}
t_conandeps["release_x86_64"]["zlib"]["sharedlinkflags"] = {}
t_conandeps["release_x86_64"]["zlib"]["exelinkflags"] = {}
t_conandeps["release_x86_64"]["zlib"]["frameworks"] = {}

if conandeps == nil then conandeps = {} end
conan_premake_tmerge(conandeps, t_conandeps)
