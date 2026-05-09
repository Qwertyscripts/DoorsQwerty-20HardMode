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
		Delay = 2,
		SpawnLocation = "Behind",
		Reversed = false,
        Cycles = { Min = 2, Max = 2, WaitTime = 0.8 },
	},
	Damage = { Enabled = true, Range = 35, Amount = 1000 },
	Death = {
		Type = "Guiding",
		Hints = {"You died to Depth", "Depth is faster than rush and ambush,And he can rebound 2 Times"},
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
        end

        if primaryPart then
            local nearSound = Instance.new("Sound")
            nearSound.Name = "NearSound"
            nearSound.SoundId = "rbxassetid://5159141859"
            nearSound.Volume = 1
            nearSound.Pitch = 0.2
            nearSound.Looped = true
            nearSound.Parent = primaryPart
            nearSound.RollOffMode = Enum.RollOffMode.Linear
            nearSound.RollOffMaxDistance = 30
            nearSound.RollOffMinDistance = 5

            local eq = Instance.new("EqualizerSoundEffect", nearSound)
            eq.HighGain = 4.6
            eq.LowGain = -21.5
            eq.MidGain = -0.8
            
            local dist = Instance.new("DistortionSoundEffect", nearSound)
            dist.Level = 0.99
            
            nearSound:Play()
        end
    end
end)

entity:Run()
