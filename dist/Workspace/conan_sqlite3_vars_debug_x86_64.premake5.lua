#!lua

include "conanutils.premake5.lua"

t_conandeps = {}
t_conandeps["debug_x86_64"] = {}
t_conandeps["debug_x86_64"]["sqlite3"] = {}
t_conandeps["debug_x86_64"]["sqlite3"]["includedirs"] = {"C:/Users/phocu/.conan2/p/sqlit823a7cf8a3a52/p/include"}
t_conandeps["debug_x86_64"]["sqlite3"]["libdirs"] = {"C:/Users/phocu/.conan2/p/sqlit823a7cf8a3a52/p/lib"}
t_conandeps["debug_x86_64"]["sqlite3"]["bindirs"] = {"C:/Users/phocu/.conan2/p/sqlit823a7cf8a3a52/p/bin"}
t_conandeps["debug_x86_64"]["sqlite3"]["libs"] = {"sqlite3"}
t_conandeps["debug_x86_64"]["sqlite3"]["system_libs"] = {}
t_conandeps["debug_x86_64"]["sqlite3"]["defines"] = {}
t_conandeps["debug_x86_64"]["sqlite3"]["cxxflags"] = {}
t_conandeps["debug_x86_64"]["sqlite3"]["cflags"] = {}
t_conandeps["debug_x86_64"]["sqlite3"]["sharedlinkflags"] = {}
t_conandeps["debug_x86_64"]["sqlite3"]["exelinkflags"] = {}
t_conandeps["debug_x86_64"]["sqlite3"]["frameworks"] = {}

if conandeps == nil then conandeps = {} end
conan_premake_tmerge(conandeps, t_conandeps)
