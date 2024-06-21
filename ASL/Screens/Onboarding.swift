//
//  Onboarding.swift
//  ASL
//
//  Created by Zakhar Litvinchuk on 21.06.2024.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image(systemName: "globe")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.yellow)
                Text("ASL Explorer")
                    .font(.title)
                    .bold()
                VStack {
                    NavigationLink(destination: {
                        ExamplesListView()
                    }, label: {
                        createButton(title: "Examples")
                    })
                    NavigationLink(destination: {
                        AlphabetView()
                    }, label: {
                        createButton(title: "Alphabet")
                    })
                    NavigationLink(destination: {
                        
                    }, label: {
                        createButton(title: "Random")
                    })
                }
                .padding(.top, 40)
                Spacer()
            }
        }
    }
    
    @ViewBuilder
    private func createButton(title: String) -> some View {
        Text(title)
            .font(.title2)
            .bold()
            .foregroundStyle(.white)
            .frame(width: 200, height: 50)
            .background(.yellow)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
