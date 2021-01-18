//
//  ProductView.swift
//  GanTest
//
//  Created by Mogis Ahmad on 17/01/21.
//

import UIKit
import SDWebImage

class ProductView: UIView {
	
	lazy var name: UILabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 15)
		label.textColor = .black
		label.adjustsFontSizeToFitWidth = true
		label.minimumScaleFactor = 0.5
		return label
	}()

	lazy var image: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		imageView.backgroundColor = .clear
		return imageView
	}()
	
	convenience init() {
		self.init(frame: CGRect.zero)
		setupConstraints()
	}
	
	func setupConstraints() {

		addSubview(image)
		addSubview(name)
		
		image.snp.makeConstraints { make in
			make.top.equalToSuperview()
			make.leading.equalToSuperview()
			make.trailing.equalToSuperview()
			make.bottom.equalToSuperview().offset(-35)
		}
		
		name.snp.makeConstraints { make in
			make.top.equalTo(image.snp.bottom)
			make.leading.equalToSuperview().offset(8)
			make.trailing.equalToSuperview().offset(-8)
			make.bottom.equalToSuperview()
		}
		
	}
	
	func config(withViewModel viewModel: ProductCellViewModelProtocol) {
		
		layer.borderWidth = 0.5
		layer.borderColor = UIColor.black.cgColor
		layer.cornerRadius = 8
		clipsToBounds = true
		
		name.text = viewModel.productName()
		image.sd_imageTransition = .fade
		image.sd_setImage(with: viewModel.productImage(), placeholderImage: UIImage(named: "placeholder"))
	}
	
}
