//
//  CircleView.swift
//  Social-Labs
//
//  Created by Bhargav Kondapalli on 9/26/16.
//  Copyright © 2016 KikrLabs. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
    
    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width / 2        
    }

}
