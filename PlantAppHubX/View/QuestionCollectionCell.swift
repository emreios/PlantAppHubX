//
//  QuestionCollectionCell.swift
//  PlantAppHubX
//
//  Created by Mehmet Emre on 2.04.2023.
//

import Foundation
import UIKit

class QuestionCollectionCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    static let questionCellID = "questioncellid"
    let questionImageView = CustomImageView()
    let questionTitleLabel = UILabel()
    
    //MARK: Placing Question Information
    
    var questionInfo: QuestionModelData! {
        
        didSet {
            
            questionTitleLabel.text = questionInfo.title
            questionImageView.loadImageUsingUrlString(urlString: questionInfo.imageURI)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureQuestionCell()
    }
    
    fileprivate func configureQuestionCell() {
        contentView.backgroundColor = UIColor(displayP3Red: 248/255, green: 251/255, blue: 255/255, alpha: 1.0)
        
        let questionLayout = contentView.layoutMarginsGuide
        
        contentView.addSubview(questionImageView)
        questionImageView.anchor(top: questionLayout.topAnchor, left: questionLayout.leftAnchor, bottom: questionLayout.bottomAnchor, right: questionLayout.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        questionImageView.backgroundColor = .red
        questionImageView.contentMode = .scaleAspectFill
        questionImageView.clipsToBounds = true
        questionImageView.layer.cornerRadius = 12.0
        
        contentView.addSubview(questionTitleLabel)
        questionTitleLabel.anchor(top: nil, left: questionLayout.leftAnchor, bottom: questionLayout.bottomAnchor, right: questionLayout.rightAnchor, paddingTop: 0, paddingLeft: 6, paddingBottom: -4, paddingRight: 6, width: 0, height: 0)
        questionTitleLabel.textAlignment = .left
        questionTitleLabel.numberOfLines = 0
        questionTitleLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 14)
        questionTitleLabel.textColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

