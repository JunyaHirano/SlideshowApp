//
//  ViewController.swift
//  SlideshowApp
//
//  Created by DS_JH on 2021/04/16.
//

import UIKit

class ViewController: UIViewController {

    //アウトレット接続
    @IBOutlet weak var prevButton: UIButton! //戻るボタン
    @IBOutlet weak var nextButton: UIButton! //進むボタン
    @IBOutlet weak var slideImage: UIImageView! //スライド画像表示部分
    @IBOutlet weak var autoPlayButton: UIButton! //再生ボタン
    
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

    
    
    @objc func stopTimer(_timer: Timer) {
        //タイマーが動いていたら停止
        self.timer.invalidate()
        //タイマーをリセット
        self.timer = nil
        // ボタンタイトルを再生に変更
        autoPlayButton.setTitle("再生", for: .normal)
        //進むボタン有効化
        nextButton.isEnabled = true
        //戻るボタン有効化
        prevButton.isEnabled = true
        
    }
    
    //自動再生・停止
    @IBAction func autoPlayButtonDo(_ sender: Any) {
        
        if self.timer == nil {
            //タイマーがnil（動いてない）なら再生
            self.timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(imageSliderNext), userInfo: nil , repeats: true)
            // ボタンタイトルを停止に変更
            autoPlayButton.setTitle("停止", for: .normal)
            //進むボタン無効化
            nextButton.isEnabled = false
            //戻るボタン無効化
            prevButton.isEnabled = false
        } else {
            stopTimer()
        }
    }
    
    
    //進むボタン
    @IBAction func nextButtonDo(_ sender: Any) {
        if self.timer == nil {
            //タイマーが動いてないなら
            imageSliderNext()
        }
    }
    
    //戻るボタン
    @IBAction func prevButtonDo(_ sender: Any) {
        if self.timer == nil {
            //タイマーが動いてないなら
            imageSliderPrev()
        }
    }
    
    //スライダー画像を1つ進ませる関数（自動再生selector指定で呼び出す）
    @objc func imageSliderNext(){
        //カウントを1増やす
         currentIndex += 1
        
        if (currentIndex == imageArray.count){
        //ナンバリングをリセットする
            currentIndex = 0
        }
        //画像セット
        slideImage.image = imageArray[currentIndex]
    }
    
    //スライダー画像を1つ戻らせる関数
    @objc func imageSliderPrev(){
        
        if (currentIndex == 0){
        //画像が最初の画像だったら、ナンバリングを最大値にする
            currentIndex = imageArray.count
        }
        //カウントを1減らす
         currentIndex -= 1
        //画像セット
        slideImage.image = imageArray[currentIndex]
    }
    
    
    @IBOutlet var slideTap1: UITapGestureRecognizer!
    //TapGestureRecognizerでスライド画像をタップ
    @IBAction func slideTap(_ sender: Any) {
        if self.timer != nil {
        //タイマーが動いていたら停止
        self.timer.invalidate()
        //タイマーをリセット
        self.timer = nil
        }
    }
    
    //戻る
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ZoomViewController:ZoomViewController = segue.destination as! ZoomViewController
        //ZoomViewControllerで定義した変数zoomImageNumberにimageの値を渡す
        ZoomViewController.zoomImageNumber = imageArray[currentIndex]
    }
}

