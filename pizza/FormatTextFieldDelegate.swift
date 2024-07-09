//
//  PhoneNumberTextFieldDelegate.swift
//  pizza
//
//  Created by Володя on 06.07.2024.
//

import UIKit

class FormatTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    private var formatter: (_ value: String) -> String
    
    init(_ formatter: @escaping (_ value: String) -> String) {
        self.formatter = formatter
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentText = textField.text else { return true }
        let newString = (currentText as NSString).replacingCharacters(in: range, with: string)
        textField.text = formatter(newString)
        return false
    }
    
}
