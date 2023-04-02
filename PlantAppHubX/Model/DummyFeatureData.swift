//
//  DummyFeatureData.swift
//  PlantAppHubX
//
//  Created by Mehmet Emre on 2.04.2023.
//

import UIKit

struct DummyFeatureData {
    
    let featureImage : String
    let featureTitle : String
    let featureText : String
    
    static func fetchFeatureData() -> [DummyFeatureData] {
        
        let feature1 = DummyFeatureData(featureImage: "scan", featureTitle: "Unlimited", featureText: "Plant Identify")
        let feature2 = DummyFeatureData(featureImage: "speed", featureTitle: "Faster", featureText: "Process")
        let feature3 = DummyFeatureData(featureImage: "dismiss", featureTitle: "Limited", featureText: "Identify")

        return [feature1,feature2,feature3]
    }
}
