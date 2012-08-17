-- Class 3 Program 4
-- http://www.moosader.com/resources/tutorials/love-lua/1
-- (c) Rachel J. Morris, 2012
-- zlib license

require "player"

userinput = {}

function userinput:GetInput()
    --self:CheckForChangeOffset()
    player:GetInput()
end

