local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

local entity = spawner.Create({
	Entity = {
		Name = "Trauma",
		Asset = "rbxassetid://6685956411",
		HeightOffset = 0,
	    Sound = { 5375147888, { Volume = 2, Pitch = 0.95, Looped = true } }
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
		Enabled = false
	},
	CameraShake = {
		Enabled = true,
		Range = 75,
		Values = {4.5, 20, 0.3, 1}
	},
	Movement = {
		Speed = 200,
		Delay = 20,
		SpawnLocation = "Next",
		Reversed = true
	},
	Damage = {
		Enabled = true,
		Range = 20,
		Amount = 1000
	},
	Death = {
		Type = "Guiding",
		Hints = {"You died to Trauma", "It appears when the lights are flickering.", "Hide if it spawn", "Alright Now!"},
		Cause = "Trauma"
	}
})


entity:SetCallback("OnSpawned", function()
    local model = entity.EntityModel
    if model then
        local primaryPart = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
        
        if primaryPart then
            local light = Instance.new("PointLight")
            light.Parent = primaryPart
            light.Color = Color3.fromRGB(255, 0, 0)
            light.Brightness = 30
            light.Range = 40
            light.Shadows = true
        end
    end
end)

entity:Run()
