//
//  GridGenerator.swift
//  ShopifyInternshipWordSearch
//
//  Created by Nicholas Kearns on 9/6/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import Foundation




struct GridGenerator {
    
    var gridDoubleArray: [[String]] = [[]]
    
    let allLetters = Array("abcdefghijklmnopqrstuvwxyz")
    
    var gridSingleArray: [String] = []
    
    let keywords: [String] = ["swift", "kotlin", "objectivec", "variable", "java", "mobile"]
    
    //dict to track what words populate what sections of the grid
    //the string is the tell whether the word is spelled horizontally or vertically
    //the first int is the starting index and the second is the end of the word
    //
    var blockedIndices: [String: (String, Int, Int)]
    
    //this function works but it starts the outer array with an empty array
    //resulting in wonky indexing in the function that turns it into a single array
    mutating func fillGrid() {
        for _ in 0...10 {
            var tempArray: [String] = []
            for _ in 0...10 {
                
                let randomIndex = Int.random(in: 0...25)
                let randomLetter = allLetters[randomIndex]
                tempArray.append(String(randomLetter))
            }
            self.gridDoubleArray.append(tempArray)
            
        }
        addInKeyWords()
    }
    
//    this function will iterate over the blockedIndices dict
    //
    func checkForCollision(word: String, x: Int, y: Int) -> Bool {
        for (key, value) in blockedIndices {
            


        }
        
        return false

    }
    
    
    
    mutating func addInKeyWords() {
        for word in keywords {
            //generate a random number between 0 and 1
            //0 will be the case where the keyword is spelled out horizontally
            //1 will be the case where the keyword is spelled out vertically
            //No diagonal cases in this version
            let direction = Int.random(in: 0...1)
            let wordArray = Array(word)
            
            
            switch direction {
            case 0:
                //generate 2 random numbers to be the indices the word starts at
                //cap the upper bound of the inner index by the length of the word to ensure the word
                //has enough horizontal space to fit
                let randomOuterIndex = Int.random(in: 1..<self.gridDoubleArray.count - (word.count))
                let randomInnerIndex = Int.random(in: 0..<self.gridDoubleArray[1].count - 1 )
                if checkForCollision(word: word, x: randomOuterIndex, y: randomInnerIndex) {
                    
                }
                
               
                
                for i in 0..<word.count {
                    gridDoubleArray[randomOuterIndex + i][randomInnerIndex] = String(wordArray[i])
                }
            case 1:
                //again generate 2 random numbers to be the indices
                //cap the upper bound of the outer index by the length of the word
                //to ensure the word has enough vertical space to fit
                let randomOuterIndex = Int.random(in: 1..<self.gridDoubleArray.count)
                let randomInnerIndex = Int.random(in: 0..<self.gridDoubleArray[1].count - 1 - (word.count))
                for i in 0..<word.count {
                    gridDoubleArray[randomOuterIndex][randomInnerIndex + i] = String(wordArray[i])
                }
            default:
                return
            }
                
            
        }
        self.turnDoubleArrayToSingle()
        
    }
    
    
    mutating func turnDoubleArrayToSingle() {
        for i in 1..<self.gridDoubleArray.count - 1 {
            for j in 0..<self.gridDoubleArray[1].count - 1{
                self.gridSingleArray.append(gridDoubleArray[i][j])
            }
        }
    }
}
