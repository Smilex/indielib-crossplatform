##############################################################
# This file is part of IndieLib which is released under
#  GNU LESSER GENERAL PUBLIC LICENSE Version 3, 29 June 2007.
# See file LICENSE or go to fsf.org for full license details.
##############################################################

cmake_minimum_required (VERSION 2.6)
project(IndieLib)

option(USE_OPENGLES "Compile with OpenGL ES support" YES)

set ( SRC	${CMAKE_CURRENT_SOURCE_DIR}/common/src/CollisionParser.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/DebugApi.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/FreeImageHelper.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/Global.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/ImageCutter.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/IND_Animation.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/IND_AnimationManager.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/IND_Camera2d.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/IND_Entity2d.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/IND_Entity2dManager.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/IND_FontManager.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/IndieLib.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/IndieVersion.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/IND_Image.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/IND_ImageManager.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/IND_Input.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/IND_Light.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/IND_LightManager.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/IND_Math.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/IND_Render.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/IND_SpriterEntity.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/IND_SpriterManager.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/IND_Surface.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/IND_SurfaceManager.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/IND_Timer.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/IND_TmxMap.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/IND_TmxMapManager.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/IND_Window.cpp
			${CMAKE_CURRENT_SOURCE_DIR}/common/src/PrecissionTimer.cpp
	)

# Include headers don't need to be added to the compilation source
#  but some IDEs will only show them if they are, so I will GLOB them
file ( GLOB INC common/include/*.h common/include/*.hpp common/src/*.h common/src/*.hpp )

set( CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules" )

find_package(SDL2 REQUIRED)
find_package(FreeImage REQUIRED)
find_package(UnitTest++)
find_package(TinyXML)

option (USE_OPENGL "Use OpenGL for rendering." ON)

if (USE_OPENGL)
	find_package(OpenGL REQUIRED)
	find_package(GLEW REQUIRED)

	set ( SRC	${SRC}
				${CMAKE_CURRENT_SOURCE_DIR}/common/src/render/opengl/OpenGLRender.cpp
				${CMAKE_CURRENT_SOURCE_DIR}/common/src/render/opengl/OpenGLTextureBuilder.cpp
				${CMAKE_CURRENT_SOURCE_DIR}/common/src/render/opengl/RenderCullingOpenGL.cpp
				${CMAKE_CURRENT_SOURCE_DIR}/common/src/render/opengl/RenderObject2dOpenGL.cpp
				${CMAKE_CURRENT_SOURCE_DIR}/common/src/render/opengl/RenderObject3dOpenGL.cpp
				${CMAKE_CURRENT_SOURCE_DIR}/common/src/render/opengl/RenderPrimitive2dOpenGL.cpp
				${CMAKE_CURRENT_SOURCE_DIR}/common/src/render/opengl/RenderText2dOpenGL.cpp
				${CMAKE_CURRENT_SOURCE_DIR}/common/src/render/opengl/RenderTransform2dOpenGL.cpp
				${CMAKE_CURRENT_SOURCE_DIR}/common/src/render/opengl/RenderTransform3dOpenGL.cpp
				${CMAKE_CURRENT_SOURCE_DIR}/common/src/render/opengl/RenderTransformCommonOpenGL.cpp
				${CMAKE_CURRENT_SOURCE_DIR}/common/src/platform/OSOpenGLManager.cpp
		)

endif (USE_OPENGL)

if(NOT SDL2_FOUND)
	# Use SDL2 provided with IndieLib
	set (SDL2_INCLUDE_DIR common/dependencies/SDL-2.0/include)
endif(NOT SDL2_FOUND)

if(NOT UnitTest++_FOUND)
	add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/common/dependencies/unittest++)
	set ( UnitTest++_LIBRARY UnitTest++)
	set ( UnitTest++_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/common/dependencies/unittest++/src )
endif(NOT UnitTest++_FOUND)

if(NOT TINYXML_FOUND)
	add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/common/dependencies/tinyxml)
	set ( TINYXML_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/common/dependencies/tinyxml)
	set ( TINYXML_LIBRARIES TinyXML )
endif(NOT TINYXML_FOUND)

if (USE_OPENGLES)
	find_package(OpenGLES)

	if(NOT OpenGLES_FOUND)
		set (OpenGLES_INCLUDE_DIR "common/dependencies/OpenGL ES/GLES/v1.1")
	endif(NOT OpenGLES_FOUND)
endif(USE_OPENGLES)

include_directories( "${CMAKE_CURRENT_SOURCE_DIR}/common/include"
					 "${CMAKE_CURRENT_SOURCE_DIR}/common/src"
					 "${CMAKE_CURRENT_SOURCE_DIR}/common"
					 SDL2_INCLUDE_DIR
					 FreeImage_INCLUDE_DIR
					 GLEW_INCLUDE_DIR
					 OpenGLES_INCLUDE_DIR
					 TmxParser_INCLUDE_DIR
					 UnitTest++_INCLUDE_DIR
					 TINYXML_INCLUDE_DIR
					)

add_subdirectory(common/dependencies/SpriterParser)

option(IndieLib_BUILD_STATIC "Build IndieLib as a static library. Otherwise it is built as a shared library." OFF)

if (IndieLib_BUILD_STATIC)
	set (IndieLib_BUILD_TYPE STATIC)
else (IndieLib_BUILD_STATIC)
	set (IndieLib_BUILD_TYPE SHARED)
endif (IndieLib_BUILD_STATIC)

add_library( IndieLib ${IndieLib_BUILD_TYPE} ${SRC} ${INC} )

target_link_libraries( IndieLib ${OpenGL_LIBRARY} ${GLEW_LIBRARY} ${SDL2_LIBRARY} ${FreeImage_LIBRARY} ${TmxParser_LIBRARY} ${UnitTest++_LIBRARY} ${TINYXML_LIBRARIES} SpriterParser )
