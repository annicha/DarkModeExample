//
//  Colors.swift
//  DarkModeExample
//
//  Created by mukesh on 1/5/20.
//  Copyright © 2020 mandy. All rights reserved.
//

import UIKit

/// Colors for light mode
struct LightColors {
	static let primaryColor = UIColor.black
	
	static var backgroundColor: UIColor {
		// RGB of systemGray4 from the documentation
		// https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/color/
		return UIColor.init(red: 209/255, green: 209/255, blue: 214/255, alpha: 1.0)
	}
	
}

/// Colors for dark mode
struct DarkColors {
	static let primaryColor = UIColor.white

	static var backgroundColor: UIColor {
		// .systemGray4
		return UIColor.init(red: 58/255, green: 58/255, blue: 60/255, alpha: 1.0)
	}
}


extension UIColor {
	@Theme(light: LightColors.backgroundColor,
		   dark: DarkColors.backgroundColor)
	static var backgroundColor: UIColor
	
	@Theme(light: LightColors.primaryColor,
		   dark: DarkColors.primaryColor)
	static var primaryTextColor: UIColor
	
	@Theme(light: UIColor.systemPink,
		   dark: UIColor.systemPink)
	static var accentColor: UIColor
}

