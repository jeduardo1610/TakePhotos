//
//  ViewController.swift
//  TakePhotos
//
//  Created by Jorge Eduardo on 25/01/18.
//  Copyright © 2018 Jorge Eduardo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var imagePickerController : UIImagePickerController!

    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onTakePhoto(_ sender: Any) {
        //this will open the controller with the camera
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func onSavePhoto(_ sender: Any) {
    }
    
    
    @IBAction func onGoToGallery(_ sender: Any) {
    }
    
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePickerController.dismiss(animated: true, completion: nil) //dismiss camera controller
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage//stores in our imageView variable the image that was taken by the camera
    }
    
}

