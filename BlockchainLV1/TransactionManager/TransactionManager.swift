//
//  TransactionManager.swift
//  BlockchainLV1
//
//  Created by Luka Lešić on 18.03.2024..
//

import Foundation

import Foundation

class TransactionManager {
    var wallets: [Wallet] = []
    var blockchain: [Block] = []
    var index = 0
    
    static let shared = TransactionManager()
    
    private init() {
        
    }
    
    func addWallet(_ wallet: Wallet) {
        wallets.append(wallet)
    }
    
    func processTransactions(_ transaction: Transaction) {
            for wallet in wallets {
                if transaction.recipientAddress == wallet.name {
                    wallet.currentBalance += transaction.amount
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        print("\(wallet.name) received \(transaction.amount). New balance is \(wallet.currentBalance)")
                    }
                }
        }
        let block = Block(transaction: transaction, index: index)
        
        self.index += 1
    }
}
