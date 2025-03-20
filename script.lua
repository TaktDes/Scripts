-- Script atualizado para Blue Lock Rivals
local Jogadores = jogo:ObterServico("Jogadores")
local JogadorLocal = Jogadores.JogadorLocal
local Personagem = JogadorLocal.Personagem
local Bola = jogo:ObterServico("Bola")

-- Lista de habilidades do Rin substituídas
local habilidadesRin = {
    "Echo Stride",
    "Echo Of The Dead",
    "Púrpura Shut",
    "Curv",
    "Imperator Authority"
}

-- Função para criar botões na tela
local function criarBotao(nome, funcao)
    local TelaGuia = Instance.new("ScreenGui")
    TelaGuia.Parent = jogo.CoreGui

    local Botao = Instance.new("TextButton")
    Botao.Parent = TelaGuia
    Botao.Size = UDim2.new(0, 200, 0, 50)
    Botao.Position = UDim2.new(0.5, -100, 0.1, #habilidadesRin * 60)
    Botao.Text = nome
    Botao.MouseButton1Click:Connect(funcao)
end

-- Habilidades modificadas

-- Echo Stride → Echo Of The Dead (Drible)
local function echoOfTheDead()
    print("Echo Of The Dead ativado!")
    -- Mantém os efeitos do Kaiser, mas muda a cor para roxo
    local efeito = jogo:ObterServico("Efeitos"):CriarEfeito("DribleKaiser")
    efeito.Cor = Color3.fromRGB(128, 0, 128) -- Roxo
    efeito:Ativar(Personagem)
end

-- Kaiser Impact → Púrpura Shut (Chute forte, velocidade mediana)
local function purpuraShut()
    print("Púrpura Shut ativado!")
    -- Mantém os efeitos do Kaiser, mas muda a cor para roxo
    local efeito = jogo:ObterServico("Efeitos"):CriarEfeito("ChuteKaiser")
    efeito.Cor = Color3.fromRGB(128, 0, 128) -- Roxo
    efeito:Ativar(Personagem)
    
    -- Aplica força na bola com velocidade mediana
    Bola.Velocidade = 50
    Bola.Direcao = Personagem.Frente
end

-- Magnus → Curv (Chute forte, velocidade mediana, curva 90° à direita)
local function curv()
    print("Curv ativado!")
    -- Mantém os efeitos do Kaiser, mas muda a cor para roxo
    local efeito = jogo:ObterServico("Efeitos"):CriarEfeito("ChuteCurvoKaiser")
    efeito.Cor = Color3.fromRGB(128, 0, 128) -- Roxo
    efeito:Ativar(Personagem)

    -- Aplica força na bola com curva de 90° para a direita
    Bola.Velocidade = 50
    Bola.Direcao = Personagem.Frente + Vector3.new(1, 0, 0) -- Curva 90° para a direita
end

-- Imperator Authority (Rouba a bola dos companheiros)
local function imperatorAuthority()
    print("Imperator Authority ativado!")
    
    for _, jogador in pairs(Jogadores:GetJogadores()) do
        if jogador ~= JogadorLocal and jogador.Personagem and jogador.Personagem.Posicao:Distancia(Personagem.Posicao) < 5 then
            -- Toma a posse da bola se estiver próximo do companheiro
            if Bola.Possuidor == jogador.Personagem then
                Bola.Possuidor = Personagem
                print("Bola roubada do companheiro!")
            end
        end
    end
end

-- Criar botões para as habilidades do Rin substituído
criarBotao("Echo Of The Dead", echoOfTheDead)
criarBotao("Púrpura Shut", purpuraShut)
criarBotao("Curv", curv)
criarBotao("Imperator Authority", imperatorAuthority)
