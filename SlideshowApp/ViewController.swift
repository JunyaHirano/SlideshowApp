//
//  ViewController.swift
//  SlideshowApp
//
//  Created by DS_JH on 2021/04/16.
//

import UIKit

class ViewController: UIViewController {

    //アウトレット接続
    @IBOutlet weak var slideImage: UIImageView! //スライド画像表示部分
    @IBOutlet weak var autoPlay: UIButton! //自動再生・停止ボタン
    
    //タイマーを宣言
    var timer: Timer!
    
    // 配列で使う画像のインデックス番号を宣言
    var currentIndex:Int = 0
    
    //スライドショーさせる画像配列
    var imageArray:[UIImage] = [
        UIImage(named: "apple.jpg")!,
        UIImage(named: "banana.jpg")!,
        UIImage(named: "orange.jpg")!
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func autoPlayButton(_sender: Any){
        if(timer == nil) {
        
            //タイマーがnil（動いてない）なら再生
            timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(imageSlider), userInfo: nil , repeats: true)
        
        }
    }
    
    //selector指定で揖斐出す関数
    @objc func imageSlider(){
        //カウントを1増やす
         currentIndex += 1
        
        if (currentIndex == imageArray.count){
        //ナンバリングをリセット
            currentIndex = 0
    }
        //画像セット
        slideImage.image = imageArray[currentIndex]
    }
    
    
}

