//
//  TimeLineViewController.swift
//  socialShare
//
//  Created by Jhovany Morales on 1/30/18.
//  Copyright © 2018 Jhovany Morales. All rights reserved.
//

import UIKit

class TimeLineViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func share(_ sender: UIButton) {
        let activityController = UIActivityViewController(activityItems: [textField.text!], applicationActivities: nil)
        present(activityController,animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textField.text = "Some one Tex"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
