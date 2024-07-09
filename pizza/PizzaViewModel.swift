//
//  PizzaViewMode.swift
//  pizza
//
//  Created by Володя on 06.07.2024.
//

import Foundation

struct PizzaViewModel {
    let id: String
    let ingredients: [PizzaIngredientModel]
    let name: String
    let imageURL: String
    let description: String
    let minPrice: Int
    let toppings: [PizzaIngredientModel]
    
    
    static func mockDataSource() -> [PizzaViewModel] {
        return [
            PizzaViewModel(id: "1", ingredients: [PizzaIngredientModel(code: "MOZZARELLA", cost: 70, imageUrl: "https://shift-backend.onrender.com/static/images/ingredient/mozzarella.png")], name: "ШИФТ Суприм", imageURL: "https://shift-backend.onrender.com/static/images/pizza/1.webp", description: "Шифт пицца с пепперони, колбасой, зеленым перцем, луком, оливками и шампиньонами.", minPrice: 499, toppings: [PizzaIngredientModel(code: "MOZZARELLA", cost: 70, imageUrl: "https://shift-backend.onrender.com/static/images/ingredient/mozzarella.png")]),
            PizzaViewModel(id: "1", ingredients: [PizzaIngredientModel(code: "MOZZARELLA", cost: 70, imageUrl: "https://shift-backend.onrender.com/static/images/ingredient/mozzarella.png")], name: "ШИФТ Суприм", imageURL: "https://shift-backend.onrender.com/static/images/pizza/1.webp", description: "Шифт пицца с пепперони, колбасой, зеленым перцем, луком, оливками и шампиньонами.", minPrice: 499, toppings: [PizzaIngredientModel(code: "MOZZARELLA", cost: 70, imageUrl: "https://shift-backend.onrender.com/static/images/ingredient/mozzarella.png")]),
            PizzaViewModel(id: "1", ingredients: [PizzaIngredientModel(code: "MOZZARELLA", cost: 70, imageUrl: "https://shift-backend.onrender.com/static/images/ingredient/mozzarella.png")], name: "ШИФТ Суприм", imageURL: "https://shift-backend.onrender.com/static/images/pizza/1.webp", description: "Шифт пицца с пепперони, колбасой, зеленым перцем, луком, оливками и шампиньонами.", minPrice: 499, toppings: [PizzaIngredientModel(code: "MOZZARELLA", cost: 70, imageUrl: "https://shift-backend.onrender.com/static/images/ingredient/mozzarella.png")]),
            PizzaViewModel(id: "1", ingredients: [PizzaIngredientModel(code: "MOZZARELLA", cost: 70, imageUrl: "https://shift-backend.onrender.com/static/images/ingredient/mozzarella.png")], name: "ШИФТ Суприм", imageURL: "https://shift-backend.onrender.com/static/images/pizza/1.webp", description: "Шифт пицца с пепперони, колбасой, зеленым перцем, луком, оливками и шампиньонами.", minPrice: 499, toppings: [PizzaIngredientModel(code: "MOZZARELLA", cost: 70, imageUrl: "https://shift-backend.onrender.com/static/images/ingredient/mozzarella.png")]),
            PizzaViewModel(id: "1", ingredients: [PizzaIngredientModel(code: "MOZZARELLA", cost: 70, imageUrl: "https://shift-backend.onrender.com/static/images/ingredient/mozzarella.png")], name: "ШИФТ Суприм", imageURL: "https://shift-backend.onrender.com/static/images/pizza/1.webp", description: "Шифт пицца с пепперони, колбасой, зеленым перцем, луком, оливками и шампиньонами.", minPrice: 499, toppings: [PizzaIngredientModel(code: "MOZZARELLA", cost: 70, imageUrl: "https://shift-backend.onrender.com/static/images/ingredient/mozzarella.png")]),
            PizzaViewModel(id: "1", ingredients: [PizzaIngredientModel(code: "MOZZARELLA", cost: 70, imageUrl: "https://shift-backend.onrender.com/static/images/ingredient/mozzarella.png")], name: "ШИФТ Суприм", imageURL: "https://shift-backend.onrender.com/static/images/pizza/1.webp", description: "Шифт пицца с пепперони, колбасой, зеленым перцем, луком, оливками и шампиньонами.", minPrice: 499, toppings: [PizzaIngredientModel(code: "MOZZARELLA", cost: 70, imageUrl: "https://shift-backend.onrender.com/static/images/ingredient/mozzarella.png")]),
            PizzaViewModel(id: "1", ingredients: [PizzaIngredientModel(code: "MOZZARELLA", cost: 70, imageUrl: "https://shift-backend.onrender.com/static/images/ingredient/mozzarella.png")], name: "ШИФТ Суприм", imageURL: "https://shift-backend.onrender.com/static/images/pizza/1.webp", description: "Шифт пицца с пепперони, колбасой, зеленым перцем, луком, оливками и шампиньонами.", minPrice: 499, toppings: [PizzaIngredientModel(code: "MOZZARELLA", cost: 70, imageUrl: "https://shift-backend.onrender.com/static/images/ingredient/mozzarella.png")]),
        ]
    }
}
