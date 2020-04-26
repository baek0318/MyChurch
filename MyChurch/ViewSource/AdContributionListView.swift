//
//  AdContributionListView.swift
//  MyChurch
//
//  Created by 백승화 on 2020/04/24.
//  Copyright © 2020 백승화. All rights reserved.
//

import UIKit

class AdContributionListView : UIView {
    
    convenience init(frame : CGRect, buttonTitle:[String]){
        self.init()
    }
    
    func makeScrollView() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 50))
        label.text = "헌금 명단"
        label.font = .boldSystemFont(ofSize: 50)
        let scrollview = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        scrollview.backgroundColor = .clear
        self.addSubview(scrollview)
        scrollview.addSubview(label)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.backgroundColor = UIColor.clear
        self.makeScrollView()
    }
}
