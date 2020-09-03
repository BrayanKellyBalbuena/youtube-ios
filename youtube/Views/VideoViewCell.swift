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
        imageView.image = UIImage(named: "thumbnail_preview")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile_image")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230 / 255, green: 230 / 255, blue: 230 / 255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Better Previews with PreviewLayout"
        return label
    }()
    
    let subTitleTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Lets Build That App • 2.8K views 5 days ago"
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        textView.textColor = .lightGray
        return textView
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
        addSubview(subTitleTextView)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWithFormat(format: "H:|-16-[v0(44)]", views: userProfileImageView)
        
        // vertical constraint
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView,
                                 userProfileImageView, separatorView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        
        // titleLabel constraint
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 4),
                                     titleLabel.leadingAnchor.constraint(equalTo: userProfileImageView.trailingAnchor,constant: 8),
                                     titleLabel.trailingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor),
                                     titleLabel.heightAnchor.constraint(equalToConstant: 20)])
        
        // subtitle constraint
        NSLayoutConstraint.activate([subTitleTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
                                     subTitleTextView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                                     subTitleTextView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
                                     subTitleTextView.heightAnchor.constraint(equalTo: titleLabel.heightAnchor, constant: 20)])
    }
}
