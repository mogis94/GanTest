//
//  ProductDetailViewModel.swift
//  GanTest
//
//  Created by Mogis Ahmad on 17/01/21.
//

import Foundation

class ProductDetailViewModel: ProductDetailViewModelProtocol {
	
	weak var viewDelegate: ProductDetailViewModelDelegate?
	
	var product: Product? {
		didSet {
			viewDelegate?.detailDidLoad(viewModel: self)
		}
	}
}
