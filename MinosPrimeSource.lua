plr = game.Players.LocalPlayer
char = plr.Character
hrp = char.HumanoidRootPart
hum = char.Humanoid
cam = workspace.CurrentCamera

ts = game.TweenService
rs = game.RunService
uis = game.UserInputService

pcall(function() plr.PlayerGui.MinosPrime:Destroy() end)
pcall(function() char.Head.MinosYap:Destroy() end)
pcall(function() workspace.MinosOrder:Destroy() end)

Https = {
    ["Die.mp3"] = "https://github.com/InnocentViru/Mentos-primeiro/raw/refs/heads/main/minos-prime-die%20(1).mp3",
    ["Crush.mp3"] = "https://github.com/InnocentViru/Mentos-primeiro/raw/refs/heads/main/ultrakill-minos-prime-attack-crush.mp3",   
    ["Explosion1.mp3"] = "https://github.com/InnocentViru/Mentos-primeiro/raw/refs/heads/main/Explosion_1.ogg.ogx",
    ["Explosion2.mp3"] = "https://github.com/InnocentViru/Mentos-primeiro/raw/refs/heads/main/Explosion_2.ogg.ogx",
    ["Explosion3.mp3"] = "https://github.com/InnocentViru/Mentos-primeiro/raw/refs/heads/main/ultrakill-big-explosion.mp3",
    ["Judgement.mp3"] = "https://github.com/InnocentViru/Mentos-primeiro/raw/refs/heads/main/judgement.mp3",
    ["Landing.mp3"] = "https://github.com/InnocentViru/Mentos-primeiro/raw/refs/heads/main/Landing.wav",
    ["Dash.mp3"] = "https://github.com/InnocentViru/Mentos-primeiro/raw/refs/heads/main/Dodge3.ogg",
    ["VD.mp3"] = "https://github.com/InnocentViru/Mentos-primeiro/raw/refs/heads/main/ultrakill-viture-death-made-with-Voicemod%20(1).mp3"
}

MinosTheme = "https://github.com/InnocentViru/Mentos-primeiro/raw/refs/heads/main/Order%20-%20Heaven%20Pierce%20Her%20(youtube).mp3"

function playtheme()
    pcall(function() workspace.MinosOrder:Destroy() end)
    pcall(function() delfile("MinosPrimeTheme.mp3") end)

    local suc, http = pcall(function()
        return game:HttpGet(MinosTheme)
    end)
    if suc and http then
        writefile("MinosPrimeTheme.mp3", http)
    end

    Theme = Instance.new("Sound", workspace)
    Theme.Volume = 5    
    Theme.TimePosition = 47.25
    Theme.Name = "MinosOrder"
    Theme.Looped = true
    Theme.SoundId = getcustomasset("MinosPrimeTheme.mp3")
    Theme:Play()

    Theme.DidLoop:Connect(function()        
        Theme.TimePosition = 47.25
    end)
end

function load()
    for i in next, Https do
        pcall(function() delfile(i) end)
    end

    for i,v in next, Https do
        local suc, http = pcall(function()
            return game:HttpGet(v)
        end)
        if suc and http then
            writefile(i, http)
        end
    end
end

function playhttp(name, volume, pitch)
    if not Https[name] then return end
    local s = Instance.new("Sound", workspace)
    s.PlayOnRemove = true
    s.Pitch = pitch or 1
    s.Volume = volume or 5
    s.SoundId = getcustomasset(name)
    s:Destroy()
end

if hum.RigType ~= Enum.HumanoidRigType.R6 then
    spawn(function()
        local msg = Instance.new("Message", workspace)
        msg.Text = "you're not r6"
        task.wait(4)
        msg:Destroy()
    end)
end

local loading = Instance.new("Message", workspace)
loading.Text = "Loading Minos Prime..."
load()
playtheme()

Main = Instance.new("ScreenGui", plr.PlayerGui)
Main.Name = "MinosPrime"

MainFrame = Instance.new("Frame", Main)
Toggle = Instance.new("TextButton", Main)
Frame = Instance.new("Frame", MainFrame)
Title = Instance.new("TextLabel", MainFrame)

BillboardGui = Instance.new("BillboardGui", char.Head)
Dialog = Instance.new("TextLabel", BillboardGui)

UICorner = Instance.new("UICorner", MainFrame)
UIStroke = Instance.new("UIStroke", MainFrame)
UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint", MainFrame) 
UIDragDetector = Instance.new("UIDragDetector", MainFrame)

UIListLayout = Instance.new("UIListLayout", Frame)

UICorner2 = Instance.new("UICorner", Toggle)
UIAspectRatioConstraint2 = Instance.new("UIAspectRatioConstraint", Toggle)
UIStroke2 = Instance.new("UIStroke", Toggle)

UIStroke3 = Instance.new("UIStroke", Dialog)
UICorner3 = Instance.new("UICorner", Dialog)

MainFrame.AnchorPoint = Vector2.new(.5,.5)
MainFrame.Size = UDim2.fromScale(.5,.5)
MainFrame.Position = UDim2.fromScale(.75,.5)
MainFrame.Name = "Main Frame"
MainFrame.BackgroundColor3 = Color3.new(0,0,0)

UIStroke.Thickness = 3
UIStroke.Color = Color3.new(1,1,1)

Frame.AnchorPoint = Vector2.new(.5,.5)
Frame.Position = UDim2.fromScale(.5,.5)
Frame.Size = UDim2.fromScale(.9,.9)
Frame.BackgroundTransparency = 1

Toggle.Size = UDim2.fromScale(.12,.12)
Toggle.AnchorPoint = Vector2.new(.5,.5)
Toggle.Position = UDim2.fromScale(.1,.5)
Toggle.TextScaled = true
Toggle.Name = "Toggle"
Toggle.Text = ":P"
Toggle.Modal = true
Toggle.BackgroundColor3 = Color3.new(0,0,0)
Toggle.Font = "Code"
Toggle.TextColor3 = Color3.new(1,1,1)
Toggle.Draggable = true

UIStroke2.Thickness = 2
UIStroke2.Color = Color3.new(1,1,1)
UIStroke2.ApplyStrokeMode = "Border"

Title.Text = "Made by VirusSX ;)"
Title.AnchorPoint = Vector2.new(.5,.5)
Title.Position = UDim2.fromScale(.5, .8)
Title.TextScaled = true
Title.Font = "Code"
Title.TextColor3 = Color3.new(1,1,1)
Title.Name = "Title"
Title.BackgroundTransparency = 1
Title.Size = UDim2.fromScale(.9,.25)

UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.FillDirection = "Horizontal"
UIListLayout.HorizontalFlex = "Fill"
UIListLayout.HorizontalAlignment = "Center"
UIListLayout.Wraps = true
UIListLayout.SortOrder = "LayoutOrder"

BillboardGui.Size = UDim2.fromScale(4,4)
BillboardGui.StudsOffset = Vector3.new(0,2.5,0)
BillboardGui.Name = "MinosYap"

Dialog.AnchorPoint = Vector2.new(.5,.5)
Dialog.Font = "Arcade"
Dialog.TextScaled = true
Dialog.TextColor3 = Color3.new(1,1,1)
Dialog.Position = UDim2.fromScale(.5,.5)
Dialog.Name = "Yapppppp"
Dialog.Size = UDim2.fromScale(1,.5)
Dialog.Text = "bomboclat"
Dialog.BackgroundTransparency = 1

Toggle.MouseButton1Click:Connect(function()    
    MainFrame.Visible = not MainFrame.Visible
    Toggle.Rotation = 19
    ts:Create(Toggle, TweenInfo.new(.2), {["Rotation"] = 0}):Play()    

    local s = Instance.new("Sound", workspace)
    s.PlayOnRemove = true
    s.Volume = 7.5
    s.SoundId = "rbxassetid://12221976"
    s:Destroy()
end)

-- functions

function debris(amount, cf)
    local ray = workspace:Raycast(cf.Position, Vector3.new(0,-100,0))
    local material 
    local color 
    if ray and ray.Instance then
        material = ray.Instance.Material
        color = ray.Instance.Color
    else
        material = "Air"
        color = Color3.new(1,1,1)
    end    

    local seed = Random.new()    
    for i = 1, amount do
        local p = Instance.new("Part", workspace)
        p.Name = "Debris"
        p.Color = color
        p.Size = Vector3.one
        p.Material = material
        p.CFrame = cf
        p.CanCollide = false
        p.Velocity = Vector3.new(
           seed:NextNumber(-200,200),
           seed:NextNumber(0,250),
           seed:NextNumber(-200,200)
        )
        game.Debris:AddItem(p, 5)

        local att = Instance.new("Attachment", p)
        local att2 = Instance.new("Attachment", p)
        att.Position = Vector3.new(0,p.Size.Y / 2, 0)
        att2.Position = Vector3.new(0, -(p.Size.Y / 2), 0)

        local trail = Instance.new("Trail", p)
        trail.Attachment0 = att               
        trail.Attachment1 = att2
        trail.FaceCamera = true
        trail.Lifetime = 1
        trail.Color = ColorSequence.new(Color3.new(1,1,1))
        trail.WidthScale = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(1, 0)
        })

    end
end

function jumpanim()
    pcall(function() getgenv().minosjump:Disconnect() end)
    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://233064613"
    local track = hum:LoadAnimation(anim)

    for i,v in next, hum:GetPlayingAnimationTracks() do
        if v.Animation and v.Animation.AnimationId == "rbxassetid://233064613" then
            v:Stop()
        end
    end
    
    hum.UseJumpPower = false
    hum.JumpHeight = 60
    hum.WalkSpeed = 40

    getgenv().minosjump = hum.StateChanged:Connect(function(_, new)
        if new == Enum.HumanoidStateType.Jumping and not track.IsPlaying then
            track:Play()
            track:AdjustSpeed(0)
            playhttp("Landing.mp3")
        elseif new == Enum.HumanoidStateType.Landed and track.IsPlaying then
            track:Stop()
        end
    end)
end
jumpanim()

function createbutton(txt, order)
    local button = Instance.new("TextButton", Frame)
    button.AnchorPoint = Vector2.new(.5,.5) 
    button.Size = UDim2.fromScale(.25, .2)
    button.Text = txt
    button.TextScaled = true
    button.LayoutOrder = order 
    button.Font = "Code"
    button.TextColor3 = Color3.new(1,1,1)
    button.BackgroundColor3 = Color3.new(0,0,0)
    button.Name = txt
    button.Modal = true

    local stroke = Instance.new("UIStroke", button)
    stroke.ApplyStrokeMode = "Border"
    stroke.Thickness = 2
    stroke.Color = Color3.new(1,1,1)

    local corner = Instance.new("UICorner", button)    

    return button
end

function createanim(id)
    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://" .. id
    local t = hum:LoadAnimation(anim)
    return t
end

function cooldown(button, dur)
    button.Interactable = false
    local oldtxt = button.Text
    
    local timer = dur

    spawn(function()
        while timer > 0 and task.wait(0.1) do
            button.Text = string.format("%.1f", timer)
            timer -= 0.1
        end
        button.Text = oldtxt
        button.Interactable = true    
    end)
end

function getclosest(radius)
    local closest = nil
    local dist = radius or math.huge

    for i,v in next, game.Players:GetPlayers() do
        if v ~= plr and v.Character then
            local phrp = v.Character:FindFirstChild("HumanoidRootPart")
            if phrp and (hrp.Position - phrp.Position).Magnitude < dist then
                closest = phrp
                dist = (hrp.Position - phrp.Position).Magnitude
            end
        end
    end
    return closest
end

function shockwave(dur,  size)
    local f = Instance.new("Model", workspace)
    f.Name = "mentos"
    local p = Instance.new("Part", f)
    local p2 = Instance.new("MeshPart", f)
    local d = Instance.new("Decal", p)
    local pos = hrp.Position + Vector3.new(0,1,0)
 
    p.Transparency = 1
    p.CanCollide = false
    p.Anchored = true
    p.Size = Vector3.one
    p.Position = pos
    p.CastShadow = false

    d.Texture = "rbxassetid://18642925033"
    d.Face = "Top"

    p2.Anchored = true
    p2.Color = Color3.fromRGB(255, 165, 0)
    p2.CanCollide = false
    p2.Transparency = 0.7
    p2.MeshId = "rbxassetid://6797156017"
    p2.Position = pos
    p2.Material = "Neon"
    p2.CastShadow = false
    p2.Size = Vector3.one
    
    ts:Create(p, TweenInfo.new(dur), {
        ["Size"] = Vector3.new(size * 2.6, 2, size * 2.6),
        ["Transparency"] = 1
    }):Play()

    ts:Create(p2, TweenInfo.new(dur), {
        ["Size"] = Vector3.new(size, 25, size),
        ["Transparency"] = 1
    }):Play()

    ts:Create(d, TweenInfo.new(dur), {       
        ["Transparency"] = 1
    }):Play()

    delay(dur, function()
        f:Destroy()
    end)
end

function explosion4(pos)
    local p = Instance.new("Part", workspace)
    local p2 = Instance.new("MeshPart", workspace)
    local decal = Instance.new("Decal", p)

    p.Anchored = true
    p.CanCollide = false
    p.Size = Vector3.one
    p.Transparency = 1
    p.CFrame = CFrame.new(pos, cam.CFrame.Position)

    p2.Anchored = true
    p2.CanCollide = false
    p2.Size = Vector3.one    
    p2.CFrame = CFrame.new(pos)
    p2.DoubleSided = true
    p2.MeshId = "rbxassetid://8553528400"
    p2.Material = "Neon"

    decal.Face = "Front"
    decal.Texture = "rbxassetid://18642925033"
    
    ts:Create(p, TweenInfo.new(1.5), {["Size"] = Vector3.new(100,100,1)}):Play()
    ts:Create(p2, TweenInfo.new(1.5), {["Size"] = Vector3.new(300,300,300), ["Transparency"] = 1}):Play()
    ts:Create(decal, TweenInfo.new(1.5), {["Transparency"] = 1}):Play()
    game.Debris:AddItem(p, 1.5)
    game.Debris:AddItem(p2, 1.5)
end

function fling(pchar)
    local oldpos = hrp.CFrame
    local phrp = pchar:FindFirstChild("HumanoidRootPart")
    if not phrp then return end
    local phum = pchar:FindFirstChild("Humanoid")
    if not phum then return end    

    local start = tick()            
    
    repeat rs.Heartbeat:Wait()
        sethiddenproperty(hrp, "PhysicsRepRootPart", phrp)
        hrp.CFrame = phrp.CFrame * CFrame.Angles(math.rad(90), 0, 0)            
        local old = hrp.Velocity
        hrp.Velocity = Vector3.new(9e9,9e9,9e9)
        rs.RenderStepped:Wait()
        hrp.Velocity = old
    until tick() - start > .4 or phum.Health <= 0 or not phrp or not phrp.Parent
    task.wait(0.12)

    spawn(function()
        hrp.Anchored = true
        task.wait(.1)
        hrp.Anchored = false
    end)
    sethiddenproperty(hrp, "PhysicsRepRootPart", nil)
    hrp.CFrame = oldpos
    hrp.Velocity = Vector3.zero    
    hum:ChangeState("GettingUp")
end

function hitbox(pos, size)
    local p = Instance.new("Part", workspace)
    p.Anchored = true
    p.CanCollide = false
    p.Size = size
    p.CastShadow = false
    p.CanQuery = false
    p.CFrame = typeof(pos) == "CFrame" and pos or CFrame.new(pos)
    p.Transparency = .5
    game.Debris:AddItem(p, 0.75)
    local no = {}

    spawn(function()
        for i,v in next, workspace:GetPartsInPart(p) do
            local pchar = v:FindFirstAncestorOfClass("Model")
            if pchar and pchar ~= char and game.Players:GetPlayerFromCharacter(pchar)
            and pchar:FindFirstChild("Humanoid") and pchar.Humanoid.Health > 0 and pchar:FindFirstChild("HumanoidRootPart") and not no[pchar] then
                no[pchar] = true
                fling(pchar)                
            end
        end
    end)
end

MsgId = 0
function Say(msg, dur)
    Dialog.TextTransparency = 0
    Dialog.UIStroke.Transparency = 0
    local id = MsgId

    spawn(function()
        for i = 1, #msg do
            Dialog.Text = string.sub(msg, 1, i)
            task.wait(0.02)
        end
        task.wait(dur)
        if MsgId == id then
            ts:Create(Dialog, TweenInfo.new(1), {["TextTransparency"] = 1}):Play()
            ts:Create(Dialog.UIStroke, TweenInfo.new(1), {["Transparency"] = 1}):Play()
        end
    end)
end

function glowing()
    local att = Instance.new("Attachment", char["Right Arm"])
    att.Position = Vector3.new(0,-1,0)    
    game.Debris:AddItem(att, 1)

    local vfx = Instance.new("ParticleEmitter", att)
    vfx.Speed = NumberRange.new(0,0)
    vfx.Rate = 40
    vfx.LockedToPart = true
    vfx.Color = ColorSequence.new(Color3.new(1,1,0))
    vfx.Brightness = 10
    vfx.Texture = "rbxassetid://17608119070"
    vfx.Lifetime = NumberRange.new(.2,.2)
    vfx.Size = NumberSequence.new({      
        NumberSequenceKeypoint.new(0, 5),
        NumberSequenceKeypoint.new(1, 0)
    })
    vfx.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(1, 0)
    })
end

function handtrail(dur)
    local att = Instance.new("Attachment", char["Right Arm"])
    local att2 = Instance.new("Attachment", char["Right Arm"])
    local trail = Instance.new("Trail", char["Right Arm"])

    att.Position = Vector3.new(char["Right Arm"].Size.X / 2,-1,0)
    att2.Position = Vector3.new(-(char["Right Arm"].Size.X / 2),-1,0)
    
    trail.Attachment0 = att
    trail.Attachment1 = att2
    trail.Lifetime = .25
    trail.FaceCamera = true
    trail.Color = ColorSequence.new(Color3.new(0,1,1))
    trail.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(1,1)
    })

    delay(dur, function()
        trail:Destroy() att:Destroy() att2:Destroy()
    end)
end

-- // // // // // // // //

buttons = {}

names = {
    "Die",
    "Judgement",    
    "Crush",    
    "Serpent throw",
    "Overhead",
    "Uppercut",
    "Toggle Music"
}

for i,v in next, names do
    local b = createbutton(v, i)
    table.insert(buttons, b)    
end

button1db = false
button4db = false

buttons[1].MouseButton1Click:Connect(function()
    if button1db then return end
    button1db = true
    buttons[1].Text = "-"
    
    local con; con = uis.InputBegan:Connect(function(input, gp)
         if not gp and input.UserInputType == Enum.UserInputType.Touch
         or input.UserInputType == Enum.UserInputType.MouseButton1 then
             con:Disconnect() con = nil
             Say("Die!", 2)
             playhttp("Die.mp3")           

             -- function  
             local hit = plr:GetMouse().Hit.Position                 
             local target = plr:GetMouse().Target
             local oldpos = hrp.Position
              
             if not target then
                 hit = hrp.Position
                 hrp.CFrame = CFrame.new(hit)
             end

             local frightened = createanim(180612465)
             frightened:Play(0, 999, 0)
             frightened.TimePosition = .5
             
             local stare; stare = rs.Heartbeat:Connect(function()
                 hrp.Velocity = Vector3.zero     
                 if target then
                     hrp.CFrame = CFrame.new(oldpos, hit) * CFrame.Angles(math.rad(90),0,0)
                 else
                     hrp.CFrame = hit
                 end
             end)

             wait(.75)
             playhttp("Landing.mp3")
             playhttp("Explosion1.mp3", 1.5)
             debris(15, CFrame.new(hit))

             stare:Disconnect() stare = nil
             hrp.CFrame = CFrame.new(hit)
             delay(.1, function()
                 shockwave(2, 50)
                 hum:ChangeState("GettingUp")
                 wait(.15)                 
                 frightened:Stop()
             end)
             hitbox(hit, Vector3.new(30,30,30))

             buttons[1].Text = "Die"
             cooldown(buttons[1], 2.5)
             button1db = false
         end
    end)    
end)

buttons[2].MouseButton1Click:Connect(function()
    local victim = getclosest()
    if not victim then
        return
    end
    buttons[2].Interactable = false
    Say("Judgment!", 2)    
    playhttp("Judgement.mp3")    
    local start = tick()
    local down = createanim(168298118)
    down:Play(0, 999, 0)
    down.TimePosition = .25
    
    hum:ChangeState("FallingDown")
    hrp.CFrame = CFrame.new(hrp.Position, victim.Position) * CFrame.Angles(math.rad(-90),0,0)

    task.wait(1)

    local dur = tick()
    repeat task.wait()
        sethiddenproperty(hrp, "PhysicsRepRootPart", victim)
        hrp.CFrame = victim.CFrame * CFrame.new(0,1.75,-3.5) * CFrame.Angles(math.rad(-90), math.rad(180), 0)
        hrp.Velocity = Vector3.zero
    until tick() - dur > .5

    playhttp("Explosion3.mp3")
    local p = Instance.new("Part", workspace)
    p.Anchored = true
    p.Transparency = -50
    p.Color = Color3.new(0,1,1)
    p.Shape = "Ball"
    p.Material = "ForceField"
    p.Size = Vector3.one
    p.CFrame = hrp.CFrame
    ts:Create(p, TweenInfo.new(.5, Enum.EasingStyle.Linear), {["Size"] = Vector3.new(400,400,400), ["Transparency"] = 1}):Play()
    game.Debris:AddItem(p, .5)
 
    local vfxf = Instance.new("Folder", workspace)
    for i = 1, 15 do
       local vfx = Instance.new("Part", vfxf)
       vfx.Anchored = true
       vfx.CanCollide = false
       vfx.Size = Vector3.new(1,1000,0)
       vfx.Color = Color3.new(0,1,1)
       vfx.Material = "Neon"
        vfx.CFrame = hrp.CFrame * CFrame.Angles(
            math.rad(math.random(-360, 360)),
            math.rad(math.random(-360, 360)),
            math.rad(math.random(-360, 360))
        )
        ts:Create(vfx, TweenInfo.new(1), {["Transparency"] = 1}):Play()
    end

    delay(1, function()
        vfxf:Destroy()
    end)

    fling(victim:FindFirstAncestorOfClass("Model"))
    sethiddenproperty(hrp, "PhysicsRepRootPart", nil)
    cooldown(buttons[2], 5)
    down:Stop()    
end)

buttons[3].MouseButton1Click:Connect(function()
    local phrp = getclosest()
    if not phrp then return end
    cooldown(buttons[3], 7.5)
    Say("Crush!", 3)

    local frightened = createanim(180612465)
    frightened:Play(0, 999, 0)
    frightened.TimePosition = .5

    playhttp("Crush.mp3")

    local start = tick()
    local pos = phrp.CFrame * CFrame.new(0,50,0)
    repeat task.wait()
        hrp.CFrame = pos
        hrp.Velocity = Vector3.zero
    until tick() - start > .5

    playhttp("Explosion2.mp3")
    
    hrp.CFrame *= CFrame.new(0,-50,0)    
    task.wait() 
    debris(20, hrp.CFrame)
    shockwave(2, 80)
    hitbox(hrp.CFrame, Vector3.new(20,20,20))

    frightened:Stop()
end)

buttons[7].MouseButton1Click:Connect(function()
    Theme.Volume = Theme.Volume == 5 and 0 or 5
end)

pcall(function() getgenv().humdie:Disconnect() end)
getgenv().humdie = char.Torso.AncestryChanged:Connect(function()
    Theme:Destroy()
    Main:Destroy()
    BillboardGui:Destroy()    
end)

buttons[4].MouseButton1Click:Connect(function()
    if button4db then return end
    buttons[4].Text = "-"

    local con; con = uis.InputBegan:Connect(function(input, gp)
        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
            con:Disconnect() con = nil
            local hit = plr:GetMouse().Hit.Position                 
            local target = plr:GetMouse().Target
            if not target then buttons[4].Text = "Serpent throw" cooldown(buttons[4], 2.5) button4db = false return end

            local throw = createanim(218508052)
            throw:Play(.5, 999, 0)
            throw.TimePosition = .725

            local oldpos

            local t = Instance.new("Part", workspace)
            t.Anchored = true
            t.Transparency = .75
            t.Color = Color3.new(1,1,0)
            t.Material = "Neon"
            t.Shape = "Ball"
            t.Size = Vector3.new(3,3,3)
            t.CanCollide = false
            t.CFrame = CFrame.new(hit)

            local p = Instance.new("Part", workspace)
            p.CanCollide = false
            p.Material = "Neon"
            p.Color = Color3.new(1,1,0)
            p.Size = Vector3.new(3,3,3)
            p.Shape = "Ball"
            p.Anchored = true            
          
            local att = Instance.new("Attachment", p)
            local att2 = Instance.new("Attachment", p)
            att.Position = Vector3.new(0,p.Size.Y / 2.5, 0)
            att2.Position = Vector3.new(0, -(p.Size.Y / 2.5), 0)

            local f = Instance.new("BodyForce", p)
             f.Force = Vector3.new(0, p:GetMass() * workspace.Gravity, 0)

            local trail = Instance.new("Trail", p)
            trail.Attachment0 = att               
            trail.Attachment1 = att2
            trail.FaceCamera = true
            trail.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(1, 1)
            })
            trail.Lifetime = 1
            trail.Color = ColorSequence.new(Color3.new(1,.6,0))            
            local start = tick()
            local old = hrp.Position
            
            p.Transparency = 1
            trail.Enabled = false
            glowing()
            repeat task.wait()
                hrp.CFrame = CFrame.new(old, hit)
                hrp.Velocity = Vector3.zero
            until tick() - start > 1
            p.Transparency = 0
            trail.Enabled = true
           
            throw:AdjustSpeed(1)            
            playhttp("Dash.mp3", 10)
            p.Anchored = false                    
            p.CFrame = hrp.CFrame * CFrame.new(0,0,-2)                         
            
            local dir = (t.Position - hrp.Position).Unit * 135
            spawn(function()
                local overlap = OverlapParams.new()
                overlap.FilterType = Enum.RaycastFilterType.Blacklist
                overlap.FilterDescendantsInstances = {char}
                local timer = tick()
                repeat task.wait() 
                    p.Velocity = dir
                until #workspace:GetPartsInPart(p, overlap) ~= 0 or not p or not p.Parent         
                or tick() - timer > 5       
                playhttp("VD.mp3", 10)                
                oldpos = p.Position
                explosion4(oldpos)
                p:Destroy()
                t:Destroy()
                debris(20, CFrame.new(oldpos))
                hitbox(oldpos, Vector3.new(30,30,30))
            end)
            buttons[4].Text = "Serpent throw"
            cooldown(buttons[4], 10)
            button4db = false
        end
    end)
end)

buttons[5].MouseButton1Click:Connect(function()    
    local closest = getclosest()
    if not closest then return end
    local ppos = closest.CFrame
    local pos = ppos * CFrame.new(0,5,-5) * CFrame.Angles(math.rad(45),math.rad(180),0)
    local pos2 = ppos * CFrame.new(0,5,-5) * CFrame.Angles(math.rad(110),math.rad(180),0)
    
    local hold = createanim(168298118)
    hold:Play(0,999,0)
    hold.TimePosition = .25
    playhttp("Dash.mp3", 10)

    local start = tick()
    repeat task.wait()
        hrp.CFrame = pos
        hrp.Velocity = Vector3.zero
    until tick() - start > .5
        start = tick()    
        playhttp("VD.mp3", 10)
    repeat task.wait()
        hrp.CFrame = pos2
        hrp.Velocity = Vector3.zero
    until tick() - start > .25
    hitbox(hrp.CFrame, Vector3.new(10,25,15))
    hold:Stop()
end)

buttons[6].MouseButton1Click:Connect(function()
    local closest = getclosest()
    if not closest then return end
    local a1 = createanim(203875401)
    local a2 = createanim(183412246)

    local cf = closest.CFrame * CFrame.new(0,0,-4) * CFrame.Angles(0,math.rad(180),0)
    hrp.CFrame = cf

    a1:Play(0, 999, 0)
    a1.TimePosition = .55

    playhttp("Dash.mp3", 10, .75)

    task.wait(.5)
    handtrail(1.5)
    a1:Stop()
    a2:Play()
    playhttp("Explosion1.mp3", 10, .75)
    hitbox(hrp.CFrame, Vector3.new(15,15,15))
    
    hrp.Velocity = Vector3.new(0,300,0)
    cooldown(buttons[6], 5)
end)
 
loading.Text = "Loaded, made by VirusSX ;)"
task.wait(2.5)
loading:Destroy()
