//
//  CustomSegmentedControl.swift
//  MyChurch
//
//  Created by 백승화 on 2020/04/22.
//  Copyright © 2020 백승화. All rights reserved.
//

import UIKit

protocol CustomSegmentedControlDelegate {
    func pageChange(index : Int)
}

class CustomSegmentedControl : UIView {
    //필요한 모델들의 변수를 선언하여 준다
    private var buttonTitles : [String]!
    private var buttons : [UIButton]!
    private var selectorView : UIView!
    
    var delegate : CustomSegmentedControlDelegate?
    
    //글자의 원래 색과 선택되었을때의 view와 글자의 색상을 바꿔준다
    var selectedIndex : Int = 0
    var textColor : UIColor!
    @IBInspectable var selectorViewColor : UIColor = .init(red: CGFloat(0.2), green: CGFloat(0.44), blue: CGFloat(0.878), alpha: 1.0)
    @IBInspectable var selectorTextColor : UIColor = .init(red: CGFloat(0.2), green: CGFloat(0.44), blue: CGFloat(0.878), alpha: 1.0)
    
    convenience init(buttonTitle:[String]){
        self.init()
        self.buttonTitles = buttonTitle
        checkmode()
    }
    
    //다크모드 체크
    func checkmode() {
        if #available(iOS 12.0, *) {
            if traitCollection.userInterfaceStyle == .dark {
                textColor = .white
            }else {
                textColor = .black
            }
        } else {
            print("이모델은 13버전 이하 버전입니다")
        }
    }
    
    //stack뷰를 구성하는을 설정해주고 레이아웃을 잡아주는 단계
    private func configStackView() {
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        delegate?.pageChange(index: selectedIndex)
    }
    
    //selectorView 만들어주는 곳
    private func configSelectorView() {
        let selectorWidth = self.frame.width/CGFloat(buttonTitles.count)
        let presentPointX = frame.width/CGFloat(buttonTitles.count)*CGFloat(selectedIndex)
        selectorView = UIView(frame: CGRect(x: presentPointX, y: self.frame.height+10, width: selectorWidth, height: 3))
        selectorView.backgroundColor = selectorViewColor
        addSubview(selectorView)
    }
    
    //button을 만들어 주는곳
    private func createButton() {
        buttons = [UIButton]()
        buttons.removeAll()
        subviews.forEach { $0.removeFromSuperview()}
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.addTarget(self, action: #selector(CustomSegmentedControl.buttonAction(sender:)), for: .touchUpInside)
            button.setTitleColor(textColor, for: .normal)
            buttons.append(button)
        }
        buttons[self.selectedIndex].setTitleColor(selectorTextColor, for: .normal)
    }
    
    //button의 액션을 정의해 주는 곳
    @objc func buttonAction(sender:UIButton) {
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            if btn == sender  {
                selectedIndex = buttonIndex
                delegate?.pageChange(index: selectedIndex)
                let selectorPosition = frame.width/CGFloat(buttonTitles.count)*CGFloat(buttonIndex)
                UIView.animate(withDuration: 0.2) {
                    self.selectorView.frame.origin.x = selectorPosition
                }
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
    }
    
    //view 업데이트 하는곳
    private func updateView() {
        createButton()
        configSelectorView()
        configStackView()
    }
    
    //
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.backgroundColor = UIColor.clear
        updateView()
    }
}

