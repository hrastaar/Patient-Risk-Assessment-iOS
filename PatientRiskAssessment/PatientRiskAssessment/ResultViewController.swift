//
//  ResultViewController.swift
//  PatientRiskAssessment
//
//  Created by Rastaar Haghi on 4/26/20.
//  Copyright © 2020 Rastaar Haghi. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    var res: ResponseMap = ResponseMap()
    
    var headerLabel: UILabel = UILabel(frame: CGRect(x: 50, y: UIScreen.main.bounds.maxY/5, width: UIScreen.main.bounds.maxX - 100, height: 80))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        headerLabel.text = "Results"
        headerLabel.font = UIFont(name: "SFProText-Medium", size: 32)
        view.addSubview(headerLabel)
        print("Reached results page")
    }
    
}
