function chat(message, temps::Float64)
    texte = open("file","w")
    write(texte, message)
    write(texte, "\n")
    close(texte)
    texte = open("file","r")
    while !eof(texte)
        lettre = read(texte, Char)
        print(lettre)
        sleep(temps)
    end
    close(texte)
    rm("file")
end
function checkChar(caractere::Char, fichier::String)
    occurrence = 0
    file = open(fichier,"r")
    while !eof(file)
        carac = read(file, Char)
        if carac == caractere
            occurrence += 1
        end
    end
    close(file)
    return occurrence
end
function checkString(chaine::String, fichier::String)
    file = open(fichier,"r")
    word = ""
    for i in eachline(file)
       word = string(word, i, "|")
    end
    close(file)
    word = replace(word, " "=>"|")
    word = replace(word, ","=>"|")
    word = replace(word, "||"=>"|")
    word = replace(word, "|||"=>"|")
    word = replace(word, "||||"=>"|")
    word = split(word, "|")
    occurrence = 0
    for i in word
        if uppercase(i) == uppercase(chaine)
            occurrence += 1
        end
    end
    return occurrence
end
