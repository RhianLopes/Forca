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
    
    var corVerde: NSMutableAttributedString {
        let atributoVerde: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.green
        ]
        return NSMutableAttributedString(string: self, attributes: atributoVerde)
    }
    
    var corVermelho: NSMutableAttributedString {
        let atributoVermelho: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.red
        ]
        return NSMutableAttributedString(string: self, attributes: atributoVermelho)
    }
    
}

public extension NSMutableAttributedString {
    
    var espacada: NSMutableAttributedString {
        let copia = NSMutableAttributedString(attributedString: self)
        
        let atributoEspacamento: [NSAttributedString.Key: Any] = [
            .kern: 12
        ]
        
        copia.addAttributes(atributoEspacamento, range: NSMakeRange(0, self.length))
        return copia
    }
}
