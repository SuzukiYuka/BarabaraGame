
//
//  RankingViewController.swift
//  BarabaraGame
//
//  Created by nagata on 7/8/15.
//  Copyright (c) 2015 litech. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController {
    let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    @IBOutlet var rankingLabel1: UILabel!
    @IBOutlet var rankingLabel2: UILabel!
    @IBOutlet var rankingLabel3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rankingLabel1.text = String(defaults.integerForKey("score1"))
        rankingLabel2.text = String(defaults.integerForKey("score2"))
        rankingLabel3.text = String(defaults.integerForKey("score3"))

        // Do any additional setup after loading the view.
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
