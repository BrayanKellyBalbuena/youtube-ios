//
//  VideoViewCell.swift
//  youtube
//
//  Created by Brayan Kelly Balbuena on 1/12/20.
//  Copyright © 2020 Brayan Kelly Balbuena. All rights reserved.
//

import UIKit

class VideoViewCell: UICollectionViewCell {
    static let identifier = String(describing: VideoViewCell.self)
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .green
        
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .purple
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let subTitleLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
    func setupViews() {
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWithFormat(format: "H:|-16-[v0(44)]", views: userProfileImageView)
        
        // vertical constraint
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView,
                                 userProfileImageView, separatorView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        
        // titleLabel constraint
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 8),
                                     titleLabel.leadingAnchor.constraint(equalTo: userProfileImageView.trailingAnchor,constant: 8),
                                     titleLabel.trailingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor),
                                     titleLabel.heightAnchor.constraint(equalToConstant: 20)])
        
        // subtitle constraint
        NSLayoutConstraint.activate([subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
                                     subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                                     subTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor), subTitleLabel.heightAnchor.constraint(equalTo: titleLabel.heightAnchor)])
    }
}
