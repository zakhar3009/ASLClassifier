//
//  ContentView.swift
//  ASL
//
//  Created by Zakhar Litvinchuk on 15.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: {
                ImagePickerView()
            }, label: {
                Text("Make photo")
                    .foregroundStyle(.black)
                    .frame(width: 100, height: 50)
                    .background(.blue)
            })
        }
    }
}


#Preview {
    ContentView()
}
