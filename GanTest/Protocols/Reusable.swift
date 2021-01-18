//
//  Reusable.swift
//  GanTest
//
//  Created by Mogis Ahmad on 17/01/21.
//

import UIKit

protocol Reusable: class {}

extension Reusable where Self: UIView {
	
	static var reuseIdentifier: String {
		return String(describing: self)
	}
}
