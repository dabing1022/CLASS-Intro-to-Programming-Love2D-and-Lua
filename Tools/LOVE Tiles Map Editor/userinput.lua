require "editor"

userinput = {}

function userinput:GetInput()
    self:CheckForPaint()
    self:CheckForUndoLast()
    self:CheckForBrushChange()
    self:CheckForChangeOffset()
    self:CheckForSave()
end

function userinput:CheckForPaint()
	if ( love.mouse.isDown( "l" ) ) then
		editor:PaintTile()
	end
end

function userinput:CheckForUndoLast()
	if ( editor.mouseCooldown <= 0 ) then
		if ( love.keyboard.isDown( "z" ) ) then
            RemoveLastTile()
		end
		editor.mouseCooldown = editor.mouseCooldownMax
	end
end

function userinput:CheckForChangeOffset()
	-- Adjust offset
	if ( love.keyboard.isDown( "left" ) ) then
		viewOffset.x = viewOffset.x - 5
	elseif ( love.keyboard.isDown( "right" ) ) then
		viewOffset.x = viewOffset.x + 5
	end
	if ( love.keyboard.isDown( "up" ) ) then
		viewOffset.y = viewOffset.y - 5
	elseif ( love.keyboard.isDown( "down" ) ) then
		viewOffset.y = viewOffset.y + 5
	end
end

function userinput:CheckForBrushChange()
	if ( love.keyboard.isDown( "1" ) ) then
		editor.currentBrush.tile = tileset.bush
		editor.currentBrush.name = "Bush"
	
    elseif ( love.keyboard.isDown( "2" ) ) then
		editor.currentBrush.tile = tileset.tree
		editor.currentBrush.name = "Tree"
	
    elseif ( love.keyboard.isDown( "3" ) ) then
		editor.currentBrush.tile = tileset.gold
		editor.currentBrush.name = "Gold"
	
    elseif ( love.keyboard.isDown( "4" ) ) then
		editor.currentBrush.tile = tileset.sand
		editor.currentBrush.name = "Sand"
	
    elseif ( love.keyboard.isDown( "5" ) ) then
		editor.currentBrush.tile = tileset.blueHouse
		editor.currentBrush.name = "Blue House"
	
    elseif ( love.keyboard.isDown( "6" ) ) then
		editor.currentBrush.tile = tileset.tanHouse
		editor.currentBrush.name = "Tan House"
        
	elseif ( love.keyboard.isDown( "7" ) ) then
		editor.currentBrush.tile = tileset.redHouse
		editor.currentBrush.name = "Red House"
	end
end

function userinput:CheckForSave()
    if ( love.keyboard.isDown( "s" ) ) then
        SaveMap()
    end
end
