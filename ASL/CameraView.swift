//
//  File.swift
//  ASL
//
//  Created by Zakhar Litvinchuk on 15.06.2024.
//

import SwiftUI
import ARKit

struct ARViewContainer: UIViewControllerRepresentable {
    @ObservedObject var handPoseClassifier: CameraViewController
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let image = UIImagePickerController()
        //image.delegate = self
        image.sourceType = .camera;
        return image
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
//    func makeUIView(context: Context) -> ARSCNView {
//        
//    }
//    
//    func updateUIView(_ uiView: ARSCNView, context: Context) {}
}

