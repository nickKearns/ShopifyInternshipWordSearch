//
//  GameVC.swift
//  ShopifyInternshipWordSearch
//
//  Created by Nicholas Kearns on 9/4/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit

class GameVC: UIViewController {
    
    //initialize a collection view
    let gridCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    let wordsToFind = ["swift", "kotlin", "objectivec", "variable", "java", "mobile"]
    
    var stackView: UIStackView = {
       let s  = UIStackView()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.alignment = .center
        s.axis = .vertical
        
        return s
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupCollectionView()
    }
    
    func setupStackViews() {
        self.view.addSubview(stackView)
        
        
        
        
    }
    
    
    func setupCollectionView() {
        self.view.addSubview(gridCollectionView)
        gridCollectionView.backgroundColor = .systemGray6
        gridCollectionView.delegate = self
        gridCollectionView.dataSource = self
        gridCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        
        
    }
    
    
}

extension GameVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
    
}


extension GameVC: UICollectionViewDelegateFlowLayout {
    
        	
    
}

