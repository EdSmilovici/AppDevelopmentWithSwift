//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Ed Smilovici on 2018-08-29.
//  Copyright © 2018 Ed Smilovici. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var resultsAnswerLabel: UILabel!
    @IBOutlet weak var resultsDefinitionLabel: UILabel!
    
    var responses: [Answer]!
    
    func calculatePersonalityResult() {
        let responseTypes = responses.map {$0.type}
        var frequencyOfAnswers: [AnimalType : Int] = [:]
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
/*      let frequencyOfAnswersSorted = frequencyOfAnswers.sorted(by: {(pair1, pair2) -> Bool in return pair1.value > pair2.value})
        let mostCommonAnswer = frequencyOfAnswersSorted.first!.key
 above is verbose version of the following:*/
        let mostCommonAnswer = frequencyOfAnswers.sorted{$0.1 > $1.1}.first!.key
        resultsAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultsDefinitionLabel.text = mostCommonAnswer.definition
    }

}
