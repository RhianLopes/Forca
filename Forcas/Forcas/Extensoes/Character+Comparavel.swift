//
//  Character+Comparavel.swift
//  Forcas
//
//  Created by Rhian Lopes da Costa on 10/10/20.
//

import Foundation

extension Character {
    
    var comparavel: String {
        self.uppercased().folding(options: .diacriticInsensitive, locale: .current)
    }
}
