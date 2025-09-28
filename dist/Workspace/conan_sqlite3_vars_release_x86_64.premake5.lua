#!lua

include "conanutils.premake5.lua"

t_conandeps = {}
t_conandeps["release_x86_64"] = {}
t_conandeps["release_x86_64"]["sqlite3"] = {}
t_conandeps["release_x86_64"]["sqlite3"]["includedirs"] = {"/home/focus/.conan2/p/b/sqlite6c5df00feb34/p/include"}
t_conandeps["release_x86_64"]["sqlite3"]["libdirs"] = {"/home/focus/.conan2/p/b/sqlite6c5df00feb34/p/lib"}
t_conandeps["release_x86_64"]["sqlite3"]["bindirs"] = {"/home/focus/.conan2/p/b/sqlite6c5df00feb34/p/bin"}
t_conandeps["release_x86_64"]["sqlite3"]["libs"] = {"sqlite3"}
t_conandeps["release_x86_64"]["sqlite3"]["system_libs"] = {"pthread", "dl", "m"}
t_conandeps["release_x86_64"]["sqlite3"]["defines"] = {}
t_conandeps["release_x86_64"]["sqlite3"]["cxxflags"] = {}
t_conandeps["release_x86_64"]["sqlite3"]["cflags"] = {}
t_conandeps["release_x86_64"]["sqlite3"]["sharedlinkflags"] = {}
t_conandeps["release_x86_64"]["sqlite3"]["exelinkflags"] = {}
t_conandeps["release_x86_64"]["sqlite3"]["frameworks"] = {}

if conandeps == nil then conandeps = {} end
conan_premake_tmerge(conandeps, t_conandeps)
