//
//  WinVC.swift
//  ShopifyInternshipWordSearch
//
//  Created by Nicholas Kearns on 9/8/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit



class WinVC: UIViewController {
    
    
    let winLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = """
            Congratulations you found
            all the words!
            """
        l.numberOfLines = 0
        
        return l
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placeLabel()
        
    }
    
    
    
    func placeLabel() {
        self.view.addSubview(winLabel)
        NSLayoutConstraint.activate([
            winLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            winLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
    }
    
    
}
