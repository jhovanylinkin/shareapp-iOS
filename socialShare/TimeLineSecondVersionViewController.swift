//
//  TimeLineSecondVersionViewController.swift
//  socialShare
//
//  Created by Jhovany Morales on 1/31/18.
//  Copyright © 2018 Jhovany Morales. All rights reserved.
//

import UIKit
import YouTubePlayer
import Social

class TimeLineSecondVersionViewController: UIViewController {
    @IBOutlet weak var videoView: YouTubePlayerView!
    @IBOutlet weak var textView: UITextView!
    @IBAction func shareButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoView.loadVideoID( "ljbhiEuGKSI" )
        textView.text = videoView.description
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
