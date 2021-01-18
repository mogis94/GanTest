//
//  ProductCollectionCellViewModel.swift
//  GanTest
//
//  Created by Mogis Ahmad on 17/01/21.
//

import Foundation

class ProductCellViewModel: ProductCellViewModelProtocol {
	
	var product: Product
	
	init(withProduct product: Product) {
		self.product = product
	}
}
