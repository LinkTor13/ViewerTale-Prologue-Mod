function Mod:init()
    Game:registerEvent("squeak", function(data)
        return Squeak(data.x, data.y, {data.width, data.height, data.polygon})
    end)
    print("Loaded " .. self.info.name .. "!")
end
function Mod:postInit(new_file)
    if new_file then
                Game.lw_money = 4898
        
    end
end
