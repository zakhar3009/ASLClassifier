//
//  Statistics.swift
//  ASL
//
//  Created by Соня Буділова on 23.06.2024.
//

import SwiftUI

struct Statistics: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            Text("Played letters:")
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .topLeading)
            ForEach(DataService.shared.solvedLetters.keys.sorted().filter { !(DataService.shared.solvedLetters[$0]?.isEmpty ?? false)
            }, id: \.self) { key in
                HStack {
                    Text("\(key)")
                    ForEach(DataService.shared.solvedLetters[key]!, id: \.self) { answer in createPoint(answer)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }

            Text("Not played letters:")
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.top, 20)

            ForEach(DataService.shared.solvedLetters.keys.sorted().filter { (DataService.shared.solvedLetters[$0]?.isEmpty ?? true)
            }, id: \.self) { key in
                Text("\(key)")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
        }
        .padding()
    }

    @ViewBuilder
    private func createPoint(_ answer: Answer) -> some View {
        Circle()
            .fill(Color.fromAnswer(answer))
            .frame(width: 10, height: 10)
    }
}

#Preview {
    Statistics()
}
