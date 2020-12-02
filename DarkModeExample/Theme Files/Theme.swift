//
//  Theme.swift
//  DarkModeExample
//
//  Created by mukesh on 1/5/20.
//  Copyright © 2020 mandy. All rights reserved.
//

import UIKit

struct UserDefaultKeys {
	static let useCustomTheme = "useCustomTheme"
	static let isDarkSelected = "isDarkSelected"
}

class DefaultThemeManager {
	static func checkDefaultTheme(){
		let isDarkSelected = UserDefaults.standard.bool(forKey: UserDefaultKeys.isDarkSelected)

		if #available(iOS 13, *){
			let useCustomTheme = UserDefaults.standard.bool(forKey: UserDefaultKeys.useCustomTheme)
			
			ThemeManager.useSystemTheme = !useCustomTheme
			
			if useCustomTheme {
				ThemeManager.isDarkModeEnabled = isDarkSelected
			}
		} else {
			ThemeManager.isDarkModeEnabled = isDarkSelected
		}
	}
	

	static func choseSystemTheme(_ useSystemTheme: Bool){
		if #available(iOS 13, *) {
			ThemeManager.useSystemTheme = useSystemTheme
			UserDefaults.standard.set(!useSystemTheme, forKey: UserDefaultKeys.useCustomTheme)
			
			choseDarkTheme(false)
			return
		}
		print("\n🧪 iOS <13 shouldn't be using this function. \(#function) \(#file)")
	}
	
	static func choseDarkTheme(_ isDarkSelected: Bool){
		ThemeManager.isDarkModeEnabled = isDarkSelected
		UserDefaults.standard.set(isDarkSelected, forKey: UserDefaultKeys.isDarkSelected)
	}
}

@propertyWrapper
struct Theme {
    let light: UIColor
    let dark: UIColor

    var wrappedValue: UIColor {
		if #available(iOS 13, *), ThemeManager.useSystemTheme {
            return UIColor { (traitCollection: UITraitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    return self.dark
                } else {
                    return self.light
                }
            }
        } else {
            return ThemeManager.isDarkModeEnabled ? self.dark : self.light
        }
    }
}

enum ThemeManager {
    static var isDarkModeEnabled = false
	static var useSystemTheme = true
}
