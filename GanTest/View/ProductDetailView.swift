//
//  ProductDetailView.swift
//  GanTest
//
//  Created by Mogis Ahmad on 17/01/21.
//

import UIKit
import SnapKit
import SDWebImage

class ProductDetailView: UIView {
	
	var nameLbl: UILabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 25)
		label.textColor = .black
		label.textAlignment = .center
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		return label
	}()
	
	var occupationLbl: UILabel = {
		let label = UILabel()
		label.text = "Occupation:"
		label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
		label.textAlignment = .center
		label.textColor = .lightGray
		return label
	}()
	
	var occupationValueLbl: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
		label.textAlignment = .center
		label.textColor = .black
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		return label
	}()
	
	var statusLbl: UILabel = {
		let label = UILabel()
		label.text = "Status:"
		label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
		label.textAlignment = .center
		label.textColor = .lightGray
		return label
	}()
	
	var statusValueLbl: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
		label.textAlignment = .center
		label.textColor = .black
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		return label
	}()
	
	var nicknameLbl: UILabel = {
		let label = UILabel()
		label.text = "Nickname:"
		label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
		label.textAlignment = .center
		label.textColor = .lightGray
		label.numberOfLines = 2
		return label
	}()
	
	var nicknameValueLbl: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
		label.textAlignment = .center
		label.textColor = .black
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		return label
	}()
	
	var appearanceLbl: UILabel = {
		let label = UILabel()
		label.text = "Season appearance:"
		label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
		label.textAlignment = .center
		label.textColor = .lightGray
		return label
	}()
	
	var appearanceValueLbl: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
		label.textAlignment = .center
		label.textColor = .black
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		return label
	}()
	
	var image: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		return imageView
	}()
	
	init() {
		super.init(frame: CGRect.zero)
		self.setupConstraints()
	}
	
	required init?(coder aDecoder: NSCoder) {
		return nil
	}
	
	func setupConstraints() {
		
		addSubview(image)
		addSubview(nameLbl)
		addSubview(occupationLbl)
		addSubview(occupationValueLbl)
		addSubview(statusLbl)
		addSubview(statusValueLbl)
		addSubview(nicknameLbl)
		addSubview(nicknameValueLbl)
		addSubview(appearanceLbl)
		addSubview(appearanceValueLbl)
		
		image.snp.makeConstraints { make in
			make.top.equalToSuperview()
			make.leading.equalToSuperview()
			make.trailing.equalToSuperview()
			make.height.equalToSuperview().dividedBy(2)
		}
		
		nameLbl.snp.makeConstraints { make in
			make.top.equalTo(image.snp.bottom).offset(8)
			make.leading.equalToSuperview().offset(8)
			make.trailing.equalToSuperview().offset(-8)
		}
		
		occupationLbl.snp.makeConstraints { make in
			make.top.equalTo(nameLbl.snp.bottom).offset(16)
			make.leading.equalTo(statusValueLbl.snp.leading)
			make.trailing.equalTo(statusValueLbl.snp.trailing)
		}
		
		occupationValueLbl.snp.makeConstraints { make in
			make.top.equalTo(occupationLbl.snp.bottom).offset(5)
			make.leading.equalTo(statusValueLbl.snp.leading)
			make.trailing.equalTo(statusValueLbl.snp.trailing)
		}
		
		statusLbl.snp.makeConstraints { make in
			make.top.equalTo(occupationValueLbl.snp.bottom).offset(8)
			make.leading.equalTo(statusValueLbl.snp.leading)
			make.trailing.equalTo(statusValueLbl.snp.trailing)
		}
		
		statusValueLbl.snp.makeConstraints { make in
			make.top.equalTo(statusLbl.snp.bottom).offset(5)
			make.leading.equalTo(nameLbl.snp.leading)
			make.trailing.equalTo(nameLbl.snp.trailing)
		}
		
		nicknameLbl.snp.makeConstraints { make in
			make.top.equalTo(statusValueLbl.snp.bottom).offset(8)
			make.leading.equalTo(nameLbl.snp.leading)
			make.trailing.equalTo(nameLbl.snp.trailing)
		}
		
		nicknameValueLbl.snp.makeConstraints { make in
			make.top.equalTo(nicknameLbl.snp.bottom).offset(5)
			make.leading.equalTo(nameLbl.snp.leading)
			make.trailing.equalTo(nameLbl.snp.trailing)
		}
		
		appearanceLbl.snp.makeConstraints { make in
			make.top.equalTo(nicknameValueLbl.snp.bottom).offset(8)
			make.leading.equalTo(nameLbl.snp.leading)
			make.trailing.equalTo(nameLbl.snp.trailing)
		}
		
		appearanceValueLbl.snp.makeConstraints { make in
			make.top.equalTo(appearanceLbl.snp.bottom).offset(5)
			make.leading.equalTo(nameLbl.snp.leading)
			make.trailing.equalTo(nameLbl.snp.trailing)
		}

	}
	
	func config(withViewModel viewModel: ProductCellViewModelProtocol) {
		nameLbl.text = viewModel.productName()
		nicknameValueLbl.text = viewModel.productNickName()
		statusValueLbl.text = viewModel.productStatus()
		occupationValueLbl.text = viewModel.productOccupation()
		appearanceValueLbl.text = viewModel.productAppearance()
		image.sd_setImage(with: viewModel.productImage(), placeholderImage: UIImage(named: "placeholder"))
	}
	
}
