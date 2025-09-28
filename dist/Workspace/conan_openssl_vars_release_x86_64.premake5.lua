#!lua

include "conanutils.premake5.lua"

t_conandeps = {}
t_conandeps["release_x86_64"] = {}
t_conandeps["release_x86_64"]["openssl"] = {}
t_conandeps["release_x86_64"]["openssl"]["includedirs"] = {"/home/focus/.conan2/p/opens5e24f8e908f3a/p/include"}
t_conandeps["release_x86_64"]["openssl"]["libdirs"] = {"/home/focus/.conan2/p/opens5e24f8e908f3a/p/lib"}
t_conandeps["release_x86_64"]["openssl"]["bindirs"] = {"/home/focus/.conan2/p/opens5e24f8e908f3a/p/bin"}
t_conandeps["release_x86_64"]["openssl"]["libs"] = {"ssl", "crypto"}
t_conandeps["release_x86_64"]["openssl"]["system_libs"] = {"dl", "pthread", "rt"}
t_conandeps["release_x86_64"]["openssl"]["defines"] = {}
t_conandeps["release_x86_64"]["openssl"]["cxxflags"] = {}
t_conandeps["release_x86_64"]["openssl"]["cflags"] = {}
t_conandeps["release_x86_64"]["openssl"]["sharedlinkflags"] = {}
t_conandeps["release_x86_64"]["openssl"]["exelinkflags"] = {}
t_conandeps["release_x86_64"]["openssl"]["frameworks"] = {}

if conandeps == nil then conandeps = {} end
conan_premake_tmerge(conandeps, t_conandeps)
