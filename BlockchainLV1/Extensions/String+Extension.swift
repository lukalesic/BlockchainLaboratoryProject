//
//  String+Extension.swift
//  BlockchainLV1
//
//  Created by Luka Lešić on 18.03.2024..
//

import Foundation

extension String {
    func generateRandomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
