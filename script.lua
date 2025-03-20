-- Script modificado para adicionar habilidades a todos os personagens

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

-- Lista de habilidades adicionadas para todos os personagens
local habilidades = {
    "Echo Stride",
    "Kaiser Impact",
    "Warp Step",
    "Magnum",
    "Phantom Line",
    "Meta-vision",
    "The Greatest Goal",
    "Direct Shot"
}

-- Função para criar botões na tela
local function criarBotao(nome, funcao)
    local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    local Botao = Instance.new("TextButton", ScreenGui)

    Botao.Size = UDim2.new(0, 200, 0, 50)
    Botao.Position = UDim2.new(0.5, -100, 0.9, 0)
    Botao.Text = nome
    Botao.BackgroundColor3 = Color3.new(0, 0, 0)
    Botao.TextColor3 = Color3.new(1, 1, 1)
    Botao.Font = Enum.Font.SourceSansBold
    Botao.TextSize = 20

    Botao.MouseButton1Click:Connect(funcao)
end

-- Função para ativar habilidades
local function ativarHabilidade(nome)
    print("Ativando habilidade: " .. nome)
    -- Adicione aqui a lógica para ativar a habilidade no jogo
end

-- Criando botões para todas as habilidades
for _, habilidade in ipairs(habilidades) do
    criarBotao(habilidade, function() ativarHabilidade(habilidade) end)
end

print("Script carregado com sucesso!")
