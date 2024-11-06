//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Option3Label: UIButton!
    @IBOutlet weak var Option2Label: UIButton!
    @IBOutlet weak var option1Label: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    
    
    var buttonArray: [UIButton] = []
    var currentQuesion = 0
    var questionListArrayInstance = QuestionList()
    var questionInstance:Question?
    var clickedAns : String?
    var count = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonArray = [option1Label, Option2Label, Option3Label]
        UIUpdate(currentQuesion)
       
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        clickedAns = sender.currentTitle!
        checkAns()
    }
    
    func UIUpdate(_ currentQuesion: Int) {
        print("Current question index \(currentQuesion)")
        if currentQuesion > questionListArrayInstance.questionListArray.count-1 {
            print("Current question index in if \(currentQuesion)")
            print("IF condition ui update")
            questionLabel.text = "You have completed all the questions, you got \(count) out of \(questionListArrayInstance.questionListArray.count)"
            option1Label.isEnabled = false
            Option2Label.isEnabled = false
            Option3Label.isEnabled = false
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
                self.count = 0
                self.currentQuesion = 0
                self.option1Label.isEnabled = true
                self.Option2Label.isEnabled = true
                self.Option3Label.isEnabled = true
                print("done")
                print(currentQuesion)
                print(self.currentQuesion)
                self.UIUpdate(self.currentQuesion)
            })
        }
        else{
            print("else condition ui update")
            print(currentQuesion)
            questionInstance = questionListArrayInstance.getQuestion(currentQuesion)
            questionLabel.text = questionInstance!.q
            option1Label.setTitle(questionInstance!.a[0], for: .normal)
            Option2Label.setTitle(questionInstance!.a[1], for: .normal)
            Option3Label.setTitle(questionInstance!.a[2], for: .normal)
        }
    }
    
    func checkAns() {
        if questionInstance?.correctAnswer == clickedAns {
            count+=1
            currentQuesion+=1
            UIUpdate(currentQuesion)
        }else{
            currentQuesion+=1
            UIUpdate(currentQuesion)
        }
    }


}

