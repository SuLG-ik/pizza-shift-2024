//
//  IngredientModel.swift
//  pizza
//
//  Created by Володя on 07.07.2024.
//

import Foundation

struct PizzaIngredientModel {
    let code: String
    let cost: Int
    let imageUrl: String

    enum Code: String {
        case mozzarella = "MOZZARELLA"
        case peperoni = "PEPERONI"
        case greenPepper = "GREEN_PEPPER"
        case mushrooms = "MUSHROOMS"
        case pineaple = "PINEAPPLE"
        case bacon = "BACON"
        case shrimps = "SHRIMPS"
        case ham = "HAM"
        case chickeFillet = "CHICKEN_FILLET"
        case basil = "BASIL"
        case chile = "CHILE"
        case cheddar = "CHEDDAR"
        case meatballs = "MEATBALLS"
        case pickle = "PICKLE"
        case tobato = "TOMATO"
        case feta = "FETA"
    }
}

struct PizzaIngredientDescription {
    let shortName: String
    let fullName: String
    
    private static let pizzaIngredients: [PizzaIngredientModel.Code: PizzaIngredientDescription] = [
        .mozzarella: PizzaIngredientDescription(shortName: "моцарелла", fullName: "Сливочная моцарелла"),
        .shrimps: PizzaIngredientDescription(shortName: "креветки", fullName: "Креветки"),
        .cheddar: PizzaIngredientDescription(shortName: "чеддер и пармезан", fullName: "Сыры чеддер и пармезан"),
        .greenPepper: PizzaIngredientDescription(shortName: "зелёный перец", fullName: "Зелёный перец"),
        .chickeFillet: PizzaIngredientDescription(shortName: "цыпленок", fullName: "Нежный цыпленок")
    ]
    
    static func by(code: PizzaIngredientModel.Code) -> PizzaIngredientDescription? {
        return pizzaIngredients[code]
    }
}
