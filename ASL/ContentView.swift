//
//  ContentView.swift
//  ASL
//
//  Created by Zakhar Litvinchuk on 15.06.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var handPoseClassifier = CameraViewController()
    
    var body: some View {
        ZStack {
            ARViewContainer(handPoseClassifier: handPoseClassifier)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                if let predictionResult = handPoseClassifier.predictionResult {
                    Text("Prediction: \(predictionResult)")
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
