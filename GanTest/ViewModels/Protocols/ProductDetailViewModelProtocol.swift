//
//  ProductDetailViewModelProtocol.swift
//  GanTest
//
//  Created by Mogis Ahmad on 17/01/21.
//

import Foundation

protocol ProductDetailViewModelDelegate: class {
	func detailDidLoad(viewModel: ProductDetailViewModelProtocol)
}

protocol ProductDetailViewModelProtocol {
	var product: Product? { get set }
	var viewDelegate: ProductDetailViewModelDelegate? { get set }
}
