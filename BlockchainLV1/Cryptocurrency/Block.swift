//
//  Block.swift
//  BlockchainLV1
//
//  Created by Luka Lešić on 18.03.2024..
//

import Foundation

class Block {
    private(set) var transaction: Transaction
    var previousHashValue = ""
    private(set) var currentHashValue = ""
    private(set) var creationDate: Date
    private(set) var index: Int
    
    init(transaction: Transaction, previousHashValue: String = "", index: Int = 0) {
        self.transaction = transaction
        self.previousHashValue = previousHashValue
        self.creationDate = Date()
        self.index = index
        self.currentHashValue = generateHash()
        
        Blockchain.shared.appendBlock(block: self)
    }
    
    private func generateHash() -> String {
        let hashCandidate = ""
        let manager = BlockchainManager()
        return manager.encodeToShA(text: hashCandidate.generateRandomString(length: 20))        
    }
}
