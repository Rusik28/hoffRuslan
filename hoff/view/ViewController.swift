//
//  ViewController.swift
//  hoff
//
//  Created by Руслан Алиев on 01.04.2022.
//

import UIKit
import SwiftUI

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var secondCollectionView: UICollectionView!

    var objects: [Hoff] = []
    var presenter = Presenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        addImageToNavBar()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "HoffCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HoffCollectionViewCell")
        presenter.view = self
        presenter.fetchProducts()
    }
    
    func didFailureObtainProducts(error: String) {
        
    }
    
    func didSuccessObtainProducts(products: [Hoff]) {
        self.objects = products
        self.collectionView.reloadData()
    }
     
    func addImageToNavBar() {
        if let navController = navigationController {
            let imageLogo = UIImage(named: "Image")
            let widthNavBar = navController.navigationBar.frame.width
            let heigthNavBar = navController.navigationBar.frame.height
            let widthForView = widthNavBar * 0.4
            let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: widthForView, height: heigthNavBar))
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: widthForView, height: heigthNavBar))
            imageView.image = imageLogo
            imageView.contentMode = .scaleAspectFit
            logoContainer.addSubview(imageView)
            navigationItem.titleView = logoContainer
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hoffCell", for: indexPath) as! HoffCollectionViewCell
        return cell

    }
    
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
}


