//
//  ContentView.swift
//  Timetable2.0
//
//  Created by Matvey Baygin on 11/1/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    public func changeGroup(){
        UserDefaults.standard.set(self.group, forKey: "group")
        let grp = self.group.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        if let url = URL(string: "https://edu.sfu-kras.ru/api/timetable/get&target="+(grp ?? "")) {
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                  do {
                      let res = try JSONDecoder().decode(allData.self, from: data)
                      self.data = res.timetable
                      
                      self.group = res.target
                  } catch let error {
                     print(error)
                  }
               }
           }.resume()
        }
    }
    private var viewContext = ""
    @State var data:[oneItem] = []
    @State var group: String = UserDefaults.standard.string(forKey: "group") ?? "КИ20-01-1м"
    @State var test: String = ""
    @State private var isShowingPopover = false
    @State private var isShowingGroup = false
    var body: some View {
        VStack{
            HStack(spacing: 30.0){
                Button(group, action: {
                            self.isShowingGroup = true
                        })
                    .popover(isPresented: $isShowingGroup) {
                        List{
                            Section(header: Text("Выбрать группу")){
                                VStack(spacing: 50.0){
                                    TextField("Выбрать группу", text: $group)
                                    Divider()
                                    Button("Выбрать", action:{
                                        self.isShowingGroup = false
                                        changeGroup()
                                    } )
                                }
                            }
                        }
                    }
                        
                Text(getWeek() == 1 ? "Нечетная" : "Четная")
                Button(dayOfWeekToString(day: getDay()), action: {
                            self.isShowingPopover = true
                        })
                        .popover(isPresented: $isShowingPopover) {
                            Today(allPairs: data, dayOfWeek: getDay(), week: getWeek())
                        }
            }

            TabView {
                if(getWeek() == 1){
                    OneWeek(allPairs: data, dayOfWeek: 1)
                        .tabItem {
                            Image(systemName: "1.square.fill")
                            Text("Нечетная")
                        }
                    OneWeek(allPairs: data, dayOfWeek: 2)
                        .tabItem {
                            Image(systemName: "2.square.fill")
                            Text("Четная")
                        }
                }
                else {
                    OneWeek(allPairs: data, dayOfWeek: 2)
                        .tabItem {
                            Image(systemName: "2.square.fill")
                            Text("Четная")
                        }
                    OneWeek(allPairs: data, dayOfWeek: 1)
                        .tabItem {
                            Image(systemName: "1.square.fill")
                            Text("Нечетная")
                        }
                }
                
            }
            .font(.headline)
        }.onAppear(perform: {
            changeGroup()
        })
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
