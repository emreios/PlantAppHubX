//
//  CustomLandingButton.swift
//  PlantAppHubX
//
//  Created by Mehmet Emre on 2.04.2023.
//


import Foundation
import UIKit

class CustomLandingButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUIButton()
    }
    
    func setUIButton() {
        
        titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 18)
        backgroundColor = UIColor(displayP3Red: 59/255, green: 161/255, blue: 104/255, alpha: 1.0)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 12.0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

