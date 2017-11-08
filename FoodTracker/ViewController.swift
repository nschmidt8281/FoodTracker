//
//  ViewController.swift
//  FoodTracker
//
//  Created by Nicolas Schmidt on 11/5/17.
//  Copyright © 2017 408 Industries. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
    @IBOutlet weak var txtMealName: UITextField!
    @IBOutlet weak var lblMealNameLabel: UILabel!
    @IBOutlet weak var imgPhoto: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtMealName.delegate = self
    }
    
    // Mark: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        lblMealNameLabel.text = txtMealName.text
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as?
            UIImage else {
                fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        imgPhoto.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Actions
    @IBAction func gstSelectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        txtMealName.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
}

