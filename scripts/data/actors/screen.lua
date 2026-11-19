
local actor, super = Class(Actor, "screen")

function actor:init()
    super.init(self)

    -- Display name
    self.name = "Screen"

    -- Width and height
    self.width = 34
    self.height = 24

    -- Hitbox
    self.hitbox = {0, 0, 34, 40}

    -- Color
    self.color = {0, 1, 0}

    -- Sprites
    self.path = "npcs/screengreen"
    self.default = "screengreen"

    -- Dialogue
    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil
    self.can_blush = false

    -- Animations
    self.animations = {
        ["screengreen"] = {"screengreen", 0.25, true},
    }

    -- Sprite offsets
    self.offsets = {}
end

return actor
