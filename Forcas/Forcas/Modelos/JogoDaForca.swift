//
//  JogoDaForca.swift
//  Forcas
//
//  Created by Rhian Lopes da Costa on 08/10/20.
//

import Foundation

class JogoDaForca {
    
    let maximoDeErros = 5
    
    let palavra: String
    
    let dica: String
    
    private(set) var palavraMascarada: String
    
    private(set) var tentativasAnteriores: [String] = []
    
    private(set) var erros: Int = 0 {
        //Nao é disparado para o valor inicial, apenas em atualizações
        didSet {
            if erros > maximoDeErros {
                derrota = true
            }
        }
    }
    
    private(set) var derrota = false
    
    private(set) var vitoria = false
    
    internal init(palavra: String, dica: String) {
        self.palavra = palavra.comparavel
        self.dica = dica
        self.palavraMascarada = palavra.map { _ in "_" }.joined()
    }
    
    func tentativa(letra: String) {
        guard let letraInformada = letra.first?.comparavel else {
            return
        }
        if tentativasAnteriores.contains(letraInformada) {
            //Validar letra repetida
            return
        }
        
        tentativasAnteriores.append(letraInformada)
        
        guard palavra.contains(letraInformada) else {
            erros += 1
            return
        }
        
        palavraMascarada = troca(letraInformada, na: palavraMascarada, com: palavra)
        
        if palavra == palavraMascarada {
            vitoria = true
        }
    }
    
}

let palavras = [
    "abelha": "inseto",
    "formiga": "inseto",
    "macaco": "animal",
    "cabra": "animal"
]

extension JogoDaForca {
    
    class func aleatorio() -> JogoDaForca {
        guard let item = palavras.randomElement() else {
            return JogoDaForca(palavra: "desnatado", dica: "microfone")
            
        }
        return JogoDaForca(palavra: item.key, dica: item.value)
    }
}
