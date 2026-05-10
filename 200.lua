local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

local entity = spawner.Create({
	Entity = {
		Name = "200",
		Asset = "rbxassetid://12650043114",
		HeightOffset = 0.6,
		Sound = { "rbxassetid://5257382967", { Volume = 1, Pitch = 1, Looped = true } }
	},
	Lights = {
		Flicker = { Enabled = true, Duration = 2 },
		Shatter = true,
		Repair = false
	},
	Earthquake = { Enabled = true, Distance = 150, Magnitude = 5 },
	CameraShake = { Enabled = true, Range = 75, Values = {20, 50, 0.3, 1} },
    Movement = {
		Speed = 0,
		Delay = 0,
		SpawnLocation = "Next",
		Reversed = false
	},
	Damage = { Enabled = true, Range = 15, Amount = 1000 },
	Death = {
		Type = "Guiding",
		Hints = {"Wait for it to vanish...", "Don't rush through the door when it's there!"},
		Cause = "200"
	}
})

entity:SetCallback("OnSpawned", function()
    local model = entity.EntityModel
    if model then
        local primaryPart = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
        if primaryPart then
            local light = Instance.new("PointLight", primaryPart)
            light.Color = Color3.fromRGB(255, 225, 225)
            light.Brightness = 10
            light.Range = 14
            light.Shadows = true
        end
    end

    task.delay(25, function()
        if entity then
            pcall(function() entity:Destroy() end)
        end
    end)
end)

entity:Run()
