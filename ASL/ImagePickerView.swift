//
//  File.swift
//  ASL
//
//  Created by Zakhar Litvinchuk on 15.06.2024.
//

import ARKit
import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    @ObservedObject var letterViewModel: LetterViewModel
    @Binding var answer: Answer

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = context.coordinator
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(handPoseClassifier: ASLClassifier(), letter: letterViewModel.letter, answer: $answer)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        @Binding var answer: Answer
        let handPoseClassifier: ASLClassifier
        let letter: String

        init(handPoseClassifier: ASLClassifier, letter: String, answer: Binding<Answer>) {
            self.letter = letter
            self.handPoseClassifier = handPoseClassifier
            self._answer = answer
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                if let resultProbabilities = handPoseClassifier.detectSign(handImage: image) {
                    let sortedProbabilities = resultProbabilities.sorted(by: { $0.value > $1.value })
                    let result = Array(sortedProbabilities.prefix(5))
                    print(result)
                    if result[0].key == letter {
                        answer = .right
                        return
                    }
                    for i in 1..<result.count {
                        if result[i].key == letter {
                            answer = .almost
                            return
                        }
                    }
                    answer = .wrong
                }
            }
            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}
