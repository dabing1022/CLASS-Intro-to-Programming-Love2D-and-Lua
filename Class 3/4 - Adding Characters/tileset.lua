-- Class 3 Program 4
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

imageFolder = "Images/"

tileset = {
	bush = {
	},
	gold = {
	},
	grass = {
	},
	sand = {
	},
	tree = {
	},
	blueHouse = {
	},
	tanHouse = {
	},
	redHouse = {
	}
}
function tileset:Setup()
	self:LoadImages()
end

function tileset:LoadImages()
	self:LoadImage( self.bush, "Bush" )
	self:LoadImage( self.gold, "Gold" )
	self:LoadImage( self.grass, "Grass" )
	self:LoadImage( self.sand, "Sand" )
	self:LoadImage( self.tree, "Tree" )
	self:LoadImage( self.blueHouse, "House1" )
	self:LoadImage( self.tanHouse, "House2" )
	self:LoadImage( self.redHouse, "House3" )
end

function tileset:LoadImage( item, name )
	item.image = love.graphics.newImage( imageFolder .. name .. ".png" )
	item.width = item.image:getWidth()
	item.height = item.image:getHeight()
    item.name = name
end
