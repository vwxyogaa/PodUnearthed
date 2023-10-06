//
//  Date+Ext.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 06/10/23.
//

import Foundation

extension Date {
    func toString(with format: DateFormat) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        formatter.locale = Constants.DefaultLocale
        formatter.amSymbol = "am"
        formatter.pmSymbol = "pm"
        return formatter.string(from: self)
    }
}
