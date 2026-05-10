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
        Cycles = { Min = 2, Max = 2, WaitTime = 1 },
	},
	Damage = { Enabled = true, Range = 35, Amount = 1000 },
	Death = {
		Type = "Guiding",
		Hints = {"You died to Depth", "Depth is faster than rush and ambush","use what you leared from Ambush and rush tho."},
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

entity:SetCallback("OnDeath", function()
    local player = game.Players.LocalPlayer
    local gui = Instance.new("ScreenGui", player.PlayerGui)
    gui.IgnoreGuiInset = true
    
    local jumpscareImg = Instance.new("ImageLabel", gui)
    jumpscareImg.Size = UDim2.new(1.5, 0, 1.5, 0)
    jumpscareImg.Position = UDim2.new(-0.25, 0, -0.25, 0)
    jumpscareImg.Image = "rbxassetid://10937456103"
    jumpscareImg.BackgroundTransparency = 1
    
    local scream = Instance.new("Sound", game.Workspace)
    scream.SoundId = "rbxassetid://5263560566"
    scream.Volume = 3
    scream.Pitch = 0.3
    scream:Play()
    
    task.spawn(function()
        for i = 1, 60 do
            jumpscareImg.Position = UDim2.new(-0.25 + math.random(-5, 5)/100, 0, -0.25 + math.random(-5, 5)/100, 0)
            task.wait(0.01)
        end
        gui:Destroy()
        scream:Destroy()
    end)
end)

entity:Run()
