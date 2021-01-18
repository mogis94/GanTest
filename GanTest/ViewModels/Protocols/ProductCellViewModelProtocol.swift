//
//  ProductCellViewModel.swift
//  GanTest
//
//  Created by Mogis Ahmad on 17/01/21.
//

import Foundation

protocol ProductCellViewModelProtocol {
	var product: Product { get }
}

extension ProductCellViewModelProtocol {
	
	func productName() -> String {
		return product.name
	}
	
	func productOccupation() -> String {
		var occupations: String = product.occupation.first ?? ""
		for occ in product.occupation {
			occupations += ", \(occ)"
		}
		
		return occupations
	}
	
	func productImage() -> URL? {
		return URL(string: product.img)
	}
	
	func productStatus() -> String {
		return product.status
	}
	
	func productNickName() -> String {
		return product.nickname
	}
	
	func productAppearance() -> String {
		var appearance: String = ""
		for (index,ape) in product.appearance.enumerated() {
			if index > 0 {
				appearance += ", "
			}
			appearance += "\(ape)"
		}
		
		return appearance
	}
	
}
