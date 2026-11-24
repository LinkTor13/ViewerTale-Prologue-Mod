
local actor, super = Class(Actor, "gonerkid")

function actor:init()
    super.init(self)

    -- Display name
    self.name = "Gonerkid"

    -- Width and height
    self.width = 22
    self.height = 29

    -- Hitbox
    self.hitbox = {0, 0, 22, 29}

    -- Color
    self.color = {1, 1, 1}

    -- Sprites
    self.path = "npcs/gonerkid"
    self.default = "gonerkid"

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
    sprite:setAnimation({ "gonerkid", 0.5, true })
end

    -- Sprite offsets
    self.offsets = {}
end

return actor
