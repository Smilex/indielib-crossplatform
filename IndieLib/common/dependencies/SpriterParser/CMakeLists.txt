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

set ( SRC	Animation.cpp
			Mainline.cpp
			MainlineKey.cpp
			Timeline.cpp
			TimelineKey.cpp
	)

file ( GLOB INC *.h *.hpp )

add_library( SpriteParser STATIC ${SRC} ${INC} )
