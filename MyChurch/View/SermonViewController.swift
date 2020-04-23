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
        searchDevice()
        navigationItem.largeTitleDisplayMode = .automatic
    }
    
    func segmented(height : CGFloat) {
        let codeSegmented = CustomSegmentedControl(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: 30), buttonTitle: ["예배순서","텍스트 설교","칼럼"])
        codeSegmented.backgroundColor = .clear
        self.view.addSubview(codeSegmented)
        codeSegmented.translatesAutoresizingMaskIntoConstraints = false
        codeSegmented.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        codeSegmented.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: height).isActive = true
        codeSegmented.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        codeSegmented.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true

    }
    
    func sermonSequence(height : CGFloat) {
        let sequence = SermonSequenceView()
        self.view.addSubview(sequence)
        sequence.translatesAutoresizingMaskIntoConstraints = false
        sequence.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: height).isActive = true
        sequence.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        sequence.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        sequence.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true

    }
    
    func searchDevice() {
        if UIDevice().userInterfaceIdiom == .phone {
          switch UIScreen.main.nativeBounds.height {
            case 1136:
            print("iPhone se")
            navigationController?.navigationBar.prefersLargeTitles = false
            segmented(height: -(self.view.frame.height-145))
            sermonSequence(height: 48)
            case 1334:
            print("iPhone 6/6S/7/8")
            navigationController?.navigationBar.prefersLargeTitles = false
            segmented(height: -(self.view.frame.height-145))
            sermonSequence(height: 48)
            case 2208:
            print("iPhone 6+/6S+/7+/8+")
            navigationController?.navigationBar.prefersLargeTitles = false
            segmented(height: -(self.view.frame.height-145))
            sermonSequence(height: 48)
            case 2436:
            print("iPhone X")
            navigationController?.navigationBar.prefersLargeTitles = true
            segmented(height: -560)
            sermonSequence(height: 40)
            case 2688:
            print("iPhone 11pro Max")
            navigationController?.navigationBar.prefersLargeTitles = true
            segmented(height: -(self.view.frame.height-260))
            sermonSequence(height: 40)
            case 1792:
            print("iPhone 11/Xr")
            navigationController?.navigationBar.prefersLargeTitles = true
            segmented(height: -(self.view.frame.height-260))
            sermonSequence(height: 40)
            default:
            print("unknown")
          }
        }
    }
}
