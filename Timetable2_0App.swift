//
//  Timetable2_0App.swift
//  Timetable2.0
//
//  Created by Matvey Baygin on 11/1/21.
//

import SwiftUI

@main
struct Timetable2_0App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
