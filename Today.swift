//
//  Today.swift
//  timetable
//
//  Created by Matvey Baygin on 10/31/21.
//

import SwiftUI

struct Today: View {
    var allPairs:[oneItem] = []
    var dayOfWeek = 1
    var week = 1
    var body: some View {
        List{
            Section(header: Text(dayOfWeekToString(day:dayOfWeek))) {
                ForEach(allPairs.filter { Int($0.day ) == Int(dayOfWeek) && Int($0.week ) == Int(week) }  ) { oneitem in
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

struct Today_Previews: PreviewProvider {
    static var previews: some View {
        Today()
    }
}
