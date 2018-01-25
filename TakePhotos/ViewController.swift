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

    @IBOutlet weak var pathLabel: UILabel!
    
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
        saveImage(imageName: "testTakePhotoApp.png")
    }
    
    
    @IBAction func onGoToGallery(_ sender: Any) {
        performSegue(withIdentifier: "gallerySegue", sender: self)
    }
    
    func saveImage(imageName: String){
        //create an instance of the FileManager
        let fileManager = FileManager.default
        //get the image path
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        pathLabel.text = imagePath
        //get the image we took with camera
        let image = imageView.image!
        //get the PNG data for this image
        let data = UIImagePNGRepresentation(image)
        //store it in the document directory    fileManager.createFile(atPath: imagePath as String, contents: data, attributes: nil)
        fileManager.createFile(atPath: imagePath as String, contents: data, attributes: nil)
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePickerController.dismiss(animated: true, completion: nil) //dismiss camera controller
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage//stores in our imageView variable the image that was taken by the camera
    }
    
    @IBAction func unWind(segue: UIStoryboardSegue) {}
    
}

