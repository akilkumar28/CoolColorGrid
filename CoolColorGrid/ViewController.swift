//
//  ViewController.swift
//  CoolColorGrid
//
//  Created by AKIL KUMAR THOTA on 8/27/17.
//  Copyright © 2017 Akil Kumar Thota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numPerRow = 15
        let width = self.view.frame.width / CGFloat(numPerRow)
        
        for j in 0...30 {
        for i in 0...numPerRow{
            let cell = UIView()
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 0.5
            cell.backgroundColor = givColor()
            cell.frame = CGRect(x: CGFloat(i) * width, y: CGFloat(j) * width, width: width, height: width)
            self.view.addSubview(cell)
        }
        }
        
    
    }
    
    func givColor() -> UIColor {
        
        let red = CGFloat(drand48())
        let blue = CGFloat(drand48())
        let green = CGFloat(drand48())
        
        return UIColor(red: red, green: blue, blue: green, alpha: 1)
        
    }
    




}

