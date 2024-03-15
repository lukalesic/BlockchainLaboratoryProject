//
//  BlockchainManager.swift
//  BlockchainLV1
//
//  Created by Luka Lešić on 14.03.2024..
//

import Foundation
import Base58

class prviZadatak {
    
    func encodetoBase58(text: String) {
        //encoding string to base58
        let bytes = text.makeBytes()
        let encodedBytes = Base58.encode(bytes)
       // let encodedString = try? String(encodedBytes)
        let encodedString = String(bytes: encodedBytes, encoding: .utf8)
        print("encoded \(bytes) to base 58 : \(encodedString)")
        
        //decoding back to string
        decodeFromBase58(hash: encodedString ?? "")
    }
    
    func decodeFromBase58(hash: String) {
        let bytes = hash.makeBytes()
        if let decodedBytes = try? Base58.decode(bytes),
              let decodedString = String(bytes: decodedBytes, encoding: .utf8) {
               print("Decoded: \(decodedString)")
           } else {
               fatalError()
           }
       }
    
}
