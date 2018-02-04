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
        let activityController = UIActivityViewController(activityItems: [textView.text!, viewPicture.image!], applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = sender
        self.present(activityController,animated: true, completion: nil)
    }
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        let url = URL(string: "http://demosistemas.com/logo.png")
        getImage(_url: url!)
        textView.text = " Text test Text test Text test Text test Text test Text testText test Text test Text test Text test Text test Text test Text test Text test Text test Text test Text test Text test Text test Text test Text test Text test Text"
    }
    
    func getImage(_url: URL){
        let session = URLSession(configuration: .default)
        //creating a dataTask
        let getImageFromUrl = session.dataTask(with: _url) { (data, response, error) in
            //if there is any error
            if let e = error {
                //displaying the message
                print("Error Occurred: \(e)")
            } else {
                //in case of now error, checking wheather the response is nil or not
                if (response as? HTTPURLResponse) != nil {
                    //checking if the response contains an image
                    if let imageData = data {
                        DispatchQueue.main.async {
                            //displaying the image #he code updates the ImageView within the background thread. Easy fix, update it in the main thread#
                            self.viewPicture.image = UIImage(data: imageData)
                        }
                    } else {
                        print("Image file is currupted")
                    }
                } else {
                    print("No response from server")
                }
            }
        }
        //starting the download getImageFromUrl
        getImageFromUrl.resume()
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
