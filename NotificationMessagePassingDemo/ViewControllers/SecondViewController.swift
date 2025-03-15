//
//  SecondViewController.swift
//  MessagePassingDemo
//
//  Created by saurabh.pareek on 29/06/22.
//

import UIKit

protocol colorPassingDelegate: AnyObject {
    func passBgdColor(_ color: UIColor?)
}

class SecondViewController: UIViewController {
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
    let colorArray = [UIColor.red,UIColor.green,UIColor.blue,UIColor.brown,UIColor.purple]
    weak var delegate: colorPassingDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    private func setupView() {
        view.backgroundColor = .white
        self.title = "Color bar"
        
        for (index, _ ) in colorArray.enumerated() {
            let button = UIButton()
            button.setTitle("\(colorArray[index].accessibilityName.uppercased())", for: .normal)
            button.tag = index
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = colorArray[index]
            button.addTarget(self, action: #selector(colorButtonTapped(Sender:)), for: .touchUpInside)
            horizontalStackView.addArrangedSubview(button)
        }
        view.addSubview(horizontalStackView)
        horizontalStackView.backgroundColor = .white
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false

        let horizontalStackViewConstraint1 = NSLayoutConstraint(item: horizontalStackView, attribute: .centerX, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1, constant: 0)
        
        let horizontalStackViewConstraint2 = NSLayoutConstraint(item: horizontalStackView, attribute: .centerY, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1, constant: 0)
        
        let horizontalStackViewConstraint3 = NSLayoutConstraint(item: horizontalStackView, attribute: .leading, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50)
        
        let horizontalStackViewConstraint4 = NSLayoutConstraint(item: horizontalStackView, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 100)
  
        view.addConstraints([horizontalStackViewConstraint1, horizontalStackViewConstraint2, horizontalStackViewConstraint3, horizontalStackViewConstraint4])
    }
    
    @objc func colorButtonTapped(Sender: UIButton) {
        let dict : [AnyHashable: Any]  = [
            AnyHashable("color") : Sender.backgroundColor
        ]
        
        NotificationCenter.default.post(name: NSNotification.Name("com.popBack.success"), object: nil, userInfo: dict)
        self.navigationController?.popViewController(animated: true)

    }
    
    
    
    
    
}
