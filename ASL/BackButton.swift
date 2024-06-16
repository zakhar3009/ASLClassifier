//
//  BackButton.swift
//  ASL
//
//  Created by Zakhar Litvinchuk on 16.06.2024.
//

import SwiftUI

struct BackButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(.black.opacity(0.5))
                .frame(width: 44, height: 44)
            Image(systemName: "arrow.backward")
                .foregroundStyle(.white)
                .frame(width: 44, height: 44)
                .background(Color.white.opacity(0.15))
                .clipShape(Circle())
        }
    }
}

