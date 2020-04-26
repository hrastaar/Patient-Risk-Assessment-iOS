//
//  WelcomeView.swift
//  PatientRiskAssessment
//
//  Created by Rastaar Haghi on 4/25/20.
//  Copyright © 2020 Rastaar Haghi. All rights reserved.
//

import SwiftUI

struct WelcomeView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> WelcomeViewController {
        let mapPage = WelcomeViewController()
        return mapPage
    }
    
    func updateUIViewController(_ uiViewController: WelcomeViewController, context: Context) {
        
    }
}
