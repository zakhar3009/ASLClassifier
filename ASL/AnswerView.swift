//
//  AnswerView.swift
//  ASL
//
//  Created by Zakhar Litvinchuk on 16.06.2024.
//

import SwiftUI

struct AnswerView: View {
    let answer: Answer
    var body: some View {
        VStack {
            if answer == .right {
                Text("That's correct! Great job!👍")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(width: 250, height: 250)
                    .background(.green)
                    .clipShape(Circle())
            }
            if answer == .almost {
                Text("Almost right! A tiny correction needed🙃")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(width: 250, height: 250)
                    .background(.yellow)
                    .clipShape(Circle())
            }
            if answer == .wrong {
                Text("That's not correct, plese try again!🤞")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(width: 250, height: 250)
                    .background(.red)
                    .clipShape(Circle())
            }
        }
        .padding(.bottom, 50)
    }
}

#Preview {
    AnswerView(answer: .wrong)
}
