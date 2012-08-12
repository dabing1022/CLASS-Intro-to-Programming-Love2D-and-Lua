player = { 
    X = 0,
    Y = 0,
    Speed = 1,
    Score = 0,
    Name = "Lily"
}
function player:Move()
    if ( love.keyboard.isDown( "down" ) ) then
        self.Y = self.Y + self.Speed
    elseif ( love.keyboard.isDown( "up" ) ) then
        self.Y = self.Y - self.Speed
    end
    if ( love.keyboard.isDown( "left" ) and
            player.X - 1 > 0 ) then
        self.X = self.X - self.Speed
    elseif ( love.keyboard.isDown( "right" ) ) then
        self.X = self.X + self.Speed
    end
end

npc = {
    X = 100,
    Y = 100,
    Speed = 0.2,
    Score = 0,
    Name = "Bob"
}

npc2 = {
    X = 300,
    Y = 300,
    Speed = 0.1,
    Score = 0,
    Name = "Robert"
}
function MoveNpc( obj ) -- New
    if ( obj.X < gem.X ) then
        obj.X = obj.X + obj.Speed
    elseif ( npc.X > gem.X ) then
        obj.X = obj.X - obj.Speed
    end
    if ( obj.Y < gem.Y ) then
        obj.Y = obj.Y + obj.Speed
    elseif ( npc.Y > gem.Y ) then
        obj.Y = obj.Y - obj.Speed
    end
end

gem = {
    X = 600,
    Y = 400
}
