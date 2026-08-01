local chaveCorreta = "kaiser123"

-- Exemplo de função ao clicar em um botão de login
local function verificarChave(textoDigitado)
    if textoDigitado == chaveCorreta then
        print("Acesso Concedido!")
        -- Código para abrir a interface principal
    else
        print("Chave incorreta. Tente novamente.")
    end
end

