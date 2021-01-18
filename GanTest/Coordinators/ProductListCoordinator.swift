//
//  MainCoordinator.swift
//  GanTest
//
//  Created by Mogis Ahmad on 17/01/21.
//

import UIKit

class ProductListCoordinator: Coordinator{
	
	var detailCoordinator: ProductDetailCoordinator?
	let weeklyTrendService: WeeklyTrendService
	var navigation: UINavigationController
	
	init(navigation: UINavigationController, weeklyTrendService: WeeklyTrendService) {
		self.weeklyTrendService = weeklyTrendService
		self.navigation = navigation
	}
	
	func start() {
		let viewModel = ProductListViewModel(withWeeklyTrendService: weeklyTrendService)
		viewModel.coordinatorDelegate = self
		let productListVC = ProductsListController(productListViewModel: viewModel)
		navigation.viewControllers = [productListVC]
	}
	
}

extension ProductListCoordinator: ProductDetailCoordinatorDelegate {
	func detailCoordinatorDidFinish(detailCoordinator: ProductDetailCoordinator) {
		self.detailCoordinator = nil
		navigation.popToRootViewController(animated: true)
	}
}

extension ProductListCoordinator: ProductListViewModelCoordinatorDelegate {
	func productDidSelect(_ viewModel: ProductListViewModel, data: Product) {
		detailCoordinator = ProductDetailCoordinator(navigation: navigation, product: data)
		detailCoordinator?.start()
	}
}

