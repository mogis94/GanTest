//
//  ProductCellTests.swift
//  GanTestTests
//
//  Created by Mogis Ahmad on 17/01/21.
//

import XCTest
@testable import GanTest

class ProductCellTests: XCTestCase {
	
	func testInitWithCoderShouldBeNil() {
		XCTAssertNil(ProductCell(coder: NSCoder()))
	}
}
