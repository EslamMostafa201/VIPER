//
//  UIImageView+Extension.swift
//  Cars
//
//  Created by Eslam Mostafa on 15/02/2022.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func loadFromUrl(stringUrl : String) {
        
        let imageBase = "" //Constants.IMAGESOURCE + stringUrl
        let imageurl = URL(string : imageBase.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)!)
       
        let image = UIImage(named: "Logo")
        
        self.kf.setImage(with: imageurl , placeholder: image, options: [.cacheOriginalImage])
    }
    
    func imageRounded(){
        self.layer.cornerRadius = self.bounds.size.width / 2
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func cornerRounded(){
        self.layer.cornerRadius = 7
        self.clipsToBounds = true
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width :1 , height:1)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}
