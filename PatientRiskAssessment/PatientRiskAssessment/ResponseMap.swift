//
//  ResponseMap.swift
//  PatientRiskAssessment
//
//  Created by Rastaar Haghi on 4/26/20.
//  Copyright © 2020 Rastaar Haghi. All rights reserved.
//

import Foundation

struct ResponseMap {
    var questionResponses: [String: String] = ["How old is the patient?" : "", // index 0
                            "What is the patient’s sex?" : "", // index 1
                            "What is the patient’s systolic blood pressure?" : "", // index 2
                            "What is the patient’s diastolic blood pressure?" : "",
                            "Does the patient have any of the following comorbidities?" : "", // index 4
                            "What is the patient’s smoking history?" : "", /* index 5*/
                            "What is the patient's absolute lymphocyte count? (units x 10^9)" : "",
                            "Does the patient present with a bacterial coinfection?" : "", // index 7
                            "Is the patient presenting with symptoms of pneumonia?" : "", // index 8
                                /* IF YES TO ABOVE QUESTION (INDEX 8) else set questionIndex to 21 */
                                "What is the patient’s respiratory rate?" : "",
                                "What is the patient’s heart rate?" : "", /* index 10 */
                                "Is the patient confused?" : "",
                                "What is the patient’s albumin level?" : "",
                                "Is the patient currently receiving oxygen?" : "",
                                    /*IF YES to above question (INDEX 13) else skip to index 15*/
                                        "What is the patient’s PaO2/FiO2 ratio?" : "",
                                        /* if at index 14 and pressed next, go to question index 17 */
                                    // IF NO:
                                        "What is the patient’s PaO2?" : "", /* index 15 */
                                        "What is the patient’s O2 saturation?" : "",
                                "Has the patient received a chest x-ray?" : "",
                                    /* IF YES to above question INDEX 17, go to 18, IF NO go to question 19 */
                                        "Is there multi-lobar involvement on the x-ray?" : "",
                                "What is the patient’s arterial pH?" : "",
                                "What is the patient’s blood urea nitrogen level?" : "" /* index 20 */
    ]
}
