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
    
    //this function works but it starts the outer array with an empty array
    //resulting in wonky indexing in the function that turns it into a single array
//    mutating func fillGrid() {
//        for _ in 0...10 {
//            var tempArray: [String] = []
//            for _ in 0...10 {
//
//                let randomIndex = Int.random(in: 0...25)
//                let randomLetter = allLetters[randomIndex]
//                tempArray.append(String(randomLetter))
//            }
//            self.gridDoubleArray.append(tempArray)
//
//        }
//        addInKeyWords()
//    }
//
////    this function will iterate over the blockedIndices dict
//    //
//    func checkForCollision(word: String, orientation: Int, x: Int, y: Int) {
//        var willColide = false
////        let randomOuterIndex = Int.random(in: 1..<self.gridDoubleArray.count - (word.count))
////        let randomInnerIndex = Int.random(in: 0..<self.gridDoubleArray[1].count - 1 )
//        for (key, value) in blockedIndices {
//            let (currentX, currentY) = value
//            if
//
//
//
//
//
//            }
//
//
//    }
//
    
    
    func checkForFit(word: String, orientation: Int) -> (Int, Int) {
        
        
        switch orientation {
        case 0:
            let randomX = Int.random(in: 1..<self.gridDoubleArray.count - (word.count))
            var xTracker = randomX
            let randomY = Int.random(in: 0..<self.gridDoubleArray[1].count - 1 )
            for char in word {
                if gridDoubleArray[xTracker][randomY] == "-" {
                    xTracker += 1
                }
                else if String(char) == String(gridDoubleArray[xTracker][randomY]) {
                    xTracker += 1
                
                }
                else {
                    return checkForFit(word: word, orientation: 0)
                }
            }
           
            return (randomX, randomY)
            
        case 1:
            let randomX = Int.random(in: 1..<self.gridDoubleArray.count)
            let randomY = Int.random(in: 0..<self.gridDoubleArray[1].count - 1 - word.count )
            var yTracker = randomY
            for char in word {
                if gridDoubleArray[randomX][yTracker] == "-" {
                    yTracker += 1
                }
                else if String(char) == String(gridDoubleArray[randomX][yTracker]) {
                    yTracker += 1
                
                }
                else {
                    return checkForFit(word: word, orientation: 1)
                }
               
            }
            
           return (randomX, randomY)
            
        default:
            print("somehow orientation was not 0 or 1")
            //this will never happen
            return(0,0)
        }
    }
            
            

    
    mutating func addKeywords() {
        
        for word in keywords {
            let orientation = Int.random(in: 0...1)
            
            var (x, y) = checkForFit(word: word, orientation: orientation)
            
            print(x)
            print(y)
            switch orientation {
            case 0:
                for char in word {
                    self.gridDoubleArray[x][y] = String(char)
                    x += 1
                }
                
            case 1:
                for char in word {
                    self.gridDoubleArray[x][y] = String(char)
                    y += 1
                }
            default:
                print("None")
                
                
            }
            
            
            
            
        }
        
        turnDoubleArrayToSingle()
        
        
        
        
    }
    
    
    
    mutating func fillWithDashes() {
        for _ in 0...10 {
            var tempArray: [String] = []
            for _ in 0...10 {
                tempArray.append("-")
            }
            gridDoubleArray.append(tempArray)
        }
        addKeywords()
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
                // maybe something like a while loop. while checkForCollision is true
                let randomOuterIndex = Int.random(in: 1..<self.gridDoubleArray.count - (word.count))
                let randomInnerIndex = Int.random(in: 0..<self.gridDoubleArray[1].count - 1 )
//                checkForCollision(word: word, orientation: 0, x: randomOuterIndex, y: randomInnerIndex)
                
//                let randomOuterIndex = Int.random(in: 1..<self.gridDoubleArray.count - (word.count))
//                let randomInnerIndex = Int.random(in: 0..<self.gridDoubleArray[1].count - 1 )
//                if checkForCollision(word: word, x: randomOuterIndex, y: randomInnerIndex) {
//                    for i in 0..<word.count {
//                        gridDoubleArray[randomOuterIndex + i][randomInnerIndex] = String(wordArray[i])
//                    }
//                }
//                else {
//
//                    checkForCollision(word: word, x: <#T##Int#>, y: <#T##Int#>)
//                }
                
               
                
                
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
