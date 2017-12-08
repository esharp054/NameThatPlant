//
//  LandingPageViewController.swift
//  Vision+ML Example
//
//  Created by Vianka Barboza on 12/7/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

class HomePageScene: UIViewController {
    
    override func viewDidLoad(){
        super.viewDidLoad();
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "images.jpeg")
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    
}
