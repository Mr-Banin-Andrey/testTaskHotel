//
//  UsefulMethods.swift
//  testTaskHotel
//
//  Created by Андрей Банин on 30.12.23..
//

import Foundation
import UIKit

struct UsefulMethods {
    
    /// разделение суммы
    func formatNumber(_ number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = " "
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 0

        if let formattedNumber = numberFormatter.string(from: NSNumber(value: number)) {
            return formattedNumber
        } else {
            return "\(number)"
        }
    }
    
    /// валидная ли почта
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }


}
