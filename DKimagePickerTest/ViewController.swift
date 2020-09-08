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
    var localImages: [UIImage] = []
    
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
                asset.fetchFullScreenImage(completeBlock: { (image:UIImage?, info) in
                    // ここで取り出せる
                    //assetsにライブラリの画像をいれる
                    if let image = image {
                        self.localImages.append(image)
                        self.CollerctionView.reloadData()
                    }
                })
            }
            
            
        }
        
        self.present(pickerController, animated: true) {}
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return localImages.count  // ←修正する
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //①再利用
        let cell = self.CollerctionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        //index.path　選択した行を〜
        cell.imageView.image = localImages[indexPath.row]

        //⑤返す
        return cell
        
    }
    
    
}

