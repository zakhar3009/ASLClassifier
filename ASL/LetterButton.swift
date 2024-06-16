//
//  LetterButton.swift
//  ASL
//
//  Created by Соня Буділова on 16.06.2024.
//

import SwiftUI

struct LetterButton: View {
    @ObservedObject var letterViewModel: LetterViewModel

    var body: some View {
        Text(letterViewModel.letter)
            .foregroundStyle(.black)
            .font(.title)
            .frame(height: 80)
            .frame(maxWidth: .infinity)
            .background(
                letterViewModel.isGuessed == .right ? .green : (letterViewModel.isGuessed == .almost ? .orange : (letterViewModel.isGuessed == .wrong ? .red : .yellow
                )))
            .cornerRadius(15)
    }
}

#Preview {
    LetterButton(letterViewModel: LetterViewModel(letter: "A", isGuessed: .default))
}
