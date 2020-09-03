//
//  UIViewExtension.swift
//  youtube
//
//  Created by Brayan Kelly Balbuena on 1/12/20.
//  Copyright © 2020 Brayan Kelly Balbuena. All rights reserved.
//

import UIKit

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options:
            NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
