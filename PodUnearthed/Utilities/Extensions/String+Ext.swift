//
//  String+Ext.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 06/10/23.
//

import UIKit

// MARK: - Date
extension String {
    func convertDateString(fromFormat: DateFormat, toFormat: DateFormat) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat.rawValue
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = toFormat.rawValue
            dateFormatter.locale = Constants.DefaultLocale
            let convertedString = dateFormatter.string(from: date)
            return convertedString
        } else {
            return nil
        }
    }
}

// MARK: - HTML
extension String {
    var convertHtmlToNSAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else {
            return nil
        }
        do {
            return try NSAttributedString(data: data,options: [.documentType: NSAttributedString.DocumentType.html,.characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        }
        catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func convertHtmlToAttributedStringWithCSS(font: UIFont?, cssColor: String, lineHeight: Int, cssTextAlign: String) -> NSAttributedString? {
        guard let font = font else {
            return convertHtmlToNSAttributedString
        }
        let modifiedString = "<style>body{font-family: '-apple-system'; font-size:\(font.pointSize)px; color: \(cssColor); line-height: \(lineHeight)px; text-align: \(cssTextAlign); }</style>\(self)";
        guard let data = modifiedString.data(using: .utf8) else {
            return nil
        }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        }
        catch {
            print(error)
            return nil
        }
    }
}
