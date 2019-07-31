//
//  FixedNavigationBarView.swift
//  FixedNavigationBarView
//
//  Created by Batıkan Sosun on 28.07.2019.
//  Copyright © 2019 Batıkan Sosun. All rights reserved.
//


/**
 
 
 - Navigation Bar Purpose:
 
 Tell people where they are in the app, provide navigation, and may contain buttons and title for initiating actions and communicating information.
 
 
 - Navigation Bar Usage:
 
 This Navigation Bar has 3 convenience initializer method, you can use one these for your requirement.
 
 - Parameters:
 - Left Button: known as the most back button, the default action pop the current view controller if this button action method is not called.
 
 - Right Button: known as the most Side Menu button, the default action show side menu from right if this button action method is not called.
 
 - Title: Provide information about current view controller
 
 
 example:  let _ = FixedNavigationBar(title: title, containerView: self.fixedNavigationBar)
 
 
 */

import UIKit

@objc(FixedNavigationBarView)
@objcMembers class FixedNavigationBarView: UIView {
    
    
    //MARK: -Private Constant

    fileprivate let kButtonBackTitle          = "Back" // can also be stored in the localization file
    fileprivate let kButtonBackImage          = "ButtonIcon-Back-Dark"
    fileprivate let kButtonRightImage         = "ButtonIcon-SideMenu-Dark"
    fileprivate let kBadgeCount               = "12"
    fileprivate let kBadgeWidthHeight:CGFloat = 20.0
    fileprivate let kButtonsWidth:CGFloat     = 69.0
    
    //MARK: - UI Elements
    lazy var viewContainer : UIView = {
        var view = UIView()
        view.newLayout()
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var viewBadge : UIView = {
        var view = UIView()
        view.newLayout()
        view.backgroundColor = .red
        view.layer.cornerRadius = kBadgeWidthHeight/2
        view.layer.masksToBounds = true;
        return view
    }()
    
    
    lazy var buttonBack : UIButton = {
        var button = UIButton()
        button.newLayout()
        button.setImage(UIImage(named: kButtonBackImage), for: .normal)
        button.addTarget(self, action: #selector(buttonActions(_sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonRight : UIButton = {
        var button = UIButton()
        button.newLayout()
        button.setImage(UIImage(named: kButtonRightImage), for: .normal)
        button.addTarget(self, action: #selector(buttonActions(_sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var labelTitle: UILabel = {
        var label = UILabel()
        label.newLayout()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.text = self.title
        label.textColor = .white
        return label;
    }()
    
    lazy var labelBadge: UILabel = {
        var label = UILabel()
        label.newLayout()
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label;
    }()
    
    var parentContainerView:UIView!
    
    
    //MARK: - Variables
    var title:String?
    
    var buttonBackCompletion: (() -> Void)?
    var buttonHomeCompletion: (() -> Void)?
    
    
    
    //MARK: - Init
    
    @discardableResult
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    @discardableResult
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    @discardableResult
    @objc convenience init(title: String!, containerView: UIView!) {
        self.init(title: title, containerView: containerView, hideRightMenu: false)
    }
    
    convenience init(title: String!, containerView: UIView!, hideRightMenu:Bool) {
        self.init(frame: .zero)
        
        self.parentContainerView = containerView
        self.title = title
        self.buttonRight.isHidden = hideRightMenu
        setupView()
    }
    @discardableResult
    convenience init(title: String!, containerView: UIView!, backButtonCompletion: (()->Void)? = nil, homeButtonCompletion: (()->Void)? = nil) {
        
        self.init(frame: .zero)
        
        self.parentContainerView = containerView
        self.title = title
        
        buttonBackCompletion = backButtonCompletion
        buttonHomeCompletion = homeButtonCompletion
        
        setupView()
    }
    
    
    //MARK: - Autolayout
    private func setupView() {
        if (parentContainerView != nil) {
            parentContainerView.addSubview(self)
        }
        
        addSubview(viewContainer)
        viewBadge.addSubview(labelBadge)
        buttonRight.addSubview(viewBadge)
        let layoutItems = [buttonBack,buttonRight,labelTitle]
        addSubviews(views: layoutItems)
        setupLayout()
        
    }
    
    func setupLayout() {
        
        self.updateConstraints()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let parentView = superview {
            self.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
            self.bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
            self.leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
            self.trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
            
        }
        
        viewContainer.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        viewContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        viewContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        viewContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        
        buttonBack.topAnchor.constraint(equalTo: viewContainer.topAnchor).isActive = true
        buttonBack.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 16).isActive = true
        buttonBack.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor).isActive = true
        buttonBack.widthAnchor.constraint(equalToConstant: 36).isActive = true
        


        labelTitle.topAnchor.constraint(equalTo: viewContainer.topAnchor).isActive = true
        labelTitle.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo: buttonBack.trailingAnchor, constant: 3).isActive = true
        
  
        buttonRight.topAnchor.constraint(equalTo: viewContainer.topAnchor).isActive = true
        buttonRight.leadingAnchor.constraint(equalTo: labelTitle.trailingAnchor, constant: 3).isActive = true
        buttonRight.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor).isActive = true
        buttonRight.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor).isActive = true
        buttonRight.widthAnchor.constraint(equalToConstant: kButtonsWidth).isActive = true
        
        
        viewBadge.topAnchor.constraint(equalTo: buttonRight.topAnchor, constant: 5).isActive = true
        viewBadge.leadingAnchor.constraint(equalTo: buttonRight.leadingAnchor, constant: 15).isActive = true
        viewBadge.widthAnchor.constraint(equalToConstant: kBadgeWidthHeight).isActive = true
        viewBadge.heightAnchor.constraint(equalToConstant: kBadgeWidthHeight).isActive = true
        
        
        
        labelBadge.topAnchor.constraint(equalTo: viewBadge.topAnchor).isActive = true
        labelBadge.bottomAnchor.constraint(equalTo: viewBadge.bottomAnchor).isActive = true
        labelBadge.leadingAnchor.constraint(equalTo: viewBadge.leadingAnchor).isActive = true
        labelBadge.trailingAnchor.constraint(equalTo: viewBadge.trailingAnchor).isActive = true
        
        
        refreshBadgeCount()
        
        
    }
    
    
    
    
    //MARK: -Private Methods
    func refreshBadgeCount() {
        // refresh badge manager
        labelBadge.text = kBadgeCount
    }
    
    func addSubviews(views:[UIView]) {
        for item in views {
            viewContainer.addSubview(item)
        }
    }
    
    
    //MARK: - Actions
    @objc func buttonActions(_sender: UIButton?){
        switch _sender {
        case buttonBack:
            if let buttonCompletion = buttonBackCompletion{
                buttonCompletion()
            }else{
                guard let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController else { return }
                navigationController.popViewController(animated: true)
            }
            break
        case buttonRight:
            if let buttonCompletion = buttonHomeCompletion{
                buttonCompletion()
            }else{
                //open custom right menu
            }
            break
        default:
            break
        }
    }
    

}

extension UIView{
    func newLayout(){
        translatesAutoresizingMaskIntoConstraints = false
    }
}
