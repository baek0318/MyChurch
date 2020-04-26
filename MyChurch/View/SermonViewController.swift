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
    var sermonColumnView : SermonColumnView!
    var sermonSequenceView : SermonSequenceView!
    var scrollview: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        codeSegmented.delegate = self
        searchDevice()
        makeScrollView()
        scrollview.delegate = self
        navigationItem.largeTitleDisplayMode = .automatic
        
    }
    
    func makeScrollView() {
        scrollview = UIScrollView()
        scrollview.isPagingEnabled = true
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.bounces = false
        self.view.addSubview(scrollview)
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        scrollview.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollview.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollview.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollview.contentSize.width = self.view.frame.width*3
        sermonSequence(xPosition: 0)
        sermonText(xPosition: self.view.frame.width)
        sermonColumn(xPosition: self.view.frame.width*2)
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
    
    func sermonSequence(xPosition : CGFloat) {
        sermonSequenceView = SermonSequenceView(frame: CGRect(x: xPosition, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        sermonSequenceView.tag = 100
        scrollview.addSubview(sermonSequenceView)
    }
    func sermonText(xPosition : CGFloat) {
        sermonTextView = SermonTextView(frame: CGRect(x: xPosition, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        sermonTextView.tag = 101
        scrollview.addSubview(sermonTextView)
    }
    func sermonColumn(xPosition : CGFloat) {
        sermonColumnView = SermonColumnView(frame: CGRect(x: xPosition, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        sermonColumnView.tag = 102
        scrollview.addSubview(sermonColumnView)
    }
    
    func searchDevice() {
        if UIDevice().userInterfaceIdiom == .phone {
          switch UIScreen.main.nativeBounds.height {
            case 1136:
            print("iPhone se")
            navigationController?.navigationBar.prefersLargeTitles = false
            segmented(height: -(self.view.frame.height-145))
            case 1334:
            print("iPhone 6/6S/7/8")
            navigationController?.navigationBar.prefersLargeTitles = false
            segmented(height: -(self.view.frame.height-145))
            case 2208:
            print("iPhone 6+/6S+/7+/8+")
            navigationController?.navigationBar.prefersLargeTitles = false
            segmented(height: -(self.view.frame.height-145))
            case 2436:
            print("iPhone X")
            navigationController?.navigationBar.prefersLargeTitles = true
            segmented(height: -550)
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
           scrollview.contentOffset.x = self.view.frame.width*0
        }
        else if(index == 1){
           scrollview.contentOffset.x = self.view.frame.width*1
        }
        else if(index == 2){
           scrollview.contentOffset.x = self.view.frame.width*2
        }
    }
    
}

extension SermonViewController : UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if scrollview.contentOffset.x == 0 {
            print(scrollView.contentOffset.x)
        }
        else if scrollview.contentOffset.x == self.view.frame.width*1 {
            print(scrollView.contentOffset.x)
        }
        else if scrollview.contentOffset.x == self.view.frame.width*2 {
            print(scrollView.contentOffset.x)
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
}
