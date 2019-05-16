//
//  ViewController.swift
//  Scatter and Gather Animations
//
//  Created by Alex on 5/15/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Constants
    
    var shouldScramble: Bool = true
    var lblArray = [UILabel]()
    var colorArray: [UIColor] = [.red, .green, .blue, .yellow, .purple, .orange]

    // MARK: - Outlets
    
    @IBOutlet var lLbl: UILabel!
    @IBOutlet var aLbl: UILabel!
    @IBOutlet var mLbl: UILabel!
    @IBOutlet var bLbl: UILabel!
    @IBOutlet var dLbl: UILabel!
    @IBOutlet var finalALbl: UILabel!
    
    // MARK: - Actions
    
    @IBAction func toggle(_ sender: UIBarButtonItem) {
        if shouldScramble {
            UIView.animate(withDuration: 2.0, animations: {
                for lbl in self.lblArray {
                    lbl.transform = CGAffineTransform(rotationAngle: CGFloat.pi/CGFloat(self.random()))
                    lbl.transform = CGAffineTransform(translationX: self.randomX(), y: self.randomY())
//                    lbl.center = CGPoint(x: self.randomX(), y: self.randomY())
                    lbl.layer.backgroundColor = self.colorArray.randomItem()?.cgColor
                    lbl.textColor = self.colorArray.randomItem()
//                    lbl.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }
            })
        } else {
            UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .repeat, animations: {
                for lbl in self.lblArray {
                    lbl.transform = .identity
//                    lbl.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
                    lbl.layer.backgroundColor = UIColor.white.cgColor
                    lbl.textColor = .black
                }
            }, completion: nil)
        }
        shouldScramble.toggle()
    }
    
    //MARK: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblArray += [lLbl, aLbl, mLbl, bLbl, dLbl, finalALbl]
        for lbl in lblArray {
            lbl.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        }
    }
    
    //MARK: - Functions
    
    func random() -> Int{
        return Int.random(in: -10...10)
    }
    func randomX() -> CGFloat{
        return CGFloat(Int.random(in: 0...Int(self.view.bounds.size.width)))
    }
    func randomY() -> CGFloat{
        return CGFloat(Int.random(in: 0...Int(self.view.bounds.size.height)))
    }

}
