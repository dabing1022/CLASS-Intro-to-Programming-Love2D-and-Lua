-- Class 3 Program 2
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

-- Box-based collision detection
-- Parameters are expected to have:
-- x, y, width, height
function Collision( obj1, obj2 )
	left1 	= obj1.x
	right1 	= obj1.x + obj1.width
	top1 	= obj1.y
	bottom1 = obj1.y + obj1.height
	
	left2 	= obj2.x
	right2 	= obj2.x + obj2.width
	top2 	= obj2.y
	bottom2 = obj2.y + obj2.height
	
	if ( 	left1 < right2 and
			right1 > left2 and
			top1 < bottom2 and
			bottom1 > top2 ) then
		return true	
	end
	
	return false
end
