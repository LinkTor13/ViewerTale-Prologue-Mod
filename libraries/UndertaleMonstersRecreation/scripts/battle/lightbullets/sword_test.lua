
---@class SmallBullet : LightBullet
local SmallBullet, super = Class(LightBullet)

---@param time number
---@param side string|nil
function SmallBullet:init(time, side)
    super.init(self, 0, 0, "bullets/knight_sword")
    self:setScale(1)

    self.side = side or "top"
    self.launched = false
    self.launch_effect_done = false
    self.sounded = false

    self.timer = math.max((time or 1) - 0.025, 0)

    self.destroy_on_hit = false
    self.physics.match_rotation = true

    local arena = Game.battle.arena

    -- Position initiale
    if self.side == "top" then
        self.x = Game.battle.soul.x
        self.y = arena:getTop() - 60

    elseif self.side == "left" then
        self.x = arena:getLeft() - 60
        self.y = Game.battle.soul.y

    elseif self.side == "right" then
        self.x = arena:getRight() + 60
        self.y = Game.battle.soul.y

    elseif self.side == "top_left" then
        self.x = arena:getLeft() - 60
        self.y = arena:getTop() - 60

    elseif self.side == "top_right" then
        self.x = arena:getRight() + 60
        self.y = arena:getTop() - 60
    end

    -- Rotation initiale
    self.rotation = math.atan2( Game.battle.soul.y - self.y, Game.battle.soul.x - self.x )

    -- Préparation
    Game.battle.timer:after(self.timer, function()
        self.launched = true
    end)

    Game.battle.timer:after(math.max(self.timer - 0.25, 0), function()
        Assets.playSound("knight_jump_quick", 1.5, 1.25)
    end)

    Game.battle.timer:tween(self.timer, self, {
        color = {0.1, 0.3, 1}
    })

    self:setHitbox(2, 5, self.sprite.width-4, self.sprite.height-10)
end

function SmallBullet:update()
    local arena = Game.battle.arena
    local soul = Game.battle.soul

    -- Suivi de la Soul pendant la préparation
    if not self.launched then
        if self.side == "top" then
            self.x = soul.x

        elseif self.side == "left" or self.side == "right" then
            self.y = soul.y
        end
    end

    -- Lancement
    if self.launched and not self.launch_effect_done then
        self.launch_effect_done = true

        -- Calcul de la direction vers la Soul
        local dx = soul.x - self.x
        local dy = soul.y - self.y

        self.rotation = math.atan2( Game.battle.soul.y - self.y, Game.battle.soul.x - self.x )

        -- Effets de lancement
        Assets.playSound("knight_cut2", 1.5, 1.25)

        self.sounded = true
        self.physics.speed = 150

        self:setColor(1, 1, 1, 1)
        self:setScale(4, 0.75)
        self.sprite:addFX(ColorMaskFX({1,1,1}, 1))
    end

    super.update(self)
end

function SmallBullet:shouldSwoon(damage, target, soul)
    return true
end

return SmallBullet
