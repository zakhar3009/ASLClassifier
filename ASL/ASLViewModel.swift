//
//  ASLViewModel.swift
//  ASL
//
//  Created by Zakhar Litvinchuk on 16.06.2024.
//

import SwiftUI

class ASLViewModel: ObservableObject {
    @Published var letters = [
        LetterViewModel(letter: "A"),
        LetterViewModel(letter: "B"),
        LetterViewModel(letter: "C"),
        LetterViewModel(letter: "D"),
        LetterViewModel(letter: "E"),
        LetterViewModel(letter: "F"),
        LetterViewModel(letter: "G"),
        LetterViewModel(letter: "H"),
        LetterViewModel(letter: "I"),
        LetterViewModel(letter: "J"),
        LetterViewModel(letter: "K"),
        LetterViewModel(letter: "L"),
        LetterViewModel(letter: "M"),
        LetterViewModel(letter: "N"),
        LetterViewModel(letter: "O"),
        LetterViewModel(letter: "P"),
        LetterViewModel(letter: "Q"),
        LetterViewModel(letter: "R"),
        LetterViewModel(letter: "S"),
        LetterViewModel(letter: "T"),
        LetterViewModel(letter: "U"),
        LetterViewModel(letter: "V"),
        LetterViewModel(letter: "W"),
        LetterViewModel(letter: "X"),
        LetterViewModel(letter: "Y"),
        LetterViewModel(letter: "Z")
    ]
}
