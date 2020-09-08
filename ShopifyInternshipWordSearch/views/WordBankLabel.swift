//
//  wordBankLabel.swift
//  ShopifyInternshipWordSearch
//
//  Created by Nicholas Kearns on 9/5/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit


class WordBankLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setText(word: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = .center
        self.text = word
        self.textColor = .systemRed
        self.font = UIFont(name: "Avenir Bold", size: 15)
        
    }
    
    func wordFound() {
        self.textColor = .systemBlue
    }
    
    func wasFound() {
        self.textColor = .systemBlue
    }
    
}
