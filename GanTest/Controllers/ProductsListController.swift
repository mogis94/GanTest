//
//  ProductsViewController.swift
//  GanTest
//
//  Created by Mogis Ahmad on 17/01/21.
//

import UIKit
import SnapKit

class ProductsListController: UIViewController {
	
	var viewModel: ProductListViewModel
	
	lazy var searchBarController: UISearchController = UISearchController()
	
	lazy var seasonButtons: UISegmentedControl = {
		let sc = UISegmentedControl()
		return sc
	}()
	
	lazy var productCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.accessibilityIdentifier = "ProductCollectionViewCell"
		collectionView.backgroundColor = .clear
		return collectionView
	}()
	
	init(productListViewModel: ProductListViewModel) {
		self.viewModel = productListViewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupCollectionView()
		setupSegs()
		configureSearchBar()
		viewModel.viewDelegate = self
		viewModel.getWeeklyTrendProducts()
	}
	
	private func refreshDisplay() {
		DispatchQueue.main.async { [self] in
			productCollectionView.reloadData()

				seasonButtons.addTarget(self, action: #selector(selectSeason(sender:)), for: .valueChanged)
			
			if seasonButtons.numberOfSegments == 0 {
				
				for season in 1...5 {
					seasonButtons.insertSegment(withTitle: String(season), at: season, animated: true)
				}
				
			}
		}
	}
	
	private func setupSegs() {
		view.addSubview(seasonButtons)
		seasonButtons.snp.makeConstraints { (make) in
			make.topMargin.equalToSuperview().offset(20)
			make.centerX.equalToSuperview()
		}
	}
	
	private func setupCollectionView() {
		
		title = "Breaking Bad"
		view.addSubview(productCollectionView)
		productCollectionView.contentInset = UIEdgeInsets(top: 60, left: 10, bottom: 10, right: 10)
		
		productCollectionView.snp.makeConstraints {
			$0.edges.equalToSuperview()
		}
		
		productCollectionView.register(ProductCell.self)
		productCollectionView.dataSource = self
		productCollectionView.delegate = self
		productCollectionView.backgroundColor = .themeMain
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		//show navigationBar backroundColor again
		navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
		navigationController?.navigationBar.shadowImage = nil
		navigationController?.navigationBar.backgroundColor = .white
		
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

extension ProductsListController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		viewModel.didSelectItemAtIndex((indexPath as NSIndexPath).row)
	}
}

extension ProductsListController: UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.numberOfItems
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as ProductCell
		guard let viewModel = viewModel.productCellViewModel(at: indexPath) else { return cell }
		cell.config(withViewModel: viewModel)
		return cell
	}
	
}

extension ProductsListController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: (collectionView.frame.width - 30) / 2, height: collectionView.frame.height/2.5)
	}
}

extension ProductsListController: ProductListViewModelDelegate {
	func productsDidLoad() {
		refreshDisplay()
	}
}

extension ProductsListController: UISearchControllerDelegate, UISearchBarDelegate {
	
	private func configureSearchBar() {
		UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
		searchBarController = UISearchController(searchResultsController: nil)
		searchBarController.searchBar.barTintColor = .black
		searchBarController.searchBar.backgroundColor = .white
		searchBarController.obscuresBackgroundDuringPresentation = false
		searchBarController.searchBar.placeholder = "Search"
		navigationItem.searchController = searchBarController
		navigationItem.hidesSearchBarWhenScrolling = false
		definesPresentationContext = true
		searchBarController.delegate = self
		searchBarController.searchBar.delegate = self
	}
	
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		
		guard let text = searchBar.text, text.count > 0 else {
			return
		}
		
		let filteredData = viewModel.filteringData?.filter({$0.name.lowercased().contains(text.lowercased())})
		
		viewModel.data = filteredData
		productCollectionView.reloadData()
		searchBarController.searchBar.resignFirstResponder()
	}
	
	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		viewModel.data = viewModel.filteringData
		productCollectionView.reloadData()
		searchBarController.searchBar.resignFirstResponder()
	}
	
	@objc func selectSeason(sender: UISegmentedControl) {
		let generator = UIImpactFeedbackGenerator(style: .light)
		generator.impactOccurred()
		show(season: sender.selectedSegmentIndex + 1)
	}
	
	func show(season: Int) {
		let filteredData = viewModel.filteringData?.filter({$0.appearance.contains(season)})
		viewModel.data = filteredData
		productCollectionView.reloadData()
	}
}
