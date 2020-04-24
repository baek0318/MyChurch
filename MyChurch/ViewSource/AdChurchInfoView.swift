//
//  AdChurchInfoView.swift
//  MyChurch
//
//  Created by 백승화 on 2020/04/24.
//  Copyright © 2020 백승화. All rights reserved.
//

import UIKit

class AdChurchInfoView : UIView {
    
    convenience init(frame : CGRect, buttonTitle:[String]){
        self.init()
    }
    
    func makeScrollView() {
        let scrollview = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        scrollview.backgroundColor = .clear
        self.addSubview(scrollview)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.backgroundColor = UIColor.clear
        self.makeScrollView()
    }
}
