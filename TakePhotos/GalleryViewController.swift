//
//  GalleryViewController.swift
//  TakePhotos
//
//  Created by Jorge Eduardo on 25/01/18.
//  Copyright © 2018 Jorge Eduardo. All rights reserved.
//

import Foundation
import UIKit
class GalleryViewcontroller : UIViewController{

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getImage(imageName: "testTakePhotoApp.png")
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    func getImage(imageName: String){
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        if fileManager.fileExists(atPath: imagePath){
            imageView.image = UIImage(contentsOfFile: imagePath)
        }else{
            print("Panic! No Image!")
        }
    }
    
    @IBAction func onReturnTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "unwind", sender: self)

    }
}
