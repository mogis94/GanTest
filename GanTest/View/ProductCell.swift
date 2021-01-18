//
//  ProductCollectionCell.swift
//  GanTest
//
//  Created by Mogis Ahmad on 17/01/21.
//

import UIKit

class ProductCell: UICollectionViewCell, Reusable {
	
	lazy var productView = ProductView()
	var product: Product?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .clear
		setupConstraints()
	}
	
	required init?(coder aDecoder: NSCoder) {
		return nil
	}
	
	func setupConstraints() {
		contentView.addSubview(productView)
		productView.snp.makeConstraints {
			$0.edges.equalToSuperview()
		}
	}
	
	func config(withViewModel viewModel: ProductCellViewModel) {
		 productView.config(withViewModel: viewModel)
	}
}
