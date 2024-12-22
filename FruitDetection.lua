print("Welcome to the Fruit Detection Script!")

-- Services
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer

-- Function to detect fruits
local function detectFruit()
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Tool") and obj:FindFirstChild("FruitName") then
            return obj
        end
    end
    return nil
end

-- Function to teleport to a position
local function teleportTo(position)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position)
    end
end

-- Main Script Logic
local fruit = detectFruit()
if fruit then
    print("Fruit Detected: " .. fruit.FruitName.Value)

    -- Notify the player
    StarterGui:SetCore("SendNotification", {
        Title = "Fruit Detected!",
        Text = "Teleporting to: " .. fruit.FruitName.Value,
        Duration = 5
    })

    -- Teleport to the fruit
    teleportTo(fruit.Handle.Position)
else
    print("No fruits found!")
end
