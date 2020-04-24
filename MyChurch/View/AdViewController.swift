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

extension AdViewController : CustomSegmentedControlDelegate {
    func pageChange(index: Int) {
        if(index == 0){
            if let viewtag = self.view.viewWithTag(101) {
                viewtag.removeFromSuperview()
            }
            if let viewtag = self.view.viewWithTag(102){
                viewtag.removeFromSuperview()
            }
            if let viewtag = self.view.viewWithTag(103){
                viewtag.removeFromSuperview()
            }
            adChurchInfoView = AdChurchInfoView(frame: CGRect(x: 0, y: 190, width: self.view.frame.width, height: self.view.frame.height))
            adChurchInfoView.tag = 100
            self.view.addSubview(adChurchInfoView)
            adChurchInfoView.translatesAutoresizingMaskIntoConstraints = false
            adChurchInfoView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
            adChurchInfoView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            adChurchInfoView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            adChurchInfoView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        }
        else if(index == 1){
            if let viewtag = self.view.viewWithTag(100){
                viewtag.removeFromSuperview()
            }
            if let viewtag = self.view.viewWithTag(102){
                viewtag.removeFromSuperview()
            }
            if let viewtag = self.view.viewWithTag(103){
                viewtag.removeFromSuperview()
            }
            adNeighborInfoView = AdNeighborInfoView(frame: CGRect(x: 0, y: 190, width: self.view.frame.width, height: self.view.frame.height))
            adNeighborInfoView.tag = 101
            self.view.addSubview(adNeighborInfoView)
            adNeighborInfoView.translatesAutoresizingMaskIntoConstraints = false
            adNeighborInfoView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
            adNeighborInfoView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            adNeighborInfoView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            adNeighborInfoView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        }
        else if(index == 2){
            if let viewtag = self.view.viewWithTag(100){
                viewtag.removeFromSuperview()
            }
            if let viewtag = self.view.viewWithTag(101){
                viewtag.removeFromSuperview()
            }
            if let viewtag = self.view.viewWithTag(103){
                viewtag.removeFromSuperview()
            }
            adContributionListView = AdContributionListView(frame: CGRect(x: 0, y: 190, width: self.view.frame.width, height: self.view.frame.height))
            adContributionListView.tag = 102
            self.view.addSubview(adContributionListView)
            adContributionListView.translatesAutoresizingMaskIntoConstraints = false
            adContributionListView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
            adContributionListView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            adContributionListView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            adContributionListView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        }
        else if(index == 3){
            if let viewtag = self.view.viewWithTag(100){
                viewtag.removeFromSuperview()
            }
            if let viewtag = self.view.viewWithTag(101){
                viewtag.removeFromSuperview()
            }
            if let viewtag = self.view.viewWithTag(102){
                viewtag.removeFromSuperview()
            }
            adSupportListView = AdSupportListView(frame: CGRect(x: 0, y: 190, width: self.view.frame.width, height: self.view.frame.height))
            adSupportListView.tag = 103
            self.view.addSubview(adSupportListView)
            adSupportListView.translatesAutoresizingMaskIntoConstraints = false
            adSupportListView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
            adSupportListView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            adSupportListView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            adSupportListView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        }
    }
    
}
