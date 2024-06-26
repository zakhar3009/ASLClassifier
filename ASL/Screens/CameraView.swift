//
//  CameraView.swift
//  ASL
//
//  Created by Zakhar Litvinchuk on 16.06.2024.
//

import SwiftUI

enum Answer: Codable {
    case right
    case almost
    case wrong
    case `default`
}

enum LearningMode {
    case alphabet
    case random
}

struct CameraView: View {
    @Environment(\.presentationMode) var presentationMode
    let letter: String
    let learningMode: LearningMode
    @State var answer = Answer.default

    var body: some View {
        ZStack {
            ImagePickerView(letter: letter, answer: $answer)
                .ignoresSafeArea(.all)
                .navigationBarBackButtonHidden(true)
            VStack(alignment: .center) {
                if learningMode == .alphabet {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            BackButtonView()
                                .padding(.top, 40)
                        })
                        Spacer()
                    }
                    .padding(.top, 40)
                    .padding(.horizontal, 5)
                }
                Spacer()
                if answer != .default {
                    AnswerView(answer: answer)
                        .transition(.opacity)
                        .onAppear {
                            DataService.shared.solvedLetters[letter]!.append(answer)
                            print(DataService.shared.solvedLetters)
                            if learningMode == .alphabet {
                                print("\(letter) = \(answer)")
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            }
                        }
                }
                Spacer()
            }
            .animation(.easeInOut, value: answer)
        }
    }
}
