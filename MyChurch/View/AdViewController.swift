//
//  AdViewController.swift
//  MyChurch
//
//  Created by 백승화 on 2020/04/22.
//  Copyright © 2020 백승화. All rights reserved.
//

import UIKit

class AdViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        let codeSegmented = CustomSegmentedControl(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: 130), buttonTitle: ["교회소식","교우소식","헌금자 명단","당번"])
        codeSegmented.backgroundColor = .clear
        view.addSubview(codeSegmented)
    }
}
