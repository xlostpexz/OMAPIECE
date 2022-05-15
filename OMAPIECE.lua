local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local venyx = library.new("Winnable Hub |", 5013109572)
 
 
 
local page = venyx:addPage("Auto-Farm", 5012544693)
local farm = page:addSection("Auto Farm")
local farm2 = page:addSection("Auto Eqiup")
local page = venyx:addPage("Auto-Stats", 7252023075)
local farm3 = page:addSection("Auto Stats")
local theme = venyx:addPage("Theme", 5012544693)
local colors = theme:addSection("Colors")

local Weaponlist = {}
local Weapon = nil

for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
    table.insert(Weaponlist,v.Name)
end

mons = {}

for i,v in pairs(game:GetService("Workspace")["มอน"]:GetChildren()) do
   table.insert(mons,v.Name)
end


farm:addToggle("Auto Farm", _G.Fa, function(value)
_G.Fa = value
end)

farm:addToggle("Auto Attack", _G.Fa2, function(value)
_G.Fa2 = value
end)

farm:addDropdown("Select Mons", mons, function(abc)
    Select = abc
end)

    farm:addSlider("Distace",11,-20,120,function(t)
        Disc = t
    end)

farm:addButton("Refresh", function()
        table.clear(mons)
for i,v in pairs(game:GetService("Workspace")["มอน"]:GetChildren()) do
   table.insert(mons,v.Name)
end
end)

farm2:addDropdown("Select Weapon", Weaponlist, function(abcd)
    Weapon = abcd
end)

farm2:addButton("Refresh", function()
        table.clear(Weaponlist)
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
   table.insert(Weaponlist,v.Name)
end
end)

farm2:addToggle("Auto Equip", _G.Equip, function(value)
_G.Equip = value
end)


farm2:addKeybind("Toggle Keybind", Enum.KeyCode.RightControl, function()
print("Activated Keybind")
venyx:toggle()
end, function()
print("Changed Keybind")
end)

farm3:addToggle("Melee", _G.ML, function(value)
_G.ML = value
while _G.ML do wait()

local args = {
    [1] = "Melee"
}

game:GetService("ReplicatedStorage").StatSystem.Points:FireServer(unpack(args))
end
end)

farm3:addToggle("Defense", _G.DF, function(value)
_G.DF = value
while _G.DF do wait()

local args = {
    [1] = "MaxHealth"
}

game:GetService("ReplicatedStorage").StatSystem.Points:FireServer(unpack(args))
end
end)

farm3:addToggle("Devil Fruits", _G.DV, function(value)
_G.DV = value
while _G.DV do wait()

local args = {
    [1] = "DevilFruit"
}

game:GetService("ReplicatedStorage").StatSystem.Points:FireServer(unpack(args))
end
end)

farm3:addToggle("Sword", _G.SW, function(value)
_G.SW = value
while _G.SW do wait()

local args = {
    [1] = "Sword"
}

game:GetService("ReplicatedStorage").StatSystem.Points:FireServer(unpack(args))
end
end)


spawn(function()
   game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.Fa then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["มอน"][Select].HumanoidRootPart.CFrame * CFrame.new(0,0,Disc)
if game:GetService("Workspace")["มอน"][Select].Humanoid.Health == 0 then
    game:GetService("Workspace")["มอน"][Select]:Destroy()
    end
        end
    end)
   end)
end)

spawn(function()
   game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.Fa2 then
        game:GetService'VirtualUser':CaptureController()
        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
        end
    end)
end) 
end)


spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") and _G.Fa then
            setfflag("HumanoidParallelRemoveNoPhysics", "False")
            setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
            game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
        end
    end)
end)


local themes = {
Background = Color3.fromRGB(24, 24, 24),
Glow = Color3.fromRGB(60, 0, 200),
Accent = Color3.fromRGB(10, 10, 10),
LightContrast = Color3.fromRGB(20, 20, 20),
DarkContrast = Color3.fromRGB(14, 14, 14),  
TextColor = Color3.fromRGB(241, 146, 255)
}
 
 
for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
colors:addColorPicker(theme, color, function(color3)
venyx:setTheme(theme, color3)
end)
end
 
-- load
venyx:SelectPage(venyx.pages[1], true)


spawn(function()
   game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.Equip then
game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(Weapon))
        end
    end)
   end)
end)
