//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by DS_JH on 2021/04/20.
//

import UIKit

class ZoomViewController: UIViewController {

    //アウトレット接続
    @IBOutlet weak var zoomImage: UIImageView! //拡大画像部分
    
    //変数宣言して初期化
    var zoomImageNumber:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        zoomImage.image = zoomImageNumber
    }
    
    


}
