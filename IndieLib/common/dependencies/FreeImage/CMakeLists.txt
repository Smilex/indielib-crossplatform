##############################################################
# This file is part of IndieLib which is released under
#  GNU LESSER GENERAL PUBLIC LICENSE Version 3, 29 June 2007.
# See file LICENSE or go to fsf.org for full license details.
#############################################################

file( GLOB SRC	Source/DeprecationManager/*.cpp
				Source/FreeImage/*.cpp
				Source/FreeImageLib/*.cpp
				Source/FreeImageToolkit/*.cpp
				Source/LibJPEG/*.cpp
				Source/LibOpenJPEG/*.cpp
				Source/LibPNG/*.cpp
				Source/LibRawLite/*.cpp
				Source/LibTIFF4/*.cpp
				Source/Metadata/*.cpp
				Source/OpenEXR/*.cpp
				Source/ZLib/*.cpp
				Source/DeprecationManager/*.c
				Source/FreeImage/*.c
				Source/FreeImageLib/*.c
				Source/FreeImageToolkit/*.c
				Source/LibJPEG/*.c
				Source/LibOpenJPEG/*.c
				Source/LibPNG/*.c
				Source/LibRawLite/*.c
				Source/LibTIFF4/*.c
				Source/Metadata/*.c
				Source/OpenEXR/*.c
				Source/ZLib/*.c
	)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/Source)

add_library(FreeImage STATIC ${SRC})
