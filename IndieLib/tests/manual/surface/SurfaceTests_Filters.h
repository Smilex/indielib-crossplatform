/*****************************************************************************************
 * Desc: SurfaceTests_Filters class
 *****************************************************************************************/

/*
IndieLib 2d library Copyright (C) 2005 Javier L�pez L�pez (info@pixelartgames.com)
THIS FILE IS AN ADDITIONAL FILE ADDED BY Miguel Angel Qui�ones (2011) (mail:m.quinones.garcia@gmail.com / mikeskywalker007@gmail.com), BUT HAS THE
SAME LICENSE AS THE WHOLE LIBRARY TO RESPECT ORIGINAL AUTHOR OF LIBRARY

This library is free software; you can redistribute it and/or modify it under the
terms of the GNU Lesser General Public License as published by the Free Software
Foundation; either version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with
this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place,
Suite 330, Boston, MA 02111-1307 USA
*/
#ifndef _SurfaceTests_Filters_
#define _SurfaceTests_Filters_

#include "manual/ManualTests.h"

class IND_Surface;
class IND_Entity2d;
class IND_Animation;

class SurfaceTests_Filters : public ManualTests {
public:

    SurfaceTests_Filters():
		_surfaces(NULL),
		_entities(NULL),
        _animations(NULL),
		_testedEntities(0){
		init();
	}

	virtual ~SurfaceTests_Filters() {
		release();
	}
	void prepareTests();
	void performTests(float dt);

    bool isActive();
    void setActive(bool active);

private:
	void init();
	void release();

    //NOTE: UPDATE THIS ACCORDINGLY! (CRASHES, NOT USED NEW TESTS...)
	int _testedEntities;

	IND_Surface** _surfaces;

	IND_Entity2d** _entities;
    
    IND_Animation** _animations;
};


#endif // _SurfaceTests_Filters_
