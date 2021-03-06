//
//  GameVC.swift
//  ShopifyInternshipWordSearch
//
//  Created by Nicholas Kearns on 9/4/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit

class GameVC: UIViewController, UIGestureRecognizerDelegate {
    
    //MARK: properties
    //initialize a collection view
    let gridCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    
    var wordsFound: Int = 0

    
    var currentSelectedLetters: [String] = []
    
    var selectedStrings: [String] = []
    
    
    var gridGenerator = GridGenerator()
    
    var wordSelector = WordSelector()
    
    let keywords: [String] = ["swift", "kotlin", "objectivec", "variable", "java", "mobile"]

    
    
    
    //create a label for each of the 6 words to be found
    //setText is a custom function created in the WordBankLabel subclass
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
        view.backgroundColor = .systemBackground
        gridGenerator.fillWithDashes()
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
        gridCollectionView.backgroundColor = .systemBackground
        gridCollectionView.delegate = self
        gridCollectionView.dataSource = self
        gridCollectionView.allowsMultipleSelection = true
        gridCollectionView.register(UINib(nibName: "LetterCell", bundle: .main), forCellWithReuseIdentifier: LetterCell.identifier)
        
        //Constrain the collection view to fill the rest of the screen
        NSLayoutConstraint.activate([
            gridCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            gridCollectionView.bottomAnchor.constraint(equalTo: stackView.topAnchor),
            gridCollectionView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor)
            
        ])
        
    }
    
    
   
    
    
    
}


//MARK: function for GameVC to conform to collection view protocols
extension GameVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.contentView.backgroundColor = .systemBackground
        }
        currentSelectedLetters = []
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? LetterCell {
            cell.contentView.backgroundColor = .systemGray3
            currentSelectedLetters.append(cell.letterLabel.text!)
        }
        
        let foundKeyword = wordSelector.checkForKeyword(selectedLetters: currentSelectedLetters)
        if foundKeyword != "" {
            
            
//            guard let selectedCells = gridCollectionView.indexPathsForSelectedItems else {return}
//            for cellIndexPath in selectedCells {
//                
//                gridCollectionView.deselectItem(at: cellIndexPath, animated: true)
//                
//            }
            
            currentSelectedLetters = []
            
            switch foundKeyword {
                //
            case "swift":
                swiftLabel.textColor = .systemBlue
                wordsFound += 1
            case "kotlin":
                kotlinLabel.textColor = .systemBlue
                wordsFound += 1
            case "objectivec":
                objcLabel.textColor = .systemBlue
                wordsFound += 1
            case "variable":
                variableLabel.textColor = .systemBlue
                wordsFound += 1
            case "java":
                javaLabel.textColor = .systemBlue
                wordsFound += 1
            case "mobile":
                mobileLabel.textColor = .systemBlue
                wordsFound += 1
                
            default:
                print("")

            }
            
            
            
        }
        
        if wordsFound == 6 {
            let winVC = WinVC()
            navigationController?.pushViewController(winVC, animated: true)
        }
        
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
        cell.letterLabel.font = UIFont(name: "Avenir", size: 15)
        return cell
    }
    
    
    
}

//MARK: collection view delegate flow layout conform
extension GameVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: gridCollectionView.frame.width / 14, height: gridCollectionView.frame.height / 14)
    }
    
    
    
    
}

