//
//  PizzaDoughsModel.swift
//  pizza
//
//  Created by Володя on 07.07.2024.
//

import Foundation

struct PizzaDoughModel {
    let code: Code
    let price: Int
    
    enum Code: String {
        case thin = "THIN"
        case thick = "THICK"
    }
}

struct PizzaDoughsDescription {
    let name: String
    
    private static let pizzaDoughs: [PizzaDoughModel.Code: PizzaDoughsDescription] = [
        .thin: PizzaDoughsDescription(name: "тонкое тесто"),
        .thick: PizzaDoughsDescription(name: "традиционное тесто")
    ]
    
    static func by(code: PizzaDoughModel.Code) -> PizzaDoughsDescription? {
        return pizzaDoughs[code]
    }
}
