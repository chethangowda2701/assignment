//
//  ViewController.swift
//  SamsClub
//
//  Created by Gowda, Chethan S on 6/16/18.
//  Copyright © 2018 Gowda, Chethan S. All rights reserved.
//

import UIKit

class PLPViewController: UIViewController {
    
    static let cellIdentifier = "PLPCollectionViewCell"
    var userName = "apple"

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var viewModel = ProductListViewModel()
    var isInitialLoad = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCollectionView()
        self.registerCell()
        self.fetchProducts()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
       super.viewWillTransition(to: size, with: coordinator)
        self.collectionView.reloadData()
    }
    
    private func registerCell() {
        self.collectionView.register(UINib(nibName: PLPViewController.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: PLPViewController.cellIdentifier)
    }
    
    private func configureCollectionView() {
        self.collectionView.contentInset = UIEdgeInsets(top: 16, left: 8, bottom: 0, right: 8)
    }
    private func fetchProducts() {
        self.viewModel.isFetchingMore = true
        let request = ProductRequest(pageNumber: self.viewModel.pageNumber + 1, user: self.userName)
        request.make(success: { json in
            DispatchQueue.main.async {
                self.viewModel.productList = ProductList(json: json)
                self.collectionView.reloadData()
                self.viewModel.isFetchingMore = false
                self.isInitialLoad = false
                self.viewModel.pageNumber += 1
   
            }
        }, failure: self.showErrorMessage )
    }
    
    private func sizeForCell() -> CGSize {
        if self.segmentControl.selectedSegmentIndex == 1 {
            let isRegular = self.traitCollection.horizontalSizeClass == .regular
            
            return computeSizeForItemInCollectionView(margin: 16, padding: 8, itemsInRow: isRegular ? 3 : 2, itemHeight: isRegular ? 200.0 : 250.0)
        }
        return computeSizeForItemInCollectionView(margin: 8, padding: 0, itemsInRow: 1, itemHeight: 150.0)
    }
    
    private func computeSizeForItemInCollectionView(margin: Int, padding: Int, itemsInRow: Int, itemHeight: CGFloat) -> CGSize {
        let width = self.collectionView.bounds.width
        
        let availableWidth = width - CGFloat((margin * 2)) - CGFloat((padding * (itemsInRow - 1)))
        let itemWidth = availableWidth / CGFloat(itemsInRow)
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    private func showErrorMessage() {
        guard self.isInitialLoad else { return }
        let alertController = UIAlertController(title: "", message: "No products found at this time. Please refresh", preferredStyle: .alert)
        self.present(alertController, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3){
            alertController.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func segmentControlChanged(_ sender: UISegmentedControl) {
        self.collectionView.reloadData()
    }
 
}

extension PLPViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PLPViewController.cellIdentifier, for: indexPath) as! PLPCollectionViewCell
        let factor = self.segmentControl.selectedSegmentIndex == 0 ? 1 : 2
        cell.setupWith(self.viewModel.products[indexPath.row], factor: factor)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.sizeForCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard !self.viewModel.isFetchingMore, collectionView.numberOfItems(inSection: indexPath.section) == indexPath.row + 1 else { return }
        self.fetchProducts()
    }
}


