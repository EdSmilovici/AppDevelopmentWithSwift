//
//  ViewController.swift
//  Apple Pie
//
//  Created by Ed Smilovici on 2018-08-13.
//  Copyright © 2018 Ed Smilovici. All rights reserved.
//
// few minor changes compared to what is in the main part of this guided project

import UIKit

class ViewController: UIViewController {
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    let incorrectMovesAllowed = 7
    var listOfWords = ["hello","goodbye","have","a","nice","day"]
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    var currentGame: Game!
    
    @IBAction func buttonPressed(_ sender: UIButton) { // the guided project refers to this as buttonTapped half the time
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }

    func newRound(){
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            setEnableetterButtons(true)
            updateUI()
        } else {
            updateUI() // added this so that when you run out of words and the game is done it still updates for the last guess
            setEnableetterButtons(false)
        }
    }
    
    func updateGameState(){
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formatedWord {
            totalWins += 1
        } else {
            updateUI()
        }
    }
    
    func updateUI (){
        var letters = [String]()
        for letter in currentGame.formatedWord {
            letters.append(String(letter))
        }
        correctWordLabel.text = letters.joined(separator: " ")
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    func setEnableetterButtons (_ value:Bool){
        for button in letterButtons {
            button.isEnabled = value
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

