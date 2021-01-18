//
//  UICollectionViewExtension.swift
//  GanTest
//
//  Created by Mogis Ahmad on 17/01/21.
//

import UIKit

extension UICollectionView {
	
	func register<T: UICollectionViewCell>(_: T.Type) where T: Reusable {
		register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
	}
	
	func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: Reusable {
		return dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T ?? T()
	}
}
