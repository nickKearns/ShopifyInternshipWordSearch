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
        l.backgroundColor = .systemGray6
        l.font = UIFont(name: "Avenir", size: 30)
        
        return l
    }()
    
    let replayButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Play Again", for: .normal)
        b.titleLabel?.font = UIFont(name: "Avenir", size: 25)
        b.backgroundColor = .systemBlue
        b.layer.cornerRadius = 5
        b.titleLabel?.textAlignment = .center
        
        
        return b
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placeLabel()
        setupButton()
        
    }
    
    
    
    func placeLabel() {
        self.view.addSubview(winLabel)
        NSLayoutConstraint.activate([
            winLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            winLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
    }
    
    
    func setupButton() {
        self.view.addSubview(replayButton)
        replayButton.addTarget(self, action: #selector(replayButtonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            replayButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            replayButton.topAnchor.constraint(equalTo: winLabel.bottomAnchor, constant: 80),
            replayButton.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.80)
        ])
    }
    
    
    
    
    @objc func replayButtonTapped() {
        
        navigationController?.popToRootViewController(animated: true)
    }
    
}
