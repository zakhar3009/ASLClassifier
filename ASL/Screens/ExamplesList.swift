//
//  Examples.swift
//  ASL
//
//  Created by Zakhar Litvinchuk on 21.06.2024.
//

import SwiftUI

struct ExamplesListView: View {
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<DataService.shared.solvedLetters.count, id: \.self) { index in
                    NavigationLink(destination: {
                        ExampleView(letter: Array(DataService.shared.solvedLetters.keys).sorted()[index])
                    }, label: {
                        Text(Array(DataService.shared.solvedLetters.keys).sorted()[index])
                            .font(.title2)
                            .bold()
                    })
                }
            }
        }
    }
}

struct ExampleView: View {
    let letter: String
    
    var body: some View {
        VStack {
            Text(letter)
                .font(.system(size: 60, weight: .heavy))
            Image(letter)
                .resizable()
                .frame(maxWidth: .infinity)
                .frame(height: 400)
            Spacer()
        }
    }
}

#Preview {
    ExamplesListView()
}
