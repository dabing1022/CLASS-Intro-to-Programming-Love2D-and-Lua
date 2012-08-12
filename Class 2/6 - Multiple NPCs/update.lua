require "collisionTables"
require "objects"

function love.update()
    player:Move()
    MoveNpc( npc )
    MoveNpc( npc2 )

-- COLLISION
    if ( collision( player, gem ) ) then
        gem.X = math.random( 0, 600)
        gem.Y = math.random(0, 400)
        player.Score = player.Score + 1 -- new
    end
    if ( collision( npc, gem ) ) then
        gem.X = math.random( 0, 600)
        gem.Y = math.random(0, 400)
    end
    if ( collision( npc2, gem ) ) then
        gem.X = math.random( 0, 600)
        gem.Y = math.random(0, 400)
    end
end
