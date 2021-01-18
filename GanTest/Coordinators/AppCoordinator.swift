//
//  AppCoordinator.swift
//  GanTest
//
//  Created by Mogis Ahmad on 17/01/21.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
	
	var window: UIWindow
	var navigation: UINavigationController
	
	init(window: UIWindow, navigation: UINavigationController)
	{
		self.navigation = navigation
		self.window = window
		window.rootViewController = emptyState()
		window.tintColor = .themeMain
		window.backgroundColor = .themeMain
		window.makeKeyAndVisible()
		
		let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
		navigation.navigationBar.tintColor = .black
		navigation.navigationBar.backgroundColor = .white
		navigation.navigationBar.barTintColor = .white
		navigation.navigationBar.backItem?.backBarButtonItem?.tintColor = .black
		navigation.navigationBar.barStyle = .default
		navigation.navigationBar.titleTextAttributes = textAttributes
		let BarButtonItemAppearance = UIBarButtonItem.appearance()
		BarButtonItemAppearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
	}
	
	func start()
	{
		let listCoordinator = ProductListCoordinator(navigation: navigation, weeklyTrendService: WeeklyTrendService())
		listCoordinator.start()
		window.rootViewController = listCoordinator.navigation
	}
	
	private func emptyState() -> UIViewController {
		let viewController = UIViewController()
		viewController.view.backgroundColor = .themeMain
		return viewController
	}
}

