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
    
    let codeSegmented = CustomSegmentedControl( buttonTitle: ["예배순서","텍스트 설교","칼럼"])
    var sermonTextView : SermonTextView!
    var sermonColumn : SermonColumnView!
    var sermonSequence : SermonSequenceView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        codeSegmented.delegate = self
        searchDevice()
        navigationItem.largeTitleDisplayMode = .automatic
    }
    
    func segmented(height : CGFloat) {
        codeSegmented.backgroundColor = .clear
        self.view.addSubview(codeSegmented)
        codeSegmented.translatesAutoresizingMaskIntoConstraints = false
        codeSegmented.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        codeSegmented.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: height).isActive = true
        codeSegmented.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        codeSegmented.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    func searchDevice() {
        if UIDevice().userInterfaceIdiom == .phone {
          switch UIScreen.main.nativeBounds.height {
            case 1136:
            print("iPhone se")
            navigationController?.navigationBar.prefersLargeTitles = false
            segmented(height: -(self.view.frame.height-135))
            case 1334:
            print("iPhone 6/6S/7/8")
            navigationController?.navigationBar.prefersLargeTitles = false
            segmented(height: -(self.view.frame.height-135))
            case 2208:
            print("iPhone 6+/6S+/7+/8+")
            navigationController?.navigationBar.prefersLargeTitles = false
            segmented(height: -(self.view.frame.height-135))
            case 2436:
            print("iPhone X")
            navigationController?.navigationBar.prefersLargeTitles = true
            segmented(height: -560)
            case 2688:
            print("iPhone 11pro Max")
            navigationController?.navigationBar.prefersLargeTitles = true
            segmented(height: -(self.view.frame.height-260))
            case 1792:
            print("iPhone 11/Xr")
            navigationController?.navigationBar.prefersLargeTitles = true
            segmented(height: -(self.view.frame.height-260))
            default:
            print("unknown")
          }
        }
    }
}

extension SermonViewController : CustomSegmentedControlDelegate {
    func pageChange(index: Int) {
        if(index == 0){
            if let viewtag = self.view.viewWithTag(101) {
                viewtag.removeFromSuperview()
            }
            if let viewtag = self.view.viewWithTag(102){
                viewtag.removeFromSuperview()
            }
            sermonSequence = SermonSequenceView(frame: CGRect(x: 0, y: 190, width: self.view.frame.width, height: self.view.frame.height))
            sermonSequence.tag = 100
            self.view.addSubview(sermonSequence)
            sermonSequence.translatesAutoresizingMaskIntoConstraints = false
            sermonSequence.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
            sermonSequence.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            sermonSequence.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            sermonSequence.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        }
        else if(index == 1){
            if let viewtag = self.view.viewWithTag(100){
                viewtag.removeFromSuperview()
            }
            if let viewtag = self.view.viewWithTag(102){
                viewtag.removeFromSuperview()
            }
            sermonTextView = SermonTextView(frame: CGRect(x: 0, y: 190, width: self.view.frame.width, height: self.view.frame.height))
            sermonTextView.tag = 101
            self.view.addSubview(sermonTextView)
            sermonTextView.translatesAutoresizingMaskIntoConstraints = false
            sermonTextView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
            sermonTextView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            sermonTextView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            sermonTextView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        }
        else if(index == 2){
            if let viewtag = self.view.viewWithTag(100){
                viewtag.removeFromSuperview()
            }
            if let viewtag = self.view.viewWithTag(101){
                viewtag.removeFromSuperview()
            }
            sermonColumn = SermonColumnView(frame: CGRect(x: 0, y: 190, width: self.view.frame.width, height: self.view.frame.height))
            sermonColumn.tag = 102
            self.view.addSubview(sermonColumn)
            sermonColumn.translatesAutoresizingMaskIntoConstraints = false
            sermonColumn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
            sermonColumn.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            sermonColumn.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            sermonColumn.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        }
    }
    
}
