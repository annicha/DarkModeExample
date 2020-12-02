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
		// Do any additional setup after loading the view.
		if #available(iOS 13, *) {
			systemThemeSettingStackView.isHidden = false
			themeButton.isHidden = true
		} else {
			themeButton.isHidden = false
			systemThemeSettingStackView.isHidden = true
		}

		// Theme
		addThemeChangeObserver()
		configureSubviewsColors()
	}


	// MARK: - IBActions
	@IBAction func switchThemeButtonTapped(_ sender: Any) {
		toggleDarkMode()
	}
	
	@IBAction func useSystemThemeToggleValueChanged(_ sender: Any) {
		ThemeManager.useSystemTheme = !ThemeManager.useSystemTheme
		toggleStackStatus(forUsingSystemTheme: useSystemThemeButton.isOn)
	}
	
    // MARK: - Actions
    // Implement this method only for iOS version less than 13
    func toggleDarkMode() {
        // Toggle Theme Logic
        ThemeManager.isDarkModeEnabled = !ThemeManager.isDarkModeEnabled
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
    
