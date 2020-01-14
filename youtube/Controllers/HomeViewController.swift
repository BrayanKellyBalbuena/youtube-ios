//
//  HomeViewController.swift
//  youtube
//
//  Created by Brayan Kelly Balbuena on 1/12/20.
//  Copyright © 2020 Brayan Kelly Balbuena. All rights reserved.
//

import UIKit

private let sections: Int = 0
private let numberOfItems = 5

class HomeViewController: UICollectionViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        collectionView.backgroundColor = .white
        
        collectionView.register(VideoViewCell.self, forCellWithReuseIdentifier: VideoViewCell.identifier)
    }
    
    // MARK: UICollectionViewDataSource
    
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return sections
//    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return numberOfItems
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:VideoViewCell.identifier,
                                                            for: indexPath) as? VideoViewCell
            else {
                fatalError("Can't dequeue Video Cell")
        }
        
        return cell
    }
}

// MARK: UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}
