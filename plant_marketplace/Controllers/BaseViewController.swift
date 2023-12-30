//
//  BaseViewController.swift
//  plant_marketplace
//
//  Created by Salil Luley on 30/12/2023.
//

import UIKit
import SwiftUI

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
    }
   
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 222/255.0, green: 237/255.0, blue: 254/255.0, alpha: 1.0).cgColor                
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}


