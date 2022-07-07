//
//  HistoryDateXibViewModel.swift
//  Medion Fitness
//
//  Created by Eslam Mostafa on 30/04/2022.
//

import Foundation

class HistoryDateXibViewModel {
    //dd.MM.yy
    var callBackClousre : ((_ selectedPeriod : HistoryPeriod, _ year : Int, _ month : Int, _ week : Int, _ day : Int)->())?
    
    var selectedPeriod = HistoryPeriod.day
    
    func getDateStringByFormat(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        formatter.dateFormat = format
        let result = formatter.string(from: date)
        return result
    }
    
    func getDateObjectByFromat(stringDate: String, format: String) -> Date {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        formatter.dateFormat = format
        let result = formatter.date(from: stringDate) ?? Date()
        return result
    }
    
    func increaseDateBy(date: Date , days: Int) -> Date {
        let newDate = Calendar.current.date(byAdding: .day, value: days, to: date) ?? Date()
            
        if newDate.compare(Date()) == .orderedDescending{
            
            return Date()
        }
        return newDate
    }
    
    func increaseDateBy(date: Date , month: Int) -> Date {
        let newDate = Calendar.current.date(byAdding: .month, value: month, to: date) ?? Date()
        
        if newDate.compare(Date()) == .orderedDescending{
            
            return Date()
        }
        return newDate
        
    }
    
    func increaseDateBy(date: Date , years: Int) -> Date {
        let newDate = Calendar.current.date(byAdding: .year, value: years, to: date) ?? Date()
        
        if newDate.compare(Date()) == .orderedDescending{
            
            return Date()
        }
        return newDate
        
    }
    
    func getDateParamter(date: Date, period: HistoryPeriod){
        
        let year  = Calendar.current.dateComponents([.year], from: date).year ?? 0
        
        let month  = Calendar.current.dateComponents([.month], from: date).month ?? 0
        
        let weekOfMonth = Calendar.current.dateComponents([.weekOfMonth], from: date).weekOfMonth ?? 0
        
        let day = Calendar.current.dateComponents([.day], from: date).day ?? 0
        
        callBackClousre?(period, year, month, weekOfMonth, day)
    }
    func getNextDateFor(currentDate: String, period: HistoryPeriod) -> String {
        var stringDate = ""
        
        switch period {
        case .day:
            let currentDate = getDateObjectByFromat(stringDate: currentDate, format: "dd.MM.yy")
            let nextDate = increaseDateBy(date: currentDate, days: 1)
            stringDate = getDateStringByFormat(date: nextDate, format: "dd.MM.yy")
            getDateParamter(date: nextDate, period: period)
        case .week:
            let currentDate = getDateObjectByFromat(stringDate: currentDate, format: "dd.MM.yy")
            let nextDate = increaseDateBy(date: currentDate, days: 7)
            stringDate = getDateStringByFormat(date: nextDate, format: "dd.MM.yy")
            getDateParamter(date: nextDate, period: period)
        case .month:
            let currentDate = getDateObjectByFromat(stringDate: currentDate, format: "MMMM yyyy")
            let nextDate = increaseDateBy(date: currentDate, month: 1)
            stringDate = getDateStringByFormat(date: nextDate, format: "MMMM yyyy")
            getDateParamter(date: nextDate, period: period)
        case .year:
            let currentDate = getDateObjectByFromat(stringDate: currentDate, format: "yyyy")
            let nextDate = increaseDateBy(date: currentDate, years: 1)
            stringDate = getDateStringByFormat(date: nextDate, format: "yyyy")
            getDateParamter(date: nextDate, period: period)
        }
        
        return stringDate
    }
    
    func getPreviousDateFor(currentDate: String, period: HistoryPeriod) -> String {
        var stringDate = ""
        
        switch period {
        case .day:
            let currentDate = getDateObjectByFromat(stringDate: currentDate, format: "dd.MM.yy")
            let nextDate = increaseDateBy(date: currentDate, days: -1)
            stringDate = getDateStringByFormat(date: nextDate, format: "dd.MM.yy")
            getDateParamter(date: nextDate, period: period)
        case .week:
            let currentDate = getDateObjectByFromat(stringDate: currentDate, format: "dd.MM.yy")
            let nextDate = increaseDateBy(date: currentDate, days: -7)
            stringDate = getDateStringByFormat(date: nextDate, format: "dd.MM.yy")
            getDateParamter(date: nextDate, period: period)
        case .month:
            let currentDate = getDateObjectByFromat(stringDate: currentDate, format: "MMMM yyyy")
            let nextDate = increaseDateBy(date: currentDate, month: -1)
            stringDate = getDateStringByFormat(date: nextDate, format: "MMMM yyyy")
            getDateParamter(date: nextDate, period: period)
        case .year:
            let currentDate = getDateObjectByFromat(stringDate: currentDate, format: "yyyy")
            let nextDate = increaseDateBy(date: currentDate, years: -1)
            stringDate = getDateStringByFormat(date: nextDate, format: "yyyy")
            getDateParamter(date: nextDate, period: period)
        }
        
        return stringDate
    }
    
    func getCurrentDateFor(period: HistoryPeriod) -> String {
        var stringDate = ""
        
        switch period {
        case .day:
            stringDate = getDateStringByFormat(date: Date(), format: "dd.MM.yy")
            getDateParamter(date: Date(), period: period)
        case .week:
            stringDate = getDateStringByFormat(date: Date(), format: "dd.MM.yy")
            getDateParamter(date: Date(), period: period)
        case .month:
            stringDate = getDateStringByFormat(date: Date(), format: "MMMM yyyy")
            getDateParamter(date: Date(), period: period)
        case .year:
            stringDate = getDateStringByFormat(date: Date(), format: "yyyy")
            getDateParamter(date: Date(), period: period)
        }
        
        return stringDate
    }
}

enum HistoryPeriod: Int {
    case day = 1
    case week = 2
    case month = 3
    case year = 4
}
