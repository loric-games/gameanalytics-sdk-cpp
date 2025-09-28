#!lua

include "conanutils.premake5.lua"

t_conandeps = {}
t_conandeps["debug_x86_64"] = {}
t_conandeps["debug_x86_64"]["crossguid"] = {}
t_conandeps["debug_x86_64"]["crossguid"]["includedirs"] = {"/home/focus/.conan2/p/b/crossf49f7d5cd2f20/p/include"}
t_conandeps["debug_x86_64"]["crossguid"]["libdirs"] = {"/home/focus/.conan2/p/b/crossf49f7d5cd2f20/p/lib"}
t_conandeps["debug_x86_64"]["crossguid"]["bindirs"] = {"/home/focus/.conan2/p/b/crossf49f7d5cd2f20/p/bin"}
t_conandeps["debug_x86_64"]["crossguid"]["libs"] = {"xg"}
t_conandeps["debug_x86_64"]["crossguid"]["system_libs"] = {"m"}
t_conandeps["debug_x86_64"]["crossguid"]["defines"] = {}
t_conandeps["debug_x86_64"]["crossguid"]["cxxflags"] = {}
t_conandeps["debug_x86_64"]["crossguid"]["cflags"] = {}
t_conandeps["debug_x86_64"]["crossguid"]["sharedlinkflags"] = {}
t_conandeps["debug_x86_64"]["crossguid"]["exelinkflags"] = {}
t_conandeps["debug_x86_64"]["crossguid"]["frameworks"] = {}

if conandeps == nil then conandeps = {} end
conan_premake_tmerge(conandeps, t_conandeps)
