# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/gecoga98/Desktop/4º/FSIV/bits_samples

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/gecoga98/Desktop/4º/FSIV/bits_samples/build

# Include any dependencies generated for this target.
include CMakeFiles/parsing.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/parsing.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/parsing.dir/flags.make

CMakeFiles/parsing.dir/parsing.cpp.o: CMakeFiles/parsing.dir/flags.make
CMakeFiles/parsing.dir/parsing.cpp.o: ../parsing.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gecoga98/Desktop/4º/FSIV/bits_samples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/parsing.dir/parsing.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/parsing.dir/parsing.cpp.o -c /home/gecoga98/Desktop/4º/FSIV/bits_samples/parsing.cpp

CMakeFiles/parsing.dir/parsing.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/parsing.dir/parsing.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gecoga98/Desktop/4º/FSIV/bits_samples/parsing.cpp > CMakeFiles/parsing.dir/parsing.cpp.i

CMakeFiles/parsing.dir/parsing.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/parsing.dir/parsing.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gecoga98/Desktop/4º/FSIV/bits_samples/parsing.cpp -o CMakeFiles/parsing.dir/parsing.cpp.s

CMakeFiles/parsing.dir/parsing.cpp.o.requires:

.PHONY : CMakeFiles/parsing.dir/parsing.cpp.o.requires

CMakeFiles/parsing.dir/parsing.cpp.o.provides: CMakeFiles/parsing.dir/parsing.cpp.o.requires
	$(MAKE) -f CMakeFiles/parsing.dir/build.make CMakeFiles/parsing.dir/parsing.cpp.o.provides.build
.PHONY : CMakeFiles/parsing.dir/parsing.cpp.o.provides

CMakeFiles/parsing.dir/parsing.cpp.o.provides.build: CMakeFiles/parsing.dir/parsing.cpp.o


# Object files for target parsing
parsing_OBJECTS = \
"CMakeFiles/parsing.dir/parsing.cpp.o"

# External object files for target parsing
parsing_EXTERNAL_OBJECTS =

parsing: CMakeFiles/parsing.dir/parsing.cpp.o
parsing: CMakeFiles/parsing.dir/build.make
parsing: /usr/local/lib/libopencv_dnn.so.3.4.7
parsing: /usr/local/lib/libopencv_highgui.so.3.4.7
parsing: /usr/local/lib/libopencv_ml.so.3.4.7
parsing: /usr/local/lib/libopencv_objdetect.so.3.4.7
parsing: /usr/local/lib/libopencv_shape.so.3.4.7
parsing: /usr/local/lib/libopencv_stitching.so.3.4.7
parsing: /usr/local/lib/libopencv_superres.so.3.4.7
parsing: /usr/local/lib/libopencv_videostab.so.3.4.7
parsing: /usr/local/lib/libopencv_calib3d.so.3.4.7
parsing: /usr/local/lib/libopencv_features2d.so.3.4.7
parsing: /usr/local/lib/libopencv_flann.so.3.4.7
parsing: /usr/local/lib/libopencv_photo.so.3.4.7
parsing: /usr/local/lib/libopencv_video.so.3.4.7
parsing: /usr/local/lib/libopencv_videoio.so.3.4.7
parsing: /usr/local/lib/libopencv_imgcodecs.so.3.4.7
parsing: /usr/local/lib/libopencv_imgproc.so.3.4.7
parsing: /usr/local/lib/libopencv_core.so.3.4.7
parsing: CMakeFiles/parsing.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/gecoga98/Desktop/4º/FSIV/bits_samples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable parsing"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/parsing.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/parsing.dir/build: parsing

.PHONY : CMakeFiles/parsing.dir/build

CMakeFiles/parsing.dir/requires: CMakeFiles/parsing.dir/parsing.cpp.o.requires

.PHONY : CMakeFiles/parsing.dir/requires

CMakeFiles/parsing.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/parsing.dir/cmake_clean.cmake
.PHONY : CMakeFiles/parsing.dir/clean

CMakeFiles/parsing.dir/depend:
	cd /home/gecoga98/Desktop/4º/FSIV/bits_samples/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gecoga98/Desktop/4º/FSIV/bits_samples /home/gecoga98/Desktop/4º/FSIV/bits_samples /home/gecoga98/Desktop/4º/FSIV/bits_samples/build /home/gecoga98/Desktop/4º/FSIV/bits_samples/build /home/gecoga98/Desktop/4º/FSIV/bits_samples/build/CMakeFiles/parsing.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/parsing.dir/depend

