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
    
    internal init(palavra: String, dica: String, palavraMascarada: String) {
        self.palavra = palavra
        self.dica = dica
        self.palavraMascarada = palavraMascarada.map { _ in "_" }.joined()
    }
    
    func tentativa(letra: String) {
        if tentativasAnteriores.contains(letra) {
            erros += 1
            return
        }
        
        tentativasAnteriores.append(letra)
        
        guard palavra.contains(letra) else {
            erros += 1
            return
        }
        
        palavraMascarada = troca(letra, na: palavraMascarada, com: palavra)
    }
    
}
