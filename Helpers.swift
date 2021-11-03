//
//  Helpers.swift
//  Raspisos
//
//  Created by Matvey Baygin on 11/1/21.
//

import Foundation

public func getDay()->Int{
    let calendar = Calendar.current
    var dayOfWeek = calendar.component(.weekday, from: Date())
    if(dayOfWeek == 1){
        dayOfWeek = 7
    }
    else {
        dayOfWeek-=1
    }
    return dayOfWeek
}
public func getWeek()->Int{
    let calendar = Calendar.current
    var dayOfWeek = calendar.component(.weekOfYear, from: Date())
    dayOfWeek+=1
    dayOfWeek%=2
    if(dayOfWeek == 0){
        return 2
    }
    return 1
}
public func dayOfWeekToString(day:Int)->String{
    switch day{
    case 1:
        return "Понедельник"
    case 2:
        return "Вторник"
    case 3:
        return "Среда"
    case 4:
        return "Четверг"
    case 5:
        return "Пятница"
    case 6:
        return "Суббота"
    default:
        return "Воскресенье"
    }
}
