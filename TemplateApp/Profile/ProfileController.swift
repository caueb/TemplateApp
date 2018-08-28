//
//  ProfileController.swift
//  TemplateApp
//
//  Created by Caue Borella on 27/8/18.
//  Copyright © 2018 Caue Borella. All rights reserved.
//

import UIKit

class ProfileController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        navigationItem.title = "Profile"
        
        collectionView?.backgroundColor = .blue
        
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        collectionView?.refreshControl = refreshControl
        
        setupNavigationItems()
    }
    
    @objc func handleUpdateFeed() {
        handleRefresh()
    }
    
    @objc func handleRefresh() {
        print("Handling refresh..")
        
    }
    
    
    func setupNavigationItems() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "camera3").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleCamera))
    }
    
    @objc func handleCamera() {
        print("Showing camera")
        
        let cameraController = CameraController()
        present(cameraController, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var height: CGFloat = 40 + 8 + 8 //username userprofileimageview
        height += view.frame.width
        height += 50
        height += 60
        
        return CGSize(width: view.frame.width, height: height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        //cell.post = posts[indexPath.item]
        
        //cell.delegate = self
        
        return cell
    }
    
    
}
