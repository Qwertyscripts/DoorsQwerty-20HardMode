local ReplicatedStorage = game:GetService("ReplicatedStorage")
local latestRoom = ReplicatedStorage:WaitForChild("GameData"):WaitForChild("LatestRoom")

task.spawn(function()
    local TextChatService = game:GetService("TextChatService")
    local channel = TextChatService:WaitForChild("TextChannels", 20):FindFirstChild("RBXGeneral")
    
    if channel then
        channel:DisplaySystemMessage("<font color='#00FFFF'><b>Crazy Mode</b></font>")
    end
end)

-- 200
coroutine.wrap(function()
    while true do 
        wait(math.random(40, 100))
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
       wait(2)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Qwertyscripts/DoorsQwerty-20HardMode/refs/heads/main/200.lua"))()
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
