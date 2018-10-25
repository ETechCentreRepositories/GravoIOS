//
//  SponsorVC.swift
//  GravosRecycler
//
//  Created by Ivan Lipotan on 10/10/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class SponsorVC : UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .homecell , for: indexPath)as! SponsorCollCell
      return cell
        
    }
    
	
    override func viewWillAppear(_ animated: Bool) {
    
        
        let logo = UIImage(named: "NavLogo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
	override func viewDidLoad() {
		super.viewDidLoad()
	}
}
