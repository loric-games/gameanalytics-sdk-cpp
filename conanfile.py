import os
from conan import ConanFile
from conan.tools.files import copy

class GACppSdk(ConanFile):
    # Simplified settings as per the "Pre-built" guide
    settings = "os", "arch", "build_type"
    name = "ga-cpp-sdk"
    version = "5.0.0"


    # Define the directory structure for your pre-built binaries
    def layout(self):
        # The root folder containing your 'lib' and 'include' directories
        self.folders.source = "."
        # Defines where to find headers
        self.cpp.source.includedirs = ["include"]
        # Defines where to find the libraries based on platform
        lib_folder = os.path.join("Build",str(self.settings.build_type))
        self.cpp.build.libdirs = [lib_folder]

    # This method copies the files from your source layout into the final package
    def package(self):
        # Copy all headers from the 'include' folder
        copy(self, "*.h",
             os.path.join(self.source_folder, "include"),
             os.path.join(self.package_folder, "include"))
        # Copy the correct library file (.lib or .a) for the current platform
        copy(self, "*.lib",
             os.path.join(self.source_folder, self.cpp.build.libdirs[0]),
             os.path.join(self.package_folder, "lib"),
             keep_path=False)
        copy(self, "*.a",
             os.path.join(self.source_folder, self.cpp.build.libdirs[0]),
             os.path.join(self.package_folder, "lib"),
             keep_path=False)

    # Informs the consumer project of the library name
    def package_info(self):
        self.cpp_info.libs = ["GameAnalytics","crossguid"]
        if self.settings.os == "Linux":
            self.cpp_info.system_libs = ["pthread", "uuid"]


    # Specifies the dependencies required by the final consumer project
    def requirements(self):
        self.requires("libcurl/8.2.1")
        self.requires("openssl/3.3.2")
        self.requires("zlib/1.3")
