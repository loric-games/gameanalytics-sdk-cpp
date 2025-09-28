#!lua

include "conanutils.premake5.lua"

t_conandeps = {}
t_conandeps["release_x86_64"] = {}
t_conandeps["release_x86_64"]["cryptopp"] = {}
t_conandeps["release_x86_64"]["cryptopp"]["includedirs"] = {"C:/Users/phocu/.conan2/p/crypt627d2fb26373b/p/include"}
t_conandeps["release_x86_64"]["cryptopp"]["libdirs"] = {"C:/Users/phocu/.conan2/p/crypt627d2fb26373b/p/lib"}
t_conandeps["release_x86_64"]["cryptopp"]["bindirs"] = {"C:/Users/phocu/.conan2/p/crypt627d2fb26373b/p/bin"}
t_conandeps["release_x86_64"]["cryptopp"]["libs"] = {"cryptopp"}
t_conandeps["release_x86_64"]["cryptopp"]["system_libs"] = {"bcrypt", "ws2_32"}
t_conandeps["release_x86_64"]["cryptopp"]["defines"] = {}
t_conandeps["release_x86_64"]["cryptopp"]["cxxflags"] = {}
t_conandeps["release_x86_64"]["cryptopp"]["cflags"] = {}
t_conandeps["release_x86_64"]["cryptopp"]["sharedlinkflags"] = {}
t_conandeps["release_x86_64"]["cryptopp"]["exelinkflags"] = {}
t_conandeps["release_x86_64"]["cryptopp"]["frameworks"] = {}

if conandeps == nil then conandeps = {} end
conan_premake_tmerge(conandeps, t_conandeps)
