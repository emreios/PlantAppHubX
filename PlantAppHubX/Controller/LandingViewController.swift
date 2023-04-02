//
//  ViewController.swift
//  PlantAppHubX
//
//  Created by Mehmet Emre on 2.04.2023.
//

import UIKit

class LandingViewController: UIViewController {
    
    //MARK: - Properties
    let backgroundImageView = UIImageView()
    let termsLabel = UILabel()
    let startButton = CustomLandingButton()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(displayP3Red: 248/255, green: 251/255, blue: 255/255, alpha: 1.0)
        
        setLandingConstraints()
        configureProperties()
    }
    
    fileprivate func configureProperties() {
        
        termsLabel.numberOfLines = 2
        termsLabel.textAlignment = .center
        termsLabel.font = UIFont(name: "AvenirNext-Medium", size: 10)
        termsLabel.textColor = .gray
        termsLabel.text = "By tapping next, you are agreeing to PlantID\nTerms of use & Privacy Policy"
        
        startButton.setTitle("Get Started", for: .normal)
        startButton.addTarget(self, action: #selector(pushtoBoarding), for: .touchUpInside)
        
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont(name: "AvenirNext-Heavy", size: 22)
        titleLabel.text = "Welcome to PlantApp"
        titleLabel.textColor = .black
        
        descriptionLabel.textAlignment = .left
        descriptionLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
        descriptionLabel.text = "Identify more than 3000+ plants and\n 88% accuracy."
        descriptionLabel.textColor = .black
        descriptionLabel.numberOfLines = 2
    }
    
    //MARK: - Push To Boarding Controller
    
    @objc func pushtoBoarding() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let boardingController = BoardingCollectionView(collectionViewLayout: layout)
        boardingController.modalPresentationStyle = .fullScreen
        self.present(boardingController, animated: true)
    }

    fileprivate func setLandingConstraints() {
        
        view.addSubview(backgroundImageView)
        backgroundImageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.image = UIImage(named: "plant")
        
        view.addSubview(termsLabel)
        termsLabel.anchor(top: nil, left: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: -24, paddingRight: 0, width: 0, height: 0)
        termsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0).isActive = true
        termsLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.66).isActive = true
        
        view.addSubview(startButton)
        startButton.anchor(top: nil, left: nil, bottom: termsLabel.topAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: -12, paddingRight: 0, width: 0, height: 48)
        startButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0).isActive = true
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: startButton.leftAnchor, bottom: nil, right: startButton.rightAnchor, paddingTop: 24, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(descriptionLabel)
        descriptionLabel.anchor(top: titleLabel.bottomAnchor, left: titleLabel.leftAnchor, bottom: nil, right: titleLabel.rightAnchor, paddingTop: 12, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }

}
