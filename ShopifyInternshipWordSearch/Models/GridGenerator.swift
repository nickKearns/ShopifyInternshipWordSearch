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
    
    
    
    mutating func fillGrid() {
        for i in 0...10 {
            var tempArray: [String] = []
            for j in 0...10 {
                
                let randomIndex = Int.random(in: 0...25)
                let randomLetter = allLetters[randomIndex]
                tempArray.append(String(randomLetter))
//                print("appending \(String(randomLetter))")
            }
            self.gridDoubleArray.append(tempArray)
//            print("appending \(tempArray)")
            
        }
        print(gridDoubleArray)
        self.turnDoubleArrayToSingle()
    }
    
    
    mutating func turnDoubleArrayToSingle() {
        for i in 1..<self.gridDoubleArray.count - 1 {
            for j in 0..<self.gridDoubleArray[1].count - 1{
                self.gridSingleArray.append(gridDoubleArray[i][j])
            }
        }
        print(self.gridSingleArray)
        
        
    }
    
    
    
}
