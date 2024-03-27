//
//  Blockchain.swift
//  BlockchainLV1
//
//  Created by Luka Lešić on 18.03.2024..
//

import Foundation

class Blockchain {
    
    static let shared = Blockchain()
    
    private init() {
        
    }
    
    var blocks: [Block] = []
    
    func appendBlock(block: Block) {
        self.blocks.append(block)
        
        if blocks.count > 1 {
            blocks[blocks.count - 1].previousHashValue = blocks[blocks.count - 2].currentHashValue
        }
    }
    
    func printBlockInfo() {
        for block in blocks {
            print("Block \(block.index): \n")
            print("Block created at \(block.creationDate)")
            print("Block amount: \(block.transaction.amount)")
            print("Block sender address: \(block.transaction.senderAdress)")
            print("Block recipient address: \(block.transaction.recipientAddress)")
            print("Block previous hash: \(block.previousHashValue)")
            print("Block current hash: \(block.currentHashValue)")
            print("\n")
        }
    }
}
