//
//  ContentView.swift
//  ASL
//
//  Created by Zakhar Litvinchuk on 15.06.2024.
//

import SwiftUI

struct MainScreen: View {
    @ObservedObject var aslViewModel = ASLViewModel()

    init() {
        for letter in aslViewModel.letters {
            print("\(letter.letter), isGuessed: \(letter.isGuessed)")
        }
    }

    var body: some View {
        NavigationStack {
            Text("Learn ASL")
                .font(.largeTitle)
            ScrollView {
                Grid(horizontalSpacing: 25, verticalSpacing: 25) {
                    ForEach(0 ..< aslViewModel.letters.count / 2, id: \.self) { i in GridRow {
                        NavigationLink(value: aslViewModel.letters[i * 2],
                                       label: {
                                           LetterButton(letterViewModel: aslViewModel.letters[i * 2])
                                       })
                        NavigationLink(value: aslViewModel.letters[i * 2 + 1],
                                       label: {
                                           LetterButton(letterViewModel: aslViewModel.letters[i * 2 + 1])
                                       })
                    }
                    }
                }.padding()
                Spacer()
            }
            .navigationDestination(for: LetterViewModel.self,
                                   destination: { CameraView(letter: $0) })
        }
    }
}

#Preview {
    MainScreen()
}
