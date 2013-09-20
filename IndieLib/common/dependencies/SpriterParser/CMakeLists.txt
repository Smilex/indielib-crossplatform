##############################################################
# This file is part of IndieLib which is released under
#  GNU LESSER GENERAL PUBLIC LICENSE Version 3, 29 June 2007.
# See file LICENSE or go to fsf.org for full license details.
##############################################################

set ( SRC	Animation.cpp
			Mainline.cpp
			MainlineKey.cpp
			Timeline.cpp
			TimelineKey.cpp
	)

file ( GLOB INC *.h *.hpp )

add_library( SpriteParser STATIC ${SRC} ${INC} )
