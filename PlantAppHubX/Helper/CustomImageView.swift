//
//  CustomImageView.swift
//  PlantAppHubX
//
//  Created by Mehmet Emre on 2.04.2023.
//

import Foundation
import UIKit

//MARK: - Load Image From URL

let imageCache = NSCache<NSString, UIImage>()

class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageUsingUrlString(urlString: String) {

        imageUrlString = urlString
        guard let url = URL(string: urlString) else { return }

        self.image = nil

        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {

            self.image = imageFromCache
            
            return
        }

        URLSession.shared.dataTask(with: url) { (data , response, error) in

            if error != nil {

                 print("error")
                return
            }

           DispatchQueue.main.async {

                let imageToCache = UIImage(data: data!)

                if self.imageUrlString == urlString {

                    self.image = imageToCache
                }

                 imageCache.setObject(imageToCache ?? UIImage(named: "speed")!, forKey: urlString as NSString)
           }

        }.resume()
    }
}
