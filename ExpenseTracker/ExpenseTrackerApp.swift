//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Szymon Wnuk on 18/10/2022.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
