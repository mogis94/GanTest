//
//  ProductDetailViewTests.swift
//  GanTestTests
//
//  Created by Mogis Ahmad on 17/01/21.
//
import XCTest

@testable import GanTest

class ProductDetailViewTests: XCTestCase {

	func testInitWithCoderShouldBeNil() {
		XCTAssertNil(ProductDetailView(coder: NSCoder()))
	}
}
