local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

local entity = spawner.Create({
	Entity = {
		Name = "Silence",
		Asset = "rbxassetid://11350717579",
		HeightOffset = 5
	},
	Lights = {
		Flicker = { Enabled = false, Duration = 0 },
		Shatter = true,
        Repair = false
	},
	Movement = {
		Speed = 0,
		Delay = 0,
		SpawnLocation = "Next"
	},
	Damage = {
		Enabled = false
	}
})

entity:SetCallback("OnSpawned", function()
    local model = entity.EntityModel
    local player = game.Players.LocalPlayer

    task.spawn(function()
        while model and model.Parent do
            local char = player.Character
            local hum = char and char:FindFirstChild("Humanoid")
            
            if hum and hum.Health > 0 then
                local isCrouching = char:GetAttribute("Crouching") == true or hum.HipHeight < 1.5
                
                if not isCrouching then
                    hum.Health -= 8
                    print("Silence наказывает за шум!")
                end
            end
            task.wait(1.6)
        end
    end)
end)

entity:Run()
