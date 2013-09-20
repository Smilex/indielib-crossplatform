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

set ( SRC	src/AssertException.cpp
			src/Checks.cpp
			src/CurrentTest.cpp
			src/DeferredTestReporter.cpp
			src/DeferredTestResult.cpp
			src/MemoryOutStream.cpp
			src/ReportAssert.cpp
			src/Test.cpp
			src/TestDetails.cpp
			src/TestList.cpp
			src/TestReporter.cpp
			src/TestResults.cpp
			src/TestRunner.cpp
			src/TimeConstraint.cpp
			src/XmlTestReporter.cpp
	)

file ( GLOB INC src/*.h src/*.hpp )

if ( WIN32 )
	set ( SRC ${SRC} src/win32/TimeHelpers.cpp )
	set ( INC ${INC} src/win32/TimeHelpers.h )
else ( WIN32 )
	set ( SRC ${SRC} src/Posix/TimeHelpers.cpp src/Posix/SignalTranslator.cpp )
	set ( INC ${INC} src/Posix/TimeHelpers.h src/Posix/SignalTranslator.cpp )
endif ( WIN32 )

option( BUILD_STATIC "Build UnitTest++ as a static library. If not, then it is built as a shared library" YES )

if (BUILD_STATIC)
	set ( BUILD_TYPE STATIC )
else (BUILD_STATIC)
	set ( BUILD_TYPE SHARED )
endif (BUILD_STATIC)

add_library(UnitTest++ SRC INC BUILD_TYPE)
