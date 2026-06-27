--[[
    kiwibirb-ui — Example Script
    Paste this into your Roblox executor and run.
]]

-- Load the library
local Library = loadstring(game:HttpGet("raw.githubusercontent.com/anomalyco/kiwibirb-ui/main/library.lua"))()

-- Create the main window
local Window = Library:Window({
    Name = "kiwibirb",
    Logo = "135215559087473",
    Version = "v2.0.0",
    FadeSpeed = 0.2,
    Size = UDim2.fromOffset(659, 511),
})

-- Add a watermark
Library:Watermark("kiwibirb | example", "135215559087473")

-- Add the keybind list overlay
Library:KeybindsList()

-- Create a page
local MainPage = Window:Page({
    Name = "Main",
    Icon = "9080568477801",
    Columns = 2,
})

-- Create a section in column 1
local AimSection = MainPage:Section({
    Name = "Aimbot",
    Icon = "98200387761744",
    Side = 1,
})

-- Toggle
local Toggle = AimSection:Toggle({
    Name = "Enabled",
    Default = true,
    Flag = "Aimbot_Enabled",
    Callback = function(value)
        print("Aimbot:", value)
    end,
    Tooltip = "Toggle aimbot on/off",
})

-- Keybind attached to the toggle
Toggle:Keybind({
    Name = "Aimbot Key",
    Mode = "hold",
    Default = Enum.KeyCode.LeftShift,
    Flag = "Aimbot_Key",
    Callback = function(value)
        print("Aimbot key pressed:", value)
    end,
})

-- Colorpicker attached to the toggle
Toggle:Colorpicker({
    Name = "Target color",
    Default = Color3.fromRGB(255, 0, 0),
    Alpha = 0.5,
    Flag = "Aimbot_Color",
    Callback = function(color, alpha)
        print("Color:", color, "Alpha:", alpha)
    end,
})

-- Slider
AimSection:Slider({
    Name = "Smoothing",
    Min = 0,
    Max = 100,
    Default = 50,
    Decimals = 1,
    Suffix = "%",
    Flag = "Aimbot_Smoothing",
    Callback = function(value)
        print("Smoothing:", value)
    end,
    Tooltip = "Aimbot smoothing intensity",
})

-- Dropdown (single-select)
AimSection:Dropdown({
    Name = "Target priority",
    Items = {"Closest", "Lowest HP", "Highest HP", "Mouse"},
    Default = "Closest",
    Flag = "Aimbot_Priority",
    Callback = function(value)
        print("Priority:", value)
    end,
})

-- Create a second section in column 2
local VisualsSection = MainPage:Section({
    Name = "Visuals",
    Icon = "103982381939732",
    Side = 2,
})

-- Textbox
VisualsSection:Textbox({
    Name = "Watermark text",
    Default = "kiwibirb",
    Placeholder = "Enter text...",
    Flag = "Visuals_Watermark",
    Callback = function(value)
        print("Watermark text:", value)
    end,
})

-- Label
local Label = VisualsSection:Label("Crosshair settings", "Left", "Configure your crosshair")

-- Colorpicker attached to label
Label:Colorpicker({
    Name = "Crosshair color",
    Default = Color3.fromRGB(0, 255, 0),
    Flag = "Visuals_CrosshairColor",
    Callback = function(color, alpha)
        print("Crosshair color:", color)
    end,
})

-- Keybind attached to label
Label:Keybind({
    Name = "Crosshair toggle",
    Mode = "toggle",
    Default = Enum.KeyCode.C,
    Flag = "Visuals_CrosshairKey",
    Callback = function(state)
        print("Crosshair:", state and "shown" or "hidden")
    end,
})

-- Dropdown (multi-select)
VisualsSection:Dropdown({
    Name = "ESP Elements",
    Items = {"Box", "Name", "Distance", "Healthbar", "Weapon"},
    Default = {"Box", "Name"},
    Multi = true,
    Flag = "Visuals_ESPElements",
    Callback = function(value)
        print("ESP elements:", table.concat(value, ", "))
    end,
})

-- Button
VisualsSection:Button({
    Name = "Reset Settings",
    Callback = function()
        print("Settings reset!")
    end,
})

-- SubPage example
local SettingsPage = Window:Page({
    Name = "Settings",
    Icon = "89224403789635",
    Columns = 2,
    SubPages = true,
})

local GeneralSub = SettingsPage:SubPage({
    Name = "General",
    Icon = "135215559087473",
    Columns = 2,
})

local GeneralSection = GeneralSub:Section({
    Name = "Config",
    Icon = "116339777575852",
    Side = 1,
})

-- Button that saves a config
GeneralSection:Button({
    Name = "Save Config",
    Callback = function()
        Library:SaveConfig("example_config")
    end,
})

-- Button that loads a config
GeneralSection:Button({
    Name = "Load Config",
    Callback = function()
        local file = readfile("kiwisense/Configs/example_config.json")
        if file then
            Library:LoadConfig(file)
        end
    end,
})

local ThemeSection = GeneralSub:Section({
    Name = "Theme",
    Icon = "103982381939732",
    Side = 2,
})

-- Label with colorpicker for theme customization
local AccentLabel = ThemeSection:Label("Accent Color", "Left")
AccentLabel:Colorpicker({
    Name = "Accent",
    Default = Library.Theme.Accent,
    Flag = "Theme_Accent",
    Callback = function(color)
        Library:ChangeTheme("Accent", color)
    end,
})

-- Dropdown to switch themes
ThemeSection:Dropdown({
    Name = "Theme Preset",
    Items = {"Preset", "Halloween", "Aqua", "One Tap"},
    Default = "Preset",
    Flag = "Theme_Preset",
    Callback = function(value)
        Library.Theme = table.clone(Library.Themes[value])
        for _, item in Library.ThemeItems do
            for prop, key in item.Properties do
                if type(key) == "string" then
                    item.Item[prop] = Library.Theme[key]
                elseif type(key) == "function" then
                    item.Item[prop] = key()
                end
            end
        end
    end,
})

-- Notification
Window:SetOpen(true)

task.wait(1)

Library:Notification({
    Name = "Welcome",
    Description = "kiwibirb loaded successfully!",
    Duration = 5,
    Icon = "116339777575852",
    IconColor = Color3.fromRGB(52, 255, 164),
})
