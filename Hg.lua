-- ========================================================
-- SCRIPT WRAPPER DE NATAL COM SISTEMA DE KEY
-- Key correta: kaiser123
-- ========================================================

local KEY_CORRETA = "kaiser123"
local SCRIPT_URL = "https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"

-- Configuração da UI Principal
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Title = Instance.new("TextLabel")
local KeyInput = Instance.new("TextBox")
local KeyCorner = Instance.new("UICorner")
local SubmitBtn = Instance.new("TextButton")
local BtnCorner = Instance.new("UICorner")
local StatusLabel = Instance.new("TextLabel")

-- Proteção contra múltiplos carregamentos
if game:GetService("CoreGui"):FindFirstChild("ChristmasKeySystem") then
    game:GetService("CoreGui").ChristmasKeySystem:Destroy()
end

ScreenGui.Name = "ChristmasKeySystem"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Frame Principal (Tema Vermelho de Natal)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(139, 0, 0) -- Vermelho Escuro/Natalino
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Active = true
MainFrame.Draggable = true -- Permite arrastar a janela

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- Borda Dourada / Festiva
UIStroke.Parent = MainFrame
UIStroke.Color = Color3.fromRGB(255, 215, 0) -- Dourado
UIStroke.Thickness = 3

-- Título
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0, 0, 0, 10)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Font = Enum.Font.FredokaOne
Title.Text = "🎄 Key System de Natal 🎁"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20.000

-- Campo de Texto (Input da Key)
KeyInput.Name = "KeyInput"
KeyInput.Parent = MainFrame
KeyInput.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
KeyInput.Position = UDim2.new(0.1, 0, 0.35, 0)
KeyInput.Size = UDim2.new(0.8, 0, 0, 35)
KeyInput.Font = Enum.Font.SourceSans
KeyInput.PlaceholderText = "Digite a Key aqui..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextSize = 16.000

KeyCorner.CornerRadius = UDim.new(0, 8)
KeyCorner.Parent = KeyInput

-- Botão de Entrar
SubmitBtn.Name = "SubmitBtn"
SubmitBtn.Parent = MainFrame
SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 0) -- Verde Natal
SubmitBtn.Position = UDim2.new(0.2, 0, 0.62, 0)
SubmitBtn.Size = UDim2.new(0.6, 0, 0, 35)
SubmitBtn.Font = Enum.Font.SourceSansBold
SubmitBtn.Text = "DESBLOQUEAR SCRIPT 🎅"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.TextSize = 14.000

BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = SubmitBtn

-- Texto de Status
StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundTransparency = 1.000
StatusLabel.Position = UDim2.new(0, 0, 0.82, 0)
StatusLabel.Size = UDim2.new(1, 0, 0, 25)
StatusLabel.Font = Enum.Font.SourceSans
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.TextSize = 14.000

-- ========================================================
-- EFEITO DE NEVE CAINDO (Efeitos de Natal)
-- ========================================================
task.spawn(function()
    while ScreenGui and ScreenGui.Parent do
        local flake = Instance.new("TextLabel")
        flake.Parent = MainFrame
        flake.BackgroundTransparency = 1
        flake.Size = UDim2.new(0, 15, 0, 15)
        flake.Position = UDim2.new(math.random(), 0, -0.1, 0)
        flake.Text = "❄"
        flake.TextColor3 = Color3.fromRGB(240, 248, 255)
        flake.TextSize = math.random(10, 18)
        flake.ZIndex = 2
        
        -- Animação de queda
        local speed = math.random(3, 6)
        flake:TweenPosition(
            UDim2.new(flake.Position.X.Scale, 0, 1.1, 0),
            Enum.EasingDirection.InOut,
            Enum.EasingStyle.Linear,
            speed,
            true,
            function()
                flake:Destroy()
            end
        )
        task.wait(0.4)
    end
end)

-- ========================================================
-- LÓGICA DA KEY E CARREGAMENTO
-- ========================================================
SubmitBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == KEY_CORRETA then
        StatusLabel.TextColor3 = Color3.fromRGB(50, 255, 50)
        StatusLabel.Text = "Key Correta! Carregando Script..."
        task.wait(1)
        
        -- Destrói a UI de Key
        ScreenGui:Destroy()
        
        -- Executa o Script desejado
        loadstring(game:HttpGet(SCRIPT_URL))()
    else
        StatusLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
        StatusLabel.Text = "Key Incorreta! Tente novamente."
    end
end)

