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
    
    
//    let allLetters = Array("abcdefghijklmnopqrstuvwxyz")
    //^ might not need this once there is an instance of GridGenerator
    
    var selectedStrings: [String] = []
    
    
    var gridGenerator = GridGenerator()
    
    
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
        l.setText(word: "java")
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
        s.distribution = .fillEqually
        return s
    }()
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        gridGenerator.fillGrid()
        setupStackViews()
        setupCollectionView()

        

        
    }
    
    func setupStackViews() {
        //add the stackview to the main view
        self.view.addSubview(stackView)
        //create 3 horizontal stack views with 2 labels in each
        let horizontalStack1 = UIStackView()
        horizontalStack1.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack1.addArrangedSubview(swiftLabel)
        horizontalStack1.addArrangedSubview(kotlinLabel)
        horizontalStack1.axis = .horizontal
        horizontalStack1.alignment = .center
        horizontalStack1.distribution = .fill
        horizontalStack1.spacing = 40.0
        
        
        let horizontalStack2 = UIStackView()
        horizontalStack2.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack2.addArrangedSubview(objcLabel)
        horizontalStack2.addArrangedSubview(variableLabel)
        horizontalStack2.axis = .horizontal
        horizontalStack2.alignment = .center
        horizontalStack2.distribution = .fill
        horizontalStack2.spacing = 40.0
        
        
        let horizontalStack3 = UIStackView()
        horizontalStack3.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack3.addArrangedSubview(javaLabel)
        horizontalStack3.addArrangedSubview(mobileLabel)
        horizontalStack3.axis = .horizontal
        horizontalStack3.alignment = .center
        horizontalStack3.distribution = .fill
        horizontalStack3.spacing = 40.0
        //Add the 3 horizontal stack views to the outer vertical stack view
        stackView.addArrangedSubview(horizontalStack1)
        stackView.addArrangedSubview(horizontalStack2)
        stackView.addArrangedSubview(horizontalStack3)
        
        //constrain the vertical stack to the bottom section of the view
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.20),
            stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.90)
        ])
    }
    
    
    func setupCollectionView() {
        gridCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(gridCollectionView)
        gridCollectionView.allowsMultipleSelection = true
        gridCollectionView.backgroundColor = .systemGray6
//        let gestureRecognizer = UIGestureRecognizer(target: self, action: #selector(handleGesture))
//        gridCollectionView.addGestureRecognizer(gestureRecognizer)
        gridCollectionView.delegate = self
        gridCollectionView.dataSource = self
        gridCollectionView.register(UINib(nibName: "LetterCell", bundle: .main), forCellWithReuseIdentifier: LetterCell.identifier)
        
        //Constrain the collection view to fill the rest of the screen
        NSLayoutConstraint.activate([
            gridCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            gridCollectionView.bottomAnchor.constraint(equalTo: stackView.topAnchor),
            gridCollectionView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor)
            
        ])
        
    }
    
//    @objc
//    func handleGesture() {
//
//
//    }
    
    
    
    
}

extension GameVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "letterCell", for: indexPath) as! LetterCell
        cell.letterLabel.text = gridGenerator.gridSingleArray[indexPath.row]
        return cell
    }
    
    
    
}


extension GameVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width/14, height: gridCollectionView.frame.height/14)
    }
    
    
}

