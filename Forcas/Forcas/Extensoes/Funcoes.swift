//
//  Funcoes.swift
//  Forcas
//
//  Created by Rhian Lopes da Costa on 08/10/20.
//

import Foundation

func troca(_ letraInformada:String, na mascara: String, com original: String) -> String {
    let caractere = Character(letraInformada)
    var resultado = mascara
    
    for indice in original.indices {
        if original[indice] == caractere {
            resultado.remove(at: indice)
            resultado.insert(caractere, at: indice)
        }
    }
    
    return resultado
}
