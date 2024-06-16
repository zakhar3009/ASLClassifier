//
//  CameraViewController.swift
//  ASL
//
//  Created by Zakhar Litvinchuk on 15.06.2024.
//
import ARKit
import AVFoundation
import SwiftUI
import UIKit
import Vision

enum errors: Error {
    case CameraError
}

class ASLClassifier: ObservableObject {
    private let handPoseRequest = VNDetectHumanHandPoseRequest()
    private let handPoseClassifier: MyHandPoseClassifier
    @Published var predictionResult: String?
    @Published var errorMessage: String?

    init() {
        do {
            handPoseClassifier = try MyHandPoseClassifier(configuration: MLModelConfiguration())
        } catch {
            fatalError("Failed to load MLModel")
        }
    }

    func detectSign(handImage: UIImage) -> [String: Double]? {
        if let pixelBuffer = handImage.toCVPixelBuffer() {
            let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .up, options: [:])
            handPoseRequest.maximumHandCount = 1
            handPoseRequest.revision = VNDetectContourRequestRevision1
            do {
                try handler.perform([handPoseRequest])
                guard let observation = handPoseRequest.results?.first else {
                    return nil
                }
                guard let keypointsMultiArray = try? observation.keypointsMultiArray()
                else { fatalError() }
                let output: MyHandPoseClassifierOutput = try handPoseClassifier.prediction(poses: keypointsMultiArray)
                return output.labelProbabilities
            } catch let e {
                self.errorMessage = e.localizedDescription
                fatalError(e.localizedDescription)
            }
        }
        return nil
    }
}
