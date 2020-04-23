//
//  SermonSequenceView.swift
//  MyChurch
//
//  Created by 백승화 on 2020/04/23.
//  Copyright © 2020 백승화. All rights reserved.
//

import UIKit

class SermonSequenceView : UIView {
    let xibName = "SermonSequence"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        let view = Bundle.main.loadNibNamed("SermonSequence", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        view.backgroundColor = .white
        self.addSubview(view)
    }
    
}
