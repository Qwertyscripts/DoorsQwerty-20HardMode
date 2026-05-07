local ReplicatedStorage = game:GetService("ReplicatedStorage")
local latestRoom = ReplicatedStorage:WaitForChild("GameData"):WaitForChild("LatestRoom")

task.spawn(function()
    local TextChatService = game:GetService("TextChatService")
    local channel = TextChatService:WaitForChild("TextChannels", 20):FindFirstChild("RBXGeneral")
    
    if channel then
        channel:DisplaySystemMessage("<font color='#00FFFF'><b>Hard Mode</b></font>")
    end
end)

-- Depth
coroutine.wrap(function()
    while true do 
        wait(math.random(20, 40))
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
       wait(2)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Qwertyscripts/DoorsQwerty-20HardMode/refs/heads/main/depth.lua"))()
end
end)()

-- 200
coroutine.wrap(function()
    while true do 
        wait(math.random(60, 100))
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
       wait(2)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Qwertyscripts/DoorsQwerty-20HardMode/refs/heads/main/200.lua"))()
end
end)()

-- Silence
coroutine.wrap(function()
    while true do 
        wait(math.random(20, 40))
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
       wait(1)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Qwertyscripts/DoorsQwerty-20HardMode/refs/heads/main/Silence.lua"))()
end
end)()

-- Trauma
coroutine.wrap(function()
    while true do 
        wait(math.random(40, 90))
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
       wait(3)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Qwertyscripts/DoorsQwerty-20HardMode/refs/heads/main/Trauma.lua"))()
end
end)()
