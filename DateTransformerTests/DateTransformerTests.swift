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
    
    //only year
    func testYearFormat_passed() {
        XCTAssertEqual(DateTransformer.dateToString(date: mockDate, format: DateFormats.year.rawValue, locale: "en"), "2022")
    }
    
    func testYearFormat_failed() {
        
        XCTAssertNotEqual(DateTransformer.dateToString(date: mockDate, format: DateFormats.year.rawValue, locale: "en"), "22222")
    }
    
    //only month
    func testMonthFormat_passed() {
        XCTAssertEqual(DateTransformer.dateToString(date: mockDate, format: DateFormats.month.rawValue, locale: "en"), "02")
    }
    
    func testMonthFormat_failed() {
        XCTAssertNotEqual(DateTransformer.dateToString(date: mockDate, format: DateFormats.month.rawValue, locale: "en"), "2")
    }
    
    //only day
    func testDayFormat_passed() {
        XCTAssertEqual(DateTransformer.dateToString(date: mockDate, format: DateFormats.day.rawValue, locale: "en"), "18")
    }
    
    func testDayFormat_failed() {
        XCTAssertNotEqual(DateTransformer.dateToString(date: mockDate, format: DateFormats.day.rawValue, locale: "en"), "11")
    }
    
    //only hour
    func testHourFormat_passed() {
        XCTAssertEqual(DateTransformer.dateToString(date: mockDate, format: DateFormats.hour.rawValue, locale: "en"), "7")
    }
    
    func testHourFormat_failed() {
        XCTAssertNotEqual(DateTransformer.dateToString(date: mockDate, format: DateFormats.hour.rawValue, locale: "en"), "007")
    }
    
    //only minute
    func testMinuteFormat_passed() {
        XCTAssertEqual(DateTransformer.dateToString(date: mockDate, format: DateFormats.minute.rawValue, locale: "en"), "0")
    }
    
    func testMinuteFormat_failed() {
        XCTAssertNotEqual(DateTransformer.dateToString(date: mockDate, format: DateFormats.minute.rawValue, locale: "en"), "000")
    }
    
    //only time
    func testOnlyTimeFormat_passed() {
        XCTAssertEqual(DateTransformer.dateToString(date: mockDate, format: DateFormats.time.rawValue, locale: "en"), "07:00 PM")
    }
    
    func testOnlyTimeFormatWithoutPM_failed() {
        XCTAssertNotEqual(DateTransformer.dateToString(date: mockDate, format: DateFormats.time.rawValue, locale: "en"), "07:00")
    }
    
    func testOnlyTimeFormatWithout0AtFirst_failed() {
        XCTAssertNotEqual(DateTransformer.dateToString(date: mockDate, format: DateFormats.time.rawValue, locale: "en"), "7:00 PM")
    }
    
    func testOnlyTimeFormatWithAM_failed() {
        XCTAssertNotEqual(DateTransformer.dateToString(date: mockDate, format: DateFormats.time.rawValue, locale: "en"), "07:00 AM")
    }
    
    //day month year
    func testDayMonthYearFormat_passed() {
        XCTAssertEqual(DateTransformer.dateToString(date: mockDate, format: DateFormats.day_month_year.rawValue, locale: "en"), "18-02-2022")
    }
    
    func testDayMonthYearFormatFailed() {
        XCTAssertNotEqual(DateTransformer.dateToString(date: mockDate, format: DateFormats.day_month_year.rawValue, locale: "en"), "18-2-2022")
    }
    
    //day month year
    func testMonthNameYearFormat_passed() {
        XCTAssertEqual(DateTransformer.dateToString(date: mockDate, format: DateFormats.monthName_Year.rawValue, locale: "en"), "Feb 2022")
    }
    
    func testMonthNameYearFormat_failed() {
        XCTAssertNotEqual(DateTransformer.dateToString(date: mockDate, format: DateFormats.monthName_Year.rawValue, locale: "en"), "feb 2022")
    }
    
    //date and time
    func testDateAndTimeFormat_passed() {
        XCTAssertEqual(DateTransformer.dateToString(date: mockDate, format: DateFormats.dateTime.rawValue, locale: "en"), "18-02-2022 07:00 PM")
    }
    
    func testDateAndTimeFormat_failed() {
        XCTAssertNotEqual(DateTransformer.dateToString(date: mockDate, format: DateFormats.dateTime.rawValue, locale: "en"), "19-02-2022 07:00 PM")
    }
    
    //Hijri arabic date
    func testHijriDateFormat_passed() {
        XCTAssertEqual(DateTransformer.dateToString(date: mockDate, format: DateFormats.dateWithMonthName.rawValue, identifier: .islamic, locale: "ar"), "١٧ رجب ١٤٤٣")
    }
    
    func testHijriDateFormat_failed() {
        XCTAssertNotEqual(DateTransformer.dateToString(date: mockDate, format: DateFormats.dateWithMonthName.rawValue, identifier: .islamic, locale: "en"), "١٧ رجب ١٤٤٣")
    }
    
    //convert date to string
    func testDateFormString_passed() {
        XCTAssertNotNil(DateTransformer.stringToDate(string: "18-02-2022", format: DateFormats.day_month_year.rawValue, locale: "en"))
    }

    func testDateFormString_failed() {
        XCTAssertNil(DateTransformer.stringToDate(string: "18-00-2022", format: DateFormats.day_month_year.rawValue, locale: "en"))
    }
    
    //convert date to string
    func testStringFormString_passed() {
        XCTAssertEqual(DateTransformer.stringToString(string: "18-02-2022", format: DateFormats.day_month_year.rawValue, outputFormat: DateFormats.monthName_Year.rawValue, locale: "en"), "Feb 2022")
    }

    func testStringFormString_failed() {
        XCTAssertNotEqual(DateTransformer.stringToString(string: "18-02-2022", format: DateFormats.day_month_year.rawValue, outputFormat: DateFormats.monthName_Year.rawValue, locale: "en"), "feb 2022")
    }
    
    //convert date from timestamp to string
    func testStringFromTimeStamp_passed() {
        XCTAssertNotEqual(DateTransformer.dateFromTimeStamp(timeStamp: mockTimeStamp, format: DateFormats.day_month_year.rawValue, locale: "en"), "18-2-2022")
    }
    
    func testStringFromTimeStamp_failed() {
        XCTAssertNotEqual(DateTransformer.dateFromTimeStamp(timeStamp: mockTimeStamp, format: DateFormats.day_month_year.rawValue, locale: "en"), "18-2-2002")
    }
}
