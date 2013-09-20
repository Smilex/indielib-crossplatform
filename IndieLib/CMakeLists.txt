##############################################################
# This file is part of IndieLib which is released under
#  GNU LESSER GENERAL PUBLIC LICENSE Version 3, 29 June 2007.
# See file LICENSE or go to fsf.org for full license details.
##############################################################

cmake_minimum_required (VERSION 2.6)
project(IndieLib)

option(USE_OPENGLES "Compile with OpenGL ES support" YES)

set ( SRC	common/src/CollisionParser.cpp
			common/src/DebugApi.cpp
			common/src/FreeImageHelper.cpp
			common/src/Global.cpp
			common/src/ImageCutter.cpp
			common/src/IND_3dMesh.cpp
			common/src/IND_3dMeshManager.cpp
			common/src/IND_Animation.cpp
			common/src/IND_AnimationManager.cpp
			common/src/IND_Camera2d.cpp
			common/src/IND_Camera3d.cpp
			common/src/IND_Entity2d.cpp
			common/src/IND_Entity2dManager.cpp
			common/src/IND_Entity3d.cpp
			common/src/IND_Entity3dManager.cpp
			common/src/IND_FontManager.cpp
			common/src/IndieLib.cpp
			common/src/IndieVersion.cpp
			common/src/IND_Image.cpp
			common/src/IND_ImageManager.cpp
			common/src/IND_Input.cpp
			common/src/IND_Light.cpp
			common/src/IND_LightManager.cpp
			common/src/IND_Math.cpp
			common/src/IND_Render.cpp
			common/src/IND_SpriterEntity.cpp
			common/src/IND_SpriterManager.cpp
			common/src/IND_Surface.cpp
			common/src/IND_SurfaceManager.cpp
			common/src/IND_Timer.cpp
			common/src/IND_TmxMap.cpp
			common/src/IND_TmxMapManager.cpp
			common/src/IND_Window.cpp
			common/src/PrecissionTimer.cpp
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
				common/src/render/opengl/OpenGLRender.cpp
				common/src/render/opengl/OpenGLTextureBuilder.cpp
				common/src/render/opengl/RenderCullingOpenGL.cpp
				common/src/render/opengl/RenderObject2dOpenGL.cpp
				common/src/render/opengl/RenderObject3dOpenGL.cpp
				common/src/render/opengl/RenderPrimitive2dOpenGL.cpp
				common/src/render/opengl/RenderText2dOpenGL.cpp
				common/src/render/opengl/RenderTransform2dOpenGL.cpp
				common/src/render/opengl/RenderTransform3dOpenGL.cpp
				common/src/render/opengl/RenderTransformCommonOpenGL.cpp
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

add_library( IndieLib ${SRC} ${INC} )

target_link_libraries( IndieLib OpenGL_LIBRARY GLEW_LIBRARY SDL2_LIBRARY TmxParser_LIBRARY UnitTest++_LIBRARY TINYXML_LIBRARIES SpriterParser )
