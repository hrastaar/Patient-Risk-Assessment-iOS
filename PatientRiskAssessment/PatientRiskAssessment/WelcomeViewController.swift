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
    let backgroundImg = UIImageView(image: UIImage(named: "gradient.png"));

    let understandImg = UIImageView(image: UIImage(named: "understand@2x.png"))
    let prioritizeImg = UIImageView(image: UIImage(named: "prioritize@2x.png"))
    let treatImg = UIImageView(image: UIImage(named: "treat@2x.png"))

    let understandHeader = UILabel(frame: CGRect(x: 120, y: UIScreen.main.bounds.maxY/5 + 130, width: 110, height: 55))
    let prioritizeHeader = UILabel(frame: CGRect(x: 120, y: UIScreen.main.bounds.maxY/5 + 210, width: 110, height: 55))
    let treatHeader = UILabel(frame: CGRect(x: 120, y: UIScreen.main.bounds.maxY/5 + 300, width: 110, height: 55))
    
    let understandText = UILabel(frame: CGRect(x: 120, y: UIScreen.main.bounds.maxY/5 + 130 + 15, width: UIScreen.main.bounds.maxX - 150, height: 80))
    let prioritizeText = UILabel(frame: CGRect(x: 120, y: UIScreen.main.bounds.maxY/5 + 210 + 15, width: UIScreen.main.bounds.maxX - 150, height: 80))
    let treatText = UILabel(frame: CGRect(x: 120, y: UIScreen.main.bounds.maxY/5 + 300 + 15, width: UIScreen.main.bounds.maxX - 150, height: 80))
    
    // main header label
    var mainHeader: UILabel = UILabel(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY/5, width: UIScreen.main.bounds.maxX, height: 80))
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImg.frame = UIScreen.main.bounds
        view.addSubview(backgroundImg)
        setLabels()
        view.addSubview(mainHeader)
        setButtons()
        view.addSubview(beginButton)
        
        setImages()
        view.addSubview(understandImg)
        view.addSubview(prioritizeImg)
        view.addSubview(treatImg)
        
        view.addSubview(understandHeader)
        view.addSubview(prioritizeHeader)
        view.addSubview(treatHeader)
        
        view.addSubview(understandText)
        view.addSubview(prioritizeText)
        view.addSubview(treatText)
        
        print("Welcome Screen loaded");

    }
    
    func setLabels() {
        mainHeader.text = "Patient Risk Assessment"
        mainHeader.font = UIFont(name: "SFProText-Heavy", size: 40)
        mainHeader.textColor = .white
        mainHeader.textAlignment = .center
        mainHeader.adjustsFontSizeToFitWidth = true
        mainHeader.numberOfLines = 2
        
        understandHeader.text = "Understand"
        prioritizeHeader.text = "Prioritize"
        treatHeader.text = "Treat"
        
        understandHeader.font = UIFont(name: "SFProText-Heavy", size: 16)
        prioritizeHeader.font = UIFont(name: "SFProText-Heavy", size: 16)
        treatHeader.font = UIFont(name: "SFProText-Heavy", size: 16)
        
        understandHeader.textColor = .white
        prioritizeHeader.textColor = .white
        treatHeader.textColor = .white
        
        understandHeader.numberOfLines = 0
        prioritizeHeader.numberOfLines = 0
        treatHeader.numberOfLines = 0
        
        understandText.text = "Treat patients based on who is most at risk."
        prioritizeText.text = "Treat patients who are most at risk for potential health issues. "
        treatText.text = "Treat patients based on who is most at risk."
        
        understandText.font = UIFont(name: "SFProText-Medium", size: 13)
        prioritizeText.font = UIFont(name: "SFProText-Medium", size: 13)
        treatText.font = UIFont(name: "SFProText-Medium", size: 13)
        
        understandText.textColor = .white
        prioritizeText.textColor = .white
        treatText.textColor = .white
        
        understandText.numberOfLines = 2
        prioritizeText.numberOfLines = 2
        treatText.numberOfLines = 2
    }
    
    func setImages() {
        understandImg.frame = CGRect(x: 50, y: UIScreen.main.bounds.maxY/5 + 130, width: 55, height: 55)
        prioritizeImg.frame = CGRect(x: 50, y: UIScreen.main.bounds.maxY/5 + 210, width: 55, height: 55)
        treatImg.frame = CGRect(x: 50, y: UIScreen.main.bounds.maxY/5 + 300, width: 55, height: 55)
    }
    
    func setButtons() {
        beginButton.setTitle("Begin", for: .normal)
        beginButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        beginButton.titleLabel?.font = UIFont(name: "SFProText-Medium", size: 21)
        beginButton.setTitleColor(UIColor(red: 0.16, green: 0.46, blue: 1.00, alpha: 1.00)

            , for: .normal)

        beginButton.frame = CGRect(x: 30, y: UIScreen.main.bounds.maxY - 150, width: UIScreen.main.bounds.maxX - 60, height: 60)
        beginButton.layer.cornerRadius = 25
        beginButton.addTarget(self, action: #selector(startTest), for: .touchUpInside)
    }
    @objc func startTest() {
        let formPage = FormViewController()
        self.present(formPage, animated: true, completion: nil)
    }
    
    
}
