//
//  GameVC.swift
//  ShopifyInternshipWordSearch
//
//  Created by Nicholas Kearns on 9/4/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit

class GameVC: UIViewController {
    
    //MARK: properties
    //initialize a collection view
    let gridCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    let wordsToFind = ["swift", "kotlin", "objectivec", "variable", "java", "mobile"]
    
    let allLetters = "abcdefghijklmnopqrstuvwxyz"
    
    //create a label for each of the 6 words to be found
    let swiftLabel: UILabel = {
        let l = WordBankLabel()
        l.setText(word: "swift")
        return l
    }()
    let kotlinLabel: UILabel = {
        let l = WordBankLabel()
        l.setText(word: "kotlin")
        return l
    }()
    let objcLabel: UILabel = {
        let l = WordBankLabel()
        l.setText(word: "objectivec")
        return l
    }()
    let variableLabel: UILabel = {
        let l = WordBankLabel()
        l.setText(word: "variable")
        return l
    }()
    let javaLabel: UILabel = {
        let l = WordBankLabel()
        l.setText(word: "javaLabel")
        return l
    }()
    let mobileLabel: UILabel = {
        let l = WordBankLabel()
        l.setText(word: "mobile")
        return l
    }()
    
    
    
    var stackView: UIStackView = {
       let s  = UIStackView()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.alignment = .center
        s.axis = .vertical
        return s
    }()
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupStackViews()
        setupCollectionView()
    }
    
    func setupStackViews() {
        //add the stackview to the main view
        self.view.addSubview(stackView)
        //create 3 horizontal stack views with 2 labels in each
        let horizontalStack1 = UIStackView(arrangedSubviews: [swiftLabel, kotlinLabel])
        horizontalStack1.axis = .horizontal
        let horizontalStack2 = UIStackView(arrangedSubviews: [objcLabel, variableLabel])
        horizontalStack2.axis = .horizontal
        let horizontalStack3 = UIStackView(arrangedSubviews: [javaLabel, mobileLabel])
        horizontalStack3.axis = .horizontal
        //Add the 3 horizontal stack views to the outer vertical stack view
        stackView.addArrangedSubview(horizontalStack1)
        stackView.addArrangedSubview(horizontalStack2)
        stackView.addArrangedSubview(horizontalStack3)
        
        //constrain the vertical stack to the bottom section of the view
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            stackView.widthAnchor.constraint(lessThanOrEqualTo: self.view.widthAnchor, multiplier: 0.80),
        ])
    }
    
    
    func setupCollectionView() {
        self.view.addSubview(gridCollectionView)
        gridCollectionView.backgroundColor = .systemGray6
        gridCollectionView.delegate = self
        gridCollectionView.dataSource = self
        gridCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        //Constrain the collection view to fill the rest of the screen
        NSLayoutConstraint.activate([
            gridCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            gridCollectionView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -8),
            gridCollectionView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor)
        
        ])
        
    }
    
    
}

extension GameVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        allLetters.
    }
    
    
    
}


extension GameVC: UICollectionViewDelegateFlowLayout {
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 60  , height: 60)
       }
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return  UIEdgeInsets(top: 20 , left: 20  ,  bottom: 20, right: 20)
       }
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 20.0
       }
    
    
        	
    
}

