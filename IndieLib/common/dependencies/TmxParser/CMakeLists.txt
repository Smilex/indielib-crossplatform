##############################################################
# This file is part of IndieLib which is released under
#  GNU LESSER GENERAL PUBLIC LICENSE Version 3, 29 June 2007.
# See file LICENSE or go to fsf.org for full license details.
##############################################################

set ( SRC	TmxImage.cpp
			TmxLayer.cpp
			TmxMap.cpp
			TmxObject.cpp
			TmxObjectGroup.cpp
			TmxPolygon.cpp
			TmxPolyline.cpp
			TmxPropertySet.cpp
			TmxTile.cpp
			TmxTileset.cpp
			TmxUtil.cpp
			base64/base64.cpp
	)

file ( GLOB INC *.h *.hpp base64/*.h base64/*.hpp )

include_directories(${CMAKE_SOURCE_DIR}/common)

add_library(TmxParser STATIC ${SRC} ${INC})
