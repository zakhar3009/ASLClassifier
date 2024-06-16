//
//  CameraView.swift
//  ASL
//
//  Created by Zakhar Litvinchuk on 16.06.2024.
//

import SwiftUI
enum Answer {
    case right
    case almost
    case wrong
    case `default`
}

struct CameraView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var letter: LetterViewModel
    @State var answer = Answer.default
    
    var body: some View {
        ZStack {
            ImagePickerView(letterViewModel: letter, answer: $answer)
                .ignoresSafeArea(.all)
                .navigationBarBackButtonHidden(true)
            VStack(alignment: .center) {
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
                Spacer()
                if answer != .default {
                    AnswerView(answer: answer)
                        .transition(.opacity)
                        .onAppear {
                            if answer == .right {
                                letter.isGuessed = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                }
                Spacer()
            }
            .animation(.easeInOut, value: answer)
        }
    }
}
