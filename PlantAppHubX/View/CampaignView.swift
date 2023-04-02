//
//  CampaignView.swift
//  PlantAppHubX
//
//  Created by Mehmet Emre on 2.04.2023.
//

import Foundation
import UIKit

class CampaignView: UIView {
    
    let monthView = UIView()
    let yearView = UIView()
    let tryFreeButton = CustomLandingButton()
    let monthLabel = UILabel()
    let monthDescriptionLabel = UILabel()
    let yearLabel = UILabel()
    let yearDescriptionLabel = UILabel()
    let selectImageView = UIImageView()
    let selectedImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configurueCampaignView()
    }
    
    fileprivate func configurueCampaignView() {
        
        backgroundColor = UIColor(displayP3Red: 19/255, green: 27/255, blue: 23/255, alpha: 1.0)
        monthView.backgroundColor = UIColor(displayP3Red: 33/255, green: 42/255, blue: 38/255, alpha: 1.0)
        yearView.backgroundColor = UIColor(displayP3Red: 33/255, green: 42/255, blue: 38/255, alpha: 1.0)
        
        addSubview(monthView)
        monthView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 70)
        monthView.layer.cornerRadius = 12.0
        
        monthView.addSubview(selectImageView)
        selectImageView.anchor(top: nil, left: monthView.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 22, height: 22)
        selectImageView.centerYAnchor.constraint(equalTo: monthView.centerYAnchor, constant: 0.0).isActive = true
        selectImageView.image = UIImage(named: "uncheck")
        selectImageView.contentMode = .scaleAspectFit
        
        monthView.addSubview(monthLabel)
        monthLabel.anchor(top: nil, left: selectImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        monthLabel.centerYAnchor.constraint(equalTo: monthView.centerYAnchor, constant: 0.0).isActive = true
        monthLabel.text = "1 Month"
        monthLabel.textColor = .white
        monthLabel.font = UIFont(name: "AvenirNext-Bold", size: 14)

        monthView.addSubview(monthDescriptionLabel)
        monthDescriptionLabel.anchor(top: monthLabel.bottomAnchor, left: monthLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 2, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        monthDescriptionLabel.text = "€2.99/month, auto-renewable"
        monthDescriptionLabel.textColor = .gray
        monthDescriptionLabel.font = UIFont(name: "AvenirNext-MediumItalic", size: 12)
        
        addSubview(yearView)
        yearView.anchor(top: monthView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 70)
        yearView.layer.cornerRadius = 12.0
        yearView.layer.borderWidth = 1.0
        yearView.layer.borderColor = UIColor.green.cgColor
        
        yearView.addSubview(selectedImageView)
        selectedImageView.anchor(top: nil, left: yearView.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 22, height: 22)
        selectedImageView.centerYAnchor.constraint(equalTo: yearView.centerYAnchor, constant: 0.0).isActive = true
        selectedImageView.image = UIImage(named: "check")
        selectedImageView.contentMode = .scaleAspectFit
        
        yearView.addSubview(yearLabel)
        yearLabel.anchor(top: nil, left: selectedImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        yearLabel.centerYAnchor.constraint(equalTo: yearView.centerYAnchor, constant: 0.0).isActive = true
        yearLabel.text = "1 Year"
        yearLabel.textColor = .white
        yearLabel.font = UIFont(name: "AvenirNext-Bold", size: 14)
        
        yearView.addSubview(yearDescriptionLabel)
        yearDescriptionLabel.anchor(top: yearLabel.bottomAnchor, left: yearLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 2, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        yearDescriptionLabel.text = "First 3 days free, then €529,99/year "
        yearDescriptionLabel.textColor = .gray
        yearDescriptionLabel.font = UIFont(name: "AvenirNext-MediumItalic", size: 12)

        addSubview(tryFreeButton)
        tryFreeButton.setTitle("Try free for 3 days", for: .normal)
        tryFreeButton.anchor(top: yearView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 12, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 48)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

