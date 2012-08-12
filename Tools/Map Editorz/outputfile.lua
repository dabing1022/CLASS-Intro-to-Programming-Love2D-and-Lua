
filename = "sampleFile.txt"

x = 2

-- Writing
file = io.open( filename, "w" )
file:write( "Sample File\n" )
file:write( x )
file:write( "\n" )
file:write( "X = " .. x .. "\n!" )
file:close()