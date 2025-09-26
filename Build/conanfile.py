import os
from conan import ConanFile
from conan.tools.files import copy

class loreRecipe(ConanFile):
    settings = "os", "build_type", "arch"
    name = "ga-cpp-sdk"
    version = "v5.0.0"
    generators = "PremakeDeps"

    def _get_os_dir(self):
        if( self.settings.os == "Macos" ):
            return "Macosx";
        else:
            return str( self.settings.os );

    def layout(self):
        self.folders.generators = os.path.join( "..", "dist", "Workspace" )
        self.folders.build = os.path.join( ".." )
        self.folders.source = self.folders.build
        self.cpp.includedirs = ["Include"]
        lib_dir =  os.path.join( "", self._get_os_dir(), str( self.settings.arch ) );
        if self.settings.build_type == "Release":
            lib_dir = os.path.join( lib_dir, "Internal" );
        else:
            lib_dir = os.path.join( lib_dir, "Debug" );
        self.cpp.build.libdirs = [ lib_dir ]

    def package(self):
        local_lib_dir = os.path.join( self.build_folder, "Build", "Release")       
        local_tools_dir = os.path.join( "dist", self._get_os_dir(), str( self.settings.arch ), "Tools" );
        copy( self, "*.h", os.path.join( self.build_folder, "Include" ), os.path.join( self.package_folder, "include" ), keep_path = True )
        copy( self, "*.lib", local_lib_dir, os.path.join( self.package_folder, "lib" ), keep_path = False )
        copy( self, "*.dll", local_lib_dir, os.path.join( self.package_folder, "lib" ), keep_path = False )
        copy( self, "*.pdb", local_lib_dir, os.path.join( self.package_folder, "lib" ), keep_path = False )
        copy( self, "*.a", local_lib_dir, os.path.join( self.package_folder, "lib" ), keep_path = False )

    def package_info(self):
        self.cpp_info.libs = ["ga-sdk-cpp"]

    def requirements(self):
         self.requires( "crossguid/0.2.2" )
         self.requires( "cryptopp/8.9.0" )
         self.requires( "libcurl/8.2.1" )
         self.requires( "openssl/3.2.1" )
         self.requires( "sqlite3/3.47.1" )