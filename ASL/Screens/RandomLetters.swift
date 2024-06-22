//
//  RandomLetters.swift
//  ASL
//
//  Created by Zakhar Litvinchuk on 22.06.2024.
//

import SwiftUI

struct RandomLettersView: View {
    let letter: String = Array(DataService.shared.solvedLetters.keys).randomElement()!
    @State var letterIsVisible = false
    @State var buttonsIsVisible = false
    var body: some View {
        ZStack {
            CameraView(letter: letter,
                       learningMode: .random)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    letterIsVisible = true
                })
            }
            VStack {
                if letterIsVisible {
                    Text(letter)
                        .font(.system(size: 150))
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.bottom, 40)
                        .transition(.opacity)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                                letterIsVisible = false
                                buttonsIsVisible = true
                            })
                        }
                }
            }
            .animation(.easeInOut, value: letterIsVisible)
            VStack {
                Spacer()
                HStack {
                    if buttonsIsVisible {
                        NavigationLink(destination: {
                            OnboardingView()
                        }, label: {
                            Text("Back")
                                .font(.title2)
                                .bold()
                                .foregroundStyle(.white)
                                .frame(width: 150, height: 50)
                                .background(.yellow)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .transition(.opacity)
                        })
                        Spacer()
                        NavigationLink(destination: {
                            RandomLettersView()
                        }, label: {
                            Text("Next")
                                .font(.title2)
                                .bold()
                                .foregroundStyle(.white)
                                .frame(width: 150, height: 50)
                                .background(.yellow)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .transition(.opacity)
                        })
                    }
                }
                .animation(.easeInOut, value: letterIsVisible)
            }
            .animation(.easeInOut, value: letterIsVisible)
            .padding(.bottom, 180)
        }
    }
}

#Preview {
    RandomLettersView()
}
