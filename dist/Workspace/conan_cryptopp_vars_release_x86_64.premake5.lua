#!lua

include "conanutils.premake5.lua"

t_conandeps = {}
t_conandeps["release_x86_64"] = {}
t_conandeps["release_x86_64"]["cryptopp"] = {}
t_conandeps["release_x86_64"]["cryptopp"]["includedirs"] = {"/home/focus/.conan2/p/b/crypt4b66d3b3aca9a/p/include"}
t_conandeps["release_x86_64"]["cryptopp"]["libdirs"] = {"/home/focus/.conan2/p/b/crypt4b66d3b3aca9a/p/lib"}
t_conandeps["release_x86_64"]["cryptopp"]["bindirs"] = {"/home/focus/.conan2/p/b/crypt4b66d3b3aca9a/p/bin"}
t_conandeps["release_x86_64"]["cryptopp"]["libs"] = {"cryptopp"}
t_conandeps["release_x86_64"]["cryptopp"]["system_libs"] = {"pthread", "m"}
t_conandeps["release_x86_64"]["cryptopp"]["defines"] = {}
t_conandeps["release_x86_64"]["cryptopp"]["cxxflags"] = {}
t_conandeps["release_x86_64"]["cryptopp"]["cflags"] = {}
t_conandeps["release_x86_64"]["cryptopp"]["sharedlinkflags"] = {}
t_conandeps["release_x86_64"]["cryptopp"]["exelinkflags"] = {}
t_conandeps["release_x86_64"]["cryptopp"]["frameworks"] = {}

if conandeps == nil then conandeps = {} end
conan_premake_tmerge(conandeps, t_conandeps)
