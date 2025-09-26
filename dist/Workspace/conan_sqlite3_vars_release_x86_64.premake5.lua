#!lua

include "conanutils.premake5.lua"

t_conandeps = {}
t_conandeps["release_x86_64"] = {}
t_conandeps["release_x86_64"]["sqlite3"] = {}
t_conandeps["release_x86_64"]["sqlite3"]["includedirs"] = {"C:/Users/phocu/.conan2/p/b/sqlitf1666eda5f895/p/include"}
t_conandeps["release_x86_64"]["sqlite3"]["libdirs"] = {"C:/Users/phocu/.conan2/p/b/sqlitf1666eda5f895/p/lib"}
t_conandeps["release_x86_64"]["sqlite3"]["bindirs"] = {"C:/Users/phocu/.conan2/p/b/sqlitf1666eda5f895/p/bin"}
t_conandeps["release_x86_64"]["sqlite3"]["libs"] = {"sqlite3"}
t_conandeps["release_x86_64"]["sqlite3"]["system_libs"] = {}
t_conandeps["release_x86_64"]["sqlite3"]["defines"] = {}
t_conandeps["release_x86_64"]["sqlite3"]["cxxflags"] = {}
t_conandeps["release_x86_64"]["sqlite3"]["cflags"] = {}
t_conandeps["release_x86_64"]["sqlite3"]["sharedlinkflags"] = {}
t_conandeps["release_x86_64"]["sqlite3"]["exelinkflags"] = {}
t_conandeps["release_x86_64"]["sqlite3"]["frameworks"] = {}

if conandeps == nil then conandeps = {} end
conan_premake_tmerge(conandeps, t_conandeps)
