//
//  ASLViewModel.swift
//  ASL
//
//  Created by Zakhar Litvinchuk on 16.06.2024.
//

import SwiftUI

class ASLViewModel: ObservableObject {
    @Published var letters = [LetterViewModel]()
    
    init() {
        self.letters = DataService.shared.solvedLetters.map { key, value in
            LetterViewModel(letter: key, isGuessed: value)
        }
    }
}
