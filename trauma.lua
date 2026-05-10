local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

local killChance = 0.3 
local willKill = math.random() <= killChance

local entity = spawner.Create({
	Entity = {
		Name = "Trauma",
		Asset = "rbxassetid://6685956411",
		HeightOffset = 0.2,
	    Sound = { "rbxassetid://5375147888", { Volume = 2, Pitch = 0.95, Looped = true } }
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
		Values = {30, 100, 0.3, 1}
	},
	Movement = {
		Speed = 200,
		Delay = 8,
		SpawnLocation = "Next",
		Reversed = true,        
        CanFly = true           
	},
	Damage = {
		Enabled = willKill,     
		Range = 25,
		Amount = 1000
	},
	Death = {
		Type = "Guiding",
		Hints = {"You died to Trauma", "He can pass through closed doors!", "Hide immediately!"},
		Cause = "Trauma"
	}
})

entity:SetCallback("OnSpawned", function()
    local model = entity.EntityModel
    if model then
        local primaryPart = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
        if primaryPart then
            local light = Instance.new("PointLight", primaryPart)
            light.Color = Color3.fromRGB(255, 0, 0)
            light.Brightness = 30
            light.Range = 80
            light.Shadows = true
        end
    end
end)

entity:Run()
