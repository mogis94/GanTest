//
//  ProductListViewModel.swift
//  GanTest
//
//  Created by Mogis Ahmad on 17/01/21.
//

import UIKit

class ProductListViewModel: ProductListViewModelProtocol {
	
	var numberOfItems: Int {
		if let items = data {
			return items.count
		}
		return 0
	}
	
	internal var filteringData: [Product]? {
		didSet {
			viewDelegate?.productsDidLoad()
		}
	}
	
	internal var data: [Product]? {
		didSet {
			viewDelegate?.productsDidLoad()
		}
	}
	
	var viewDelegate: ProductListViewModelDelegate?
	var coordinatorDelegate: ProductListViewModelCoordinatorDelegate?
	private let weeklyTrendService: WeeklyTrendService
	let itemsPerRow: Int = 2
	let cellPadding: CGFloat = 10.0
	
	init(withWeeklyTrendService weeklyTrendService: WeeklyTrendService) {
		self.weeklyTrendService = weeklyTrendService
	}
	
	func getWeeklyTrendProducts() {
		weeklyTrendService.fetch { [weak self] (result) in
			switch result{
			case .success(let response):
				let resultData = response.shuffled()
				self?.data = resultData
				self?.filteringData = resultData
			case .failure(let error):
				DLog(error.localizedDescription)
			}
		}
	}
	
}

// MARK: - TableView Data Fetch

extension ProductListViewModel {
	
	func productCellViewModel(at indexPath: IndexPath) -> ProductCellViewModel? {
		if let items = data {
			return ProductCellViewModel(withProduct: items[indexPath.row])
		}
		return nil
	}
	
	func didSelectItemAtIndex(_ index: Int) {
		if let items = data,
		   let coordinatorDelegate = coordinatorDelegate,
		   index < items.count {
			coordinatorDelegate.productDidSelect(self, data: items[index])
		}
	}
}
