#!lua

include "conanutils.premake5.lua"

t_conandeps = {}
t_conandeps["debug_x86_64"] = {}
t_conandeps["debug_x86_64"]["cryptopp"] = {}
t_conandeps["debug_x86_64"]["cryptopp"]["includedirs"] = {"/home/focus/.conan2/p/b/cryptd31d8c480d3e7/p/include"}
t_conandeps["debug_x86_64"]["cryptopp"]["libdirs"] = {"/home/focus/.conan2/p/b/cryptd31d8c480d3e7/p/lib"}
t_conandeps["debug_x86_64"]["cryptopp"]["bindirs"] = {"/home/focus/.conan2/p/b/cryptd31d8c480d3e7/p/bin"}
t_conandeps["debug_x86_64"]["cryptopp"]["libs"] = {"cryptopp"}
t_conandeps["debug_x86_64"]["cryptopp"]["system_libs"] = {"pthread", "m"}
t_conandeps["debug_x86_64"]["cryptopp"]["defines"] = {}
t_conandeps["debug_x86_64"]["cryptopp"]["cxxflags"] = {}
t_conandeps["debug_x86_64"]["cryptopp"]["cflags"] = {}
t_conandeps["debug_x86_64"]["cryptopp"]["sharedlinkflags"] = {}
t_conandeps["debug_x86_64"]["cryptopp"]["exelinkflags"] = {}
t_conandeps["debug_x86_64"]["cryptopp"]["frameworks"] = {}

if conandeps == nil then conandeps = {} end
conan_premake_tmerge(conandeps, t_conandeps)
