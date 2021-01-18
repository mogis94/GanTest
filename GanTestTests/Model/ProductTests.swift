//
//  ProductTests.swift
//  GanTest
//
//  Created by Mogis Ahmad on 17/01/21.
//


import XCTest
@testable import GanTest

class ProductTests: XCTestCase {
	
	var product: Product? {
		return DecodableHelper.decode(Product.self, dictionary: productDataPresentation())
	}
	func testInitializationWithRepresentation() {
		XCTAssertNotNil(product)
	}
	
	func testInitializationWithNoImagePathRepresentation() {
		let productDataNilImagePresentation = [
			"char_id": "1",
			"name": "Walter White",
			"birthday": "09-07-1958",
			"occupation": [
				"High School Chemistry Teacher",
				"Meth King Pin" ]
			] as [String: Any]
		
		XCTAssertNil(DecodableHelper.decode(Product.self, dictionary: productDataNilImagePresentation))
	}
	
	func testNameDescriptionAndThumbnail() throws {
		let product = try XCTUnwrap(self.product)

		XCTAssertTrue(product.char_id == 1)
		XCTAssertTrue(product.name == "Walter White")
		XCTAssertTrue(product.nickname == "Heisenberg")
		XCTAssertTrue(product.img == "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg")
	}
	
}

extension ProductTests {
	
	private func productDataPresentation() -> [String: Any] {
		let representation = [
			"char_id": 1,
			"name": "Walter White",
			"birthday": "09-07-1958",
			"occupation": [
				"High School Chemistry Teacher",
				"Meth King Pin"
			],
			"img": "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg",
			"status": "Presumed dead",
			"nickname": "Heisenberg",
			"appearance": [
				1,
				2,
				3,
				4,
				5
			],
			"portrayed": "Bryan Cranston",
			"category": "Breaking Bad",
			"better_call_saul_appearance": []
	] as [String: Any]
		return representation
	}
}
