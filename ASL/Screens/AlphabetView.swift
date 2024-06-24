//
//  ContentView.swift
//  ASL
//
//  Created by Zakhar Litvinchuk on 15.06.2024.
//

import SwiftUI

struct AlphabetView: View {
    
    var body: some View {
        NavigationStack {
            Text("Learn ASL")
                .font(.largeTitle)
            ScrollView(showsIndicators: false) {
                Grid(horizontalSpacing: 25, verticalSpacing: 25) {
                    ForEach(0..<(DataService.shared.solvedLetters.count/2), id: \.self) { i in GridRow {
                        NavigationLink(destination: CameraView(letter: Array(DataService.shared.solvedLetters.keys).sorted()[i * 2],
                                                               learningMode: .alphabet),
                                       label: {
                            LetterButton(letter: Array(DataService.shared.solvedLetters.keys).sorted()[i * 2])
                        })
                        NavigationLink(destination: CameraView(letter: Array(DataService.shared.solvedLetters.keys).sorted()[i * 2 + 1],
                                                               learningMode: .alphabet),
                                       label: {
                            LetterButton(letter: Array(DataService.shared.solvedLetters.keys).sorted()[i * 2 + 1])
                        })
                    }
                    }
                }.padding()
                Spacer()
            }
        }
    }
}

