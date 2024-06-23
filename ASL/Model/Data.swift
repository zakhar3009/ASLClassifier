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
    @Published var solvedLetters: [String: [Answer]] = ["A": [],
                                                        "B": [],
                                                        "C": [],
                                                        "D": [],
                                                        "E": [],
                                                        "F": [],
                                                        "G": [],
                                                        "H": [],
                                                        "I": [],
                                                        "J": [],
                                                        "K": [],
                                                        "L": [],
                                                        "M": [],
                                                        "N": [],
                                                        "O": [],
                                                        "P": [],
                                                        "Q": [],
                                                        "R": [],
                                                        "S": [],
                                                        "T": [],
                                                        "U": [],
                                                        "V": [],
                                                        "W": [],
                                                        "X": [],
                                                        "Y": [],
                                                        "Z": []]
}

struct UserData: Codable {
    let solvedLetters: [String: [Answer]]
}
