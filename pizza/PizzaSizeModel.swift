//
//  SizeModel.swift
//  pizza
//
//  Created by Володя on 07.07.2024.
//

import Foundation

struct PizzaSizeModel {
    let code: PizzaSizeModel.Code
    let price: String
    
    enum Code: String {
        case small = "SMALL"
        case medium = "MEDIUM"
        case large = "LARGE"
    }
}

struct PizzaSizeDescription {
    let name: String
    let size: Int
    
    private static let pizzaSizes: [PizzaSizeModel.Code: PizzaSizeDescription] = [
        .small: PizzaSizeDescription(name: "Маленькая", size: 25),
        .medium: PizzaSizeDescription(name: "Средняя", size: 30),
        .large: PizzaSizeDescription(name: "Большая", size: 35)
    ]
    static func by(code: PizzaSizeModel.Code) -> PizzaSizeDescription? {
        return pizzaSizes[code]
    }
}
