//
//  ViewController.swift
//  DarkModeExample
//
//  Created by mukesh on 1/5/20.
//  Copyright © 2020 mandy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlets
	@IBOutlet weak var themeButton: AppButton!
	@IBOutlet weak var useSystemThemeButton: AppSwitch!
	@IBOutlet weak var systemThemeSettingStackView: UIStackView!
	
	@IBOutlet weak var helloWorldLabel: PrimaryLabel!
	@IBOutlet weak var systemThemeSettingLabel: PrimaryLabel!
	
	// MARK: - Life Cycles
	override func viewDidLoad() {
		super.viewDidLoad()
		setSystemThemeStack()
		configureSystemThemeButton()
		
		// Theme
		addThemeChangeObserver()
		configureSubviewsColors()
	}


	// MARK: - IBActions
	@IBAction func switchThemeButtonTapped(_ sender: Any) {
		toggleDarkMode()
	}
	
	@IBAction func useSystemThemeToggleValueChanged(_ sender: Any) {
		
		// toggle system theme status
		DefaultThemeManager.choseSystemTheme(!ThemeManager.useSystemTheme)

		toggleStackStatus(forUsingSystemTheme: useSystemThemeButton.isOn)
		configureSubviewsColors()
	}
	
    // MARK: - Actions
	func setSystemThemeStack(){
		if #available(iOS 13, *) {
			systemThemeSettingStackView.isHidden = false
		} else {
			systemThemeSettingStackView.isHidden = true
		}
	}
	
	
	func configureSystemThemeButton(){
		if #available(iOS 13, *), ThemeManager.useSystemTheme {
			useSystemThemeButton.isOn = true
			themeButton.isHidden = true
		} else {
			useSystemThemeButton.isOn = false
			themeButton.isHidden = false
		}
	}
	
	
    func toggleDarkMode() {
        // Toggle Theme Logic
		DefaultThemeManager.choseDarkTheme(!ThemeManager.isDarkModeEnabled)
		NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationKeys.themeChangeNotificationName),
                                        object: nil)
    }
	
	func toggleThemeEmoji(forDarkMode isDarkMode: Bool) {
		if !isDarkMode {
			themeButton.setTitle("🌻", for: .normal)
		} else {
			themeButton.setTitle("🌙", for: .normal)
		}
	}
	
	func toggleStackStatus(forUsingSystemTheme useSystemTheme: Bool){
		if useSystemTheme {
			themeButton.isHidden = true
		} else {
			themeButton.isHidden = false
		}
	}


}


extension ViewController: ThemeProtocol {
    func configureSubviewsColors() {
		toggleThemeEmoji(forDarkMode: ThemeManager.isDarkModeEnabled)
		view.backgroundColor = .backgroundColor
		themeButton.setupView()
		useSystemThemeButton.setupView()
		systemThemeSettingLabel.setupView()
		helloWorldLabel.setupView()
    }
}
    
