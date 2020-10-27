//
//  DetailsViewController.swift
//  CodingTest
//
//  Created by mohammed on 9/6/20.
//  Copyright © 2020 mohammedErbia. All rights reserved.
//

import UIKit
import Kingfisher
class DetailsViewController: UIViewController {
    var data :  Item?
    private let cellheader : String = "headerCollectionReusableView"
    private let cellbody : String = "imagecellcolectionviewcell"
    @IBOutlet weak var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.register(UINib(nibName: cellheader, bundle: nil), forSupplementaryViewOfKind: cellheader, withReuseIdentifier: cellheader)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.collection.collectionViewLayout.invalidateLayout()
        
    }
}
//MARK:- DetailsViewController
extension DetailsViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collection.frame.size.width - space) / 2.0
        return CGSize(width: size, height: size)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:collectionView.frame.size.width, height:340)
    }
     
         func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data?.images?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellbody, for: indexPath) as! imagecellcolectionviewcell
        let object = self.data?.images?[indexPath.row]
        cell.imagecell.kf.indicatorType = .activity
        cell.imagecell.kf.setImage(with: URL(string: object?.url ?? ""),placeholder: UIImage(named: "Placeholder_logo"))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: self.cellheader, for: indexPath) as! headerCollectionReusableView
        cell.id.text = "\(self.data?.id ?? 0)"
        cell.titel.text = self.data?.title ?? " err titel"
        cell.price.text = "\(self.data?.price ?? 0)"
        cell.address.text = self.data?.location?.address ?? "err location address "
        
        return cell
    }
}
