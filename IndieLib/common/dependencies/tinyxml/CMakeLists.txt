##############################################################
# This file is part of IndieLib which is released under
#  GNU LESSER GENERAL PUBLIC LICENSE Version 3, 29 June 2007.
# See file LICENSE or go to fsf.org for full license details.
#
# File created date: 20/09/2013 (dd/mm/year)
# File last updated: 20/09/2013 (dd/mm/year)
# Author: Ian T. Jacobsen "Smilex" (iantj92@gmail.com)
#
##############################################################

set ( SRC	tinystr.cpp
			tinyxml.cpp
			tinyxmlerror.cpp
			tinyxmlparser.cpp
	)

file ( GLOB INC *.h *.hpp )

option ( TINXML_BUILD_STATIC "Build TinyXML as a static library. Otherwise build it as a shared library." ON)

if (TINYXML_BUILD_STATIC)
	set( TINYXML_BUILD_TYPE STATIC )
else (TINYXML_BUILD_STATIC)
	set( TINYXML_BUILD_TYPE SHARED )
endif (TINYXML_BUILD_STATIC)

add_library(TinyXML ${TINYXML_BUILD_TYPE} ${SRC} ${INC})
