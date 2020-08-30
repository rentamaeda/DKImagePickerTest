//
//  ViewController.swift
//  DKimagePickerTest
//
//  Created by user on 2020/08/30.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import Photos
import DKImagePickerController  // 忘れないように
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {

    @IBOutlet weak var CollerctionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        CollerctionView.delegate = self
              CollerctionView.dataSource = self
    }

    @IBAction func Button(_ sender: Any) {
        let pickerController = DKImagePickerController()
        // 選択可能な枚数を20にする
        pickerController.maxSelectableCount = 20
        pickerController.didSelectAssets = { [unowned self] (assets: [DKAsset]) in
            
            // 選択された画像はassetsに入れて返却されるのでfetchして取り出す
            for asset in assets {
                asset.fetchFullScreenImage(completeBlock: { (image, info) in
                    // ここで取り出せる
                    //self.imageView.image = image

                })
            }
            
            
        }
        
        self.present(pickerController, animated: true) {}
    }
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                  return 13 //追加
              }
            func numberOfSections(in collectionView: UICollectionView) -> Int {
                  return 1
              }
       
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                  //①
                  let cell = self.CollerctionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
                  //②
                  cell.imageView.image = image
                  //③
               
             
                //⑤
                 return cell
                           
              }
        
    
}

