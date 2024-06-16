//
//  File.swift
//  ASL
//
//  Created by Zakhar Litvinchuk on 15.06.2024.
//

import ARKit
import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    let letter: String

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = context.coordinator
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(handPoseClassifier: ASLClassifier())
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let handPoseClassifier: ASLClassifier

        init(handPoseClassifier: ASLClassifier) {
            self.handPoseClassifier = handPoseClassifier
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                if let resultProbabilities = handPoseClassifier.detectSign(handImage: image) {
                    let sortedProbabilities = resultProbabilities.sorted(by: { $0.value > $1.value })
                    let result = Array(sortedProbabilities.prefix(5))
                }
            }
            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}
