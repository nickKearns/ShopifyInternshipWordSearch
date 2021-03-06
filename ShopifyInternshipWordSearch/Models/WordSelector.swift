//
//  WordSelector.swift
//  ShopifyInternshipWordSearch
//
//  Created by Nicholas Kearns on 9/7/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import Foundation

struct WordSelector {
    
    var selectedLetters: [String] = []
    
    let keywords: [String] = ["swift", "kotlin", "objectivec", "variable", "java", "mobile"]

    
    func checkForKeyword(selectedLetters: [String]) -> String {
        
        for word in keywords {
            let keywordArr = Array(word)
            var correctLetters = 0
            for i in 0..<selectedLetters.count {
                if String(keywordArr[i]) != String(selectedLetters[i]) {
                    break
                }
                else {
                    correctLetters += 1
                    
                }
            }
            if correctLetters == word.count {
                return word
            }
        }
        return ""
    }
}
