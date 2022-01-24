//
//  DateFormater.swift
//  Utility
//
//  Created by Khaled Mahmoud on 23/01/2022.
//

import Foundation

class DateTransformer {
    
    /// Convert date to a string using custom date format.
    ///
    /// - Parameters:
    /// - timeStamp: timeStamp value to be transformed to date
    /// - format: format of the string representation.
    /// - identifire: calendar identifre (.gregorian, .islamic, etc...).
    /// - locale: to fix a custom locale.
    /// - Returns: string representation of the date.
    static func dateFromTimeStamp(timeStamp: Double, format: String, identifier: Calendar.Identifier = .gregorian, locale: String) -> String {
        let date = Date(timeIntervalSince1970: timeStamp)
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: locale)
        formatter.dateFormat = format
        formatter.calendar = Calendar(identifier: identifier)
        return formatter.string(from: date)
    }
    
    /// Convert date to a string using custom date format.
    ///
    /// - Parameters:
    /// - date: date to be transformed
    /// - format: format of the string representation.
    /// - identifire: calendar identifre (.gregorian, .islamic, etc...).
    /// - locale: to fix a custom locale.
    /// - Returns: string representation of the date.
    static func dateToString(date: Date, format: String, identifier: Calendar.Identifier = .gregorian, locale: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: locale)
        formatter.dateFormat = format
        formatter.calendar = Calendar(identifier: identifier)
        return formatter.string(from: date)
    }
    
    /// Convert string to date using custom date format.
    ///
    /// - Parameters:
    /// - string: string to be transformed
    /// - format: format of the string representation.
    /// - locale: to fix a custom locale.
    /// - identifre: calendar identifre (.gregorian, .islamic, etc...).
    /// - Returns: date representation of the string.
    static func stringToDate(string: String, format: String, identifier: Calendar.Identifier = .gregorian, locale: String)-> Date? {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: locale)
        formatter.dateFormat = format
        formatter.calendar = Calendar(identifier: identifier)
        let date = formatter.date(from: string)
        return date
    }
    
    /// Convert string with custom format To string using custom date format.
    ///
    /// - Parameters:
    /// - string: string to be transformed
    /// - format: format of the string representation.
    /// - locale: to fix a custom locale.
    /// - identifre: calendar identifre (.gregorian, .islamic, etc...).
    /// - Returns: string representation of the date.
    static func stringToString(string: String, format: String, outputFormat: String, identifier: Calendar.Identifier = .gregorian, locale: String)-> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: locale)
        formatter.dateFormat = format
        formatter.calendar = Calendar(identifier: identifier)
        guard let date = formatter.date(from: string) else {
            return "date string or format is not correct."
        }
        formatter.dateFormat = outputFormat
        return formatter.string(from: date)
    }
}

enum DateFormats: String {
    case year = "yyyy"
    case month = "MM"
    case day = "dd"
    case hour = "h"
    case minute = "m"
    case day_MonthName = "dd MMM"
    case monthName_Year = "MMM YYYY"
    case day_month_year = "dd-MM-yyyy"
    case time = "hh:mm a"
    case dateTime = "dd-MM-yyyy hh:mm a"
    case dateWithMonthName = "d MMM yyyy"
    case isoFormat = "yyyy-MM-dd'T'HH:mm:ss"
}
