#!lua

include "conanutils.premake5.lua"

t_conandeps = {}
t_conandeps["release_x86_64"] = {}
t_conandeps["release_x86_64"]["libcurl"] = {}
t_conandeps["release_x86_64"]["libcurl"]["includedirs"] = {"C:/Users/phocu/.conan2/p/libcuf8c785e8ae8a1/p/include"}
t_conandeps["release_x86_64"]["libcurl"]["libdirs"] = {"C:/Users/phocu/.conan2/p/libcuf8c785e8ae8a1/p/lib"}
t_conandeps["release_x86_64"]["libcurl"]["bindirs"] = {"C:/Users/phocu/.conan2/p/libcuf8c785e8ae8a1/p/bin"}
t_conandeps["release_x86_64"]["libcurl"]["libs"] = {"libcurl"}
t_conandeps["release_x86_64"]["libcurl"]["system_libs"] = {"ws2_32"}
t_conandeps["release_x86_64"]["libcurl"]["defines"] = {"CURL_STATICLIB=1"}
t_conandeps["release_x86_64"]["libcurl"]["cxxflags"] = {}
t_conandeps["release_x86_64"]["libcurl"]["cflags"] = {}
t_conandeps["release_x86_64"]["libcurl"]["sharedlinkflags"] = {}
t_conandeps["release_x86_64"]["libcurl"]["exelinkflags"] = {}
t_conandeps["release_x86_64"]["libcurl"]["frameworks"] = {}

if conandeps == nil then conandeps = {} end
conan_premake_tmerge(conandeps, t_conandeps)
