//
//  CustomSegmentedControl.swift
//  MyChurch
//
//  Created by 백승화 on 2020/04/22.
//  Copyright © 2020 백승화. All rights reserved.
//

import UIKit

@IBDesignable
class CustomSegmentedControl : UIView {
    //필요한 모델들의 변수를 선언하여 준다
    private var buttonTitles : [String]!
    private var buttons : [UIButton]!
    private var selectorView : UIView!
    
    
    //글자의 원래 색과 선택되었을때의 view와 글자의 색상을 바꿔준다
    var textColor : UIColor = .black
    var selectorViewColor : UIColor = .init(red: CGFloat(0.2), green: CGFloat(0.44), blue: CGFloat(0.878), alpha: 1.0)
    var selectorTextColor : UIColor = .init(red: CGFloat(0.2), green: CGFloat(0.44), blue: CGFloat(0.878), alpha: 1.0)
    
    convenience init(frame: CGRect,buttonTitle:[String]){
        self.init(frame:frame)
        self.buttonTitles = buttonTitle
    }
    
    //stack뷰를 구성하는을 설정해주고 레이아웃을 잡아주는 단계
    private func configStackView() {
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    //selectorView 만들어주는 곳
    private func configSelectorView() {
        let selectorWidth = self.frame.width/CGFloat(buttonTitles.count)
        selectorView = UIView(frame: CGRect(x: 0, y: self.frame.height, width: selectorWidth, height: 2))
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
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
    }
    
    //button의 액션을 정의해 주는 곳
    @objc func buttonAction(sender:UIButton) {
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            if btn == sender {
                let selectorPosition = frame.width/CGFloat(buttonTitles.count)*CGFloat(buttonIndex)
                UIView.animate(withDuration: 0.3) {
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
        self.backgroundColor = UIColor.white
        updateView()
    }
}
