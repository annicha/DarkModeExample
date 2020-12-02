//
//  UIExtensions.swift
//  DarkModeExample
//
//  Created by Anne on 2/12/20.
//  Copyright © 2020 mandy. All rights reserved.
//

import UIKit

class PrimaryLabel: UILabel {
	open override func awakeFromNib() {
		super.awakeFromNib()
		setupView()
	}
	
	func setupView(){
		self.textColor = .primaryTextColor
		self.backgroundColor = .backgroundColor
	}
}


class AppButton: UIButton {
	open override func awakeFromNib() {
		super.awakeFromNib()
		setupView()
	}
	
	func setupView(){
		self.tintColor = .accentColor
		self.backgroundColor = .backgroundColor
	}
}

class AppSwitch: UISwitch {
	open override func awakeFromNib() {
		super.awakeFromNib()
		setupView()
	}
	
	func setupView(){
		self.tintColor = .accentColor
		self.backgroundColor = .backgroundColor
	}
}



class PrimaryView: UIView {
	open override func awakeFromNib() {
		super.awakeFromNib()
		setupView()
	}
	
	func setupView(){
		self.backgroundColor = .backgroundColor
	}
}


