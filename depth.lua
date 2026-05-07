local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

local entity = spawner.Create({
	Entity = {
		Name = "Depth",
		Asset = "rbxassetid://10937455925",
		HeightOffset = 1,
        Sound = { 105001273757711, { Volume = 2, Pitch = 1, Looped = true } }
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Repair = false
	},
	Earthquake = {
		Enabled = true,
		Distance = 150,
		Magnitude = 5
	},
	CameraShake = {
		Enabled = true,
		Range = 75,
		Values = {20, 20, 0.3, 1}
	},
	Movement = {
		Speed = 300,
		Delay = 3,
		SpawnLocation = "Behind",
		Reversed = false,
        Cycles = {
            Min = 2,
            Max = 2,
            WaitTime = 1,
        },
	},
	Damage = {
		Enabled = true,
		Range = 30,
		Amount = 1000
	},
	Death = {
		Type = "Guiding",
		Hints = {"You died to who you call Depth", "Depth is faster than rush and ambush", "And he can rebound 2 Times"},
		Cause = "Depth"
	}
})

entity:SetCallback("OnSpawned", function()
    local model = entity.EntityModel
    if model then
        local primaryPart = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
        if primaryPart then
            local light = Instance.new("PointLight")
            light.Parent = primaryPart
            light.Color = Color3.fromRGB(98, 169, 255)
            light.Brightness = 8
            light.Range = 10
            light.Shadows = true
        end
    end
end)

entity:Run()
