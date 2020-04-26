//
//  FormViewController.swift
//  PatientRiskAssessment
//
//  Created by Rastaar Haghi on 4/26/20.
//  Copyright © 2020 Rastaar Haghi. All rights reserved.
//

import Foundation
import UIKit
import GTProgressBar

class FormViewController: UIViewController {
    
    var questionIndex: Int = 0
    var selectedResponse: String = ""
    var progressBar: GTProgressBar = GTProgressBar(frame: CGRect(x: 30, y: UIScreen.main.bounds.maxY/6, width: UIScreen.main.bounds.maxX - 60, height: 10))
    var questionLabel: UILabel = UILabel(frame: CGRect(x: 30, y: 15 + UIScreen.main.bounds.maxY/6 , width: UIScreen.main.bounds.maxX - 60, height: 80))
    var nextButton: UIButton = UIButton(frame: CGRect(x: 30, y: 740, width: UIScreen.main.bounds.maxX - 60, height: 60))
    var prevButton: UIButton = UIButton(frame: CGRect(x: 30, y: 50, width: 75, height: 75))
    var questionSet: [String] = ["How old is the patient?", // index 0
                                "What is the patient’s sex?", // index 1
                                "What is the patient’s systolic blood pressure?", // index 2
                                "What is the patient’s diastolic blood pressure?",
                                "Does the patient have any of the following comorbidities?", // index 4
                                "What is the patient’s smoking history?", /* index 5*/
                                "What is the patient's absolute lymphocyte count? (units x 10^9)",
                                "Does the patient present with a bacterial coinfection?", // index 7
                                "Is the patient presenting with symptoms of pneumonia?", // index 8
                                    /* IF YES TO ABOVE QUESTION (INDEX 8) else set questionIndex to 21 */
                                    "What is the patient’s respiratory rate?",
                                    "What is the patient’s heart rate?", /* index 10 */
                                    "Is the patient confused?",
                                    "What is the patient’s albumin level?",
                                    "Is the patient currently receiving oxygen?",
                                        /*IF YES to above question (INDEX 13) else skip to index 15*/
                                            "What is the patient’s PaO2/FiO2 ratio?",
                                            /* if at index 14 and pressed next, go to question index 17 */
                                        // IF NO:
                                            "What is the patient’s PaO2?", /* index 15 */
                                            "What is the patient’s O2 saturation?",
                                    "Has the patient received a chest x-ray?",
                                        /* IF YES to above question INDEX 17, go to 18, IF NO go to question 19 */
                                            "Is there multi-lobar involvement on the x-ray?",
                                    "What is the patient’s arterial pH?",
                                    "What is the patient’s blood urea nitrogen level?" /* index 20 */
                                ]
    var questionAnswers: [[String]] = [
        ["0 - 17", "18 - 40", "41 - 50", "51 - 60", "61 - 70", "71 - 80", "80+"], // index 0
        ["Male", "Female"],
        ["< 90 mmHg", "> 90 mmHg"], // index 2
        ["< 70 mmHg", "> 70 mmHg"],
        ["Cardiovascular disease", "Diabetes", "Chronic respiratory disease", "Hypertension", "Cancer", "None"], // index 4
        ["None", "Prior smoker", "Current smoker"],
        ["<.8", ">.8", "Has not been measured yet"], // index 6
        ["Yes", "No"],
        ["Yes", "No"], // index 8
        ["<25", ">=25", ">=30"],
        ["<125 bpm", ">=125 bpm"], // index 10
        ["Yes", "No"],
        ["<3.5 g/dL", ">3.5 g/dL", "Has not been measured yet"], // index 12
        ["Yes", "No"],
        ["<250", "<333", ">333", "Has not been measured yet"], // index 14
        ["<60", "<70", ">70", "Has not been measured yet"],
        ["<=90", "<=93", ">93", "Has not been measured yet"], // index 16
        ["Yes", "No"],
        ["Yes", "No"], // index 18
        ["<7.35", ">7.35", "Has not been measured yet"],
        ["<30", ">30", "Has not been measured yet"] // index 20
    ]
    
    var b1: UIButton = UIButton(frame: CGRect(x: 0, y: 125 + UIScreen.main.bounds.maxY/6, width: UIScreen.main.bounds.maxX , height: 60))
    var b2: UIButton = UIButton(frame: CGRect(x: 0, y: 190 + UIScreen.main.bounds.maxY/6, width: UIScreen.main.bounds.maxX , height: 60))
    var b3: UIButton = UIButton(frame: CGRect(x: 0, y: 255 + UIScreen.main.bounds.maxY/6, width: UIScreen.main.bounds.maxX , height: 60))
    var b4: UIButton = UIButton(frame: CGRect(x: 0, y: 320 + UIScreen.main.bounds.maxY/6, width: UIScreen.main.bounds.maxX , height: 60))
    var b5: UIButton = UIButton(frame: CGRect(x: 0, y: 385 + UIScreen.main.bounds.maxY/6, width: UIScreen.main.bounds.maxX , height: 60))
    var b6: UIButton = UIButton(frame: CGRect(x: 0, y: 450 + UIScreen.main.bounds.maxY/6, width: UIScreen.main.bounds.maxX , height: 60))
    var b7: UIButton = UIButton(frame: CGRect(x: 0, y: 515 + UIScreen.main.bounds.maxY/6, width: UIScreen.main.bounds.maxX , height: 60))
    var whiteUnderTone: UIView = UIView(frame: CGRect(x: 0, y: 110 + UIScreen.main.bounds.maxY/6, width: UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.maxY - 110 - UIScreen.main.bounds.maxY/6) )
    let backgroundImg = UIImageView(image: UIImage(named: "background.png"));
    //var response
    var responses: ResponseMap = ResponseMap()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        whiteUnderTone.backgroundColor = UIColor(white: 0.98, alpha: 1)
        whiteUnderTone.layer.cornerRadius = 20
        backgroundImg.frame = UIScreen.main.bounds
        view.addSubview(backgroundImg)
        view.addSubview(whiteUnderTone)
        

        //view.sendSubviewToBack(backgroundGrad)
        setupProgressBar()
        view.addSubview(progressBar)
        
        setupNextButton()
        view.addSubview(nextButton)
        
        setupPrevButton()
        view.addSubview(prevButton)
        
        setupQuestionLabel()
        view.addSubview(questionLabel)
        setupResponseBtns()
        updateQuestionLabel()
        setupQuestionAns()
        view.addSubview(b1);
        view.addSubview(b2);
        view.addSubview(b3);
        view.addSubview(b4);
        view.addSubview(b5);
        view.addSubview(b6);
        view.addSubview(b7);
        updateQuestionResponseBtns()
        print("FormPage loaded")
    }
    
    func updateQuestionResponseBtns() {
        var count = 0
        b1.isHidden = true
        b2.isHidden = true
        b3.isHidden = true
        b4.isHidden = true
        b5.isHidden = true
        b6.isHidden = true
        b7.isHidden = true
        
        b1.backgroundColor = UIColor(white: 0.98, alpha: 1)
        b2.backgroundColor = UIColor(white: 0.98, alpha: 1)
        b3.backgroundColor = UIColor(white: 0.98, alpha: 1)
        b4.backgroundColor = UIColor(white: 0.98, alpha: 1)
        b5.backgroundColor = UIColor(white: 0.98, alpha: 1)
        b6.backgroundColor = UIColor(white: 0.98, alpha: 1)
        b7.backgroundColor = UIColor(white: 0.98, alpha: 1)
        setupQuestionAns()
        for ans in self.questionAnswers[questionIndex] {
            if(count == 0) {
                b1.setTitle(ans, for: .normal)
                b1.isHidden = false
            } else if(count == 1) {
                b2.setTitle(ans, for: .normal)
                b2.isHidden = false
            } else if(count == 2) {
                b3.setTitle(ans, for: .normal)
                b3.isHidden = false
            } else if(count == 3) {
                b4.setTitle(ans, for: .normal)
                b4.isHidden = false
            } else if(count == 4) {
                b5.setTitle(ans, for: .normal)
                b5.isHidden = false
            } else if(count == 5) {
                b6.setTitle(ans, for: .normal)
                b6.isHidden = false
            } else if(count == 6) {
                b7.setTitle(ans, for: .normal)
                b7.isHidden = false
            }
            count = count + 1
        }
    }
    
    func setupQuestionAns() {
        
        b1.titleLabel?.font = UIFont(name: "SFProText-Heavy", size: 24)
        b2.titleLabel?.font = UIFont(name: "SFProText-Heavy", size: 24)
        b3.titleLabel?.font = UIFont(name: "SFProText-Heavy", size: 24)
        b4.titleLabel?.font = UIFont(name: "SFProText-Heavy", size: 24)
        b5.titleLabel?.font = UIFont(name: "SFProText-Heavy", size: 24)
        b6.titleLabel?.font = UIFont(name: "SFProText-Heavy", size: 24)
        b7.titleLabel?.font = UIFont(name: "SFProText-Heavy", size: 24)
        
        b1.titleLabel?.textAlignment = .left
        b2.titleLabel?.textAlignment = .left
        b3.titleLabel?.textAlignment = .left
        b4.titleLabel?.textAlignment = .left
        b5.titleLabel?.textAlignment = .left
        b6.titleLabel?.textAlignment = .left
        b7.titleLabel?.textAlignment = .left
        
        b1.setTitleColor(.black, for: .normal)
        b2.setTitleColor(.black, for: .normal)
        b3.setTitleColor(.black, for: .normal)
        b4.setTitleColor(.black, for: .normal)
        b5.setTitleColor(.black, for: .normal)
        b6.setTitleColor(.black, for: .normal)
        b7.setTitleColor(.black, for: .normal)

    }
    
    func setupResponseBtns() {
        b1.addTarget(self, action: #selector(answerSelected), for: .touchUpInside)
        b2.addTarget(self, action: #selector(answerSelected), for: .touchUpInside)
        b3.addTarget(self, action: #selector(answerSelected), for: .touchUpInside)
        b4.addTarget(self, action: #selector(answerSelected), for: .touchUpInside)
        b5.addTarget(self, action: #selector(answerSelected), for: .touchUpInside)
        b6.addTarget(self, action: #selector(answerSelected), for: .touchUpInside)
        b7.addTarget(self, action: #selector(answerSelected), for: .touchUpInside)
    }
    
    @objc func answerSelected(sender: UIButton) {
        b1.backgroundColor = .white
        b2.backgroundColor = .white
        b3.backgroundColor = .white
        b4.backgroundColor = .white
        b5.backgroundColor = .white
        b6.backgroundColor = .white
        b7.backgroundColor = .white
        print("Button pressed")
        sender.backgroundColor = UIColor(white: 0.9, alpha: 1)
        sender.titleLabel?.textColor = UIColor(red: 0.16, green: 0.46, blue: 1.00, alpha: 1.00)
        self.selectedResponse = sender.titleLabel!.text ?? ""
        print("SELECTED RESPONSE: \(selectedResponse)")
    }
    
    func setupProgressBar() {
        progressBar.progress = 0.05
        progressBar.displayLabel = false
        progressBar.barFillColor = .white
        progressBar.barBackgroundColor = UIColor(white: 1.00, alpha: 0.3)
        progressBar.barBorderWidth = 0
        progressBar.barBorderColor = .clear
    }
    
    func setupQuestionLabel() {
        questionLabel.font = UIFont(name: "SFProText-Heavy", size: 32)
        questionLabel.numberOfLines = 0
        questionLabel.adjustsFontSizeToFitWidth = true
        questionLabel.textAlignment = .natural
        questionLabel.textColor = UIColor(white: 0.95, alpha: 1)
    }
    
    func setupNextButton() {
        nextButton.backgroundColor = UIColor(red: 0.16, green: 0.46, blue: 1.00, alpha: 1.00)
        nextButton.titleLabel?.textColor = UIColor(white: 0.97, alpha: 1)
        nextButton.layer.cornerRadius = 25
        nextButton.titleLabel?.font = UIFont(name: "SFProText-Heavy", size: 24)
        nextButton.setTitle("Next", for: .normal)
        nextButton.titleLabel?.textAlignment = .center
        nextButton.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
        print("Next button set up")
    }
    
    func setupPrevButton() {
        prevButton.setImage(UIImage(named: "Back"), for: .normal)
        prevButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        print("Prev button set up")
    }
    
    // handle logic of question orders
    @objc func nextPressed() {
        let question = questionSet[questionIndex]
        // setting answer
        self.responses.questionResponses[question] = selectedResponse
        print("placed answer \(selectedResponse) for question \(question)")
        if(questionIndex == 8 && selectedResponse == "No") {
            updateQuestionLabel()
            questionIndex = 21
            // push results
            print("answered index 8 with response yes, so push to results")
            return
        } else if(questionIndex == 13 && selectedResponse == "No") {
            questionIndex = 15
            updateQuestionLabel()
            updateProgressBar()
            print("question index was 13 and response was no, so making question index = 15")
            return
        } else if(questionIndex == 14) {
            questionIndex = 17
            updateQuestionLabel()
            updateProgressBar()
            print("question index was 14 and response was yes, so making question index = 15")
            return
        } else if(questionIndex == 17 && selectedResponse == "No") {
            questionIndex = 19
            updateQuestionLabel()
            updateProgressBar()
            print("question index was 14 and response was yes, so making question index = 15")
            return
        } else if(questionIndex == 20) {
            // push to results
            print(self.responses.questionResponses)
        }
        updateQuestionResponseBtns()
        questionIndex += 1
        updateProgressBar()
        updateQuestionLabel()
        print("Next Button pressed / nextPressed called")
    }
    
    @objc func backPressed() {
        let question = questionSet[questionIndex]
        print(question)
        // clear a response
        self.responses.questionResponses[question] = ""
        print("cleared response for question \(question)")
        if(questionIndex == 0) {
            print("already on the first question, cannot go back")
        } else if(questionIndex == 15) {
            // clear the responses for questions 14
            // go to question 13
        } else if(questionIndex == 17) {
            questionIndex = 14
        } else if(questionIndex == 19) {
            questionIndex = 17
        } else {
            questionIndex -= 1
        }
        updateQuestionResponseBtns()
        updateProgressBar()
        updateQuestionLabel()
        print("Back button pressed / backPressed called")
    }
    
    func updateProgressBar() {
        progressBar.progress = CGFloat(questionIndex) / CGFloat(questionSet.count)
    }
    
    func updateQuestionLabel() {
        if(questionIndex >= questionSet.count) {
            return
        }
        questionLabel.text = questionSet[questionIndex]
    }
    
}




/*
"How old is the patient?"
"What is the patient’s sex?"
"What is the patient’s systolic blood pressure?"
"What is the patient’s diastolic blood pressure?"
"Does the patient have any of the following comorbidities?"
"What is the patient’s smoking history?"
"Is the patient presenting with symptoms of pneumonia?"
    IF YES:
        What is the patient’s respiratory rate?
        What is the patient’s heart rate?
        Is the patient confused?
        What is the patient’s albumin level?
        Is the patient currently receiving oxygen?+1
            IF YES:
                    What is the patient’s PaO2/FiO2 ratio? ANSWERS: Number, range 100-1000 or “Has not been measured yet”
            IF NO:
                What is the patient’s PaO2? ANSWER: Number, range 10-150 or “Has not been measured yet”
                What is the patient’s O2 saturation? ANSWER: Percentage, range 0-100 or “Has not been measured yet”
        Has the patient received a chest x-ray? ANSWER: Yes, No
            IF YES:
                Is there multi-lobar involvement on the x-ray? ANSWER: Yes, No
        What is the patient’s arterial pH? ANSWER: Number, range 0-14 or “Has not been measured yet”
        What is the patient’s blood urea nitrogen level? ANSWER: Number, units in either mg/dL or mmol/L with ranges 0-100, 0-50 respectively
    IF NO:
        ##### All of the questions so far should give an answer, but there are more optional ones to assess mortality risk ######
        Does the patient have a history of neoplastic disease? ANSWER: Yes, No
        Does the patient have a history of liver disease? ANSWER: Yes, No
        Does the patient have a history of congestive heart failure? ANSWER: Yes, No
        Does the patient have a history of cerebrovascular disease? ANSWER: Yes, no
        Does the patient have a history of renal disease? ANSWER: Yes, No
        What is the patient’s body temperature? ANSWER: Number, units in Celsius or Fahrenheit, range 32-42, 90-115 respectively
        What is the patient’s blood sodium level? ANSWER: Number, units mmol/L, range 50-300, OR “Has not been measured yet”
        What is the patient’s blood glucose level? ANSWER: Number units in mg/dL or mmol/L, range 0-2700, 0-147.6 respectively, OR “Has not been measured yet”
        What is the patient’s hematocrit? ANSWER: Percentage, 0-100 or “Has not been measured yet”
*/
