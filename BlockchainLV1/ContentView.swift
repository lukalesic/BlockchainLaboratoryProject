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
            //A UI Is not necessary for this application yet. The app displays output in the logging console.
        }
        .padding()
        .onAppear {
            manager.encodeBase58(text: BlockchainManager.message)
            manager.encodeToShA(text: BlockchainManager.message)
            manager.generateKeys()
        }
    }
}
