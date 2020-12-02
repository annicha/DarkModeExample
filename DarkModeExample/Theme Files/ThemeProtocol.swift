//
//  ThemeProtocol.swift
//  DarkModeExample
//
//  Created by Anne on 2/12/20.
//  Copyright © 2020 mandy. All rights reserved.
//

import UIKit

struct NotificationKeys {
	static let themeChangeNotificationName = "themeChange"
}


protocol ThemeProtocol {
	func addThemeChangeObserver()
	func configureSubviewsColors()
}

extension ThemeProtocol  {
	func addThemeChangeObserver() {
		NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: NotificationKeys.themeChangeNotificationName),
											   object: nil,
											   queue: OperationQueue.main) { _ in
			self.configureSubviewsColors()
		}
		
	}

}
