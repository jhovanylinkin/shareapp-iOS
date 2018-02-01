//
//  TimeLineViewController.swift
//  socialShare
//
//  Created by Jhovany Morales on 1/30/18.
//  Copyright © 2018 Jhovany Morales. All rights reserved.
//

import UIKit
import Social

class TimeLineViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var viewPicture: UIImageView!
    
    @IBAction func getMedia(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self

        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = .camera
        }
        else {
            imagePicker.sourceType = .savedPhotosAlbum
        }
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func share(_ sender: UIButton) {
        let activityController = UIActivityViewController(activityItems: [textField.text!, textView.text!, viewPicture.image!], applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = sender
        self.present(activityController,animated: true, completion: nil)
    }
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        let url = URL(string: "http://demosistemas.com/logo.png")
        let loadimage = URLSession.shared.dataTask(with: url!){(data, resp, error) in
        if (error != nil){
            print("Error")
        }else{
            var documentsDirectory: String?
            var paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
            
            if paths.count > 0{
                documentsDirectory = paths[0]
                let savePath = documentsDirectory! + "/logo.png"
                FileManager.default.createFile(atPath: savePath, contents: data, attributes: nil)
                DispatchQueue.main.async {
                    self.viewPicture.image = UIImage(named: savePath)
                    }
                }
            }
        }
        loadimage.resume()
        textField.text = "Some one Tex"
        textView.text = " Text test Text test Text test Text test Text test Text testText test Text test Text test Text test Text test Text test Text test Text test Text test Text test Text test Text test Text test Text test Text test Text test Text"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func imagePickerController(_ Picker:UIImagePickerController, didFinishPickingMediaWithInfo info:[String: Any]){
        viewPicture.image = info[UIImagePickerControllerOriginalImage] as?
        UIImage; self.dismiss(animated: true, completion: nil)
        
    }
}
