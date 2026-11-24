
local actor, super = Class(Actor, "clamgoner")

function actor:init()
    super.init(self)

    -- Display name
    self.name = "ClamGoner"

    -- Width and height
    self.width = 39
    self.height = 58

    -- Hitbox
    self.hitbox = {0, 0, 39, 58}

    -- Color
    self.color = {1, 1, 1}

    -- Sprites
    self.path = "npcs/clamgoner"
    self.default = "clamgoner"

    -- Dialogue
    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil
    self.can_blush = false

    -- Animations
    self.animations = {
        ["talk_anim"] = {"talk", 0.5, true},
    }
function actor:onTalkStart(text, sprite)
    sprite:setAnimation({ "talk", 0.2, true })
end

function actor:onTalkEnd(text, sprite)
    sprite:setAnimation({ "clamgoner", 0.5, true })
end

    -- Sprite offsets
    self.offsets = {}
end

return actor
