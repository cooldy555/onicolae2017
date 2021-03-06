//
//  onicolae2017.swift
//  onicolae2017
//
//  Created by cooldy555 on May 3, 2017.
//  Copyright © 2017 ecole42. All rights reserved.
//

import Foundation
import UIKit

public class onicolae2017: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let bundle = Bundle(for: type(of: self))
        let image = UIImage(named: "wk", in: bundle, compatibleWith: nil)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        
        self.addConstraint(NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0))
        self.layoutIfNeeded()
    }
}
