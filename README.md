# DateTransformer
     this module is used to convert (Date -> String) or (String -> Date) with specific formate
     also convert (hijri -> gregorian) or (gregorian -> hijri) 
     and extract any part of date you need.

## Installation

DateTransformer is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DateTransformer"
```

# Usage

```swift
let today = Date()

// convert date object to string of "day-month-year" format > ex: "25-01-2022"
DateTransformer.dateToString(date: today,
                             characteristcs: DateCharacteristcs(
                             format: DateFormats.DD_MM_YYYY.rawValue)

// convert date object to string of time format > ex: "10:34 AM"
DateTransformer.dateToString(date: today,
                             characteristcs: DateCharacteristcs(
                             format: DateFormats.HH_MM_A.rawValue)

// convert date object to string of date-time format > ex: "18-02-2022 07:00 PM"
DateTransformer.dateToString(date: today,
                             characteristcs: DateCharacteristcs(
                             format: DateFormats.DD_MM_YYYY_HH_MM_A.rawValue)

// convert date object to string of Hijri date format > ex: "١٧ رجب ١٤٤٣"
DateTransformer.dateToString(date: today,
                             characteristcs: DateCharacteristcs(
                             format: DateFormats.D_MMM_YYYY.rawValue,
                             locale: "Ar",
                             identifier: .islamic))

// convert string of "day-month-year" format ex: "18-02-2022" > Date object. 
DateTransformer.stringToDate(string: "18-02-2022",
                             characteristcs: DateCharacteristcs(
                             format: DateFormats.DD_MM_YYYY.rawValue)
                             
// convert string of "year-month-day" format ex: "2022-01-25" > string of "day-month-year" format ex: "25-01-2022".
DateTransformer.stringToString(string: "2022-01-25", 
                               inputCharacteristcs: DateCharacteristcs(
                               format: DateFormats.YYYY_MM_DD.rawValue), 
                               outputCharacteristcs: DateCharacteristcs(
                               format: DateFormats.DD_MM_YYYY.rawValue))

// convert string of hijri calendar ex: "1443-06-17" > string of "day-month-year" format gregorian calendar "18-02-2022". 
DateTransformer.stringToString(string: "1443-06-17", 
                               inputCharacteristcs: DateCharacteristcs(
                               format: DateFormats.YYYY_MM_DD.rawValue, 
                               locale: "en", identifier: .islamic), 
                               outputCharacteristcs: DateCharacteristcs(
                               format: DateFormats.DD_MM_YYYY.rawValue,
                               locale: "en", identifier: .gregorian))
                               
```      

### Comparing dates

```swift
let date1 = Date() // ex: "25-01-2022"
let date2 = Calendar.current.date(byAdding: .month, value: 1, to: date1) // ex: "25-02-2022"

//check if date is before another date
if DateTransformer.isBefore(firstDate: date1, secondDate: date2) {
    //Do some thing
}

//check if date is before or equal another date
if DateTransformer.isBefore(firstDate: date1, secondDate: date2, orEqual: true) {
    //Do some thing
}

//check if string of date is before another string of date
if DateTransformer.isBefore(firstDate: "01-01-2014",
                            firstDateCharacteristcs: DateCharacteristcs(
                            format: DateFormats.DD_MM_YYYY.rawValue), 
                            secondDate: "01-01-2028", 
                            secondDateCharacteristcs: DateCharacteristcs(
                            format: DateFormats.DD_MM_YYYY.rawValue)) {
    //Do some thing
}

also,

//check if date is After another date
if DateTransformer.isAfter(firstDate: date2, secondDate: date1) {
    //Do some thing
}

```

## Author
* [Ibrahim Ali](https://github.com/IbrahimAli2017)
* [Khalid Mahmoud](https://github.com/KhalidZayat)
