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
        
        
        switch orientation {
        case 0:
            let randomX = Int.random(in: 0..<self.gridDoubleArray.count - (word.count - 1))
            var xTracker = randomX
            let randomY = Int.random(in: 0..<self.gridDoubleArray[0].count )
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
            let randomX = Int.random(in: 0..<self.gridDoubleArray.count)
            let randomY = Int.random(in: 0..<self.gridDoubleArray[0].count - (word.count - 1) )
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
        
        replaceDashes()
        
        
        
        
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
        print(gridSingleArray)
    }
}
