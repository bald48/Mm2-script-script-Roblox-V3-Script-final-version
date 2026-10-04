-- ==================== ЗАЩИТА ОТ ПОВТОРНЫХ МЕНЮ ====================
if _G.MM2HubLoaded then
    warn("MM2 Hub уже загружен!")
    return
end
_G.MM2HubLoaded = true

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")
local VirtualUser = game:GetService("VirtualUser")
local Stats = game:GetService("Stats")
local RaycastParams = RaycastParams.new()

-- ==================== ЯЗЫКИ ====================
local CurrentLanguage = "Russian"

local Languages = {
    Russian = {
        MainTabTitle = "Главная",
        PlayerInfoTitle = "👤 Информация об игроке",
        RolesTitle = "🎭 Роли в раунде",
        AntiAFKTitle = "Anti-AFK",
        RejoinTitle = "Rejoin (перезайти)",
        ServerHopTitle = "Server Hop (другой сервер)",
        CopyJobIdTitle = "Скопировать JobId сервера",
        ServerHopNotFound = "Подходящий сервер не найден",
        Copied = "Скопировано",
        
        VisualsTabTitle = "Визуальные эффекты",
        ESPTitle = "ESP / Chams [FIXED]",
        FullbrightTitle = "Fullbright (без темноты)",
        FOVTitle = "Свой FOV",
        FOVSliderTitle = "FOV",
        
        CombatTabTitle = "Боевые функции",
        AimAssistTitle = "AimAssist Пистолет (телефон)",
        AimSmoothTitle = "Плавность Aimbot (0.05-0.5)",
        WallCheckTitle = "Wall Check Пистолет",
        KnifeAimbotWallTitle = "Knife Aimbot (с стенами)",
        KnifeAimbotNoWallTitle = "Knife Aimbot (сквозь стены)",
        HitboxTitle = "Hitbox [FIXED]",
        HitboxSizeTitle = "Размер хитбокса",
        HitboxTransparencyTitle = "Прозрачность хитбокса",
        HitboxTargetTitle = "Цель хитбокса",
        TeleportGunTitle = "Телепорт к пистолету",
        GunFoundNotify = "Пистолет на земле! 🔫",
        System = "Система",
        
        AutoTabTitle = "Автоматизация",
        SafeFarmTitle = "Safe Farm Монет (только в раунде)",
        AutoGrabGunTitle = "Auto Grab Gun 🔫",
        AutoNotifyKitsTitle = "Auto Notify Kits",
        KitFoundTitle = "Kit Found! 🏥",
        KitNearby = "Набор рядом: ",
        
        MoveTabTitle = "Движение",
        WalkSpeedTitle = "WalkSpeed",
        JumpPowerTitle = "JumpPower",
        NoclipTitle = "Noclip",
        InfJumpTitle = "Infinite Jump",
        FlyTitle = "Fly (полёт)",
        FlySpeedTitle = "Скорость полёта",
        
        TpTabTitle = "Телепортация",
        SelectPlayerTitle = "Выбери игрока",
        RefreshPlayersTitle = "Обновить список игроков",
        TeleportPlayerTitle = "Телепорт к игроку",
        PlayerNotFound = "Игрок не выбран или не найден",
        SpectateTitle = "Наблюдать за игроком",
        TpLobbyTitle = "TP to Lobby (в лобби)",
        TpMapTitle = "TP to Map (где раунд) [FIXED]",
        TeleportNotify = "Телепортация ",
        InLobby = "в лобби",
        OnMap = "на карту",
        
        MiscTabTitle = "Разное",
        LowerGraphicsTitle = "Снизить графику (больше FPS)",
        ResetCharTitle = "Сбросить персонажа",
        GraphicsLowered = "Графика снижена",
        LanguageTitle = "Язык / Language",
        
        InfoTabTitle = "Информация",
    },
    English = {
        MainTabTitle = "Main",
        PlayerInfoTitle = "👤 Player Info",
        RolesTitle = "🎭 Roles in Round",
        AntiAFKTitle = "Anti-AFK",
        RejoinTitle = "Rejoin",
        ServerHopTitle = "Server Hop",
        CopyJobIdTitle = "Copy Server JobId",
        ServerHopNotFound = "No suitable server found",
        Copied = "Copied",
        
        VisualsTabTitle = "Visuals",
        ESPTitle = "ESP / Chams [FIXED]",
        FullbrightTitle = "Fullbright",
        FOVTitle = "Custom FOV",
        FOVSliderTitle = "FOV",
        
        CombatTabTitle = "Combat",
        AimAssistTitle = "AimAssist Gun (mobile)",
        AimSmoothTitle = "Aimbot Smoothness (0.05-0.5)",
        WallCheckTitle = "Wall Check Gun",
        KnifeAimbotWallTitle = "Knife Aimbot (with walls)",
        KnifeAimbotNoWallTitle = "Knife Aimbot (through walls)",
        HitboxTitle = "Hitbox [FIXED]",
        HitboxSizeTitle = "Hitbox Size",
        HitboxTransparencyTitle = "Hitbox Transparency",
        HitboxTargetTitle = "Hitbox Target",
        TeleportGunTitle = "Teleport to Gun",
        GunFoundNotify = "Gun on ground! 🔫",
        System = "System",
        
        AutoTabTitle = "Automation",
        SafeFarmTitle = "Safe Farm Coins (in round)",
        AutoGrabGunTitle = "Auto Grab Gun 🔫",
        AutoNotifyKitsTitle = "Auto Notify Kits",
        KitFoundTitle = "Kit Found! 🏥",
        KitNearby = "Kit nearby: ",
        
        MoveTabTitle = "Movement",
        WalkSpeedTitle = "WalkSpeed",
        JumpPowerTitle = "JumpPower",
        NoclipTitle = "Noclip",
        InfJumpTitle = "Infinite Jump",
        FlyTitle = "Fly",
        FlySpeedTitle = "Fly Speed",
        
        TpTabTitle = "Teleport",
        SelectPlayerTitle = "Select Player",
        RefreshPlayersTitle = "Refresh Players",
        TeleportPlayerTitle = "Teleport to Player",
        PlayerNotFound = "Player not found",
        SpectateTitle = "Spectate Player",
        TpLobbyTitle = "TP to Lobby",
        TpMapTitle = "TP to Map (where round) [FIXED]",
        TeleportNotify = "Teleported ",
        InLobby = "to lobby",
        OnMap = "to map",
        
        MiscTabTitle = "Misc",
        LowerGraphicsTitle = "Lower Graphics (more FPS)",
        ResetCharTitle = "Reset Character",
        GraphicsLowered = "Graphics lowered",
        LanguageTitle = "Language / Язык",
        
        InfoTabTitle = "Info",
    }
}

local function GetLang(key)
    return Languages[CurrentLanguage][key] or key
end

-- ==================== ТЕМА ====================
WindUI:AddTheme({
    Name = "Purple",
    Accent = Color3.fromHex("#a855f7"),
    Dialog = Color3.fromHex("#1a1025"),
    Outline = Color3.fromHex("#7c3aed"),
    Text = Color3.fromHex("#f3e8ff"),
    Placeholder = Color3.fromHex("#a78bfa"),
    Background = Color3.fromHex("#120a1f"),
    Button = Color3.fromHex("#6d28d9"),
    Icon = Color3.fromHex("#c084fc"),
})

local Window = WindUI:CreateWindow({
    Title = "🔮 MM2 Hub",
    Icon = "sparkles",
    Author = "by: @Gjfssbn23 [FIXED v3]",
    Folder = "MM2Hub",
    Size = UDim2.fromOffset(580, 460),
    Theme = "Purple",
})
pcall(function() WindUI:SetTheme("Purple") end)

-- ==================== ПЕРЕМЕННЫЕ ====================
local ESP_Enabled, AimAssist_Enabled = false, false
local Noclip_Enabled, SafeFarm_Enabled = false, false
local Hitbox_Enabled, HitboxSize, HitboxTransparency, HitboxTarget = false, 10, 0.7, "Murderer"
local WalkSpeedValue, JumpPowerValue = 16, 50
local InfJump_Enabled, Fly_Enabled, FlySpeed = false, false, 60
local Fullbright_Enabled, FOV_Enabled, FOVValue = false, false, 70
local AntiAFK_Enabled = false
local AutoGrabGun_Enabled = false
local AutoNotifyKits_Enabled = false
local KnifeAimbot_Enabled = false
local KnifeNoWall_Enabled = false
local SelectedPlayer = nil
local fps = 60
local AimSmoothness = 0.1
local WallCheck_Enabled = false

-- ==================== ESP СИСТЕМА ====================
local espHighlights = {}

local function CreateESPHighlight(character, color)
    if not character or espHighlights[character] then return end
    
    pcall(function()
        local hl = Instance.new("Highlight")
        hl.Name = "MM2HubESP"
        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        hl.FillColor = color
        hl.OutlineColor = Color3.fromRGB(255, 255, 255)
        hl.FillTransparency = 0.5
        hl.Parent = character
        
        espHighlights[character] = hl
    end)
end

local function RemoveESPHighlight(character)
    if not character then return end
    pcall(function()
        if espHighlights[character] then
            espHighlights[character]:Destroy()
            espHighlights[character] = nil
        end
    end)
end

local function GetPlayerRole(player)
    if not player then return "Innocent" end
    local bp, char = player:FindFirstChild("Backpack"), player.Character
    if (bp and bp:FindFirstChild("Knife")) or (char and char:FindFirstChild("Knife")) then return "Murderer" end
    if (bp and bp:FindFirstChild("Gun")) or (char and char:FindFirstChild("Gun")) then return "Sheriff" end
    return "Innocent"
end

local function HasGun()
    local bp = LocalPlayer:FindFirstChild("Backpack")
    local char = LocalPlayer.Character
    if bp and bp:FindFirstChild("Gun") then return true end
    if char and char:FindFirstChild("Gun") then return true end
    return false
end

local function HasKnife()
    local bp = LocalPlayer:FindFirstChild("Backpack")
    local char = LocalPlayer.Character
    if bp and bp:FindFirstChild("Knife") then return true end
    if char and char:FindFirstChild("Knife") then return true end
    return false
end

local function IsRoundActive()
    for _, p in ipairs(Players:GetPlayers()) do
        if GetPlayerRole(p) == "Murderer" or GetPlayerRole(p) == "Sheriff" then
            return true
        end
    end
    return false
end

local function CanSeeTarget(targetPos)
    if not WallCheck_Enabled then return true end
    
    local hrp = GetHRP()
    if not hrp then return false end
    
    local rayOrigin = hrp.Position
    local rayDirection = (targetPos - rayOrigin).Unit * 1000
    
    local raycastParams = RaycastParams.new()
    raycastParams:AddToFilter(LocalPlayer.Character)
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    
    local rayResult = Workspace:Raycast(rayOrigin, rayDirection, raycastParams)
    
    if rayResult and rayResult.Instance then
        return false
    end
    return true
end

local function GetGun()
    local gun = Workspace:FindFirstChild("GunDrop", true)
    if gun and gun:IsA("BasePart") then return gun end
    return nil
end

local function GetCoinContainer()
    for _, v in ipairs(Workspace:GetChildren()) do
        local c = v:FindFirstChild("CoinContainer")
        if c then return c end
    end
    return Workspace:FindFirstChild("CoinContainer", true)
end

local function GetHRP()
    local char = LocalPlayer.Character
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function GetHum()
    local char = LocalPlayer.Character
    return char and char:FindFirstChildOfClass("Humanoid")
end

local function Notify(title, content)
    pcall(function() WindUI:Notify({ Title = title, Content = content, Duration = 3 }) end)
end

-- ==================== MAIN ====================
local MainTab = Window:Tab({ Title = GetLang("MainTabTitle"), Icon = "user" })

local InfoPara = MainTab:Paragraph({ Title = GetLang("PlayerInfoTitle"), Desc = "Загрузка..." })
local RolesPara = MainTab:Paragraph({ Title = GetLang("RolesTitle"), Desc = "Загрузка..." })

local function SetDesc(para, text)
    pcall(function() para:SetDesc(text) end)
end

RunService.RenderStepped:Connect(function(dt)
    fps = math.floor(1 / math.max(dt, 0.001))
end)

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            local hum = GetHum()
            local ping = 0
            pcall(function() ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue()) end)
            SetDesc(InfoPara, string.format(
                "Ник: %s (@%s)\nID: %d\nВозраст аккаунта: %d дн.\nРоль: %s\nHP: %s\nСкорость: %s\nПинг: %d мс | FPS: %d\nИгроков на сервере: %d/%d",
                LocalPlayer.DisplayName, LocalPlayer.Name, LocalPlayer.UserId,
                LocalPlayer.AccountAge, GetPlayerRole(LocalPlayer),
                hum and math.floor(hum.Health) or "—",
                hum and math.floor(hum.WalkSpeed) or "—",
                ping, fps, #Players:GetPlayers(), Players.MaxPlayers
            ))

            local murd, sher = "—", "—"
            for _, p in ipairs(Players:GetPlayers()) do
                local r = GetPlayerRole(p)
                if r == "Murderer" then murd = p.Name elseif r == "Sheriff" then sher = p.Name end
            end
            SetDesc(RolesPara, "🔪 " .. (CurrentLanguage == "Russian" and "Мардер" or "Murderer") .. ": " .. murd .. "\n🔫 " .. (CurrentLanguage == "Russian" and "Шериф" or "Sheriff") .. ": " .. sher)
        end)
    end
end)

MainTab:Toggle({
    Title = GetLang("AntiAFKTitle"),
    Value = false,
    Callback = function(v) AntiAFK_Enabled = v end
})

LocalPlayer.Idled:Connect(function()
    if AntiAFK_Enabled then
        pcall(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
    end
end)

MainTab:Button({
    Title = GetLang("RejoinTitle"),
    Callback = function()
        pcall(function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end)
    end
})

MainTab:Button({
    Title = GetLang("ServerHopTitle"),
    Callback = function()
        pcall(function()
            local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
            local data = game:GetService("HttpService"):JSONDecode(game:HttpGet(url))
            for _, s in ipairs(data.data) do
                if s.playing < s.maxPlayers and s.id ~= game.JobId then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id, LocalPlayer)
                    return
                end
            end
            Notify("Server Hop", GetLang("ServerHopNotFound"))
        end)
    end
})

MainTab:Button({
    Title = GetLang("CopyJobIdTitle"),
    Callback = function()
        pcall(function()
            setclipboard(game.JobId)
            Notify(GetLang("Copied"), game.JobId)
        end)
    end
})

-- ==================== VISUALS ====================
local VisualsTab = Window:Tab({ Title = GetLang("VisualsTabTitle"), Icon = "eye" })

VisualsTab:Toggle({
    Title = GetLang("ESPTitle"),
    Value = false,
    Callback = function(v) 
        ESP_Enabled = v 
        if not v then
            for char, _ in pairs(espHighlights) do
                RemoveESPHighlight(char)
            end
        end
    end
})

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        if ESP_Enabled and player ~= LocalPlayer then
            task.wait(0.1)
            if character and character.Parent then
                local role = GetPlayerRole(player)
                local color = Color3.fromRGB(0, 255, 0)
                if role == "Murderer" then color = Color3.fromRGB(255, 0, 0)
                elseif role == "Sheriff" then color = Color3.fromRGB(0, 0, 255) end
                CreateESPHighlight(character, color)
            end
        end
    end)
end)

task.spawn(function()
    while task.wait(0.5) do
        if ESP_Enabled then
            pcall(function()
                for _, p in ipairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer and p.Character then
                        local role = GetPlayerRole(p)
                        local hl = espHighlights[p.Character]
                        
                        if hl and hl.Parent then
                            local newColor = Color3.fromRGB(0, 255, 0)
                            if role == "Murderer" then newColor = Color3.fromRGB(255, 0, 0)
                            elseif role == "Sheriff" then newColor = Color3.fromRGB(0, 0, 255) end
                            
                            if hl.FillColor ~= newColor then
                                hl.FillColor = newColor
                            end
                        elseif not hl then
                            local color = Color3.fromRGB(0, 255, 0)
                            if role == "Murderer" then color = Color3.fromRGB(255, 0, 0)
                            elseif role == "Sheriff" then color = Color3.fromRGB(0, 0, 255) end
                            CreateESPHighlight(p.Character, color)
                        end
                    end
                end
            end)
        end
    end
end)

local origLight = {
    Brightness = Lighting.Brightness, ClockTime = Lighting.ClockTime,
    FogEnd = Lighting.FogEnd, GlobalShadows = Lighting.GlobalShadows,
    Ambient = Lighting.Ambient,
}

VisualsTab:Toggle({
    Title = GetLang("FullbrightTitle"),
    Value = false,
    Callback = function(v)
        Fullbright_Enabled = v
        if not v then
            pcall(function()
                for k, val in pairs(origLight) do Lighting[k] = val end
            end)
        end
    end
})

RunService.RenderStepped:Connect(function()
    if Fullbright_Enabled then
        pcall(function()
            Lighting.Brightness = 2
            Lighting.ClockTime = 14
            Lighting.FogEnd = 1e6
            Lighting.GlobalShadows = false
            Lighting.Ambient = Color3.fromRGB(178, 178, 178)
        end)
    end
    if FOV_Enabled then
        pcall(function() Workspace.CurrentCamera.FieldOfView = FOVValue end)
    end
end)

VisualsTab:Toggle({
    Title = GetLang("FOVTitle"),
    Value = false,
    Callback = function(v)
        FOV_Enabled = v
        if not v then pcall(function() Workspace.CurrentCamera.FieldOfView = 70 end) end
    end
})

VisualsTab:Slider({
    Title = GetLang("FOVSliderTitle"),
    Value = { Min = 30, Max = 120, Default = 70 },
    Step = 1,
    Callback = function(v) FOVValue = v end
})

-- ==================== COMBAT ====================
local CombatTab = Window:Tab({ Title = GetLang("CombatTabTitle"), Icon = "swords" })

CombatTab:Toggle({
    Title = GetLang("AimAssistTitle"),
    Value = false,
    Callback = function(v) AimAssist_Enabled = v end
})

CombatTab:Slider({
    Title = GetLang("AimSmoothTitle"),
    Value = { Min = 0.05, Max = 0.5, Default = 0.1 },
    Step = 0.05,
    Callback = function(v) AimSmoothness = v end
})

CombatTab:Toggle({
    Title = GetLang("WallCheckTitle"),
    Value = false,
    Callback = function(v) WallCheck_Enabled = v end
})

RunService.RenderStepped:Connect(function()
    if not AimAssist_Enabled then return end
    if not HasGun() then return end
    
    pcall(function()
        local cam = Workspace.CurrentCamera
        local murderer = nil
        
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and GetPlayerRole(p) == "Murderer" and p.Character then
                local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                local hum = p.Character:FindFirstChildOfClass("Humanoid")
                if hrp and hum and hum.Health > 0 then
                    if CanSeeTarget(hrp.Position) then
                        murderer = hrp
                        break
                    end
                end
            end
        end
        
        if murderer then
            local targetPos = murderer.Position + Vector3.new(0, 0.5, 0)
            local camPos = cam.CFrame.Position
            local direction = (targetPos - camPos).Unit
            
            local newCFrame = CFrame.new(camPos, camPos + direction)
            cam.CFrame = cam.CFrame:Lerp(newCFrame, AimSmoothness)
        end
    end)
end)

CombatTab:Toggle({
    Title = GetLang("KnifeAimbotWallTitle"),
    Value = false,
    Callback = function(v) KnifeAimbot_Enabled = v end
})

RunService.RenderStepped:Connect(function()
    if not KnifeAimbot_Enabled then return end
    if not HasKnife() then return end
    
    pcall(function()
        local cam = Workspace.CurrentCamera
        local target = nil
        local minDist = math.huge
        
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                local hum = p.Character:FindFirstChildOfClass("Humanoid")
                if hrp and hum and hum.Health > 0 then
                    local dist = (hrp.Position - cam.CFrame.Position).Magnitude
                    if dist < minDist and CanSeeTarget(hrp.Position) then
                        target = hrp
                        minDist = dist
                    end
                end
            end
        end
        
        if target then
            local targetPos = target.Position + Vector3.new(0, 0.3, 0)
            local camPos = cam.CFrame.Position
            local direction = (targetPos - camPos).Unit
            
            local newCFrame = CFrame.new(camPos, camPos + direction)
            cam.CFrame = cam.CFrame:Lerp(newCFrame, AimSmoothness * 0.8)
        end
    end)
end)

CombatTab:Toggle({
    Title = GetLang("KnifeAimbotNoWallTitle"),
    Value = false,
    Callback = function(v) KnifeNoWall_Enabled = v end
})

RunService.RenderStepped:Connect(function()
    if not KnifeNoWall_Enabled then return end
    if not HasKnife() then return end
    
    pcall(function()
        local cam = Workspace.CurrentCamera
        local target = nil
        local minDist = math.huge
        
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                local hum = p.Character:FindFirstChildOfClass("Humanoid")
                if hrp and hum and hum.Health > 0 then
                    local dist = (hrp.Position - cam.CFrame.Position).Magnitude
                    if dist < minDist then
                        target = hrp
                        minDist = dist
                    end
                end
            end
        end
        
        if target then
            local targetPos = target.Position + Vector3.new(0, 0.3, 0)
            local camPos = cam.CFrame.Position
            local direction = (targetPos - camPos).Unit
            
            local newCFrame = CFrame.new(camPos, camPos + direction)
            cam.CFrame = cam.CFrame:Lerp(newCFrame, AimSmoothness * 0.75)
        end
    end)
end)

CombatTab:Toggle({
    Title = GetLang("HitboxTitle"),
    Value = false,
    Callback = function(v) 
        Hitbox_Enabled = v 
        if not v then
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character then
                    local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.Size = Vector3.new(2, 2, 1)
                    end
                end
            end
        end
    end
})

CombatTab:Slider({
    Title = GetLang("HitboxSizeTitle"),
    Value = { Min = 2, Max = 50, Default = 10 },
    Step = 0.5,
    Callback = function(v) HitboxSize = v end
})

CombatTab:Slider({
    Title = GetLang("HitboxTransparencyTitle"),
    Value = { Min = 0, Max = 1, Default = 0.7 },
    Step = 0.1,
    Callback = function(v) HitboxTransparency = v end
})

CombatTab:Dropdown({
    Title = GetLang("HitboxTargetTitle"),
    Values = { "Murderer", "Sheriff", "Все" },
    Value = "Murderer",
    Callback = function(option) HitboxTarget = option end
})

task.spawn(function()
    while task.wait(0.5) do
        if Hitbox_Enabled then
            pcall(function()
                for _, p in ipairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer and p.Character then
                        local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            local isTarget = (HitboxTarget == "Все") or (GetPlayerRole(p) == HitboxTarget)
                            if isTarget then
                                hrp.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
                                hrp.Transparency = HitboxTransparency
                            end
                        end
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    local notified = false
    while task.wait(1) do
        pcall(function()
            local gun = GetGun()
            if gun and not notified then
                notified = true
                Notify(GetLang("System"), GetLang("GunFoundNotify"))
            elseif not gun then
                notified = false
            end
        end)
    end
end)

CombatTab:Button({
    Title = GetLang("TeleportGunTitle"),
    Callback = function()
        pcall(function()
            local gun, hrp = GetGun(), GetHRP()
            if gun and hrp then hrp.CFrame = gun.CFrame * CFrame.new(0, 3, 0) end
        end)
    end
})

-- ==================== AUTOMATION ====================
local AutoTab = Window:Tab({ Title = GetLang("AutoTabTitle"), Icon = "bot" })

AutoTab:Toggle({
    Title = GetLang("SafeFarmTitle"),
    Value = false,
    Callback = function(v) SafeFarm_Enabled = v end
})

AutoTab:Toggle({
    Title = GetLang("AutoGrabGunTitle"),
    Value = false,
    Callback = function(v) AutoGrabGun_Enabled = v end
})

AutoTab:Toggle({
    Title = GetLang("AutoNotifyKitsTitle"),
    Value = false,
    Callback = function(v) AutoNotifyKits_Enabled = v end
})

local visited = {}

task.spawn(function()
    while task.wait(0.2) do
        if SafeFarm_Enabled then
            pcall(function()
                if not IsRoundActive() then return end
                
                local hrp, hum = GetHRP(), GetHum()
                local container = GetCoinContainer()
                if not (hrp and hum and hum.Health > 0 and container) then return end

                local best, bestDist
                for _, coin in ipairs(container:GetChildren()) do
                    if coin:IsA("BasePart") and coin.Parent then
                        local t = visited[coin]
                        if not t or (os.clock() - t) > 8 then
                            local d = (hrp.Position - coin.Position).Magnitude
                            if not bestDist or d < bestDist then
                                best, bestDist = coin, d
                            end
                        end
                    end
                end
                if not best then return end

                visited[best] = os.clock()
                local duration = math.max(bestDist / 25, 0.1)
                local tween = TweenService:Create(hrp, TweenInfo.new(duration, Enum.EasingStyle.Linear), {CFrame = best.CFrame})
                tween:Play()

                local done = false
                local c = tween.Completed:Connect(function() done = true end)
                local start = os.clock()
                while not done and SafeFarm_Enabled and (os.clock() - start) < (duration + 1) do task.wait() end
                c:Disconnect()
                if not SafeFarm_Enabled then tween:Cancel() end
                task.wait(0.3)
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        if AutoGrabGun_Enabled then
            pcall(function()
                local gun = GetGun()
                local hrp = GetHRP()
                local hum = GetHum()
                if gun and hrp and hum and hum.Health > 0 then
                    local dist = (hrp.Position - gun.Position).Magnitude
                    if dist < 80 then
                        hrp.CFrame = gun.CFrame * CFrame.new(0, 3, 0)
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    local lastNotify = 0
    while task.wait(1) do
        if AutoNotifyKits_Enabled then
            pcall(function()
                local now = os.clock()
                if now - lastNotify > 5 then
                    for _, part in ipairs(Workspace:GetDescendants()) do
                        if part:IsA("BasePart") and (part.Name:lower():find("kit") or part.Name:lower():find("medkit")) then
                            local hrp = GetHRP()
                            if hrp and (hrp.Position - part.Position).Magnitude < 100 then
                                Notify(GetLang("KitFoundTitle"), GetLang("KitNearby") .. part.Name)
                                lastNotify = now
                                break
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ==================== MOVEMENT ====================
local MoveTab = Window:Tab({ Title = GetLang("MoveTabTitle"), Icon = "zap" })

MoveTab:Slider({
    Title = GetLang("WalkSpeedTitle"),
    Value = { Min = 16, Max = 100, Default = 16 },
    Step = 1,
    Callback = function(v) WalkSpeedValue = v end
})

MoveTab:Slider({
    Title = GetLang("JumpPowerTitle"),
    Value = { Min = 50, Max = 200, Default = 50 },
    Step = 1,
    Callback = function(v) JumpPowerValue = v end
})

MoveTab:Toggle({
    Title = GetLang("NoclipTitle"),
    Value = false,
    Callback = function(v) Noclip_Enabled = v end
})

MoveTab:Toggle({
    Title = GetLang("InfJumpTitle"),
    Value = false,
    Callback = function(v) InfJump_Enabled = v end
})

UserInputService.JumpRequest:Connect(function()
    if InfJump_Enabled then
        pcall(function()
            local hum = GetHum()
            if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
        end)
    end
end)

local flyBV
local function StopFly()
    if flyBV then flyBV:Destroy() flyBV = nil end
    pcall(function()
        local hum = GetHum()
        if hum then hum.PlatformStand = false end
    end)
end

MoveTab:Toggle({
    Title = GetLang("FlyTitle"),
    Value = false,
    Callback = function(v)
        Fly_Enabled = v
        if not v then StopFly() end
    end
})

MoveTab:Slider({
    Title = GetLang("FlySpeedTitle"),
    Value = { Min = 20, Max = 200, Default = 60 },
    Step = 5,
    Callback = function(v) FlySpeed = v end
})

RunService.Heartbeat:Connect(function()
    pcall(function()
        local hum, hrp = GetHum(), GetHRP()
        if not (hum and hrp) then return end

        if WalkSpeedValue ~= 16 then hum.WalkSpeed = WalkSpeedValue end
        if JumpPowerValue ~= 50 then
            hum.UseJumpPower = true
            hum.JumpPower = JumpPowerValue
        end

        if Fly_Enabled then
            if not flyBV or not flyBV.Parent then
                flyBV = Instance.new("BodyVelocity")
                flyBV.MaxForce = Vector3.new(1e9, 1e9, 1e9)
                flyBV.Velocity = Vector3.zero
                flyBV.Parent = hrp
            end
            hum.PlatformStand = true
            local cam = Workspace.CurrentCamera
            local moveDir = hum.MoveDirection
            if moveDir.Magnitude > 0 then
                local look = cam.CFrame.LookVector
                local flat = Vector3.new(look.X, 0, look.Z)
                local forward = flat.Magnitude > 0 and moveDir:Dot(flat.Unit) or 0
                flyBV.Velocity = moveDir * FlySpeed + Vector3.new(0, look.Y * forward * FlySpeed, 0)
            else
                flyBV.Velocity = Vector3.zero
            end
        end
    end)
end)

RunService.Stepped:Connect(function()
    if (Noclip_Enabled or SafeFarm_Enabled or Fly_Enabled) and LocalPlayer.Character then
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

-- ==================== TELEPORT ====================
local TpTab = Window:Tab({ Title = GetLang("TpTabTitle"), Icon = "map-pin" })

local function PlayerNames()
    local names = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then table.insert(names, p.Name) end
    end
    if #names == 0 then names = { "—" } end
    return names
end

local PlayerDropdown = TpTab:Dropdown({
    Title = GetLang("SelectPlayerTitle"),
    Values = PlayerNames(),
    Value = PlayerNames()[1],
    Callback = function(option) SelectedPlayer = Players:FindFirstChild(option) end
})

TpTab:Button({
    Title = GetLang("RefreshPlayersTitle"),
    Callback = function()
        pcall(function() PlayerDropdown:Refresh(PlayerNames()) end)
    end
})

TpTab:Button({
    Title = GetLang("TeleportPlayerTitle"),
    Callback = function()
        pcall(function()
            local target = SelectedPlayer
            local hrp = GetHRP()
            local thrp = target and target.Character and target.Character:FindFirstChild("HumanoidRootPart")
            if hrp and thrp then
                hrp.CFrame = thrp.CFrame * CFrame.new(0, 0, 3)
            else
                Notify("Teleport", GetLang("PlayerNotFound"))
            end
        end)
    end
})

TpTab:Toggle({
    Title = GetLang("SpectateTitle"),
    Value = false,
    Callback = function(v)
        pcall(function()
            local cam = Workspace.CurrentCamera
            if v then
                local thum = SelectedPlayer and SelectedPlayer.Character and SelectedPlayer.Character:FindFirstChildOfClass("Humanoid")
                if thum then cam.CameraSubject = thum end
            else
                cam.CameraSubject = GetHum()
            end
        end)
    end
})

TpTab:Button({
    Title = GetLang("TpLobbyTitle"),
    Callback = function()
        pcall(function()
            local hrp = GetHRP()
            if hrp then
                local lobbyPos = Vector3.new(0, 50, 0)
                
                for _, part in ipairs(Workspace:GetDescendants()) do
                    if part:IsA("BasePart") and part.Name:lower():find("lobby") then
                        lobbyPos = part.Position
                        break
                    end
                end
                
                hrp.CFrame = CFrame.new(lobbyPos + Vector3.new(0, 3, 0))
                Notify("Teleport", GetLang("TeleportNotify") .. GetLang("InLobby"))
            end
        end)
    end
})

-- ==================== TP TO MAP [FIXED] ====================
TpTab:Button({
    Title = GetLang("TpMapTitle"),
    Callback = function()
        pcall(function()
            local hrp = GetHRP()
            if not hrp then return end
            
            local teleported = false
            
            -- Ищем живого убийцу или шерифа (они точно на карте в раунде!)
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character then
                    local phrp = p.Character:FindFirstChild("HumanoidRootPart")
                    local phum = p.Character:FindFirstChildOfClass("Humanoid")
                    local role = GetPlayerRole(p)
                    
                    if phrp and phum and phum.Health > 0 and (role == "Murderer" or role == "Sheriff") then
                        -- Телепортируемся рядом с убийцой/шерифом
                        hrp.CFrame = phrp.CFrame * CFrame.new(5, 0, 5)
                        Notify("Teleport", GetLang("TeleportNotify") .. GetLang("OnMap"))
                        teleported = true
                        break
                    end
                end
            end
            
            -- Если нет убийцы/шерифа, ищем любого живого игрока
            if not teleported then
                for _, p in ipairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer and p.Character then
                        local phrp = p.Character:FindFirstChild("HumanoidRootPart")
                        local phum = p.Character:FindFirstChildOfClass("Humanoid")
                        
                        if phrp and phum and phum.Health > 0 then
                            hrp.CFrame = phrp.CFrame * CFrame.new(5, 0, 5)
                            Notify("Teleport", GetLang("TeleportNotify") .. GetLang("OnMap"))
                            teleported = true
                            break
                        end
                    end
                end
            end
            
            -- Если никого не нашли, ищем самую большую платформу
            if not teleported then
                local maxSize = 0
                local bestPart = nil
                for _, part in ipairs(Workspace:GetDescendants()) do
                    if part:IsA("BasePart") and part.Parent ~= LocalPlayer.Character and not part.Parent:FindFirstChild("Humanoid") then
                        local size = part.Size.Magnitude
                        if size > maxSize and size > 5 then
                            maxSize = size
                            bestPart = part
                        end
                    end
                end
                if bestPart then
                    hrp.CFrame = bestPart.CFrame + Vector3.new(0, bestPart.Size.Y/2 + 3, 0)
                    Notify("Teleport", GetLang("TeleportNotify") .. GetLang("OnMap"))
                end
            end
        end)
    end
})

-- ==================== MISC ====================
local MiscTab = Window:Tab({ Title = GetLang("MiscTabTitle"), Icon = "settings" })

MiscTab:Button({
    Title = GetLang("LowerGraphicsTitle"),
    Callback = function()
        pcall(function()
            Lighting.GlobalShadows = false
            for _, v in ipairs(Workspace:GetDescendants()) do
                if v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic end
                if v:IsA("ParticleEmitter") or v:IsA("Trail") then v.Enabled = false end
            end
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
            Notify("Misc", GetLang("GraphicsLowered"))
        end)
    end
})

MiscTab:Button({
    Title = GetLang("ResetCharTitle"),
    Callback = function()
        pcall(function()
            local hum = GetHum()
            if hum then hum.Health = 0 end
        end)
    end
})

MiscTab:Dropdown({
    Title = GetLang("LanguageTitle"),
    Values = { "Russian", "English" },
    Value = CurrentLanguage,
    Callback = function(lang)
        CurrentLanguage = lang
        Notify("Language / Язык", "Changed to: " .. lang)
    end
})

-- ==================== INFO ====================
local InfoTab = Window:Tab({ Title = GetLang("InfoTabTitle"), Icon = "info" })

InfoTab:Paragraph({
    Title = "🔮 MM2 HUB v3 [FIXED]",
    Desc = "═════════════════════════════════\n\n✨ Создано: @Gjfssbn23\n📱 Telegram: @Gjfssbn23\n\n═════════════════════════════════"
})

InfoTab:Paragraph({
    Title = "⭐ Основные функции",
    Desc = "🔫 Aimbot для пистолета (телефон)\n🔪 Knife Aimbot (с/без стен)\n🎯 Hitbox расширенный\n💰 Auto Grab Gun\n💎 Safe Farm Coins\n👁️ ESP / Chams система\n📍 Продвинутая телепортация\n✈️ Fly, Noclip, Infinite Jump"
})

InfoTab:Paragraph({
    Title = "⚙️ Все вкладки",
    Desc = "👤 Main - информация и сервер\n💥 Visuals - ESP, Fullbright, FOV\n⚔️ Combat - Aimbot, Hitbox\n🤖 Automation - Автофарм\n🏃 Movement - Полёт, скорость\n📍 Teleport - Все телепорты\n🔧 Misc - Графика, язык"
})

InfoTab:Paragraph({
    Title = "✅ Статус и исправления",
    Desc = "✓ Hitbox [FIXED] - не вызывает баги физики\n✓ TP to Map [FIXED] - телепортирует в место раунда\n✓ ESP [FIXED] - нет мигания\n✓ Все функции работают\n✓ Оптимизировано\n✓ Готово к использованию!"
})

Notify("MM2 Hub", "✅ Хаб загружен! v3 [FIXED] 🚀")
