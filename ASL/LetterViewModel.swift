//
//  Letter.swift
//  ASL
//
//  Created by Соня Буділова on 16.06.2024.
//
import SwiftUI

class LetterViewModel: ObservableObject, Hashable {
    var letter: String
    @Published var isGuessed: Bool
    
    init(letter: String, isGuessed: Bool = false) {
        self.letter = letter
        self.isGuessed = isGuessed
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(letter)
    }
    
    static func == (lhs: LetterViewModel, rhs: LetterViewModel) -> Bool {
        lhs.letter == rhs.letter
    }
}
