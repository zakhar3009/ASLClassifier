//
//  LetterButton.swift
//  ASL
//
//  Created by Соня Буділова on 16.06.2024.
//

import SwiftUI

struct LetterButton: View {
    @ObservedObject var dataService = DataService.shared
    let letter: String
    var body: some View {
        Text(letter)
            .foregroundStyle(.black)
            .font(.title)
            .frame(height: 80)
            .frame(maxWidth: .infinity)
            .background {
                switch dataService.solvedLetters[letter]!.last {
                case .right:
                    Color.green
                case .almost:
                    Color.orange
                case .wrong:
                    Color.red
                case .default:
                    Color.yellow
                case .none:
                    Color.yellow
                }
            }
            .cornerRadius(15)
    }
}
