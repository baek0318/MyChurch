//
//  MainViewController.swift
//  MyChurch
//
//  Created by 백승화 on 2020/04/22.
//  Copyright © 2020 백승화. All rights reserved.
//

import UIKit

class MainViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchDevice()
        navigationItem.largeTitleDisplayMode = .automatic
    }
    
    func searchDevice() {
        if UIDevice().userInterfaceIdiom == .phone {
          switch UIScreen.main.nativeBounds.height {
            case 1136:
            print("iPhone se")
            self.navigationController?.navigationBar.prefersLargeTitles = true
            case 1334:
            print("iPhone 6/6S/7/8")
            self.navigationController?.navigationBar.prefersLargeTitles = true
            case 2208:
            print("iPhone 6+/6S+/7+/8+")
            self.navigationController?.navigationBar.prefersLargeTitles = true
            case 2436:
            print("iPhone X")
            self.navigationController?.navigationBar.prefersLargeTitles = true
            case 2688:
            print("iPhone 11pro Max")
            self.navigationController?.navigationBar.prefersLargeTitles = true
            case 1792:
            print("iPhone 11/Xr")
            self.navigationController?.navigationBar.prefersLargeTitles = true
            default:
            print("unknown")
          }
        }
    }
    
    
}
