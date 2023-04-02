//
//  PriceCollectionCell.swift
//  PlantAppHubX
//
//  Created by Mehmet Emre on 2.04.2023.
//

import UIKit

protocol PriceCellProtocol {
    
    func goToHomeScreen()
}

class PriceCollectionCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    //MARK: - Properties
    
    static let priceCellID = "pricecellid"
    var priceDelegate: PriceCellProtocol?
    var featureData: [DummyFeatureData] = DummyFeatureData.fetchFeatureData()
    
    private let featureCollectionView: UICollectionView = {
       
        let featureLayout = UICollectionViewFlowLayout()
        featureLayout.scrollDirection = .horizontal
        let featureCollection = UICollectionView(frame: .zero, collectionViewLayout: featureLayout)
        
        return featureCollection
    }()
    
    let headerView = UIImageView()
    let campaignStackView = CampaignView()
    lazy var dismissButton = UIButton()
    let headerTitleLabel = UILabel()
    let headerDescriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        featureCollectionView.delegate = self
        featureCollectionView.dataSource = self
        featureCollectionView.register(FeatureCollectionCell.self, forCellWithReuseIdentifier: FeatureCollectionCell.featureCellID)
        
        configurePriceCell()
    }
    
    fileprivate func configurePriceCell() {
        
        contentView.backgroundColor = UIColor(displayP3Red: 19/255, green: 27/255, blue: 23/255, alpha: 1.0)
        featureCollectionView.backgroundColor = UIColor(displayP3Red: 19/255, green: 27/255, blue: 23/255, alpha: 1.0)
        let priceLayout = contentView.layoutMarginsGuide
        
        contentView.addSubview(headerView)
        headerView.anchor(top: priceLayout.topAnchor, left: priceLayout.leftAnchor, bottom: nil, right: priceLayout.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        headerView.heightAnchor.constraint(equalTo: priceLayout.heightAnchor, multiplier: 0.4).isActive = true
        headerView.isUserInteractionEnabled = true
        headerView.image = UIImage(named: "plant2")
        headerView.contentMode = .scaleAspectFill
        
        headerView.addSubview(dismissButton)
        dismissButton.setImage(UIImage(named: "dismiss"), for: .normal)
        dismissButton.anchor(top: headerView.topAnchor, left: nil, bottom: nil, right: headerView.rightAnchor, paddingTop: 12, paddingLeft: 0, paddingBottom: 0, paddingRight: 12, width: 32, height: 32)
        dismissButton.addTarget(self, action: #selector(goToMainController), for: .touchUpInside)
        
        headerView.addSubview(headerDescriptionLabel)
        headerDescriptionLabel.anchor(top: nil, left: headerView.leftAnchor, bottom: headerView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: -16, paddingRight: 0, width: 0, height: 0)
        headerDescriptionLabel.font = UIFont(name: "AvenirNext-Medium", size: 18)
        headerDescriptionLabel.textColor = .white
        headerDescriptionLabel.text = "Access All Features"
        
        headerView.addSubview(headerTitleLabel)
        headerTitleLabel.anchor(top: nil, left: headerView.leftAnchor, bottom: headerDescriptionLabel.topAnchor, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: -16, paddingRight: 0, width: 0, height: 0)
        headerTitleLabel.font = UIFont(name: "AvenirNext-Bold", size: 24)
        headerTitleLabel.textColor = .white
        headerTitleLabel.text = "PlantApp Premium"
        
        contentView.addSubview(featureCollectionView)
        featureCollectionView.anchor(top: headerView.bottomAnchor, left: priceLayout.leftAnchor, bottom: nil, right: priceLayout.rightAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 144)
        
        contentView.addSubview(campaignStackView)
        campaignStackView.anchor(top: featureCollectionView.bottomAnchor, left: featureCollectionView.leftAnchor, bottom: nil, right: featureCollectionView.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 242)
        
    }
    
    //Dismiss Button Event
    @objc func goToMainController() {
        
        priceDelegate?.goToHomeScreen()
    }
    
    //MARK: - Configure Feature CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return featureData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let featureCell = collectionView.dequeueReusableCell(withReuseIdentifier: FeatureCollectionCell.featureCellID, for: indexPath) as! FeatureCollectionCell
        let featureInfo = featureData[indexPath.row]
        featureCell.featureInfo = featureInfo
        return featureCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = collectionView.frame.height
        
        return CGSize(width: 166, height: height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


