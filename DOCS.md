# kiwibirb-ui Documentation

A Roblox Luau UI library with integrated ESP system. Built for executor environments (supports `getgenv`, `gethui`, `cloneref`).

---

## Table of Contents
1. [Getting Started](#getting-started)
2. [Library Methods](#library-methods)
3. [Window](#window)
4. [Pages & SubPages](#pages--subpages)
5. [Sections](#sections)
6. [Components](#components)
7. [Toggle Sub-Elements](#toggle-sub-elements)
8. [Label Sub-Elements](#label-sub-elements)
9. [ESP System](#esp-system)
10. [Themes](#themes)
11. [Config System](#config-system)
12. [Keybinds List](#keybinds-list)
13. [Notifications](#notifications)
14. [Chat System](#chat-system)
15. [ESP Preview](#esp-preview)
16. [Playerlist](#playerlist)

---

## Getting Started

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/YOUR_USERNAME/kiwibirb-ui/main/library.lua"))()

local Window = Library:Window({
    Name = "kiwibirb",
    Logo = "135215559087473",
    Version = "v1.0.0",
    FadeSpeed = 0.2,
    Size = UDim2.fromOffset(659, 511),
})
```

---

## Library Methods

### `Library:Window(Data)`
Creates the main window.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `Name` / `name` | string | "kiwisense" | Window title |
| `Logo` / `logo` | string | "135215559087473" | Roblox asset ID for logo |
| `Version` / `version` | string | "v1.0.0 alpha" | Version text |
| `Size` / `size` | UDim2 | 659x511 | Window size |
| `FadeSpeed` / `fadespeed` | number | 0.2 | Animation speed |

### `Library:Watermark(Text, Logo)`
Creates a draggable watermark.

### `Library:KeybindsList()`
Creates the keybind list overlay.

### `Library:Notification(Data)`
Shows a notification.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `Name` / `name` | string | "Title" | Notification title |
| `Description` / `description` | string | "Description" | Notification body |
| `Duration` / `duration` | number | 5 | Display time (seconds) |
| `Icon` / `icon` | string | "9080568477801" | Roblox asset ID |
| `IconColor` / `iconcolor` | Color3 | white | Icon tint |

### `Library:ChatSystem(Data)`
Creates a global chat UI.

| Key | Type | Description |
|-----|------|-------------|
| `MainFrame` | Frame | Parent frame for the chat |

### `Library:ESPPreview(Data)`
Creates an ESP preview viewport.

| Key | Type | Description |
|-----|------|-------------|
| `MainFrame` | Frame | Parent frame for preview |

### `Library:SetFlags`
Table of setter functions for each flag. Used by config loading.

### `Library:GetConfig()`
Returns JSON string of current flags.

### `Library:LoadConfig(JSON)`
Loads flags from a JSON string.

### `Library:SaveConfig(Name)`
Saves current flags to a config file.

### `Library:DeleteConfig(Name)`
Deletes a saved config file.

---

## Window

### `Window:SetOpen(Bool)`
Opens or closes the window with fade animation.

### `Window:SetText(Text)`
Changes the title bar text.

### `Window.Page(Data)`
Creates a new page tab.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `Name` / `name` | string | "combat" | Page name |
| `Icon` / `icon` | string | "111178525804834" | Roblox asset ID |
| `Columns` / `columns` | number | 2 | Number of columns |
| `SubPages` / `subpages` | boolean | false | Enable sub-page tabs |

---

## Pages & SubPages

### `Page:Section(Data)`
Creates a section within a page.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `Name` / `name` | string | "Section" | Section header |
| `Icon` / `icon` | string | "9080568477801" | Section icon |
| `Side` / `side` | number | 1 | Column index (1-based) |

### `Page:SubPage(Data)`
Creates a sub-page tab (requires `SubPages: true` on parent page).

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `Name` / `name` | string | "SubPage" | Sub-page name |
| `Icon` / `icon` | string | "9080568477801" | Roblox asset ID |
| `Columns` / `columns` | number | 2 | Number of columns |

### `Page:Playerlist(Data)`
Creates a full playerlist panel (replaces column layout).

| Key | Type | Description |
|-----|------|-------------|
| `Callback` | function | Fires on player select: `(Player, Status, Team)` |

### `SubPage/Section(Data)`
See Page:Section above — same API.

---

## Sections

### `Section:Toggle(Data)`
| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `Name` / `name` | string | "Toggle" | Display name |
| `Default` / `default` | boolean | false | Initial state |
| `Flag` / `flag` | string | auto | Unique flag for config |
| `Callback` / `callback` | function | nil | `function(bool)` |
| `Tooltip` / `tooltip` | string | nil | Hover tooltip |

### `Section:Button(Data)`
| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `Name` / `name` | string | "Button" | Display name |
| `Callback` / `callback` | function | nil | `function()` |
| `Tooltip` / `tooltip` | string | nil | Hover tooltip |

### `Section:Slider(Data)`
| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `Name` / `name` | string | "Slider" | Display name |
| `Min` / `min` | number | 0 | Minimum value |
| `Max` / `max` | number | 100 | Maximum value |
| `Default` / `default` | number | 0 | Initial value |
| `Decimals` / `decimals` | number | 1 | Decimal places |
| `Suffix` / `suffix` | string | "" | Value suffix (e.g. "%") |
| `Flag` / `flag` | string | auto | Unique flag |
| `Callback` / `callback` | function | nil | `function(number)` |
| `Tooltip` / `tooltip` | string | nil | Hover tooltip |

### `Section:Dropdown(Data)`
| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `Name` / `name` | string | "Dropdown" | Display name |
| `Items` / `items` | table | {"One","Two","Three"} | Option list |
| `Default` / `default` | string/nil | nil | Default selection |
| `MaxSize` / `maxsize` | number | 85 | Max dropdown height |
| `Flag` / `flag` | string | auto | Unique flag |
| `Multi` / `multi` | boolean | false | Allow multiple selection |
| `Callback` / `callback` | function | nil | `function(value)` |
| `Tooltip` / `tooltip` | string | nil | Hover tooltip |

### `Section:Textbox(Data)`
| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `Name` / `name` | string | "Textbox" | Display name |
| `Default` / `default` | string | "" | Initial text |
| `Placeholder` / `placeholder` | string | "..." | Placeholder text |
| `Flag` / `flag` | string | auto | Unique flag |
| `Callback` / `callback` | function | nil | `function(string)` |
| `Tooltip` / `tooltip` | string | nil | Hover tooltip |

### `Section:Label(Name, Alignment, Tooltip)`
Creates a static text label.

| Param | Type | Default | Description |
|-------|------|---------|-------------|
| `Name` | string | "Label" | Text content |
| `Alignment` | string | "Left" | `"Left"`, `"Center"`, or `"Right"` |
| `Tooltip` | string | nil | Hover tooltip |

---

## Components

### Toggle
```lua
Toggle:Get()      -- returns boolean
Toggle:Set(bool)  -- sets state
Toggle:SetVisibility(bool)
```

### Slider
```lua
Slider:Get()      -- returns number
Slider:Set(value) -- sets value
Slider:SetVisibility(bool)
```

### Dropdown
```lua
Dropdown:Get()               -- returns value(s)
Dropdown:Set(value)          -- sets selection
Dropdown:AddOption(name)     -- adds option
Dropdown:RemoveOption(name)  -- removes option
Dropdown:Refresh(list)       -- replaces all options
Dropdown:SetVisibility(bool)
```

### Textbox
```lua
Textbox:Get()      -- returns string
Textbox:Set(text)  -- sets text
Textbox:SetVisibility(bool)
```

### Button
```lua
Button:Press()     -- triggers callback with animation
Button:SetVisibility(bool)
```

### Label
```lua
Label:SetVisibility(bool)
Label:Colorpicker(Data)  -- adds colorpicker to label
Label:Keybind(Data)      -- adds keybind to label
```

---

## Toggle Sub-Elements

### `Toggle:Keybind(Data)`
| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `Name` / `name` | string | "Keybind" | Display name |
| `Mode` / `mode` | string | "Toggle" | `"Toggle"`, `"Hold"`, `"Always"` |
| `Default` / `default` | Enum.KeyCode | RightShift | Default key |
| `Flag` / `flag` | string | auto | Unique flag |
| `Callback` / `callback` | function | nil | `function(bool)` |

### `Toggle:Colorpicker(Data)`
| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `Name` / `name` | string | nil | Display name |
| `Default` / `default` | Color3 | black | Initial color |
| `Alpha` / `alpha` | number | 0 | Initial alpha (0-1) |
| `Flag` / `flag` | string | auto | Unique flag |
| `Callback` / `callback` | function | nil | `function(Color3, alpha)` |

---

## Label Sub-Elements

Same as Toggle sub-elements — `Label:Keybind(Data)` and `Label:Colorpicker(Data)` work identically.

---

## ESP System

The library includes a built-in ESP system accessible via `getgenv().Esp`.

### Options
ESP options are stored in `getgenv().Options` and can be toggled via UI elements.

| Flag | Type | Default | Description |
|------|------|---------|-------------|
| `Enabled` | boolean | false | Master toggle |
| `Boxes` | boolean | false | Show boxes |
| `BoxType` | string | "Corner" | `"Corner"` or `"Full"` |
| `Box Gradient 1` | table | cyan | First gradient color + transparency |
| `Box Gradient 2` | table | red | Second gradient color + transparency |
| `Box Gradient Rotation` | number | 90 | Gradient rotation |
| `Box Fill` | boolean | false | Fill boxes |
| `Box Fill 1` | table | cyan | Fill gradient start |
| `Box Fill 2` | table | cyan | Fill gradient end |
| `Box Fill Rotation` | number | 0 | Fill gradient rotation |
| `Healthbar` | boolean | false | Show health bars |
| `Healthbar_Position` | string | "Left" | `"Left"`, `"Right"`, `"Top"`, `"Bottom"` |
| `Healthbar_Number` | boolean | false | Show health number |
| `Healthbar_Low` | table | red | Low health color |
| `Healthbar_Medium` | table | yellow | Medium health color |
| `Healthbar_High` | table | green | High health color |
| `Healthbar_Font` | string | "Verdana" | Font name |
| `Healthbar_Text_Size` | number | 11 | Font size |
| `Healthbar_Thickness` | number | 1 | Bar thickness |
| `Healthbar_Tween` | boolean | false | Animate health changes |
| `Healthbar_EasingStyle` | string | "Circular" | Easing style |
| `Healthbar_EasingDirection` | string | "InOut" | Easing direction |
| `Healthbar_Easing_Speed` | number | 1 | Animation speed |
| `Name_Text` | boolean | false | Show name |
| `Name_Text_Color` | table | white | Name color |
| `Name_Text_Position` | string | "Top" | Name position |
| `Name_Text_Font` | string | "Verdana" | Name font |
| `Name_Text_Size` | number | 11 | Name font size |
| `Distance_Text` | boolean | false | Show distance |
| `Distance_Text_Color` | table | white | Distance color |
| `Distance_Text_Position` | string | "Bottom" | Distance position |
| `Distance_Text_Font` | string | "Verdana" | Distance font |
| `Distance_Text_Size` | number | 11 | Distance font size |

---

## Themes

### Built-in Themes
- `"Preset"` — dark theme (default)
- `"Halloween"` — orange-accented dark
- `"Aqua"` — blue-accented dark
- `"One Tap"` — gold-accented dark

### Theme Keys
| Key | Used For |
|-----|----------|
| `Background` | Main background color |
| `Inline` | Secondary background |
| `Shadow` | Drop shadow color |
| `Text` | Primary text color |
| `Image` | Icon/image tint |
| `Dark Gradient` | Gradient overlay color |
| `Inactive Text` | Dimmed/placeholder text |
| `Element` | Input/button background |
| `Accent` | Accent/highlight color |
| `Border` | Stroke/border color |

### Theme Methods
```lua
Library:ChangeTheme("Accent", Color3.fromRGB(255, 0, 0))
Library:SaveTheme("MyTheme")
Library:LoadTheme(JSON)
Library:DeleteTheme("MyTheme")
Library:GetDarkerColor(Color3)
Library:GetLighterColor(Color3, multiplier)
```

---

## Config System

### Methods
```lua
Library:SaveConfig("MyConfig")
Library:LoadConfig(JSON)
Library:DeleteConfig("MyConfig")
Library:GetConfig()  -- returns JSON string
Library:RefreshConfigsList(DropdownElement)
Library:RefreshThemesList(DropdownElement)
```

Configs are stored in `kiwisense/Configs/` as JSON files.

---

## Keybinds List

```lua
local KeyList = Library:KeybindsList()
local entry = KeyList:Add("Z", "Toggle GUI")
entry:SetText("X", "Some Bind")
entry:SetStatus("on")  -- "on", "off", "holding"
entry:SetVisibility(false)
entry:Set(true)  -- dims or highlights
KeyList:SetVisibility(false)
```

---

## Notifications

```lua
Library:Notification({
    Name = "Success",
    Description = "Config loaded",
    Duration = 5,
    Icon = "116339777575852",
    IconColor = Color3.fromRGB(52, 255, 164)
})
```

---

## Chat System

```lua
local Chat = Library:ChatSystem({MainFrame = Window.Items.MainFrame})
Chat:SetVisibility(true)
Chat:SetStatusText("Connected")
Chat:OnMessageSendPressed(function()
    local msg = Chat:GetTypedMessage()
    Chat:SendMessage("rbxassetid://123", "User", msg, true)
end)
```

---

## ESP Preview

```lua
local Preview = Library:ESPPreview({MainFrame = Window.Items.MainFrame})
Preview:SetVisibility(true)
```

---

## Playerlist

```lua
local list = Page:Playerlist({
    Callback = function(Player, Status, Team)
        print(Player.Name, Status, Team)
    end
})
```

### Methods
```lua
list:Add(PlayerInstance)
list:Remove(PlayerName)
```

Automatically adds/removes players on join/leave.

---

## Keybinds

The menu toggle keybind defaults to `Z`. Change via:
```lua
Library.MenuKeybind = "Enum.KeyCode.RightShift"
```

Keybind components support three modes:
- `"toggle"` — press to toggle on/off
- `"hold"` — hold to keep enabled
- `"always"` — always enabled

---

## Flags & Config

Every interactive element accepts a `Flag` / `flag` parameter. Flags are stored in `Library.Flags` and are used by the config save/load system. If no flag is provided, a unique one is auto-generated.

To retrieve a flag value programmatically:
```lua
local val = Library.Flags["MyFlag"]
```

To set a flag value (triggers callbacks):
```lua
Library.SetFlags["MyFlag"](value)
```

To access element objects directly:
```lua
local element = getgenv().Options["MyFlag"]
element:Set(value)
```
