
--==================================================
-- PYROVEX HUB - ADVANCED TOP LOADING EFFECT
-- BLUE x RED x BLACK x PURPLE
-- 5 SECONDS | PREMIUM ANIMATED LOADER
--==================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local LogoAsset = "rbxthumb://type=Asset&id=97950138094007&w=420&h=420"

local Old = PlayerGui:FindFirstChild("PyrovexTopLoader")
if Old then Old:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PyrovexTopLoader"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999999
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

local function New(class,props,parent)
    local object = Instance.new(class)

    for property,value in pairs(props or {}) do
        object[property] = value
    end

    object.Parent = parent
    return object
end

local function Tween(obj,properties,duration,style,direction)
    local tween = TweenService:Create(
        obj,
        TweenInfo.new(
            duration or 0.25,
            style or Enum.EasingStyle.Quart,
            direction or Enum.EasingDirection.Out
        ),
        properties
    )

    tween:Play()
    return tween
end

local Main = New("Frame",{
    Name = "LoadingContainer",
    Size = UDim2.fromOffset(340,62),
    Position = UDim2.new(0.5,0,0,-85),
    AnchorPoint = Vector2.new(0.5,0),
    BackgroundColor3 = Color3.fromRGB(10,12,23),
    BorderSizePixel = 0,
    ClipsDescendants = true,
    ZIndex = 10
},ScreenGui)

New("UICorner",{
    CornerRadius = UDim.new(0,13)
},Main)

local MainStroke = New("UIStroke",{
    Color = Color3.fromRGB(90,105,210),
    Thickness = 1.3,
    Transparency = 0.1
},Main)

New("UIGradient",{
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,Color3.fromRGB(12,18,35)),
        ColorSequenceKeypoint.new(0.5,Color3.fromRGB(15,12,28)),
        ColorSequenceKeypoint.new(1,Color3.fromRGB(28,12,25))
    }),
    Rotation = 15
},Main)

-- OUTER GLOW

local Glow = New("Frame",{
    Name = "Glow",
    Size = UDim2.new(1,-12,0,2),
    Position = UDim2.fromOffset(6,0),
    BackgroundColor3 = Color3.fromRGB(80,120,255),
    BorderSizePixel = 0,
    ZIndex = 12
},Main)

New("UICorner",{
    CornerRadius = UDim.new(1,0)
},Glow)

New("UIGradient",{
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,Color3.fromRGB(0,130,255)),
        ColorSequenceKeypoint.new(0.35,Color3.fromRGB(120,65,255)),
        ColorSequenceKeypoint.new(0.7,Color3.fromRGB(230,45,100)),
        ColorSequenceKeypoint.new(1,Color3.fromRGB(255,65,65))
    })
},Glow)

-- SETTINGS EMOJI

local Settings = New("TextLabel",{
    Name = "SettingsIcon",
    Size = UDim2.fromOffset(32,32),
    Position = UDim2.fromOffset(11,10),
    BackgroundTransparency = 1,
    Text = "⚙️",
    TextSize = 24,
    Font = Enum.Font.GothamBold,
    TextColor3 = Color3.fromRGB(255,255,255),
    ZIndex = 15
},Main)

task.spawn(function()
    while ScreenGui.Parent and Settings.Parent do
        local rotate = Tween(
            Settings,
            {Rotation = Settings.Rotation + 360},
            1.35,
            Enum.EasingStyle.Linear
        )

        rotate.Completed:Wait()
    end
end)

-- TITLE

local Title = New("TextLabel",{
    Name = "Title",
    Position = UDim2.fromOffset(51,8),
    Size = UDim2.new(1,-115,0,17),
    BackgroundTransparency = 1,
    Text = "PYROVEX HUB",
    TextColor3 = Color3.fromRGB(245,248,255),
    TextSize = 11,
    TextXAlignment = Enum.TextXAlignment.Left,
    Font = Enum.Font.GothamBlack,
    ZIndex = 15
},Main)

-- STATUS

local Status = New("TextLabel",{
    Name = "Status",
    Position = UDim2.fromOffset(51,25),
    Size = UDim2.new(1,-105,0,15),
    BackgroundTransparency = 1,
    Text = "Initializing loader...",
    TextColor3 = Color3.fromRGB(150,165,195),
    TextSize = 8,
    TextXAlignment = Enum.TextXAlignment.Left,
    Font = Enum.Font.GothamMedium,
    ZIndex = 15
},Main)

-- PERCENTAGE

local Percentage = New("TextLabel",{
    Name = "Percentage",
    Position = UDim2.new(1,-54,0,24),
    Size = UDim2.fromOffset(43,16),
    BackgroundTransparency = 1,
    Text = "0%",
    TextColor3 = Color3.fromRGB(150,190,255),
    TextSize = 9,
    TextXAlignment = Enum.TextXAlignment.Right,
    Font = Enum.Font.GothamBold,
    ZIndex = 15
},Main)

-- PROGRESS BACKGROUND

local BarBG = New("Frame",{
    Name = "ProgressBackground",
    Size = UDim2.new(1,-22,0,5),
    Position = UDim2.fromOffset(11,48),
    BackgroundColor3 = Color3.fromRGB(32,35,53),
    BorderSizePixel = 0,
    ClipsDescendants = true,
    ZIndex = 15
},Main)

New("UICorner",{
    CornerRadius = UDim.new(1,0)
},BarBG)

-- PROGRESS BAR

local Bar = New("Frame",{
    Name = "ProgressBar",
    Size = UDim2.new(0,0,1,0),
    BackgroundColor3 = Color3.fromRGB(50,130,255),
    BorderSizePixel = 0,
    ZIndex = 16
},BarBG)

New("UICorner",{
    CornerRadius = UDim.new(1,0)
},Bar)

local BarGradient = New("UIGradient",{
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,Color3.fromRGB(0,145,255)),
        ColorSequenceKeypoint.new(0.35,Color3.fromRGB(100,80,255)),
        ColorSequenceKeypoint.new(0.7,Color3.fromRGB(190,55,160)),
        ColorSequenceKeypoint.new(1,Color3.fromRGB(255,55,70))
    }),
    Rotation = 0
},Bar)

-- MOVING SHINE

local Shine = New("Frame",{
    Name = "ProgressShine",
    Size = UDim2.new(0,45,1,0),
    Position = UDim2.new(0,0,0,0),
    BackgroundColor3 = Color3.fromRGB(255,255,255),
    BackgroundTransparency = 0.55,
    BorderSizePixel = 0,
    ZIndex = 17
},Bar)

New("UICorner",{
    CornerRadius = UDim.new(1,0)
},Shine)

New("UIGradient",{
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0,1),
        NumberSequenceKeypoint.new(0.5,0),
        NumberSequenceKeypoint.new(1,1)
    })
},Shine)

-- LOADING ENTRANCE

Tween(
    Main,
    {Position = UDim2.new(0.5,0,0,12)},
    0.75,
    Enum.EasingStyle.Quint,
    Enum.EasingDirection.Out
)

-- BORDER ANIMATION

task.spawn(function()
    while ScreenGui.Parent do
        Tween(MainStroke,{
            Transparency = 0.55,
            Color = Color3.fromRGB(180,65,160)
        },0.8)

        task.wait(0.8)

        if not ScreenGui.Parent then break end

        Tween(MainStroke,{
            Transparency = 0.1,
            Color = Color3.fromRGB(70,145,255)
        },0.8)

        task.wait(0.8)
    end
end)

-- SHINE ANIMATION

task.spawn(function()
    while ScreenGui.Parent and Shine.Parent do
        Shine.Position = UDim2.new(0,-45,0,0)

        local shineTween = Tween(
            Shine,
            {Position = UDim2.new(1,0,0,0)},
            0.75,
            Enum.EasingStyle.Linear
        )

        shineTween.Completed:Wait()
        task.wait(0.12)
    end
end)

-- LOADING STATUS

local LoadingMessages = {
    {Time = 0, Text = "Initializing Pyrovex Hub..."},
    {Time = 1, Text = "Preparing loader interface..."},
    {Time = 2, Text = "Loading script collection..."},
    {Time = 3, Text = "Setting up components..."},
    {Time = 4, Text = "Almost ready..."}
}

for _,message in ipairs(LoadingMessages) do
    task.delay(message.Time,function()
        if not ScreenGui.Parent then return end

        Tween(Status,{
            TextTransparency = 1
        },0.15)

        task.wait(0.15)

        if not ScreenGui.Parent then return end

        Status.Text = message.Text

        Tween(Status,{
            TextTransparency = 0
        },0.2)
    end)
end

-- EXACT 5 SECOND PROGRESS

local StartTime = os.clock()
local Duration = 5

local Progress = Tween(
    Bar,
    {Size = UDim2.new(1,0,1,0)},
    Duration,
    Enum.EasingStyle.Linear
)

Progress:Play()

while os.clock() - StartTime < Duration do
    if not ScreenGui.Parent then return end

    local elapsed = os.clock() - StartTime
    local percent = math.clamp(math.floor((elapsed / Duration) * 100),0,100)

    Percentage.Text = percent.."%"

    task.wait(0.04)
end

Percentage.Text = "100%"
Status.Text = "Pyrovex Hub is ready!"

-- FINISH EFFECT

Tween(MainStroke,{
    Color = Color3.fromRGB(80,220,160),
    Transparency = 0
},0.2)

Tween(Bar,{
    BackgroundColor3 = Color3.fromRGB(60,220,150)
},0.2)

task.wait(0.25)

-- LOADING EXIT

Tween(Main,{
    Position = UDim2.new(0.5,0,0,-85),
    BackgroundTransparency = 1
},0.65,Enum.EasingStyle.Quint,Enum.EasingDirection.In)

Tween(Settings,{TextTransparency = 1},0.35)
Tween(Title,{TextTransparency = 1},0.35)
Tween(Status,{TextTransparency = 1},0.35)
Tween(Percentage,{TextTransparency = 1},0.35)
Tween(BarBG,{BackgroundTransparency = 1},0.35)
Tween(Glow,{BackgroundTransparency = 1},0.35)

task.wait(0.7)

if ScreenGui then
    ScreenGui:Destroy()
end

local GrowAGarden_PlaceID = 126884695634066
if game.PlaceId ~= GrowAGarden_PlaceID then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "PYROVEX HUB", Text = "Exclusive to Grow a Garden!", Duration = 5
    })
    return
end

-- Cleanup
if _G.TLoop then _G.TLoop = false end
local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("PyroVexHub") then CoreGui.PyroVexHub:Destroy() end
if CoreGui:FindFirstChild("PyrovexKeyUI") then CoreGui.PyrovexKeyUI:Destroy() end

local Players=game:GetService("Players")
local UIS=game:GetService("UserInputService")
local TS=game:GetService("TweenService")
local RS=game:GetService("RunService")
local VU=game:GetService("VirtualUser")

local LP=Players.LocalPlayer

--// COMPACT RED + PURPLE THEME
local C={
	Main=Color3.fromRGB(20,7,18),
	Panel=Color3.fromRGB(36,10,27),
	Panel2=Color3.fromRGB(52,14,38),

	Red=Color3.fromRGB(225,35,65),
	Red2=Color3.fromRGB(255,70,90),

	Purple=Color3.fromRGB(125,45,220),
	Purple2=Color3.fromRGB(175,85,255),

	White=Color3.fromRGB(250,242,248),
	Gray=Color3.fromRGB(175,155,170),
	Off=Color3.fromRGB(58,25,45)
}

local AFK=false
local AFKStart=0
local Minimized=false
local TimerVisible=false
local AFKLoop=nil

--// UTIL
local function Corner(o,r)
	local c=Instance.new("UICorner")
	c.CornerRadius=UDim.new(0,r)
	c.Parent=o
	return c
end

local function Stroke(o,c,t,thickness)
	local s=Instance.new("UIStroke")
	s.Color=c
	s.Transparency=t or 0
	s.Thickness=thickness or 1
	s.Parent=o
	return s
end

local function Gradient(o,c1,c2,rotation)
	local g=Instance.new("UIGradient")
	g.Color=ColorSequence.new{
		ColorSequenceKeypoint.new(0,c1),
		ColorSequenceKeypoint.new(.5,c2),
		ColorSequenceKeypoint.new(1,c1)
	}
	g.Rotation=rotation or 0
	g.Parent=o
	return g
end

local function TextHighlight(o)
	o.TextColor3=C.White
	o.TextStrokeColor3=C.Purple
	o.TextStrokeTransparency=.35

	local s=Instance.new("UIStroke")
	s.Color=C.Red
	s.Transparency=.65
	s.Thickness=.7
	s.Parent=o

	return s
end

local function Tween(o,info,props)
	if not o or not o.Parent then return end
	local t=TS:Create(o,info,props)
	t:Play()
	return t
end

local function FormatTime(sec)
	sec=math.max(0,math.floor(sec))
	local h=math.floor(sec/3600)
	local m=math.floor((sec%3600)/60)
	local s=sec%60

	if h>0 then
		return string.format("%02d:%02d:%02d",h,m,s)
	end

	return string.format("%02d:%02d",m,s)
end

--// ANTI AFK
local function StartAntiAFK()
	if AFKLoop then
		task.cancel(AFKLoop)
		AFKLoop=nil
	end

	if not AFK then return end

	AFKLoop=task.spawn(function()
		while AFK do
			pcall(function()
				local Character=LP.Character
				local Root=Character and Character:FindFirstChild("HumanoidRootPart")

				if Root then
					local Original=Root.CFrame
					Root.CFrame=Original*CFrame.new(0,.01,0)
					task.wait(.08)

					if Root and Root.Parent then
						Root.CFrame=Original
					end
				end
			end)

			task.wait(15)
		end
	end)
end

LP.Idled:Connect(function()
	if AFK then
		pcall(function()
			VU:CaptureController()
			VU:ClickButton2(Vector2.new(100,100))
		end)
	end
end)

--// GUI
local GUI=Instance.new("ScreenGui")
GUI.Name="PyrovexHub"
GUI.ResetOnSpawn=false
GUI.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
GUI.Parent=game:GetService("CoreGui")

--// MAIN
local Main=Instance.new("Frame")
Main.Name="Main"
Main.Size=UDim2.fromOffset(270,205)
Main.Position=UDim2.new(.5,-135,.5,-102)
Main.BackgroundColor3=C.Main
Main.BorderSizePixel=0
Main.Parent=GUI

Corner(Main,12)
local MainStroke=Stroke(Main,C.Red,.25,1.2)

local MainGradient=Gradient(
	Main,
	Color3.fromRGB(55,9,24),
	Color3.fromRGB(30,8,45),
	25
)

--// HEADER
local Header=Instance.new("Frame")
Header.Size=UDim2.new(1,0,0,48)
Header.BackgroundTransparency=1
Header.Parent=Main

--// LOGO
local Logo=Instance.new("TextLabel")
Logo.Size=UDim2.fromOffset(34,34)
Logo.Position=UDim2.fromOffset(9,7)
Logo.BackgroundColor3=C.Red
Logo.Text="P"
Logo.TextSize=19
Logo.Font=Enum.Font.GothamBold
Logo.Parent=Header

Corner(Logo,9)
local LogoTextStroke=TextHighlight(Logo)
local LogoGradient=Gradient(Logo,C.Red,C.Purple,0)

--// TITLE
local Title=Instance.new("TextLabel")
Title.Size=UDim2.new(1,-105,0,21)
Title.Position=UDim2.fromOffset(50,6)
Title.BackgroundTransparency=1
Title.Text="Pyrovex Hub Anti-AFK"
Title.TextSize=13
Title.Font=Enum.Font.GothamBold
Title.TextXAlignment=Enum.TextXAlignment.Left
Title.Parent=Header

local TitleStroke=TextHighlight(Title)
local TitleGradient=Gradient(Title,C.Red2,C.Purple2,0)

--// SUBTITLE
local Subtitle=Instance.new("TextLabel")
Subtitle.Size=UDim2.new(1,-105,0,16)
Subtitle.Position=UDim2.fromOffset(50,27)
Subtitle.BackgroundTransparency=1
Subtitle.Text="By King Flame / Pyrovex Hub Team"
Subtitle.TextSize=8
Subtitle.Font=Enum.Font.Gotham
Subtitle.TextXAlignment=Enum.TextXAlignment.Left
Subtitle.Parent=Header

Subtitle.TextColor3=C.White
Subtitle.TextStrokeColor3=C.Red
Subtitle.TextStrokeTransparency=.55
local SubtitleGradient=Gradient(
	Subtitle,
	Color3.fromRGB(255,100,120),
	Color3.fromRGB(180,95,255),
	0
)

--// MINIMIZE
local Min=Instance.new("TextButton")
Min.Size=UDim2.fromOffset(26,26)
Min.Position=UDim2.new(1,-60,0,10)
Min.BackgroundColor3=C.Panel
Min.Text="-"
Min.TextSize=16
Min.Font=Enum.Font.GothamBold
Min.AutoButtonColor=false
Min.Parent=Header

Corner(Min,8)
local MinTextStroke=TextHighlight(Min)

--// CLOSE
local Close=Instance.new("TextButton")
Close.Size=UDim2.fromOffset(26,26)
Close.Position=UDim2.new(1,-31,0,10)
Close.BackgroundColor3=C.Panel
Close.Text="×"
Close.TextSize=16
Close.Font=Enum.Font.GothamBold
Close.AutoButtonColor=false
Close.Parent=Header

Corner(Close,8)
local CloseTextStroke=TextHighlight(Close)

--// BODY
local Body=Instance.new("Frame")
Body.Size=UDim2.new(1,-18,1,-57)
Body.Position=UDim2.fromOffset(9,48)
Body.BackgroundTransparency=1
Body.Parent=Main

--// AFK CARD
local AFKCard=Instance.new("Frame")
AFKCard.Size=UDim2.new(1,0,0,65)
AFKCard.BackgroundColor3=C.Panel
AFKCard.BorderSizePixel=0
AFKCard.Parent=Body

Corner(AFKCard,10)
local AFKCardStroke=Stroke(AFKCard,C.Red,.48)

local AFKCardGradient=Gradient(
	AFKCard,
	Color3.fromRGB(48,11,28),
	Color3.fromRGB(34,13,50),
	0
)

--// AFK TITLE
local AFKTitle=Instance.new("TextLabel")
AFKTitle.Size=UDim2.new(1,-75,0,22)
AFKTitle.Position=UDim2.fromOffset(12,8)
AFKTitle.BackgroundTransparency=1
AFKTitle.Text="Anti-AFK"
AFKTitle.TextSize=12
AFKTitle.Font=Enum.Font.GothamBold
AFKTitle.TextXAlignment=Enum.TextXAlignment.Left
AFKTitle.Parent=AFKCard

local AFKTitleStroke=TextHighlight(AFKTitle)
local AFKTitleGradient=Gradient(AFKTitle,C.Red2,C.Purple2,0)

--// AFK DESCRIPTION
local AFKDesc=Instance.new("TextLabel")
AFKDesc.Size=UDim2.new(1,-75,0,20)
AFKDesc.Position=UDim2.fromOffset(12,30)
AFKDesc.BackgroundTransparency=1
AFKDesc.Text="Prevent idle kick"
AFKDesc.TextSize=9
AFKDesc.Font=Enum.Font.Gotham
AFKDesc.TextXAlignment=Enum.TextXAlignment.Left
AFKDesc.Parent=AFKCard

AFKDesc.TextColor3=C.Gray
AFKDesc.TextStrokeColor3=C.Purple
AFKDesc.TextStrokeTransparency=.65

--// SWITCH
local Switch=Instance.new("TextButton")
Switch.Size=UDim2.fromOffset(45,24)
Switch.Position=UDim2.new(1,-57,.5,-12)
Switch.BackgroundColor3=C.Off
Switch.Text=""
Switch.AutoButtonColor=false
Switch.Parent=AFKCard

Corner(Switch,12)
local SwitchStroke=Stroke(Switch,C.Red,.3,1)

local SwitchGradient=Gradient(
	Switch,
	C.Red,
	C.Purple,
	0
)

local Knob=Instance.new("Frame")
Knob.Size=UDim2.fromOffset(18,18)
Knob.Position=UDim2.fromOffset(3,3)
Knob.BackgroundColor3=C.White
Knob.BorderSizePixel=0
Knob.Parent=Switch

Corner(Knob,9)

local Status=Instance.new("TextLabel")
Status.Size=UDim2.fromOffset(55,15)
Status.Position=UDim2.new(1,-64,0,7)
Status.BackgroundTransparency=1
Status.Text="OFF"
Status.TextSize=7
Status.Font=Enum.Font.GothamBold
Status.TextXAlignment=Enum.TextXAlignment.Right
Status.Parent=AFKCard

Status.TextColor3=C.Red2
Status.TextStrokeColor3=C.Purple
Status.TextStrokeTransparency=.4

--// INFO CARD
local InfoCard=Instance.new("Frame")
InfoCard.Size=UDim2.new(1,0,0,65)
InfoCard.Position=UDim2.fromOffset(0,73)
InfoCard.BackgroundColor3=C.Panel
InfoCard.BorderSizePixel=0
InfoCard.Parent=Body

Corner(InfoCard,10)
local InfoCardStroke=Stroke(InfoCard,C.Purple,.45)

local InfoCardGradient=Gradient(
	InfoCard,
	Color3.fromRGB(47,10,29),
	Color3.fromRGB(30,11,48),
	0
)

--// INFO TITLE
local InfoTitle=Instance.new("TextLabel")
InfoTitle.Size=UDim2.new(1,-24,0,22)
InfoTitle.Position=UDim2.fromOffset(12,8)
InfoTitle.BackgroundTransparency=1
InfoTitle.Text="Pyrovex Hub"
InfoTitle.TextSize=12
InfoTitle.Font=Enum.Font.GothamBold
InfoTitle.TextXAlignment=Enum.TextXAlignment.Left
InfoTitle.Parent=InfoCard

local InfoTitleStroke=TextHighlight(InfoTitle)
local InfoTitleGradient=Gradient(InfoTitle,C.Red2,C.Purple2,0)

--// INFO DESCRIPTION
local InfoDesc=Instance.new("TextLabel")
InfoDesc.Size=UDim2.new(1,-24,0,20)
InfoDesc.Position=UDim2.fromOffset(12,30)
InfoDesc.BackgroundTransparency=1
InfoDesc.Text="Red × Purple Compact Edition"
InfoDesc.TextSize=9
InfoDesc.Font=Enum.Font.Gotham
InfoDesc.TextXAlignment=Enum.TextXAlignment.Left
InfoDesc.Parent=InfoCard

InfoDesc.TextColor3=C.Gray
InfoDesc.TextStrokeColor3=C.Red
InfoDesc.TextStrokeTransparency=.65

--// SHOW UI
local Show=Instance.new("TextButton")
Show.Name="ShowUI"
Show.Size=UDim2.fromOffset(72,28)
Show.Position=UDim2.new(.5,-36,0,8)
Show.BackgroundColor3=C.Red
Show.BackgroundTransparency=.2
Show.Text="Show UI"
Show.TextSize=10
Show.Font=Enum.Font.GothamBold
Show.AutoButtonColor=false
Show.Visible=false
Show.Parent=GUI

Corner(Show,9)
local ShowTextStroke=TextHighlight(Show)
local ShowGradient=Gradient(Show,C.Red,C.Purple,0)

--// TIMER
local Timer=Instance.new("Frame")
Timer.Name="AFKTimer"
Timer.Size=UDim2.fromOffset(108,38)
Timer.Position=UDim2.new(.5,42,0,5)
Timer.BackgroundColor3=C.Red
Timer.BorderSizePixel=0
Timer.Visible=false
Timer.ZIndex=50
Timer.Parent=GUI

Corner(Timer,19)

local TimerGradient=Gradient(
	Timer,
	C.Red,
	C.Purple,
	0
)

local TimerStroke=Stroke(Timer,C.Red2,.05,1.5)

local TimerDot=Instance.new("Frame")
TimerDot.Size=UDim2.fromOffset(7,7)
TimerDot.Position=UDim2.fromOffset(12,15)
TimerDot.BackgroundColor3=C.White
TimerDot.BorderSizePixel=0
TimerDot.ZIndex=52
TimerDot.Parent=Timer

Corner(TimerDot,7)

local TimerText=Instance.new("TextLabel")
TimerText.Size=UDim2.new(1,-30,1,0)
TimerText.Position=UDim2.fromOffset(24,0)
TimerText.BackgroundTransparency=1
TimerText.Text="00:00"
TimerText.TextSize=11
TimerText.Font=Enum.Font.GothamBold
TimerText.TextXAlignment=Enum.TextXAlignment.Center
TimerText.ZIndex=51
TimerText.Parent=Timer

TimerText.TextColor3=C.White
TimerText.TextStrokeColor3=C.Purple
TimerText.TextStrokeTransparency=.25

--// ANIMATION STATE
local HoverMin=false
local HoverClose=false
local HoverSwitch=false
local HoverShow=false

local function UpdateSwitch(v)
	if v then
		Status.Text="ON"
		Status.TextColor3=C.Purple2

		Tween(
			Switch,
			TweenInfo.new(.28,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
			{BackgroundColor3=C.Red}
		)

		Tween(
			Knob,
			TweenInfo.new(.32,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
			{
				Position=UDim2.new(1,-21,0,3),
				BackgroundColor3=C.White
			}
		)

		Tween(
			Status,
			TweenInfo.new(.18,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
			{TextTransparency=0}
		)
	else
		Status.Text="OFF"
		Status.TextColor3=C.Red2

		Tween(
			Switch,
			TweenInfo.new(.28,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
			{BackgroundColor3=C.Off}
		)

		Tween(
			Knob,
			TweenInfo.new(.32,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
			{
				Position=UDim2.fromOffset(3,3),
				BackgroundColor3=C.White
			}
		)
	end
end

local function PressSwitch()
	local oldSize=Switch.Size
	local oldPos=Switch.Position

	Tween(
		Switch,
		TweenInfo.new(.08,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
		{
			Size=UDim2.fromOffset(49,27),
			Position=UDim2.new(1,-60,.5,-13.5)
		}
	)

	task.delay(.08,function()
		if Switch and Switch.Parent then
			Tween(
				Switch,
				TweenInfo.new(.3,Enum.EasingStyle.Elastic,Enum.EasingDirection.Out),
				{
					Size=oldSize,
					Position=oldPos
				}
			)
		end
	end)
end

--// TIMER ANIMATION
local function ShowTimer()
	if TimerVisible then return end

	TimerVisible=true
	Timer.Visible=true

	Timer.Size=UDim2.fromOffset(10,10)
	Timer.BackgroundTransparency=1
	TimerStroke.Transparency=1
	TimerDot.BackgroundTransparency=1
	TimerText.TextTransparency=1

	Tween(
		Timer,
		TweenInfo.new(.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
		{
			Size=UDim2.fromOffset(108,38),
			BackgroundTransparency=0
		}
	)

	Tween(
		TimerStroke,
		TweenInfo.new(.35,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
		{Transparency=.05}
	)

	Tween(
		TimerDot,
		TweenInfo.new(.35,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
		{BackgroundTransparency=0}
	)

	Tween(
		TimerText,
		TweenInfo.new(.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
		{TextTransparency=0}
	)

	-- small dot pop
	TimerDot.Size=UDim2.fromOffset(3,3)

	Tween(
		TimerDot,
		TweenInfo.new(.45,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
		{
			Size=UDim2.fromOffset(7,7)
		}
	)
end

local function HideTimer()
	if not TimerVisible then return end

	TimerVisible=false

	Tween(
		TimerStroke,
		TweenInfo.new(.2,Enum.EasingStyle.Quint,Enum.EasingDirection.In),
		{Transparency=1}
	)

	Tween(
		TimerDot,
		TweenInfo.new(.2,Enum.EasingStyle.Quint,Enum.EasingDirection.In),
		{
			BackgroundTransparency=1,
			Size=UDim2.fromOffset(3,3)
		}
	)

	Tween(
		TimerText,
		TweenInfo.new(.2,Enum.EasingStyle.Quint,Enum.EasingDirection.In),
		{TextTransparency=1}
	)

	local t=Tween(
		Timer,
		TweenInfo.new(.32,Enum.EasingStyle.Back,Enum.EasingDirection.In),
		{
			Size=UDim2.fromOffset(10,10),
			BackgroundTransparency=1
		}
	)

	if t then
		t.Completed:Connect(function()
			if not TimerVisible and Timer then
				Timer.Visible=false
			end
		end)
	end
end

local function AFKState(v)
	AFK=v

	PressSwitch()
	UpdateSwitch(v)
	StartAntiAFK()

	if v then
		AFKStart=os.clock()
		ShowTimer()
	else
		HideTimer()
		TimerText.Text="00:00"
	end
end

Switch.MouseButton1Click:Connect(function()
	AFKState(not AFK)
end)

--// SMOOTH VISUAL LOOP
RS.RenderStepped:Connect(function()
	if AFK then
		TimerText.Text=FormatTime(os.clock()-AFKStart)

		local pulse=(math.sin(os.clock()*3)+1)/2

		TimerStroke.Transparency=.03+(pulse*.18)
		TimerDot.BackgroundColor3=C.White:Lerp(C.Purple2,pulse*.35)

		-- subtle timer gradient movement
		TimerGradient.Offset=Vector2.new(
			math.sin(os.clock()*1.2)*.08,
			0
		)
	end

	-- very subtle title gradient movement
	local shift=(math.sin(os.clock()*1.1)+1)/2

	TitleGradient.Offset=Vector2.new(shift*.08,0)
	InfoTitleGradient.Offset=Vector2.new(-shift*.08,0)
	AFKTitleGradient.Offset=Vector2.new(shift*.08,0)
end)

--// DRAG
local function Drag(frame)
	local dragging=false
	local dragStart
	local startPos

	frame.InputBegan:Connect(function(input)
		if input.UserInputType==Enum.UserInputType.MouseButton1
		or input.UserInputType==Enum.UserInputType.Touch then

			dragging=true
			dragStart=input.Position
			startPos=frame.Position

			input.Changed:Connect(function()
				if input.UserInputState==Enum.UserInputState.End then
					dragging=false
				end
			end)
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if dragging and (
			input.UserInputType==Enum.UserInputType.MouseMovement
			or input.UserInputType==Enum.UserInputType.Touch
		) then

			local delta=input.Position-dragStart

			frame.Position=UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset+delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset+delta.Y
			)
		end
	end)
end

Drag(Main)
Drag(Timer)

--// MINIMIZE
local function Minimize()
	if Minimized then return end

	Minimized=true

	Show.Visible=true
	Show.BackgroundTransparency=1
	Show.Size=UDim2.fromOffset(10,10)

	Tween(
		Show,
		TweenInfo.new(.48,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
		{
			Size=UDim2.fromOffset(72,28),
			BackgroundTransparency=.2
		}
	)

	local t=Tween(
		Main,
		TweenInfo.new(.42,Enum.EasingStyle.Back,Enum.EasingDirection.In),
		{
			Size=UDim2.fromOffset(10,10),
			BackgroundTransparency=1
		}
	)

	if t then
		t.Completed:Connect(function()
			if Minimized then
				Main.Visible=false
			end
		end)
	end
end

--// RESTORE
local function Restore()
	if not Minimized then return end

	Minimized=false

	Main.Visible=true
	Main.Size=UDim2.fromOffset(10,10)
	Main.BackgroundTransparency=1

	Tween(
		Main,
		TweenInfo.new(.52,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
		{
			Size=UDim2.fromOffset(270,205),
			BackgroundTransparency=0
		}
	)

	Tween(
		Show,
		TweenInfo.new(.3,Enum.EasingStyle.Back,Enum.EasingDirection.In),
		{
			Size=UDim2.fromOffset(10,10),
			BackgroundTransparency=1
		}
	)

	task.delay(.3,function()
		if not Minimized and Show then
			Show.Visible=false
			Show.Size=UDim2.fromOffset(72,28)
			Show.BackgroundTransparency=.2
		end
	end)
end

Min.MouseButton1Click:Connect(Minimize)
Show.MouseButton1Click:Connect(Restore)

--// CLOSE
Close.MouseButton1Click:Connect(function()
	AFK=false

	if AFKLoop then
		task.cancel(AFKLoop)
		AFKLoop=nil
	end

	local t=Tween(
		Main,
		TweenInfo.new(.38,Enum.EasingStyle.Back,Enum.EasingDirection.In),
		{
			Size=UDim2.fromOffset(10,10),
			BackgroundTransparency=1
		}
	)

	if t then
		t.Completed:Connect(function()
			if GUI then
				GUI:Destroy()
			end
		end)
	end
end)

--// HOVER ANIMATIONS
Min.MouseEnter:Connect(function()
	HoverMin=true

	Tween(
		Min,
		TweenInfo.new(.18,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
		{
			BackgroundColor3=C.Purple,
			Size=UDim2.fromOffset(28,28)
		}
	)

	Tween(
		MinTextStroke,
		TweenInfo.new(.18),
		{Transparency=.15}
	)
end)

Min.MouseLeave:Connect(function()
	HoverMin=false

	Tween(
		Min,
		TweenInfo.new(.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
		{
			BackgroundColor3=C.Panel,
			Size=UDim2.fromOffset(26,26)
		}
	)

	Tween(
		MinTextStroke,
		TweenInfo.new(.2),
		{Transparency=.65}
	)
end)

Close.MouseEnter:Connect(function()
	HoverClose=true

	Tween(
		Close,
		TweenInfo.new(.18,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
		{
			BackgroundColor3=C.Red,
			Size=UDim2.fromOffset(28,28)
		}
	)

	Tween(
		CloseTextStroke,
		TweenInfo.new(.18),
		{Transparency=.15}
	)
end)

Close.MouseLeave:Connect(function()
	HoverClose=false

	Tween(
		Close,
		TweenInfo.new(.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
		{
			BackgroundColor3=C.Panel,
			Size=UDim2.fromOffset(26,26)
		}
	)

	Tween(
		CloseTextStroke,
		TweenInfo.new(.2),
		{Transparency=.65}
	)
end)

Switch.MouseEnter:Connect(function()
	HoverSwitch=true

	Tween(
		Switch,
		TweenInfo.new(.18,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
		{
			BackgroundColor3=AFK and C.Purple or C.Panel2
		}
	)

	Tween(
		SwitchStroke,
		TweenInfo.new(.18),
		{
			Transparency=.05,
			Thickness=1.5
		}
	)
end)

Switch.MouseLeave:Connect(function()
	HoverSwitch=false

	Tween(
		Switch,
		TweenInfo.new(.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
		{
			BackgroundColor3=AFK and C.Red or C.Off
		}
	)

	Tween(
		SwitchStroke,
		TweenInfo.new(.2),
		{
			Transparency=.3,
			Thickness=1
		}
	)
end)

Show.MouseEnter:Connect(function()
	HoverShow=true

	Tween(
		Show,
		TweenInfo.new(.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
		{
			BackgroundTransparency=.03,
			Size=UDim2.fromOffset(76,30)
		}
	)

	Tween(
		ShowTextStroke,
		TweenInfo.new(.2),
		{Transparency=.12}
	)
end)

Show.MouseLeave:Connect(function()
	HoverShow=false

	Tween(
		Show,
		TweenInfo.new(.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
		{
			BackgroundTransparency=.2,
			Size=UDim2.fromOffset(72,28)
		}
	)

	Tween(
		ShowTextStroke,
		TweenInfo.new(.2),
		{Transparency=.65}
	)
end)

--// INITIAL STATE
UpdateSwitch(false)
