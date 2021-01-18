//
//  SceneDelegate.swift
//  GanTest
//
//  Created by Mogis Ahmad on 17/01/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?
	var appCoordinator: AppCoordinator?
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		
		guard let windowScene = (scene as? UIWindowScene) else { return }
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.windowScene = windowScene
		appCoordinator = AppCoordinator(window: window!, navigation: UINavigationController())
		appCoordinator?.start()
	}

}

