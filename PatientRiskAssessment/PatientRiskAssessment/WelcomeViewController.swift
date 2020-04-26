//
//  WelcomeScreenViewController.swift
//  PatientRiskAssessment
//
//  Created by Rastaar Haghi on 4/25/20.
//  Copyright © 2020 Rastaar Haghi. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    
    var beginButton: UIButton = UIButton()
    // main header label
    var mainHeader: UILabel = UILabel(frame: CGRect(x: UIScreen.main.bounds.maxX/5, y: UIScreen.main.bounds.maxY/5, width: 3*UIScreen.main.bounds.maxX/5, height: 80))
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        view.addSubview(mainHeader)
        setButtons()
        view.addSubview(beginButton)
        
        
        print("Welcome Screen loaded");

    }
    
    func setLabels() {
        mainHeader.text = "Patient Risk Assessment"
        mainHeader.font = UIFont(name: ".SFUIText-Bold", size: 32)
        mainHeader.textAlignment = .center
        mainHeader.numberOfLines = 0
    }
    
    func setButtons() {
        beginButton.setTitle("Begin", for: .normal)
        beginButton.backgroundColor = .gray
        beginButton.frame = CGRect(x: UIScreen.main.bounds.maxX/5, y: 700, width: 3*UIScreen.main.bounds.maxX/5, height: 80)
        beginButton.layer.cornerRadius = 15
        beginButton.addTarget(self, action: #selector(startTest), for: .touchUpInside)
    }
    @objc func startTest() {
        let formPage = FormViewController()
        self.present(formPage, animated: true, completion: nil)
    }
    
    func addGradient() {
        let glayer = CAGradientLayer()
            glayer.frame = self.view.bounds
            glayer.colors = [UIColor(red: 0.16, green: 0.46, blue: 1.00, alpha: 0.8),
                            UIColor(red: 0.57, green: 0.83, blue: 1.00, alpha: 1.00)
                            ]
//        layer.startPoint = CGPoint(x: 0,y: UIScreen.main.bounds.maxY)
//        layer.endPoint = CGPoint(x: UIScreen.main.bounds.maxX, y: 0)
        //self.backgroundView.layer.insertSublayer(glayer, at: 0)
        print("Gradient background set")
    }
}
