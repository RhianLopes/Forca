//
//  ForcasTests.swift
//  ForcasTests
//
//  Created by Rhian Lopes da Costa on 06/10/20.
//

import XCTest
@testable import Forcas

class ForcasTests: XCTestCase {

    func testExample() throws {
        let palavra = "CACHORRO"
        var mascara = "________"
        
        mascara = troca("R", na: mascara, com: palavra)
        
        XCTAssert(mascara == "_____RR_", mascara)
        
        mascara = troca("X", na: mascara, com: palavra)
        
        XCTAssertEqual(mascara, "_____RR_", mascara)
    }

}
