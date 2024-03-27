//
//  BlockchainManager.swift
//  BlockchainLV1
//
//  Created by Luka Lešić on 14.03.2024..
//

import Foundation
import Base58
import CryptorRSA
import CryptoKit

class BlockchainManager {
    //MARK: Lab #1
    
    static let message = "FERIT"
    
    //MARK: task 1
    
    func encodeBase58(text: String) {
        //encoding string to base58
        let bytesArray = text.makeBytes()
        let encodedBytesArray = Base58.encode(bytesArray)
        let resultString = String(bytes: encodedBytesArray, encoding: .utf8)
        print("encoded \(text) to bytes array \(bytesArray) to Base58 : \(resultString)")
        
        //decoding back to string
        decodeBase58(hash: resultString ?? "")
    }
    
   private func decodeBase58(hash: String) {
        let bytesArray = hash.makeBytes()
       
        if let decodedBytesArray = try? Base58.decode(bytesArray),
           let resultString = String(bytes: decodedBytesArray, encoding: .utf8) {
            print("Decoded: \(resultString) \n")
        } else {   
            fatalError()
        }
    }
    
    //MARK: task 2
    
    func encodeToShA(text: String) -> String {
        let data = text.data(using: .utf8)!
        let digest = SHA256.hash(data: data)
        
        let hashString = digest
            .compactMap { String(format: "%02x", $0) }
            .joined()
        return hashString
    }
    
    //MARK: Task 3

    func generateKeys() -> (SecKey?, SecKey?) {
        var publicKey: SecKey?
        var privateKey: SecKey?

        let parameters: [String: Any] = [
            kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
            kSecAttrKeySizeInBits as String: 2048
        ]

        SecKeyGeneratePair(parameters as CFDictionary, &publicKey, &privateKey)
        
        if let publicKeyData = publicKey, let privateKeyData = privateKey {
//            printPublicKey(publicKeyData)
//            printPrivateKey(privateKeyData)
            
            if let encryptedData = encryptMessageWithPublicKey(message: "".generateRandomString(length: 10), publicKey: publicKeyData) {
//                print("Encoded message: \(encryptedData.base64EncodedString())")
                
                if let decryptedMessage = decryptMessageWithPrivateKey(encryptedData: encryptedData, privateKey: privateKeyData) {
//                    print("Decrypted message: \(decryptedMessage)")
                } else {
                    print("Decryption failed.")
                }
            } else {
                print("Encryption failed.")
            }
        } else {
            print("Key generation failed.")
        }
        return (privateKey, publicKey)
    }
    
    func printPublicKey(_ publicKey: SecKey) {
        print("Public Key: \(publicKey)")
        print("Public Key hash Value: \(publicKey.hashValue)")
    }
    
    func printPrivateKey(_ privateKey: SecKey) {
        print("Private Key: \(privateKey)")
        print("Private Key hash Value: \(privateKey.hashValue)")
    }
    
    func encryptMessageWithPublicKey(message: String, publicKey: SecKey) -> Data? {
        guard let messageData = message.data(using: .utf8) else {
            return nil
        }
        
        var error: Unmanaged<CFError>?
        guard let encryptedData = SecKeyCreateEncryptedData(publicKey, .rsaEncryptionOAEPSHA256, messageData as CFData, &error) else {
            print("Encryption failed: \(error.debugDescription)")
            return nil
        }
        return encryptedData as Data
    }
    
    func decryptMessageWithPrivateKey(encryptedData: Data, privateKey: SecKey) -> String? {
        var error: Unmanaged<CFError>?
        guard let decryptedData = SecKeyCreateDecryptedData(privateKey, .rsaEncryptionOAEPSHA256, encryptedData as CFData, &error) else {
            print("Decryption failed: \(error.debugDescription)")
            return nil
        }
        return String(data: decryptedData as Data, encoding: .utf8)
    }
}
