//
//  GameViewController.swift
//  BarabaraGame
//
//  Created by nagata on 7/8/15.
//  Copyright (c) 2015 litech. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var imgView1: UIImageView! //上の画像
    @IBOutlet var imgView2: UIImageView! //真ん中の画像
    @IBOutlet var imgView3: UIImageView! //下の画像
    
    @IBOutlet var resultLabel: UILabel! //スコアを表示するラベル
    
    var timer: NSTimer = NSTimer() //画像を動かすためのタイマー
    var score: Int = 1000 //スコア保存
    let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults() //スコアの保存をするための変数
    
    var positionX: [CGFloat] = [0.0, 0.0, 0.0] //画像の位置
    
    var dx: [CGFloat] = [1.0, 1.0, 1.0] //上の画像を動かす幅
    let X: CGFloat = UIScreen.mainScreen().bounds.size.width/2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        positionX = [X, X, X]
        /*動かす位置の幅*/
        dx = [1.0, 0.5, -1.0]
        self.start()
    }
    
    func start() {
        /*結果ラベルを消す*/
        resultLabel.hidden = true
        
        /* タイマーを呼び出す時間 */
        timer = NSTimer.scheduledTimerWithTimeInterval(0.005, target: self, selector: "up", userInfo: nil, repeats: true)
        
    }
    
    func up() {
        for i in 0..<3 {
            //端にきたら動かす向きを逆にする
            if positionX[i] > 320 || positionX[i] < 0 {
                dx[i] = dx[i] * (-1)
            }
            positionX[i] += dx[i] //画像の位置をdx分ずらす
        }
        imgView1.center.x = positionX[0] //上の画像をずらした位置に移動させる
        imgView2.center.x = positionX[1] //真ん中の画像をずらした位置に移動させる
        imgView3.center.x = positionX[2] //下の画像をずらした位置に移動させる
    }

    @IBAction func retry() {
        score = 1000 //スコアの値をリセットする
        positionX = [X, X, X] //画像の位置を真ん中に戻す
        self.start() //スタートメソッドを呼び出す
    }

    @IBAction func stop() {
        if timer.valid == true {
            timer.invalidate()
            for i in 0..<3 {
                score = score - abs(Int(X - positionX[i]))*2 //画像のずれた分だけスコアから値を引く
            }
            resultLabel.text = "Score : " + String(score) //結果ラベルにスコアを表示する
            resultLabel.hidden = false  //結果ラベルを隠さない(現す)
            
            var highScore1: Int = defaults.integerForKey("score1")
            var highScore2: Int = defaults.integerForKey("score2")
            var highScore3: Int = defaults.integerForKey("score3")
            //1位のスコア
            if score > highScore1 {
                defaults.setInteger(score, forKey: "score1")
                defaults.setInteger(highScore1, forKey: "score2")
                defaults.setInteger(highScore2, forKey: "score3")
                //2位のスコア
            } else if score > highScore2 {
                defaults.setInteger(score, forKey: "score2")
                defaults.setInteger(highScore2, forKey: "score3")
                //3位のスコア
            } else if score > highScore3 {
                defaults.setInteger(score, forKey: "score3")
            }
        }
    }
    
    @IBAction func toTop() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
