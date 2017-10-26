//
//  ViewController.swift
//  CollectionViewSupplementaryViewPractice
//
//  Created by 박종찬 on 2017. 7. 3..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
  
  var dataArray = Array(1...10).map { (i) -> String in
    String(i)
  }
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.allowsMultipleSelection = true
    
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: LabelCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: LabelCollectionViewCell.reuseID, for: indexPath) as! LabelCollectionViewCell
    
    cell.titleLabel.text = dataArray[indexPath.row]
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let reusableView: MyCollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: MyCollectionReusableView.reuseID, for: indexPath) as! MyCollectionReusableView
    reusableView.headerTitleLabel.text = "Header Supplementary View"
    return reusableView
  }
  
  @IBAction func duplicateButtonTouched(_ sender: UIBarButtonItem) {
    
    let sortedArray: [IndexPath]? = self.collectionView.indexPathsForSelectedItems?.sorted(by: { (l, r) -> Bool in
      return l.row > r.row
    })
    
    
    _ = sortedArray?.map({ (indexPath) in
      dataArray.insert(dataArray[indexPath.row], at: indexPath.row)
      self.collectionView.insertItems(at: [indexPath])
      
    })
    
  }
  
  @IBAction func deleteButtonTouched(_ sender: Any) {
    
    let sortedArray: [IndexPath]? = self.collectionView.indexPathsForSelectedItems?.sorted(by: { (l, r) -> Bool in
      return l.row > r.row
    })
    
    _ = sortedArray?.map({ (indexPath) in
      self.dataArray.remove(at: indexPath.row)
    })
    
    self.collectionView.deleteItems(at: sortedArray!)
  }
  
}

