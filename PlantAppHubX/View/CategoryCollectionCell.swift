//
//  CategoryCollectionCell.swift
//  PlantAppHubX
//
//  Created by Mehmet Emre on 2.04.2023.
//

import Foundation
import UIKit

class CategoryCollectionCell: UICollectionViewCell {
    
    static let categoryCellID = "categorycellid"
    let categoryImageView = CustomImageView()
    let categoryTitleLabel = UILabel()
    
    //MARK: Placing Category Information
    
    var categoryInfo: CategoryData! {
        
        didSet {
            
            categoryTitleLabel.text = categoryInfo.title
            categoryImageView.loadImageUsingUrlString(urlString: categoryInfo.image.url)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCategoryCell()
    }
    
    fileprivate func configureCategoryCell() {
        
        contentView.backgroundColor = UIColor(displayP3Red: 248/255, green: 251/255, blue: 255/255, alpha: 1.0)
        let categoryLayout = contentView.layoutMarginsGuide
        
        contentView.addSubview(categoryImageView)
        categoryImageView.anchor(top: nil, left: nil, bottom: categoryLayout.bottomAnchor, right: categoryLayout.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 122, height: 0)
        categoryImageView.clipsToBounds = true
        categoryImageView.contentMode = .scaleAspectFit
        
        contentView.addSubview(categoryTitleLabel)
        categoryTitleLabel.anchor(top: categoryLayout.topAnchor, left: categoryLayout.leftAnchor, bottom: nil, right: categoryLayout.rightAnchor, paddingTop: 4, paddingLeft: 4, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        categoryTitleLabel.textColor = .black
        categoryTitleLabel.numberOfLines = 0
        categoryTitleLabel.font = UIFont(name: "AvenirNext-Bold", size: 16)
        categoryTitleLabel.textAlignment = .left
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
