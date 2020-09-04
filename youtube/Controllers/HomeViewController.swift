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
private let statusBarBackroundColor = UIColor.rgb(red: 194, green: 31, blue: 31);
private let hometitle: String = "Home"

class HomeViewController: UICollectionViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        setupStatusBar()
        setupCollectionView()
        
    }
    
   private func setupTitle() {
        
        navigationItem.title = hometitle
               navigationController?.navigationBar.isTranslucent = false
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32,
        height: view.frame.height))
        titleLabel.text = hometitle
        titleLabel.textColor  = .white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
    }
    
   private func  setupStatusBar() {
        if #available(iOS 13, *)
              {
                  let statusBar = UIView(frame: (UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame)!)
                  statusBar.backgroundColor = statusBarBackroundColor
                  UIApplication.shared.keyWindow?.addSubview(statusBar)
        } else {
                 // ADD THE STATUS BAR AND SET A CUSTOM COLOR
                 let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
                 if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
                    statusBar.backgroundColor = statusBarBackroundColor
                 }
              }
         navigationController?.navigationBar.barStyle = .black
                setNeedsStatusBarAppearanceUpdate()
    }
    
   private func setupCollectionView() {
        collectionView?.backgroundColor = UIColor.white
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
        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 16 + 68)
    }
}
