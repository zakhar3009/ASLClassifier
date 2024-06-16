//
//  LetterButton.swift
//  ASL
//
//  Created by Соня Буділова on 16.06.2024.
//

import SwiftUI

struct LetterButton: View {
    let letter: Letter

    var body: some View {
        Text(letter.letter)
            .foregroundStyle(.black)
            .font(.title)
            .frame(height: 80)
            .frame(maxWidth: .infinity)
            .background(letter.isGuessed ? .green : .yellow)
            .cornerRadius(15)
    }
}

#Preview {
    LetterButton(letter: Letter(letter: "A", isGuessed: false))
}
