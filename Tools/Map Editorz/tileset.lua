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
	self:LoadImage( self.bush, "Bush.png" )
	self:LoadImage( self.gold, "Gold.png" )
	self:LoadImage( self.grass, "Grass.png" )
	self:LoadImage( self.sand, "Sand.png" )
	self:LoadImage( self.tree, "Tree.png" )
	self:LoadImage( self.blueHouse, "House1.png" )
	self:LoadImage( self.tanHouse, "House2.png" )
	self:LoadImage( self.redHouse, "House3.png" )
end

function tileset:LoadImage( item, name )
	item.image = love.graphics.newImage( imageFolder .. name )
	item.width = item.image:getWidth()
	item.height = item.image:getHeight()
end
