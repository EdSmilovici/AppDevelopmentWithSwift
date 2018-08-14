//
//  Game.swift
//  Apple Pie
//
//  Created by Ed Smilovici on 2018-08-13.
//  Copyright © 2018 Ed Smilovici. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    var formatedWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter){
                guessedWord.append(letter)
            } else {
                guessedWord.append("_")
            }
        }
        return guessedWord
    }
    mutating func playerGuessed(letter: Character){
        guessedLetters.append(letter)
        if !word.contains(letter){ //string.characters is depricated so there is no need for it
            incorrectMovesRemaining -= 1
        }
    }
}
