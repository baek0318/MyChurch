//
//  AdViewController.swift
//  MyChurch
//
//  Created by 백승화 on 2020/04/22.
//  Copyright © 2020 백승화. All rights reserved.
//

import UIKit

class AdViewController : UIViewController {
    
    let codeSegmented = CustomSegmentedControl(buttonTitle: ["교회소식","교우소식","헌금자 명단","예배위원"])
    var adChurchInfoView : AdChurchInfoView!
    var adNeighborInfoView : AdNeighborInfoView!
    var adContributionListView : AdContributionListView!
    var adSupportListView : AdSupportListView!
    var scrollview : UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        codeSegmented.delegate = self
        searchDevice()
        makeScrollView()
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
        scrollview.contentSize.width = self.view.frame.width*4
        adChurchInfo(xPosition: 0)
        adNeighborInfo(xPosition: self.view.frame.width)
        adContributionList(xPosition: self.view.frame.width*2)
        adSupportList(xPosition : self.view.frame.width*3)
    }
    
    func adChurchInfo(xPosition : CGFloat){
        adChurchInfoView = AdChurchInfoView(frame: CGRect(x: xPosition, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        adChurchInfoView.tag = 100
        scrollview.addSubview(adChurchInfoView)
    }
    func adNeighborInfo(xPosition : CGFloat){
        adNeighborInfoView = AdNeighborInfoView(frame: CGRect(x: xPosition, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        adNeighborInfoView.tag = 101
        scrollview.addSubview(adNeighborInfoView)
    }
    func adContributionList(xPosition : CGFloat){
        adContributionListView = AdContributionListView(frame: CGRect(x: xPosition, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        adContributionListView.tag = 102
        scrollview.addSubview(adContributionListView)
    }
    func adSupportList(xPosition : CGFloat){
        adSupportListView = AdSupportListView(frame: CGRect(x: xPosition, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        adSupportListView.tag = 102
        scrollview.addSubview(adSupportListView)
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

extension AdViewController : CustomSegmentedControlDelegate {
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
        else if(index == 3){
            scrollview.contentOffset.x = self.view.frame.width*3
        }
    }
    
}
