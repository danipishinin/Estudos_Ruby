#funcao
def saudacoes
    puts
    puts "        P  /_\\  P                              "
    puts "       /_\\_|_|_/_\\                             "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \\__|_|__/                              "
    puts
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n\n\n"
    puts "Começaremos o jogo para você, #{nome}"
    nome
end

def nivel
    puts "Selecione um nível de dificuldade (1- Fácil, 5- Difícil)"
    dificuldade = gets.to_i
end

def sorteia_numero_secreto(dificuldade)
    case dificuldade
    when 1
        maximo = 30
    when 2
        maximo = 60
    when 3 
        maximo = 100
    when 4
        maximo = 150
    when 5
        maximo = 200
    end
    puts "Escolha um número secreto entre 1 e #{maximo}..."
    sorteado = rand(maximo) + 1 # + 1 pra não contar o 0
    sorteado # o return retorna a última linha de instrução do método
end

def pede_um_numero(tentativa, limite_tentativas)
    puts "Tentativa " + tentativa.to_s + " de " + limite_tentativas.to_s # to_s converte em tring
    chute = gets.strip #inputs tirando os caracteres em branco de ambos os lados
    chute.to_i #convertendo nosso chute em um int
end

def verifica_se_acertou(numero_secreto, chute)
    acertou = numero_secreto == chute

    if acertou
        puts "Você acertou certou!"
        return true
    end

    maior = numero_secreto > chute.to_i
        if maior
            puts "O número secreto é maior!"
        else
            puts "O número secreto é menor!"
        end
    return false
end

def joga(nome, dificuldade)
    limite_tentativas = 3
    tentativas = []
    pontuacao = 100 
    numero_secreto = dificuldade

    for tentativa in 1..limite_tentativas
        puts "últimas tentativas #{tentativas.to_s} ..." #interpolar valores dentro de uma string
        chute = pede_um_numero(tentativa, limite_tentativas)
        tentativas << chute # colocar o valor no array
        if verifica_se_acertou(numero_secreto, chute)
            break 
        end
        pontuacao-= 100
    end
end

def play?
    puts "Deseja jogar novamente? (S/N)"
    play = gets.strip
    again = play.upcase == "N"
end

nome = saudacoes
dificuldade = nivel

loop do
    joga nome, dificuldade
    break if play?
end

