//
//  OneWeek.swift
//  timetable
//
//  Created by Matvey Baygin on 10/31/21.
//

import SwiftUI
func printOnlyExistDay(day:Int, week:Int, data:[oneItem])->Bool{
    for item in data{
        if Int(item.day ) == day && Int(item.week ) == week {
            return true
        }
    }
    return false
}
func colour(type:String)->Color{
    switch type{
    case "пр. занятие": return Color.red
    case "лекция": return Color.green
    case "лаб. работа": return Color.blue
    default: return Color.clear
    }
}
struct OneWeek: View {
    var allPairs:[oneItem] = []
    var dayOfWeek = 1
    var body: some View {
        List(0...7, id: \.self){ dayofweek in
            if(printOnlyExistDay(day: dayofweek, week: dayOfWeek, data:allPairs)){
                Section(header: Text(dayOfWeekToString(day:dayofweek))) {
                    ForEach(allPairs.filter { Int($0.day ) == Int(dayofweek) && Int($0.week ) == Int(dayOfWeek) }  ) { oneitem in
                        VStack(alignment: .leading, spacing: 4.0) {
                            Text(oneitem.subject ).fontWeight(.bold).multilineTextAlignment(.leading)
                            HStack(alignment: .top){
                                Text(oneitem.time )
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.gray)
                                Text(oneitem.type ).foregroundColor(colour(type: oneitem.type ))
                                Text(oneitem.sync )
                            }
                            HStack(){
                                Text(oneitem.building )
                                Text(oneitem.room )
                            }
                            Text(oneitem.teacher )
                        }.padding(10)
                    }
                }
            }
        }
    }
}

struct OneWeek_Previews: PreviewProvider {
    static var previews: some View {
        OneWeek()
    }
}
