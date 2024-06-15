//
//  CameraViewController.swift
//  ASL
//
//  Created by Zakhar Litvinchuk on 15.06.2024.
//
import AVFoundation
import UIKit
import Vision
import ARKit
import SwiftUI

enum errors: Error{
    case CameraError
}

class CameraViewController: NSObject, ARSessionDelegate, ARSCNViewDelegate, ObservableObject {
    private let handPoseRequest = VNDetectHumanHandPoseRequest()
    private let handPoseClassifier: MyNewHandPoseClassifier
    @Published var predictionResult: String?
    @Published var errorMessage: String?
    let captureSize = CGSize(width: 224, height: 224)
    private var arSession: ARSession!
    var sceneView: ARSCNView!
    
    override init() {
        do {
            handPoseClassifier = try MyNewHandPoseClassifier(configuration: MLModelConfiguration())
            super.init()
            setupARSession()
        } catch {
            fatalError("Failed to load MLModel")
        }
    }
    
    func setupARSession() {
        arSession = ARSession()
        arSession.delegate = self
        
        // Set up the ARSCNView
        sceneView = ARSCNView()
        sceneView.session = arSession
        sceneView.delegate = self
        
        let configuration = ARBodyTrackingConfiguration()
        arSession.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        let pixelBuffer = frame.capturedImage
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .up, options: [:])
        handPoseRequest.maximumHandCount = 1
        handPoseRequest.revision = VNDetectContourRequestRevision1
        do {
            try handler.perform([handPoseRequest])
            
            guard let observation = handPoseRequest.results?.first else {
                return
            }
            guard let keypointsMultiArray = try? observation.keypointsMultiArray()
            else { fatalError() }
            let output: MyNewHandPoseClassifierOutput = try handPoseClassifier.prediction(poses: keypointsMultiArray)
            
            print(output.label)
            
            DispatchQueue.main.async {
                self.predictionResult = output.label
            }
        } catch let e {
            arSession.pause()
            self.errorMessage = e.localizedDescription
            fatalError(e.localizedDescription)
        }
    }
}
