
local Basic, super = Class(LightWave)

function Basic:init()
    super.init(self)
    self.time = 8
end

function Basic:onStart()
    local timer = 1.5

    -- Attaque individuelle
    local function knife(side)
        if timer > 0.6 then
            timer = timer - 0.1
        end

        self:spawnBullet("sword_test", timer - 0.1, side)
    end

    -- Attaque finale double
    local function final_attack()
        if timer > 0.6 then
            timer = timer - 0.25
        end

        local delay = timer - 0.25

        self:spawnBullet("sword", delay, "top_left")
        self:spawnBullet("sword", delay, "top_right")
    end

Game.battle.timer:script(function(wait)
    -- 7 attaques normales

    knife(Utils.pick({"top", "left", "right"}))
    wait(timer-0.2)

    knife(Utils.pick({"top", "left", "right"}))
    wait(timer-0.2)

    knife(Utils.pick({"top", "left", "right"}))
    wait(timer-0.2)

    knife(Utils.pick({"top", "left", "right"}))
    wait(timer-0.2)

    knife(Utils.pick({"top", "left", "right"}))
    wait(timer-0.2)

    knife(Utils.pick({"top", "left", "right"}))
    wait(timer-0.2)

    knife(Utils.pick({"top", "left", "right"}))
    wait(timer-0.2)

    -- Final simultané
    final_attack()
end)
end

function Basic:update()
    super.update(self)
end

return Basic
