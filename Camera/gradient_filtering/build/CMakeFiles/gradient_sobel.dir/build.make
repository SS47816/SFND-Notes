# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

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
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/workspace/gradient_filtering

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/workspace/gradient_filtering/build

# Include any dependencies generated for this target.
include CMakeFiles/gradient_sobel.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/gradient_sobel.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/gradient_sobel.dir/flags.make

CMakeFiles/gradient_sobel.dir/src/gradient_sobel.cpp.o: CMakeFiles/gradient_sobel.dir/flags.make
CMakeFiles/gradient_sobel.dir/src/gradient_sobel.cpp.o: ../src/gradient_sobel.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/workspace/gradient_filtering/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/gradient_sobel.dir/src/gradient_sobel.cpp.o"
	/usr/bin/g++-7  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gradient_sobel.dir/src/gradient_sobel.cpp.o -c /home/workspace/gradient_filtering/src/gradient_sobel.cpp

CMakeFiles/gradient_sobel.dir/src/gradient_sobel.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gradient_sobel.dir/src/gradient_sobel.cpp.i"
	/usr/bin/g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/workspace/gradient_filtering/src/gradient_sobel.cpp > CMakeFiles/gradient_sobel.dir/src/gradient_sobel.cpp.i

CMakeFiles/gradient_sobel.dir/src/gradient_sobel.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gradient_sobel.dir/src/gradient_sobel.cpp.s"
	/usr/bin/g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/workspace/gradient_filtering/src/gradient_sobel.cpp -o CMakeFiles/gradient_sobel.dir/src/gradient_sobel.cpp.s

# Object files for target gradient_sobel
gradient_sobel_OBJECTS = \
"CMakeFiles/gradient_sobel.dir/src/gradient_sobel.cpp.o"

# External object files for target gradient_sobel
gradient_sobel_EXTERNAL_OBJECTS =

gradient_sobel: CMakeFiles/gradient_sobel.dir/src/gradient_sobel.cpp.o
gradient_sobel: CMakeFiles/gradient_sobel.dir/build.make
gradient_sobel: /usr/local/lib/libopencv_gapi.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_stitching.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_aruco.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_bgsegm.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_bioinspired.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_ccalib.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_cvv.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_dnn_objdetect.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_dpm.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_face.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_freetype.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_fuzzy.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_hdf.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_hfs.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_img_hash.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_line_descriptor.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_quality.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_reg.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_rgbd.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_saliency.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_sfm.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_stereo.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_structured_light.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_superres.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_surface_matching.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_tracking.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_videostab.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_viz.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_xfeatures2d.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_xobjdetect.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_xphoto.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_shape.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_datasets.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_plot.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_text.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_dnn.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_ml.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_phase_unwrapping.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_optflow.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_ximgproc.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_video.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_objdetect.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_calib3d.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_features2d.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_flann.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_highgui.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_videoio.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_imgcodecs.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_photo.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_imgproc.so.4.1.0
gradient_sobel: /usr/local/lib/libopencv_core.so.4.1.0
gradient_sobel: CMakeFiles/gradient_sobel.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/workspace/gradient_filtering/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable gradient_sobel"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gradient_sobel.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/gradient_sobel.dir/build: gradient_sobel

.PHONY : CMakeFiles/gradient_sobel.dir/build

CMakeFiles/gradient_sobel.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/gradient_sobel.dir/cmake_clean.cmake
.PHONY : CMakeFiles/gradient_sobel.dir/clean

CMakeFiles/gradient_sobel.dir/depend:
	cd /home/workspace/gradient_filtering/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/workspace/gradient_filtering /home/workspace/gradient_filtering /home/workspace/gradient_filtering/build /home/workspace/gradient_filtering/build /home/workspace/gradient_filtering/build/CMakeFiles/gradient_sobel.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/gradient_sobel.dir/depend

