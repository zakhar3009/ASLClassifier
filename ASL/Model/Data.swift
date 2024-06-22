//
//  Data.swift
//  ASL
//
//  Created by Zakhar Litvinchuk on 21.06.2024.
//

import Foundation

class DataService: ObservableObject {
    static let shared = DataService()
    private init() {}
    @Published var solvedLetters: [String : Answer] = ["A" : .default,
                                                   "B" : .default,
                                                   "C" : .default,
                                                   "D" : .default,
                                                   "E" : .default,
                                                   "F" : .default,
                                                   "G" : .default,
                                                   "H" : .default,
                                                   "I" : .default,
                                                   "J" : .default,
                                                   "K" : .default,
                                                   "L" : .default,
                                                   "M" : .default,
                                                   "N" : .default,
                                                   "O" : .default,
                                                   "P" : .default,
                                                   "Q" : .default,
                                                   "R" : .default,
                                                   "S" : .default,
                                                   "T" : .default,
                                                   "U" : .default,
                                                   "V" : .default,
                                                   "W" : .default,
                                                   "X" : .default,
                                                   "Y" : .default,
                                                   "Z" : .default]
}

struct UserData: Codable {
    let solvedLetters: [String : Answer]
}
