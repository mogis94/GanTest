//
//  ProductListViewModel.swift
//  GanTest
//
//  Created by Mogis Ahmad on 17/01/21.
//

import Foundation

protocol ProductListViewModelDelegate: class {
	func productsDidLoad()
}

protocol ProductListViewModelCoordinatorDelegate: class {
	func productDidSelect(_ viewModel: ProductListViewModel, data: Product)
}

protocol ProductListViewModelProtocol {
	var data: [Product]? { get set }
	var numberOfItems: Int { get }
	
	func productCellViewModel(at indexPath: IndexPath) -> ProductCellViewModel?
	func getWeeklyTrendProducts()
	
	var viewDelegate: ProductListViewModelDelegate? { get set }
}
