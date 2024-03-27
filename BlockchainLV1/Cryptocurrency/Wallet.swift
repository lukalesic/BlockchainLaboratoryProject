//
//  Wallet.swift
//  BlockchainLV1
//
//  Created by Luka Lešić on 18.03.2024..
//

import Foundation

class Wallet {
    private(set) var privateKey: SecKey?
    private(set) var publicKey: SecKey?
    //also using the name as an address for simplicity
    private(set) var name: String
    var currentBalance: Float = 10
    
    init(name: String) {
        self.name = name
        let (privateKey, publicKey) = BlockchainManager().generateKeys()
        self.privateKey = privateKey
        self.publicKey = publicKey
        printWalletInfo()
    }
    
    private func printWalletInfo() {
        print("Wallet \(self.name) generated with public key: \(self.publicKey) and private key: \(self.privateKey) \n")
    }
    
    func sendToWallet(recipientAddress: String, amount: Float) {
        if (self.currentBalance - amount > 0) {
            self.currentBalance -= amount
            
            let transaction = Transaction(amount: amount, senderAdress: name, recipientAddress: recipientAddress)
            TransactionManager.shared.processTransactions(transaction)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                print("\(self.name) sent \(amount) to \(recipientAddress). New balance is \(self.currentBalance)")
            }
        }
        else {
            print("Not enough balance")
        }
    }
}
