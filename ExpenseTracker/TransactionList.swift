//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Szymon Wnuk on 19/10/2022.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack{
            List{
                //MARK: Transaction groups
                ForEach(Array(transactionListVM.groupTransactionsByMonth()), id: \.key) {
                    month, transactions in
                    Section {
                        ForEach(transactions)
                        { transaction in
                            TransactionRow(transaction: transaction)
                                    .overlay(
                                        NavigationLink("", destination: {
                                            TransactionView(transaction: transaction)
                                        })
                                            .opacity(0)
                                    )
                        }
                    }
                header:
                        {
                    Text(month)
                }
                    listSectionSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    } ()
    static var previews: some View {
        NavigationView {
            TransactionList()
                .environmentObject(transactionListVM)
        }
    }
}
