//
//  MoreViewController.swift
//  MyChurch
//
//  Created by 백승화 on 2020/04/22.
//  Copyright © 2020 백승화. All rights reserved.
//

import UIKit

class MoreViewController : UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
    }
}

