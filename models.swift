//
//  models.swift
//  Raspisos
//
//  Created by Matvey Baygin on 11/1/21.
//

import Foundation

class oneItem:Codable, Identifiable{
    var building: String = ""
    var day: String = ""
    var place: String = ""
    var room: String = ""
    var subject: String = ""
    var sync: String = ""
    var teacher: String = ""
    var time: String = ""
    var type: String = ""
    var week: String = ""
}


class allData: Codable{
    var institute: String = ""
    var target: String = ""
    var type: String = ""
    var timetable: [oneItem] = []
}
