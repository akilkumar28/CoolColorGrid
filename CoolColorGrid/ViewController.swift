//
//  ViewController.swift
//  CoolColorGrid
//
//  Created by AKIL KUMAR THOTA on 8/27/17.
//  Copyright © 2017 Akil Kumar Thota. All rights reserved.
// random comment line

import UIKit

class ViewController: UIViewController {
    
    let numberPerRow = 10
    
    var cellsDict = [String:UIView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = self.view.frame.width / CGFloat(numberPerRow)
        for j in 0...30 {
        for i in 0...numberPerRow{
            let cell = UIView()
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 0.5
            cell.backgroundColor = givColor()
            cell.frame = CGRect(x: CGFloat(i) * width, y: CGFloat(j) * width, width: width, height: width)
            self.view.addSubview(cell)

            let key = "\(i)|\(j)"
            cellsDict[key] = cell
            
        }
        }
        
        self.view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(pangestur(gesture:))))
        
    
    }
    var selectedCell:UIView?
    
    @objc func pangestur(gesture:UIPanGestureRecognizer) {
        let touch = gesture.location(in: self.view)
        let width = self.view.frame.width / CGFloat(numberPerRow)

        let i = Int(touch.x / width)
        let j = Int(touch.y / width)
        let key = "\(i)|\(j)"
        guard let cellView = cellsDict[key] else {return}
        
        view.bringSubview(toFront: cellView)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { 
            
            cellView.layer.transform = CATransform3DMakeScale(3, 3, 3)
        }, completion: nil)
        
        if selectedCell != cellView {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { 
                
                self.selectedCell?.layer.transform = CATransform3DIdentity
                
            }, completion: nil)
            
        }
        
        selectedCell = cellView
        
        
        if gesture.state == .ended {
            UIView.animate(withDuration: 0.5, delay: 0.25, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                
                self.selectedCell?.layer.transform = CATransform3DIdentity
                
            }, completion: nil)
        }
        
    }
    
    func givColor() -> UIColor {
        
        let red = CGFloat(drand48())
        let blue = CGFloat(drand48())
        let green = CGFloat(drand48())
        
        return UIColor(red: red, green: blue, blue: green, alpha: 1)
        
    }
}

