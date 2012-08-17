
map = { }

function map:LoadMap()
    filename = "Map.txt"
    
    mapFile = io.open( filename )
    
    line = mapFile.read( mapFile )
    while line do
        -- Grab a line
        line = mapFile.read( mapFile )
        -- Read the values of that line
    end
end

map:LoadMap()
