//
//  Transaction.swift
//  BlockchainLV1
//
//  Created by Luka Lešić on 18.03.2024..
//

import Foundation

class Transaction {
    var amount: Float = 0
    var senderAdress: String = ""
    var recipientAddress: String = ""
    
    init(amount: Float, senderAdress: String, recipientAddress: String) {
        self.amount = amount
        self.senderAdress = senderAdress
        self.recipientAddress = recipientAddress
    }
}
