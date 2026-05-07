local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

local entity = spawner.Create({
	Entity = {
		Name = "200",
		Asset = "rbxassetid://12650043114",
		HeightOffset = 0,
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 6
		},
		Shatter = true,
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
		Values = {20, 50, 0.3, 1}
	},
	Movement = {
		Speed = 200,
		Delay = 35,
		SpawnLocation = "Next",
		Reversed = true
	},
	Damage = {
		Enabled = true,
		Range = 15,
		Amount = 1000
	},
	Death = {
		Type = "Guiding",
		Hints = {"You died to 200", "It appears when the lights are flickering.", "Hide if it spawn", "Alright Now!"},
		Cause = "200"
	}
})


entity:SetCallback("OnSpawned", function()
    local model = entity.EntityModel
    if model then
        local primaryPart = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
        
        if primaryPart then
            local light = Instance.new("PointLight")
            light.Parent = primaryPart
            light.Color = Color3.fromRGB(255, 225, 225)
            light.Brightness = 8
            light.Range = 14
            light.Shadows = true
        end
    end
end)

entity:Run()
