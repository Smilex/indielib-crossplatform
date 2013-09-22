##############################################################
# This file is part of IndieLib which is released under
#  GNU LESSER GENERAL PUBLIC LICENSE Version 3, 29 June 2007.
# See file LICENSE or go to fsf.org for full license details.
##############################################################

set ( SRC	src/glew.c
			src/glewinfo.c
			src/visualinfo.c
	)

file ( GLOB INC include/*.h )

add_library(GLEW STATIC ${SRC} ${INC})
