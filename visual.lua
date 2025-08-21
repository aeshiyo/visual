local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VisualMenu"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 300, 0, 350)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Text = "Визуальные эффекты"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.Parent = MainFrame

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Text = "X"
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 14
CloseButton.Parent = MainFrame

local OptionsFrame = Instance.new("ScrollingFrame")
OptionsFrame.Name = "OptionsFrame"
OptionsFrame.Size = UDim2.new(1, -10, 1, -40)
OptionsFrame.Position = UDim2.new(0, 5, 0, 35)
OptionsFrame.BackgroundTransparency = 1
OptionsFrame.ScrollBarThickness = 5
OptionsFrame.CanvasSize = UDim2.new(0, 0, 0, 500)
OptionsFrame.Parent = MainFrame

local function CreateToggle(name, yPosition, callback)
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Name = name .. "Toggle"
    ToggleFrame.Size = UDim2.new(1, 0, 0, 30)
    ToggleFrame.Position = UDim2.new(0, 0, 0, yPosition)
    ToggleFrame.BackgroundTransparency = 1
    ToggleFrame.Parent = OptionsFrame
    
    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Name = "Button"
    ToggleButton.Size = UDim2.new(0, 80, 0, 25)
    ToggleButton.Position = UDim2.new(1, -80, 0, 0)
    ToggleButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleButton.Text = "Выкл"
    ToggleButton.Font = Enum.Font.Gotham
    ToggleButton.TextSize = 12
    ToggleButton.Parent = ToggleFrame
    
    local ToggleLabel = Instance.new("TextLabel")
    ToggleLabel.Name = "Label"
    ToggleLabel.Size = UDim2.new(1, -90, 1, 0)
    ToggleLabel.Position = UDim2.new(0, 0, 0, 0)
    ToggleLabel.BackgroundTransparency = 1
    ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleLabel.Text = name
    ToggleLabel.Font = Enum.Font.Gotham
    ToggleLabel.TextSize = 14
    ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    ToggleLabel.Parent = ToggleFrame
    
    local isEnabled = false
    
    ToggleButton.MouseButton1Click:Connect(function()
        isEnabled = not isEnabled
        if isEnabled then
            ToggleButton.Text = "Вкл"
            ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
        else
            ToggleButton.Text = "Выкл"
            ToggleButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        end
        callback(isEnabled)
    end)
    
    return ToggleFrame
end

local function CreateSlider(name, yPosition, min, max, default, callback)
    local SliderFrame = Instance.new("Frame")
    SliderFrame.Name = name .. "Slider"
    SliderFrame.Size = UDim2.new(1, 0, 0, 50)
    SliderFrame.Position = UDim2.new(0, 0, 0, yPosition)
    SliderFrame.BackgroundTransparency = 1
    SliderFrame.Parent = OptionsFrame
    
    local SliderLabel = Instance.new("TextLabel")
    SliderLabel.Name = "Label"
    SliderLabel.Size = UDim2.new(1, 0, 0, 20)
    SliderLabel.Position = UDim2.new(0, 0, 0, 0)
    SliderLabel.BackgroundTransparency = 1
    SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    SliderLabel.Text = name .. ": " .. default
    SliderLabel.Font = Enum.Font.Gotham
    SliderLabel.TextSize = 14
    SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
    SliderLabel.Parent = SliderFrame
    
    local SliderBar = Instance.new("Frame")
    SliderBar.Name = "Bar"
    SliderBar.Size = UDim2.new(1, 0, 0, 10)
    SliderBar.Position = UDim2.new(0, 0, 0, 30)
    SliderBar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    SliderBar.BorderSizePixel = 0
    SliderBar.Parent = SliderFrame
    
    local SliderFill = Instance.new("Frame")
    SliderFill.Name = "Fill"
    SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    SliderFill.Position = UDim2.new(0, 0, 0, 0)
    SliderFill.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    SliderFill.BorderSizePixel = 0
    SliderFill.Parent = SliderBar
    
    local SliderButton = Instance.new("TextButton")
    SliderButton.Name = "Button"
    SliderButton.Size = UDim2.new(0, 20, 0, 20)
    SliderButton.Position = UDim2.new((default - min) / (max - min), -10, 0, -5)
    SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SliderButton.Text = ""
    SliderButton.Parent = SliderBar
    
    local dragging = false
    
    local function updateValue(value)
        local percent = math.clamp((value - min) / (max - min), 0, 1)
        SliderFill.Size = UDim2.new(percent, 0, 1, 0)
        SliderButton.Position = UDim2.new(percent, -10, 0, -5)
        SliderLabel.Text = name .. ": " .. math.floor(value)
        callback(value)
    end
    
    SliderButton.MouseButton1Down:Connect(function()
        dragging = true
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    SliderBar.MouseButton1Down:Connect(function(x, y)
        local percent = (x - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X
        updateValue(min + (max - min) * percent)
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local percent = (input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X
            updateValue(min + (max - min) * math.clamp(percent, 0, 1))
        end
    end)
    
    updateValue(default)
    
    return SliderFrame
end

local hat = nil
local trails = {}
local fovValue = 70

CreateToggle("Азиатская шляпа", 0, function(enabled)
    if enabled then
        hat = Instance.new("Part")
        hat.Name = "AsianHat"
        hat.Size = Vector3.new(4, 0.2, 4)
        hat.Shape = Enum.PartType.Cylinder
        hat.BrickColor = BrickColor.new("Bright blue")
        hat.Material = Enum.Material.SmoothPlastic
        
        local hatCone = Instance.new("Part")
        hatCone.Name = "HatCone"
        hatCone.Size = Vector3.new(0.5, 2, 0.5)
        hatCone.Shape = Enum.PartType.Cylinder
        hatCone.BrickColor = BrickColor.new("Bright blue")
        hatCone.Material = Enum.Material.SmoothPlastic
        
        local weld = Instance.new("Weld")
        weld.Part0 = hat
        weld.Part1 = hatCone
        weld.C0 = CFrame.new(0, 1.1, 0) * CFrame.Angles(0, 0, math.rad(90))
        weld.Parent = hat
        
        hat.Parent = workspace
        hatCone.Parent = workspace
        
        RunService.RenderStepped:Connect(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
                hat.CFrame = LocalPlayer.Character.Head.CFrame * CFrame.new(0, 1.8, 0)
            end
        end)
    else
        if hat then
            hat:Destroy()
            hat = nil
        end
    end
end)

CreateToggle("Радужные трейсы", 40, function(enabled)
    if enabled then
        if LocalPlayer.Character then
            local bodyParts = {
                "LeftHand", "RightHand", "LeftFoot", "RightFoot", "Torso"
            }
            
            local rainbowColors = {
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
                ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 165, 0)),
                ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 255, 0)),
                ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 0)),
                ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0, 0, 255)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(128, 0, 128))
            }
            
            for _, partName in pairs(bodyParts) do
                local part = LocalPlayer.Character:FindFirstChild(partName)
                if part then
                    local trail = Instance.new("Trail")
                    trail.Attachment0 = Instance.new("Attachment")
                    trail.Attachment0.Parent = part
                    trail.Attachment1 = Instance.new("Attachment")
                    trail.Attachment1.Position = Vector3.new(0, 0.5, 0)
                    trail.Attachment1.Parent = part
                    trail.Color = ColorSequence.new(rainbowColors)
                    trail.Lifetime = 0.8
                    trail.Transparency = NumberSequence.new(0.5)
                    trail.Parent = part
                    trails[part] = trail
                end
            end
        end
    else
        for part, trail in pairs(trails) do
            if trail then
                trail:Destroy()
                if trail.Attachment0 then trail.Attachment0:Destroy() end
                if trail.Attachment1 then trail.Attachment1:Destroy() end
            end
        end
        trails = {}
    end
end)

CreateSlider("FOV", 80, 50, 120, 70, function(value)
    fovValue = value
    if workspace.CurrentCamera then
        workspace.CurrentCamera.FieldOfView = value
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

UserInputService.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Enum.KeyCode.RightShift then
        MainFrame.Visible = not MainFrame.Visible
    end
end)
