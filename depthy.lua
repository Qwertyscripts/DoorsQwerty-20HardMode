local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

local entity = spawner.Create({
	Entity = {
		Name = "Depth",
		Asset = "rbxassetid://10937455925",
		HeightOffset = 1,
        Sound = { "rbxassetid://5159141859", { Volume = 1, Pitch = 0.06, Looped = true } }
	},
	Lights = {
		Flicker = { Enabled = true, Duration = 1 },
		Repair = false
	},
	Movement = {
		Speed = 300,
		Delay = 3,
		SpawnLocation = "Behind",
		Reversed = false,
        Cycles = { Min = 2, Max = 2, WaitTime = 1 },
	},
	Damage = { Enabled = true, Range = 30, Amount = 1000 },
	Death = {
		Type = "Guiding",
		Hints = {"You died to Depth", "He is faster than anyone else..."},
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
            light.Range = 12
            light.Shadows = true
        end
        
        local sound = model:FindFirstChild("Sound", true)
        if sound and sound:IsA("Sound") then
            local eq = Instance.new("EqualizerSoundEffect")
            eq.Parent = sound
            eq.HighGain = 4.6
            eq.LowGain = -21.5
            eq.MidGain = -0.8
            
            local dist = Instance.new("DistortionSoundEffect")
            dist.Parent = sound
            dist.Level = 0.99
        end
    end
end)

entity:Run()
