//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Yash Patel on 10/26/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    var q:String
    var a:[String]
    var correctAnswer:String
    
    init(q:String,a:[String] ,correctAnswer:String){
        self.q = q
        self.a = a
        self.correctAnswer = correctAnswer
    }
    
    
}
