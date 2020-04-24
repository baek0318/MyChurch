//
//  MainViewController.swift
//  MyChurch
//
//  Created by 백승화 on 2020/04/22.
//  Copyright © 2020 백승화. All rights reserved.
//

import UIKit

//MARK: - 레이아웃 수정하기 리팩토링 필수!!

class MainViewController : UIViewController {
    
    var mainView : UIScrollView!
    var imageview : UIImageView!
    var textview : UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchDevice()
        create()
        navigationItem.largeTitleDisplayMode = .automatic
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapaction(recognizer:)))
        mainView.addGestureRecognizer(tap)
    }
    
    @objc func tapaction(recognizer : UIGestureRecognizer) {
        if recognizer.state == .ended {
            print("tap")
            UIView.animate(withDuration: 1.0, animations: {
                if self.mainView.translatesAutoresizingMaskIntoConstraints == true && self.imageview.translatesAutoresizingMaskIntoConstraints == true{
                    
                    self.mainView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
                    self.imageview.frame.origin = CGPoint(x: 0, y: 0)
                    self.mainView.contentSize.height = 0
                    self.imageview.frame.size.width = self.view.frame.width
                    self.textview.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
                    
                    self.mainView.translatesAutoresizingMaskIntoConstraints = false
                    self.imageview.translatesAutoresizingMaskIntoConstraints = false
                    self.navigationController?.navigationBar.isHidden = false
                    self.mainView.isScrollEnabled = false
                    self.mainView.showsVerticalScrollIndicator = false
                    
                }else {
                    
                    self.mainView.isScrollEnabled = true
                    
                    self.mainView.translatesAutoresizingMaskIntoConstraints = true
                    self.imageview.translatesAutoresizingMaskIntoConstraints = true
                    self.mainView.showsVerticalScrollIndicator = true
                    self.navigationController?.navigationBar.isHidden = true
                    
                    self.mainView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
                    self.mainView.contentSize.height = self.view.frame.height+60
                    
                    self.imageview.frame.origin = CGPoint(x: 0, y: 0)
                    self.imageview.frame.size.width = self.view.frame.width
                    
                    self.textview.frame = CGRect(x: 10, y: self.imageview.frame.height+20, width: self.view.frame.width-20, height: 250)
                    
                }
            })
        }
    }
    
    
    
    func create() {
        mainView = .init(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        mainView.backgroundColor = .clear
        mainView.layer.cornerRadius = CGFloat(20)
        mainView.layer.masksToBounds = true
        mainView.isScrollEnabled = false
        mainView.showsVerticalScrollIndicator = false
        self.view.addSubview(mainView)
        createTextView()
        createImageView()
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        mainView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        mainView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        mainView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    func createImageView() {
        imageview = .init(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        imageview.image = UIImage(named: "flower")
        imageview.layer.cornerRadius = CGFloat(20)
        imageview.layer.masksToBounds = true
        self.mainView.addSubview(imageview)
        
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        imageview.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        imageview.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        imageview.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        createTitle()
    }
    
    func createTextView() {
        textview = UITextView(frame: CGRect(x: 0, y: 600, width: self.view.frame.width, height: self.view.frame.height))
        textview.isEditable = false
        textview.backgroundColor = .clear
        textview.font  = .boldSystemFont(ofSize: 15)
        textview.text = """
        대흥교회 방문을 진심으로 환영합니다.

        저희 대흥교회는 행복한 교회를 꿈꾸며 지역을 사랑으로 품고 있는 살아있는 교회입니다.

        능력 있는 말씀과 역동적인 예배, 제자훈련과 교육사업을 통한 인재양성, 복음전도에 최선을 다하고 있습니다.
        미래의 꿈과 진실한 사랑과 하나님의 소명으로 지역사회를 섬기는데 최선을 다 할 것입니다.

        가족같이 서로를 아껴주고 참 쉼과 안식이 있는 대흥교회에서
        이제 행복한 삶을 꿈꿔보시기 바랍니다.
        """
        mainView.addSubview(textview)
    }
    
    
    //그림안에 들어갈 제목이랑 날짜
    func createTitle() {
        let dateFormat = DateFormatter()
        let date = Date(timeIntervalSinceNow: 0)
        dateFormat.locale = Locale(identifier: "ko_KR")
        dateFormat.timeStyle = DateFormatter.Style.none
        dateFormat.dateStyle = DateFormatter.Style.long
        dateFormat.setLocalizedDateFormatFromTemplate("MMMMd") // set template after setting locale
        let title = UILabel(frame: CGRect(x: 20, y: 40, width: self.imageview.frame.width, height: 50))
        let subTitle = UILabel(frame: CGRect(x: 20, y: 10, width: self.imageview.frame.width, height: 50))
        title.text = "대흥교회"
        subTitle.text = dateFormat.string(from: date)
        
        title.font = .boldSystemFont(ofSize: 40)
        subTitle.font = .boldSystemFont(ofSize: 20)
        subTitle.textColor = .init(red: 0.196, green: 0.196, blue: 0.196, alpha: 1.0)
        imageview.addSubview(title)
        imageview.addSubview(subTitle)
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
