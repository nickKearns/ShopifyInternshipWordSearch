//
//  GridGenerator.swift
//  ShopifyInternshipWordSearch
//
//  Created by Nicholas Kearns on 9/6/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import Foundation




struct GridGenerator {
    
    var gridDoubleArray = [[String]]()
    
    let allLetters = Array("abcdefghijklmnopqrstuvwxyz")
    
    var gridSingleArray: [String] = []
    
    let keywords: [String] = ["swift", "kotlin", "objectivec", "variable", "java", "mobile"]
    

    
    
    func checkForFit(word: String, orientation: Int) -> (Int, Int) {
        
        //switch statement based on whether the keyword is going vertical or horizontal
        //case 0 is the keyword is going horizontal
        //case 1 is the keyword is going vertical
        switch orientation {
        case 0:
            //generate two random indices to start the keyword at
            let randomX = Int.random(in: 0..<self.gridDoubleArray.count - (word.count - 1))
            var xTracker = randomX
            //create a new var to track change in x so randomX does not have to change
            //ensuring that the correct x position is returned
            let randomY = Int.random(in: 0..<self.gridDoubleArray[0].count )
            for char in word {
                //check if the current spot is a dash
                if gridDoubleArray[xTracker][randomY] == "-" {
                    
                    xTracker += 1
                }
                    //if the current spot isnt a dash but happens to match the current char
                    //in the current word then that is allowed and increment xtracker
                else if String(char) == String(gridDoubleArray[xTracker][randomY]) {
                    xTracker += 1
                
                }
                //if the previous two if statements do not run then there would be a collision
                //between the current word and the word we are attempting to add
                //so make a recursive call the checkForFit function
                else {
                    return checkForFit(word: word, orientation: 0)
                }
            }
           //only when all the characters in the string would be able to fit in the grid does this function
           //return the randomly generated x and y position in the grid
            return (randomX, randomY)
            
        case 1:
            //generate two random indices to start the keyword at
            let randomX = Int.random(in: 0..<self.gridDoubleArray.count)
            let randomY = Int.random(in: 0..<self.gridDoubleArray[0].count - (word.count - 1) )
            //create a new var to track change in y so randomY does not have to change
            //ensuring that the correct y position is returned
            var yTracker = randomY
            for char in word {
                //check if the current spot is a dash
                if gridDoubleArray[randomX][yTracker] == "-" {
                    yTracker += 1
                }
                //if the current spot isnt a dash but happens to match the current char
                //in the current word then that is allowed and increment ytracker
                else if String(char) == String(gridDoubleArray[randomX][yTracker]) {
                    yTracker += 1
                
                }
                //if the previous two if statements do not run then there would be a collision
                //between the current word and the word we are attempting to add
                //so make a recursive call the checkForFit function
                else {
                    return checkForFit(word: word, orientation: 1)
                }
               
            }
            //only when all the characters in the string would be able to fit in the grid does this function
            //return the randomly generated x and y position in the grid
           return (randomX, randomY)
            
        default:
            print("somehow orientation was not 0 or 1")
            //this will never happen because the random number must be either 0 or 1
            //and then recursive calls pass their own orientation number to the next call
            return(0,0)
        }
    }
            
            

    
    mutating func addKeywords() {
        
        for word in keywords {
            //0 means it goes horizontal
            //1 means it goes vertical
            let orientation = Int.random(in: 0...1)
            
            var (x, y) = checkForFit(word: word, orientation: orientation)
            
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
        
//        replaceDashes()
        turnDoubleArrayToSingle()
        
        
        
        
    }
    
    
    
    
    
    mutating func fillWithDashes() {
        for _ in 1...10 {
            var tempArray: [String] = []
            for _ in 1...10 {
                tempArray.append("-")
            }
            gridDoubleArray.append(tempArray)
        }
        addKeywords()
    }
    
    mutating func replaceDashes() {
        for i in 0...9 {
            for j in 0...9 {
                if gridDoubleArray[i][j] == "-" {
                    let randomIndex = Int.random(in: 1...25)
                    let randomLetter = allLetters[randomIndex]
                    gridDoubleArray[i][j] = String(randomLetter)
                }
            }
        }
        turnDoubleArrayToSingle()
        
        
    }
    
    
    
    mutating func turnDoubleArrayToSingle() {
        for i in 0..<self.gridDoubleArray.count {
            for j in 0..<self.gridDoubleArray[0].count{
                self.gridSingleArray.append(gridDoubleArray[i][j])
            }
        }
    }
}
