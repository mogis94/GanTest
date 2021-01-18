//
//  ProductsDetailController.swift
//  GanTest
//
//  Created by Mogis Ahmad on 17/01/21.
//

import UIKit
import SnapKit

class ProductsDetailController: UIViewController {
	
	let detailContentView = ProductDetailView()
	var viewModel: ProductDetailViewModel? {
		willSet {
			viewModel?.viewDelegate = nil
		}
		didSet {
			viewModel?.viewDelegate = self
		}
	}
	override func loadView() {
		view = detailContentView
	}
	init() {
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		navigationController?.navigationBar.backgroundColor = .clear
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
		navigationController?.navigationBar.shadowImage = UIImage()
	}
	
	func refreshDisplay() {
		let dataViewModel = ProductCellViewModel(withProduct: viewModel!.product!)
		detailContentView.config(withViewModel: dataViewModel)
	}
	
	override func viewWillAppear(_ animated: Bool) {
			super.viewWillAppear(animated)
			setNeedsStatusBarAppearanceUpdate()
	}
	override var preferredStatusBarStyle: UIStatusBarStyle {
			.darkContent
	}
	
	deinit {
		print("deinit ProductVC")
	}
}

extension ProductsDetailController: ProductDetailViewModelDelegate {
	func detailDidLoad(viewModel: ProductDetailViewModelProtocol) {
		refreshDisplay()
	}
}
