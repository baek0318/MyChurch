//
//  MainViewController.swift
//  MyChurch
//
//  Created by 백승화 on 2020/04/22.
//  Copyright © 2020 백승화. All rights reserved.
//

import UIKit

@IBDesignable
class SermonViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        let codeSegmented = CustomSegmentedControl(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: 130), buttonTitle: ["예배순서","텍스트 설교","칼럼"])
        codeSegmented.backgroundColor = .clear
        view.addSubview(codeSegmented)
    }
}
