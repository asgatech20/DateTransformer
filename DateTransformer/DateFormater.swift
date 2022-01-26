//
//  DateFormater.swift
//  Utility
//
//  Created by Khaled Mahmoud on 23/01/2022.
//

import Foundation

public class DateTransformer {
    
    /// Convert date to a string using custom date format.
    ///
    /// - Parameters:
    /// - timeStamp: timeStamp value to be transformed to date
    /// - characteristcs: format of the string representation, calendar identifre,  custom locale.
    /// - Returns: string representation of the date.
    static public func dateStringFromTimeStamp(timeStamp: Double, characteristcs: DateCharacteristcs) -> String {
        let date = Date(timeIntervalSince1970: timeStamp)
        return dateToString(date: date, characteristcs: characteristcs)
    }
    
    
    /// Convert date to another date using custom date format.
    ///
    /// - Parameters:
    /// - timeStamp: timeStamp value to be transformed to date
    /// - characteristcs: format of the string representation, calendar identifre,  custom locale.
    /// - Returns: date representation of the date.
    static public func dateFromTimeStamp(timeStamp: Double, characteristcs: DateCharacteristcs) -> Date? {
        let date = Date(timeIntervalSince1970: timeStamp)
        return stringToDate(string: dateToString(date: date, characteristcs: characteristcs), characteristcs: characteristcs)
    }
    
    
    /// Convert date to a string using custom date format.
    ///
    /// - Parameters:
    /// - date: date to be transformed
    /// - characteristcs: format of the string representation, calendar identifre,  custom locale.
    /// - Returns: string representation of the date.
    static public func dateToString(date: Date, characteristcs: DateCharacteristcs) -> String {
        let formatter = DateFormatter(characteristcs: characteristcs)
        return formatter.string(from: date)
    }
    
    
    /// Convert string to date using custom date format.
    ///
    /// - Parameters:
    /// - string: string to be transformed
    /// - characteristcs: format of the string representation, calendar identifre,  custom locale.
    /// - Returns: date representation of the string.
    static public func stringToDate(string: String, characteristcs: DateCharacteristcs)-> Date? {
        let formatter = DateFormatter(characteristcs: characteristcs)
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
    static public func stringToString(string: String, inputCharacteristcs: DateCharacteristcs, outputCharacteristcs: DateCharacteristcs)-> String {
        guard let date = stringToDate(string: string, characteristcs: inputCharacteristcs) else {
            return "date string or format is not correct."
        }
        return dateToString(date: date, characteristcs: outputCharacteristcs)
    }
    
    
    /// check if date is bfore another date
    ///
    /// - Parameters:
    /// - firstDate: the first date object
    /// - secondDate: second date object
    /// - orEqual: a flage if need to check equality too.
    /// - Returns: bool represntin the check result.
    static public func isBefore(firstDate: Date, secondDate: Date, orEqual: Bool = false) -> Bool {
        if orEqual {
            return firstDate <= secondDate
        }
        return firstDate < secondDate
    }
    
    
    /// check if date is bfore another date
    ///
    /// - Parameters:
    /// - firstDate: the string of first date object
    /// - firstDateCharacteristcs: characteristcs of string date.
    /// - secondDate: the string of second date object
    /// - secondDateCharacteristcs: characteristcs of string date.
    /// - orEqual: a flage if need to check equality too.
    /// - Returns: bool represntin the check result, return nil if firstDate or secondDate in wrong formate.
    static public func isBefore(firstDate: String, firstDateCharacteristcs: DateCharacteristcs,  secondDate: String, secondDateCharacteristcs: DateCharacteristcs, orEqual: Bool = false) -> Bool? {
        guard let date1 = stringToDate(string: firstDate, characteristcs: firstDateCharacteristcs) else { return nil }
        
        guard let date2 = stringToDate(string: secondDate, characteristcs: secondDateCharacteristcs) else { return nil }
        
        if orEqual {
            return date1 <= date2
        }
        return date1 < date2
    }
    
    /// check if date is after another date
    ///
    /// - Parameters:
    /// - firstDate: the first date object
    /// - secondDate: second date object
    /// - orEqual: a flage if need to check equality too.
    /// - Returns: bool represntin the check result.
    static public func isAfter(firstDate: Date, secondDate: Date, orEqual: Bool = false) -> Bool {
        if orEqual {
            return firstDate >= secondDate
        }
        return firstDate > secondDate
    }
    
    
    /// check if date is after another date
    ///
    /// - Parameters:
    /// - firstDate: the string of first date object
    /// - firstDateCharacteristcs: characteristcs of string date.
    /// - secondDate: the string of second date object
    /// - secondDateCharacteristcs: characteristcs of string date.
    /// - orEqual: a flage if need to check equality too.
    /// - Returns: bool represntin the check result, return nil if firstDate or secondDate in wrong formate.
    static public func isAfter(firstDate: String, firstDateCharacteristcs: DateCharacteristcs, secondDate: String, secondDateCharacteristcs: DateCharacteristcs, orEqual: Bool = false) -> Bool? {
        guard let date1 = stringToDate(string: firstDate, characteristcs: firstDateCharacteristcs) else { return nil }
        
        guard let date2 = stringToDate(string: secondDate, characteristcs: secondDateCharacteristcs) else { return nil }
        
        if orEqual {
            return date1 >= date2
        }
        return date1 > date2
    }
}

extension DateFormatter {
    convenience init(characteristcs: DateCharacteristcs) {
        self.init()
        locale = Locale(identifier: characteristcs.locale)
        dateFormat = characteristcs.format
        calendar = Calendar(identifier: characteristcs.identifier)
    }
}

public struct DateCharacteristcs {
    var format: String
    var locale: String = "en"
    var identifier: Calendar.Identifier = .gregorian
}

public enum DateFormats: String {
    case YYYY = "yyyy" // ex: 2022
    case MM = "MM"  // ex: 12
    case DD = "dd"  // ex: 31
    case H = "h"  // ex: 7
    case M = "m"  // ex: 58
    case DD_MMM = "dd MMM"  // ex: 13 Jan
    case MMM_YYYY = "MMM YYYY"  // ex: Feb 2022
    case DD_MM_YYYY = "dd-MM-yyyy"  // ex: 22-10-2022
    case YYYY_MM_DD = "yyyy-MM-dd"  // ex: 2022-03-23
    case HH_MM_A = "hh:mm a"  // ex: 07:30 PM
    case DD_MM_YYYY_HH_MM_A = "dd-MM-yyyy hh:mm a"  // ex: 02-02-2022 04:30 PM
    case D_MMM_YYYY = "d MMM yyyy"  // ex: 15 May 2021
    case YYYY_MM_DD_T_HH_MM_SS = "yyyy-MM-dd'T'HH:mm:ss"  //ex: 2001-07-04T12:08:56
    case YYYY_MM_DD_HH_MM_SS = "yyyy-MM-dd HH:mm:ss"  // ex: 2020-10-01 04:30:22
}
