//
//  ContentView.swift
//  BlockchainLV1
//
//  Created by Luka Lešić on 14.03.2024..
//

import SwiftUI

struct ContentView: View {
    
    var manager = BlockchainManager()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            //A UI Is not necessary for this application yet. The app displays output in the logging console. I mostly used this file to test function logs via the onAppear block
        }
        .padding()
        .onAppear {
            //LV1 Test
            
//            manager.encodeBase58(text: BlockchainManager.message)
//            manager.encodeToShA(text: BlockchainManager.message)
//            manager.generateKeys()
            
            //LV2 Test
            
            let blockchainFactory = BlockchainFactory()
            let studentWallet = Wallet(name: "student")
            let professorWallet = Wallet(name: "professor")
            let cryptoWhaleWallet = Wallet(name: "cryptowhale")
            let transactionManager = TransactionManager.shared
            transactionManager.addWallet(studentWallet)
            transactionManager.addWallet(professorWallet)
            transactionManager.addWallet(cryptoWhaleWallet)
            
            studentWallet.sendToWallet(recipientAddress: "professor", amount: 4)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                professorWallet.sendToWallet(recipientAddress: "cryptowhale", amount: 1)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                cryptoWhaleWallet.sendToWallet(recipientAddress: "student", amount: 1)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                Blockchain.shared.printBlockInfo()
            }
        }
    }
}
