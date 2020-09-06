//
//  ViewController.swift
//  ShopifyInternshipWordSearch
//
//  Created by Nicholas Kearns on 9/4/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    
    
    //create the title label
    let titleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.backgroundColor = .systemGray6
        l.text = "Word Search"
        l.font = UIFont(name: "Avenir", size: 25)
        l.textAlignment = .center
        return l
    }()
    
    //create the details label
    let detailsLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.backgroundColor = .systemGray6
        l.text = """
        Find various words
        in the grid of letters
        """
        l.font = UIFont(name: "Avenir", size: 25)
        l.textAlignment = .center
        l.numberOfLines = 0
        return l
    }()
    
    //create the play button
    let playButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Play!", for: .normal)
        b.titleLabel?.font = UIFont(name: "Avenir", size: 25)
        b.backgroundColor = .systemBlue
        b.layer.cornerRadius = 5
        b.titleLabel?.textAlignment = .center
        
        
        return b
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        // Do any additional setup after loading the view.
        setupLabels()
        setupButton()
    }


    
    
    
    func setupLabels() {
        //add titleLabel to the view and constrain it
        self.view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        //add detailsLabel to the view and constrain it
        self.view.addSubview(detailsLabel)
        NSLayoutConstraint.activate([
            detailsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
            detailsLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)

        
        ])

    }
    
    func setupButton() {
        //add the button to view and constrain it
        self.view.addSubview(playButton)
        NSLayoutConstraint.activate([
            playButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            playButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.50)
        ])
        
        //call the playButtonPressed when the button is tapped
        playButton.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
        
    }
    
    
    
    @objc func playButtonPressed() {
        let gameVC = GameVC()
        navigationController?.pushViewController(gameVC, animated: true)
        
    }
    
}

