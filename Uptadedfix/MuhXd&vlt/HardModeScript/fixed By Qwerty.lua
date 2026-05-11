--[[ 
    DOORS HARD MODE
    MuhammadGames & Volta
    fixed by Qwerty
--]]

local NightmareRush = { Title = "Rush But Even Harder", Desc = "Don't Be fooled", Image = "rbxassetid://10483790459", id = 1 }
local NightmareAmbush = { Title = "Ambush But Even Harder", Desc = "Don't Be fooled", Image = "rbxassetid://10937455925", id = 2 }

pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/MuhXd/DoorSuff/main/OtherSuff/Sprint"))() end)

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()
local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/MuhXd/Models/main/RegularVynixu's%20Achievement%20Modifyer"))()

game:GetService("TextChatService").TextChannels.RBXGeneral:DisplaySystemMessage("<font color='#FF0000'><b>Doors Hard Mode ON! By MuhammadGames (MuhammadGames#0017) and Volta (volta#2161)</b></font>")

spawner.Events.OnEntityDespawned:Connect(function(entityModel, name)
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 then
        if name == "Nightmare Rush" then
            Achievements.Get(NightmareRush)
        elseif name == "Ambush" or name == "Nightmare Ambush" then
            Achievements.Get(NightmareAmbush)
        end
    end
end)

local function spawnDepth()
    local depth = spawner.createEntity({
        CustomName = "Depth",
        Model = "rbxassetid://11517682292",
        Speed = 250, DelayTime = 2, HeightOffset = 1,
        CanKill = true, KillRange = 65,
        BreakLights = true, FlickerLights = {true, 0.2},
        Cycles = {Min = 2, Max = 2, WaitTime = 0.8},
        CamShake = {true, {4.5, 25, 0.1, 2}, 75},
        CustomDialog = {"You died to Depth", "He is faster than Rush!", "Use your Ambush tactics."}
    })
    spawner.runEntity(depth)
end

local function spawnTrauma()
    local Trauma = spawner.createEntity({
        CustomName = "Trauma",
        Model = "rbxassetid://6685956411", 
        Speed = 0, DelayTime = 500,
        CanKill = true, KillRange = 5, 
        CamShake = {true, {6, 30, 1, 1}, 50}, 
        SpawnLocation = "Next", 
        Sound = { 5375147888, { Volume = 1.5, Pitch = 0.95, Looped = true } },
    })
    
    Trauma:SetCallback("OnSpawned", function()
        pcall(function()
            local pPart = Trauma.EntityModel:WaitForChild("PrimaryPart", 10)
            local light = Instance.new("PointLight", pPart)
            light.Color, light.Brightness, light.Range = Color3.fromRGB(255, 0, 0), 25, 60
        end)
    end)
    spawner.runEntity(Trauma)
end

local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom
local lastRoomDepth = 0
local lastRoomTrauma = 0

LatestRoom.Changed:Connect(function(room)
    if room <= 0 or room == 50 or room == 100 then return end

    if room % 4 == 0 and room ~= lastRoomDepth then
        lastRoomDepth = room
        task.delay(2, spawnDepth)
    end

    if room % 7 == 0 and room ~= lastRoomTrauma then
        lastRoomTrauma = room
        task.delay(1, spawnTrauma)
    end
end)
