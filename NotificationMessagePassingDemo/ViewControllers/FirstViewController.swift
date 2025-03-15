//
//  FirstViewController.swift
//  MessagePassingDemo
//
//  Created by saurabh.pareek on 29/06/22.
//

import UIKit

class FirstViewController: UIViewController{
    
    private let lblSelectedText: UILabel = {
        let lblSelectedText = UILabel()
        lblSelectedText.text = "Selected Text"
        lblSelectedText.translatesAutoresizingMaskIntoConstraints = false
        lblSelectedText.font = UIFont.systemFont(ofSize: 20)
        return lblSelectedText
    }()
    
    
    private let btnColor: UIButton = {
        let btnColor = UIButton()
        btnColor.translatesAutoresizingMaskIntoConstraints = false
        btnColor.layer.cornerRadius = 5.0
        btnColor.setTitle("Selected Color", for: .normal)
        btnColor.setTitleColor(.black, for: .normal)
        btnColor.backgroundColor = .none
        btnColor.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btnColor.layer.borderColor = UIColor.black.cgColor
        btnColor.layer.cornerRadius = 5.0
        btnColor.layer.borderWidth = 0.5
        btnColor.addTarget(self, action: #selector(btnColorTapped(_:)), for: .touchUpInside)
        return btnColor
    }()
    
    let secondvc = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        registerForLocalNotifications()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name("com.popBack.success"), object: nil)
    }
    
    
    private func registerForLocalNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(passBgdColor(_:)), name: NSNotification.Name("com.popBack.success"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(lblSelectedText)
        view.addSubview(btnColor)
        setupViewConstraints()
    }
    
    
    private func setupViewConstraints() {
        lblSelectedText.translatesAutoresizingMaskIntoConstraints = false
        btnColor.translatesAutoresizingMaskIntoConstraints = false
        
        let lblcenterHorizontalConstraint = NSLayoutConstraint(item: btnColor, attribute: .centerX, relatedBy: .equal, toItem: lblSelectedText, attribute: .centerX, multiplier: 1, constant: 0)
        
        let btncenterHorizontalConstraint = NSLayoutConstraint(item: btnColor, attribute: .centerX, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1, constant: 0)
        
        let lblcenterVerticalConstraint = NSLayoutConstraint(item: btnColor, attribute: .centerY, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1, constant: 0)
        
        let lblBottomConstraint = NSLayoutConstraint(item: btnColor, attribute: .top, relatedBy: .equal, toItem: lblSelectedText, attribute: .bottom, multiplier: 1, constant: 100)
        
        let widthConstraint = NSLayoutConstraint(item: btnColor, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 180)
        
        let heightConstraint = NSLayoutConstraint(item: btnColor, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        
        view.addConstraints([lblcenterHorizontalConstraint, btncenterHorizontalConstraint, lblcenterVerticalConstraint, lblBottomConstraint, widthConstraint, heightConstraint])
    }
    
    @objc fileprivate func btnColorTapped(_ sender: UIButton) {
        self.navigationController?.pushViewController(secondvc, animated: true)
        
    }
    
    @objc func passBgdColor(_ notification: Notification) {
        //        let color = notification.userInfo?["colorName"] as? String
        let color = notification.userInfo?[AnyHashable("color")]! as? UIColor
        self.btnColor.backgroundColor = color
        self.btnColor.setTitle(color?.accessibilityName.uppercased(), for: .normal)
    }
    
    
    
    
    
    
}
