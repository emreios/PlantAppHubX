//
//  BoardingCollectionCell.swift
//  PlantAppHubX
//
//  Created by Mehmet Emre on 2.04.2023.
//

import UIKit

protocol SwipeLeftProtocol {
    
    func swipeLeft()
}

class BoardingCollectionCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    static let boardingCellID = "boardingcellid"
    let continueButton = CustomLandingButton()
    let boardingTitleLabel = UILabel()
    var swipeDelegate: SwipeLeftProtocol?
    let boardingImageView = UIImageView()
    
    //MARK: Set Page Info With Dummy Data
    
    var pageInfo: DummyBoardingData! {
        
        didSet {
            boardingImageView.image = UIImage(named: pageInfo.pageImage)
            boardingTitleLabel.text = pageInfo.pageText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureBoardingCell()
    }
    
    fileprivate func configureBoardingCell() {
        
        contentView.backgroundColor = UIColor(displayP3Red: 248/255, green: 251/255, blue: 255/255, alpha: 1.0)
        let layoutGuide = contentView.layoutMarginsGuide
        
        contentView.addSubview(boardingImageView)
        boardingImageView.anchor(top: layoutGuide.topAnchor, left: layoutGuide.leftAnchor, bottom: layoutGuide.bottomAnchor, right: layoutGuide.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        boardingImageView.clipsToBounds = true
        boardingImageView.contentMode = .scaleAspectFill
        
        contentView.addSubview(continueButton)
        continueButton.anchor(top: nil, left: nil, bottom: layoutGuide.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: -38, paddingRight: 0, width: 0, height: 48)
        continueButton.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor, constant: 0.0).isActive = true
        continueButton.widthAnchor.constraint(equalTo: layoutGuide.widthAnchor, multiplier: 0.7).isActive = true
        
        continueButton.setTitle("Continue", for: .normal)
        continueButton.addTarget(self, action: #selector(handleSwipeLeft), for: .touchUpInside)
        
        contentView.addSubview(boardingTitleLabel)
        boardingTitleLabel.anchor(top: layoutMarginsGuide.topAnchor, left: continueButton.leftAnchor, bottom: nil, right: continueButton.rightAnchor, paddingTop: 48, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        boardingTitleLabel.textAlignment = .left
        boardingTitleLabel.textColor = .black
        boardingTitleLabel.numberOfLines = 2
        boardingTitleLabel.font = UIFont(name: "AvenirNext-Bold", size: 18)
    }
    
    @objc func handleSwipeLeft() {
        swipeDelegate?.swipeLeft()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

