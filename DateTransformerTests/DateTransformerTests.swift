//
//  DateTransformerTests.swift
//  DateTransformerTests
//
//  Created by Khaled Mahmoud on 24/01/2022.
//

import XCTest
@testable import DateTransformer

class DateTransformerTests: XCTestCase {

    // mock timeStamp
    var mockTimeStamp: Double = 1645203600
    
    // mock date = "18-02-2022 07:00 PM"
    var mockDate: Date {
        var dateComponents = DateComponents()
        dateComponents.year = 2022
        dateComponents.month = 2
        dateComponents.day = 18
        dateComponents.hour = 19
        dateComponents.minute = 00
        return Calendar(identifier: .gregorian).date(from: dateComponents)!
    }
    
    var mockDate2: Date {
        var dateComponents = DateComponents()
        dateComponents.year = 2024
        dateComponents.month = 1
        dateComponents.day = 1
        dateComponents.hour = 1
        dateComponents.minute = 00
        return Calendar(identifier: .gregorian).date(from: dateComponents)!
    }
    
    //only year
    func testYearFormat_passed() {
        XCTAssertEqual(DateTransformer.dateToString(date: mockDate, characteristcs: DateCharacteristcs(format: DateFormats.YYYY.rawValue)), "2022")
    }
    
    func testYearFormat_failed() {
        
        XCTAssertNotEqual(DateTransformer.dateToString(date: mockDate, characteristcs: DateCharacteristcs(format: DateFormats.YYYY.rawValue)), "22222")
    }
    
    //only month
    func testMonthFormat_passed() {
        XCTAssertEqual(DateTransformer.dateToString(date: mockDate, characteristcs: DateCharacteristcs(format: DateFormats.MM.rawValue)), "02")
    }
    
    func testMonthFormat_failed() {
        XCTAssertNotEqual(DateTransformer.dateToString(date: mockDate, characteristcs: DateCharacteristcs(format: DateFormats.MM.rawValue)), "2")
    }
    
    //only day
    func testDayFormat_passed() {
        XCTAssertEqual(DateTransformer.dateToString(date: mockDate, characteristcs: DateCharacteristcs(format: DateFormats.DD.rawValue)), "18")
    }
    
    func testDayFormat_failed() {
        XCTAssertNotEqual(DateTransformer.dateToString(date: mockDate, characteristcs: DateCharacteristcs(format: DateFormats.DD.rawValue)), "11")
    }
    
    //only hour
    func testHourFormat_passed() {
        XCTAssertEqual(DateTransformer.dateToString(date: mockDate, characteristcs: DateCharacteristcs(format: DateFormats.H.rawValue)), "7")
    }
    
    func testHourFormat_failed() {
        XCTAssertNotEqual(DateTransformer.dateToString(date: mockDate, characteristcs: DateCharacteristcs(format: DateFormats.H.rawValue)), "007")
    }
    
    //only minute
    func testMinuteFormat_passed() {
        XCTAssertEqual(DateTransformer.dateToString(date: mockDate, characteristcs: DateCharacteristcs(format: DateFormats.M.rawValue)), "0")
    }
    
    func testMinuteFormat_failed() {
        XCTAssertNotEqual(DateTransformer.dateToString(date: mockDate, characteristcs: DateCharacteristcs(format: DateFormats.M.rawValue)), "000")
    }
    
    //only time
    func testOnlyTimeFormat_passed() {
        XCTAssertEqual(DateTransformer.dateToString(date: mockDate, characteristcs: DateCharacteristcs(format: DateFormats.HH_MM_A.rawValue)), "07:00 PM")
    }
    
    func testOnlyTimeFormatWithoutPM_failed() {
        XCTAssertNotEqual(DateTransformer.dateToString(date: mockDate, characteristcs: DateCharacteristcs(format: DateFormats.HH_MM_A.rawValue)), "07:00")
    }
    
    func testOnlyTimeFormatWithout0AtFirst_failed() {
        XCTAssertNotEqual(DateTransformer.dateToString(date: mockDate, characteristcs: DateCharacteristcs(format: DateFormats.HH_MM_A.rawValue)), "7:00 PM")
    }
    
    func testOnlyTimeFormatWithAM_failed() {
        XCTAssertNotEqual(DateTransformer.dateToString(date: mockDate, characteristcs: DateCharacteristcs(format: DateFormats.HH_MM_A.rawValue)), "07:00 AM")
    }
    
    //day month year
    func testDayMonthYearFormat_passed() {
        XCTAssertEqual(DateTransformer.dateToString(date: mockDate, characteristcs: DateCharacteristcs(format: DateFormats.DD_MM_YYYY.rawValue)), "18-02-2022")
    }
    
    func testDayMonthYearFormatFailed() {
        XCTAssertNotEqual(DateTransformer.dateToString(date: mockDate, characteristcs: DateCharacteristcs(format: DateFormats.DD_MM_YYYY.rawValue)), "18-2-2022")
    }
    
    //day month year
    func testMonthNameYearFormat_passed() {
        XCTAssertEqual(DateTransformer.dateToString(date: mockDate, characteristcs: DateCharacteristcs(format: DateFormats.MMM_YYYY.rawValue)), "Feb 2022")
    }
    
    func testMonthNameYearFormat_failed() {
        XCTAssertNotEqual(DateTransformer.dateToString(date: mockDate, characteristcs: DateCharacteristcs(format: DateFormats.MMM_YYYY.rawValue)), "feb 2022")
    }
    
    //date and time
    func testDateAndTimeFormat_passed() {
        XCTAssertEqual(DateTransformer.dateToString(date: mockDate, characteristcs: DateCharacteristcs(format: DateFormats.DD_MM_YYYY_HH_MM_A.rawValue)), "18-02-2022 07:00 PM")
    }
    
    func testDateAndTimeFormat_failed() {
        XCTAssertNotEqual(DateTransformer.dateToString(date: mockDate, characteristcs: DateCharacteristcs(format: DateFormats.DD_MM_YYYY_HH_MM_A.rawValue)), "19-02-2022 07:00 PM")
    }
    
    //Hijri arabic date
    func testHijriDateFormat_passed() {
        XCTAssertEqual(DateTransformer.dateToString(date: mockDate, characteristcs: DateCharacteristcs(format: DateFormats.D_MMM_YYYY.rawValue, locale: "Ar", identifier: .islamic)), "١٧ رجب ١٤٤٣")
    }
    
    func testHijriDateFormat_failed() {
        XCTAssertNotEqual(DateTransformer.dateToString(date: mockDate, characteristcs: DateCharacteristcs(format: DateFormats.D_MMM_YYYY.rawValue, locale: "En", identifier: .islamic)), "١٧ رجب ١٤٤٣")
    }
    
    //convert string to date
    func testDateFormString_passed() {
        XCTAssertNotNil(DateTransformer.stringToDate(string: "18-02-2022", characteristcs: DateCharacteristcs(format: DateFormats.DD_MM_YYYY.rawValue)))
    }

    func testDateFormString_failed() {
        XCTAssertNil(DateTransformer.stringToDate(string: "18-00-2022", characteristcs: DateCharacteristcs(format: DateFormats.DD_MM_YYYY.rawValue)))
    }
    
    //convert String to String
    func testStringFormString_passed() {
        XCTAssertEqual(DateTransformer.stringToString(string: "1443-06-21",inputCharacteristcs: DateCharacteristcs(format: DateFormats.YYYY_MM_DD.rawValue, locale: "en", identifier: .islamic), outputCharacteristcs: DateCharacteristcs(format: DateFormats.DD_MM_YYYY.rawValue, locale: "en", identifier: .gregorian)), "23-01-2022")
    }
    
    func testStringIslamicArToStringGregorianEn_passed() {
        XCTAssertEqual(DateTransformer.stringToString(string: "١٧ رجب ١٤٤٣",inputCharacteristcs: DateCharacteristcs(format: DateFormats.D_MMM_YYYY.rawValue, locale: "ar", identifier: .islamic), outputCharacteristcs: DateCharacteristcs(format: DateFormats.DD_MM_YYYY.rawValue, locale: "en", identifier: .gregorian)), "18-02-2022")
    }

    //convert date from timestamp to string
    func testStringFromTimeStamp_passed() {
        XCTAssertNotEqual(DateTransformer.dateFromTimeStamp(timeStamp: mockTimeStamp, characteristcs: DateCharacteristcs(format: DateFormats.DD_MM_YYYY.rawValue)), "18-2-2022")
    }
    
    func testStringFromTimeStamp_failed() {
        XCTAssertNotEqual(DateTransformer.dateFromTimeStamp(timeStamp: mockTimeStamp, characteristcs: DateCharacteristcs(format: DateFormats.DD_MM_YYYY.rawValue)), "18-2-2002")
    }
    
    
    //check if date is before another date
    func testDateIsBeforeAnotherDate_passed() {
        XCTAssertTrue(DateTransformer.isBefore(firstDate: mockDate, secondDate: mockDate2))
    }
    
    func testDateIsBeforeAnotherDate_failed() {
        XCTAssertFalse(DateTransformer.isBefore(firstDate: mockDate2, secondDate: mockDate))
    }
    
    //check if date is equal another date
    func testDateIsBeforeOrEqualAnotherDate_passed() {
        XCTAssertTrue(DateTransformer.isBefore(firstDate: mockDate, secondDate: mockDate, orEqual: true))
    }

    func testDateIsBeforeOrEqualAnotherDate_failed() {
        XCTAssertFalse(DateTransformer.isBefore(firstDate: mockDate2, secondDate: mockDate, orEqual: true))
    }

    //check if string date is befor another string date using
    func testDateIsBeforeAnotherDate_Strings_passed() {
        XCTAssertTrue((DateTransformer.isBefore(firstDate: "01-01-2014", firstDateCharacteristcs: DateCharacteristcs(format: DateFormats.DD_MM_YYYY.rawValue), secondDate: "01-01-2028", secondDateCharacteristcs: DateCharacteristcs(format: DateFormats.DD_MM_YYYY.rawValue)) == true))
    }
    
    func testDateIsBeforeAnotherDate_Strings_failed() {
        XCTAssertTrue((DateTransformer.isBefore(firstDate: "02-01-2024", firstDateCharacteristcs: DateCharacteristcs(format: DateFormats.DD_MM_YYYY.rawValue), secondDate: "02-01-2018", secondDateCharacteristcs: DateCharacteristcs(format: DateFormats.DD_MM_YYYY.rawValue)) == false))
    }
    
    //check if date is after another date
    func testDateIsAfterAnotherDate_passed() {
        XCTAssertTrue(DateTransformer.isAfter(firstDate: mockDate2, secondDate: mockDate))
    }
    
    func testDateIsAfterAnotherDate_failed() {
        XCTAssertFalse(DateTransformer.isAfter(firstDate: mockDate, secondDate: mockDate2))
    }
    
    //check if date is equal another date
    func testDateIsAfterOrEqualAnotherDate_passed() {
        XCTAssertTrue(DateTransformer.isAfter(firstDate: mockDate, secondDate: mockDate, orEqual: true))
    }
    
    func testDateIsAfterOrEqualAnotherDate_failed() {
        XCTAssertFalse(DateTransformer.isAfter(firstDate: mockDate, secondDate: mockDate2, orEqual: true))
    }

    //check if string date is after another string date using
    func testDateIsAfterAnotherDate_Strings_passed() {
        XCTAssertTrue((DateTransformer.isAfter(firstDate: "01-01-2030", firstDateCharacteristcs: DateCharacteristcs(format: DateFormats.DD_MM_YYYY.rawValue), secondDate: "01-01-2010", secondDateCharacteristcs: DateCharacteristcs(format: DateFormats.DD_MM_YYYY.rawValue)) == true))
    }
    
    func testDateIsAfterAnotherDate_Strings_failed() {
        XCTAssertTrue((DateTransformer.isAfter(firstDate: "01-01-2010", firstDateCharacteristcs: DateCharacteristcs(format: DateFormats.DD_MM_YYYY.rawValue), secondDate: "01-01-2030", secondDateCharacteristcs: DateCharacteristcs(format: DateFormats.DD_MM_YYYY.rawValue)) == false))
    }
}
