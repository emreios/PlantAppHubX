//
//  DummyBoardingData.swift
//  PlantAppHubX
//
//  Created by Mehmet Emre on 2.04.2023.
//

import UIKit

struct DummyBoardingData {
    
    let pageImage : String
    let pageText : String
    
    static func fetchPageData() -> [DummyBoardingData] {
        
        let page1 = DummyBoardingData(pageImage: "plant3", pageText: "Take a photo to identify the plant!")
        let page2 = DummyBoardingData(pageImage: "plant3", pageText: "Get plant care guides")

        return [page1,page2]
    }
}

