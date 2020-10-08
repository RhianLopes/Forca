//
//  String+AttributedText.swift
//  Forcas
//
//  Created by Rhian Lopes da Costa on 08/10/20.
//

import UIKit

public extension String {
    
    var espacada: NSMutableAttributedString {
        let atributoEspacamento: [NSAttributedString.Key: Any] = [
            .kern: 12
        ]
        
        return NSMutableAttributedString(string: self, attributes: atributoEspacamento)
    }
    
}
