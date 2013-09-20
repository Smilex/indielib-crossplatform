# File copied from http://gqp.googlecode.com/hg-history/20a492321c1e176bc5f15d958fd03ad78521fc36/external/TmxParser/FindTmxParser.cmake

# - Find TmxParser
# Find the native TmxParser includes and libraries
#
#  TMXPARSER_INCLUDE_DIR - where to find TmxParser/Config.hpp, etc.
#  TMXPARSER_LIBRARIES   - List of libraries when using libTmxParser.
#  TMXPARSER_FOUND       - True if libTmxParser found.

if(TMXPARSER_INCLUDE_DIR)
  # Already in cache, be silent
  set(TMXPARSER_FIND_QUIETLY TRUE)
endif(TMXPARSER_INCLUDE_DIR)

find_path(TMXPARSER_INCLUDE_DIR TmxParser/Tmx.h
  PATH_SUFFIXES include
  PATHS
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local
  /usr
  /sw          # Fink
  /opt/local   # DarwinPorts
  /opt/csw     # Blastwave
  /opt
  ${TMXPARSERDIR}
  $ENV{TMXPARSERDIR})

find_library(TMXPARSER_LIBRARY_DEBUG
  NAMES TmxParser-d TmxParser-s-d
  PATH_SUFFIXES lib64 lib
  PATHS
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local
  /usr
  /sw          # Fink
  /opt/local   # DarwinPorts
  /opt/csw     # Blastwave
  /opt
  ${TMXPARSERDIR}
  $ENV{TMXPARSERDIR})

find_library(TMXPARSER_LIBRARY_RELEASE
  NAMES TmxParser TmxParser-s
  PATH_SUFFIXES lib64 lib
  PATHS
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local
  /usr
  /sw          # Fink
  /opt/local   # DarwinPorts
  /opt/csw     # Blastwave
  /opt
  ${TMXPARSERDIR}
  $ENV{TMXPARSERDIR})

if(TMXPARSER_LIBRARY_DEBUG OR TMXPARSER_LIBRARY_RELEASE)
  # Library found
  set(TMXPARSER_FOUND TRUE)

  # If both were found, set TMXPARSER_LIBRARY to the release version
  if(TMXPARSER_LIBRARY_DEBUG AND TMXPARSER_LIBRARY_RELEASE)
    # This causes problems with building under NMake Makefiles (command line Visual Studio)
    set(TMXPARSER_LIBRARY debug ${TMXPARSER_LIBRARY_DEBUG}
      optimized ${TMXPARSER_LIBRARY_RELEASE})
  endif()

  if(TMXPARSER_LIBRARY_DEBUG AND NOT TMXPARSER_LIBRARY_RELEASE)
    set(TMXPARSER_LIBRARY ${TMXPARSER_LIBRARY_DEBUG})
  endif()

  if(NOT TMXPARSER_LIBRARY_DEBUG AND TMXPARSER_LIBRARY_RELEASE)
    set(TMXPARSER_LIBRARY ${TMXPARSER_LIBRARY_RELEASE})
  endif()
else()
  set(TMXPARSER_FOUND FALSE)
endif()

# Handle the QUIETLY and REQUIRED arguments and set SNDFILE_FOUND to TRUE if
# all listed variables are TRUE.
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(TMXPARSER DEFAULT_MSG TMXPARSER_LIBRARY TMXPARSER_INCLUDE_DIR)

if(TMXPARSER_FOUND)
  set(TMXPARSER_LIBRARIES ${TMXPARSER_LIBRARY})
else(TMXPARSER_FOUND)
  set(TMXPARSER_LIBRARIES)
endif(TMXPARSER_FOUND)

mark_as_advanced(TMXPARSER_INCLUDE_DIR
  TMXPARSER_LIBRARY
  TMXPARSER_LIBRARY_RELEASE
  TMXPARSER_LIBRARY_DEBUG)
