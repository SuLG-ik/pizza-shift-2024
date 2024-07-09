//
//  CodeFormatter.swift
//  pizza
//
//  Created by Володя on 06.07.2024.
//

import Foundation

func maskFormatter(mask: String) -> (_ value: String) -> String {
    return { value in
        let cleanPhoneNumber = value.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask where index < cleanPhoneNumber.endIndex {
            if ch == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
}
