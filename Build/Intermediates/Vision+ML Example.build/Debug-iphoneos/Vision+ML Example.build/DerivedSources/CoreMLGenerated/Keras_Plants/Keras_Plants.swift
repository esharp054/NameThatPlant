//
// Keras_Plants.swift
//
// This file was automatically generated and should not be edited.
//

import CoreML


/// Model Prediction Input Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class Keras_PlantsInput : MLFeatureProvider {

    /// image as color (kCVPixelFormatType_32BGRA) image buffer, 150 pixels wide by 150 pixels high
    var image: CVPixelBuffer
    
    var featureNames: Set<String> {
        get {
            return ["image"]
        }
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "image") {
            return MLFeatureValue(pixelBuffer: image)
        }
        return nil
    }
    
    init(image: CVPixelBuffer) {
        self.image = image
    }
}


/// Model Prediction Output Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class Keras_PlantsOutput : MLFeatureProvider {

    /// output1 as dictionary of strings to doubles
    let output1: [String : Double]

    /// classLabel as string value
    let classLabel: String
    
    var featureNames: Set<String> {
        get {
            return ["output1", "classLabel"]
        }
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "output1") {
            return try! MLFeatureValue(dictionary: output1 as [NSObject : NSNumber])
        }
        if (featureName == "classLabel") {
            return MLFeatureValue(string: classLabel)
        }
        return nil
    }
    
    init(output1: [String : Double], classLabel: String) {
        self.output1 = output1
        self.classLabel = classLabel
    }
}


/// Class for model loading and prediction
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class Keras_Plants {
    var model: MLModel

    /**
        Construct a model with explicit path to mlmodel file
        - parameters:
           - url: the file url of the model
           - throws: an NSError object that describes the problem
    */
    init(contentsOf url: URL) throws {
        self.model = try MLModel(contentsOf: url)
    }

    /// Construct a model that automatically loads the model from the app's bundle
    convenience init() {
        let bundle = Bundle(for: Keras_Plants.self)
        let assetPath = bundle.url(forResource: "Keras_Plants", withExtension:"mlmodelc")
        try! self.init(contentsOf: assetPath!)
    }

    /**
        Make a prediction using the structured interface
        - parameters:
           - input: the input to the prediction as Keras_PlantsInput
        - throws: an NSError object that describes the problem
        - returns: the result of the prediction as Keras_PlantsOutput
    */
    func prediction(input: Keras_PlantsInput) throws -> Keras_PlantsOutput {
        let outFeatures = try model.prediction(from: input)
        let result = Keras_PlantsOutput(output1: outFeatures.featureValue(for: "output1")!.dictionaryValue as! [String : Double], classLabel: outFeatures.featureValue(for: "classLabel")!.stringValue)
        return result
    }

    /**
        Make a prediction using the convenience interface
        - parameters:
            - image as color (kCVPixelFormatType_32BGRA) image buffer, 150 pixels wide by 150 pixels high
        - throws: an NSError object that describes the problem
        - returns: the result of the prediction as Keras_PlantsOutput
    */
    func prediction(image: CVPixelBuffer) throws -> Keras_PlantsOutput {
        let input_ = Keras_PlantsInput(image: image)
        return try self.prediction(input: input_)
    }
}
