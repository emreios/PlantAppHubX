//
//  BoardingCollectionView.swift
//  PlantAppHubX
//
//  Created by Mehmet Emre on 2.04.2023.
//

import Foundation
import UIKit

class BoardingCollectionView: UICollectionViewController, UICollectionViewDelegateFlowLayout,SwipeLeftProtocol, PriceCellProtocol {
    
    //MARK: - Properties
    
    var boardingData: [DummyBoardingData] = DummyBoardingData.fetchPageData()
    private lazy var boardingPageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
    }
    
    fileprivate func configureCollectionView() {
        
        collectionView.backgroundColor = UIColor(displayP3Red: 248/255, green: 251/255, blue: 255/255, alpha: 1.0)
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.isPagingEnabled = true
        collectionView.register(BoardingCollectionCell.self, forCellWithReuseIdentifier: BoardingCollectionCell.boardingCellID)
        collectionView.register(PriceCollectionCell.self, forCellWithReuseIdentifier: PriceCollectionCell.priceCellID)
        
        boardingPageControl.numberOfPages = boardingData.count + 1
        boardingPageControl.currentPage = 0
        boardingPageControl.numberOfPages = boardingData.count + 1
        boardingPageControl.currentPageIndicatorTintColor = .green
        boardingPageControl.pageIndicatorTintColor = .darkGray
        
        collectionView.addSubview(boardingPageControl)
        boardingPageControl.translatesAutoresizingMaskIntoConstraints = false
        boardingPageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0).isActive = true
        boardingPageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8.0).isActive = true
        
    }
    
    //MARK: - Configuration CollectionViewController
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return boardingData.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        
        return CGSize(width: width, height: height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let index = indexPath.row
        
        switch index {
            
        case 0...1:
            let boardingCell = collectionView.dequeueReusableCell(withReuseIdentifier: BoardingCollectionCell.boardingCellID, for: indexPath) as! BoardingCollectionCell
            
            let pageInfos = boardingData[indexPath.row]
            boardingCell.pageInfo = pageInfos
            boardingCell.swipeDelegate = self
            
            return boardingCell
            
        default:
            let priceCell = collectionView.dequeueReusableCell(withReuseIdentifier: PriceCollectionCell.priceCellID, for: indexPath) as! PriceCollectionCell
            priceCell.priceDelegate = self
            return priceCell
        }
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        boardingPageControl.currentPage = Int(x / view.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    //MARK: - Boarding Cell Delegate Function
    
    func swipeLeft() {
        
        let collectionBounds = self.collectionView.bounds
        let contentOffset = CGFloat(floor(self.collectionView.contentOffset.x + collectionBounds.size.width))
        boardingPageControl.currentPage += 1
        self.moveCollectionWithButton(contentOffset: contentOffset)
    }
    func moveCollectionWithButton(contentOffset : CGFloat) {

        let frame: CGRect = CGRect(x : contentOffset ,y : self.collectionView.contentOffset.y ,width : self.collectionView.frame.width,height : self.collectionView.frame.height)
     
        self.collectionView.scrollRectToVisible(frame, animated: true)
     }
 
    //Hide "boardingPageControl" in last cell
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

        if indexPath.row == 2 {
            boardingPageControl.isHidden = true
        } else {
            boardingPageControl.isHidden = false
        }
    }
    
    //MARK: Go To Main Screen
    
    func goToHomeScreen() {
        
        let homeController = MainTabBarController()
        sceneDelegate.window?.rootViewController = homeController
    }
}

