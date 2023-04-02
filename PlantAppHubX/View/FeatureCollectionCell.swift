//
//  FeatureCollectionCell.swift
//  PlantAppHubX
//
//  Created by Mehmet Emre on 2.04.2023.
//

import UIKit

class FeatureCollectionCell: UICollectionViewCell {
    
    static let featureCellID = "featurecellid"
    
    let featureTitleLabel = UILabel()
    let featureDescriptionLabel = UILabel()
    let featureImageView = UIImageView()
    
    var featureInfo: DummyFeatureData! {
        
        didSet {
            
            featureTitleLabel.text = featureInfo.featureTitle
            featureDescriptionLabel.text = featureInfo.featureText
            featureImageView.image = UIImage(named: featureInfo.featureImage)
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureFeatureCell()
    }
    
    fileprivate func configureFeatureCell() {
        contentView.backgroundColor = UIColor(displayP3Red: 33/255, green: 42/255, blue: 38/255, alpha: 1.0)
        let featureLayout = contentView.layoutMarginsGuide
        
        contentView.addSubview(featureImageView)
        featureImageView.anchor(top: featureLayout.topAnchor, left: featureLayout.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 4, paddingBottom: 0, paddingRight: 0, width: 44, height: 44)
        featureImageView.contentMode = .scaleAspectFit
        
        contentView.addSubview(featureTitleLabel)
        featureTitleLabel.anchor(top: featureImageView.bottomAnchor, left: featureLayout.leftAnchor, bottom: nil, right: nil, paddingTop: 12, paddingLeft: 6, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        featureTitleLabel.font = UIFont(name: "AvenirNext-Bold", size: 16)
        featureTitleLabel.textColor = .white
        
        contentView.addSubview(featureDescriptionLabel)
        featureDescriptionLabel.anchor(top: featureTitleLabel.bottomAnchor, left: featureLayout.leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 6, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        featureDescriptionLabel.font = UIFont(name: "AvenirNext-MediumItalic", size: 14)
        featureDescriptionLabel.textColor = .white
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

