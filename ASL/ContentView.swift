//
//  ContentView.swift
//  ASL
//
//  Created by Zakhar Litvinchuk on 15.06.2024.
//

import SwiftUI

struct ContentView: View {
    let letters = [Letter(letter: "A", isGuessed: false), Letter(letter: "C", isGuessed: false), Letter(letter: "L", isGuessed: false), Letter(letter: "T", isGuessed: false)]

    var body: some View {
        NavigationStack {
            Text("Learn ASL").font(.largeTitle)

            Grid(horizontalSpacing: 25, verticalSpacing: 25) {
                ForEach(0 ..< letters.count / 2, id: \.self) { i in
                    GridRow {
                        NavigationLink(destination: {
                            ImagePickerView(letter: letters[i * 2].letter)
                        }, label: {
                            LetterButton(letter: letters[i * 2])
                        })

                        NavigationLink(destination: {
                            ImagePickerView(letter: letters[i * 2 + 1].letter)
                        }, label: {
                            LetterButton(letter: letters[i * 2 + 1])
                        })
                    }
                }
            }.padding()
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
