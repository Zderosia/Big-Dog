//
//  ViewController.swift
//  Test 3
//
//  Created by De Rosia, Zachary on 5/26/20.
//  Copyright © 2020 De Rosia, Zachary. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: Properties
    
	@IBOutlet weak var Butoon: UIButton!
	@IBOutlet weak var lobsterSwitch: UISwitch!
	@IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var buttOn: UIButton!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
	var flag = 0;
	let uiColorArray = [UIColor.red, UIColor.green, UIColor.blue, UIColor.orange, UIColor.purple, UIColor.yellow, UIColor.systemPink, UIColor.systemIndigo, UIColor.systemTeal];
	
	override func viewWillAppear(_ animated: Bool) {
		nameTextField.background = nil;
	}
    override func viewDidLoad() {
        super.viewDidLoad()
        buttOn.titleLabel?.text = "test"
		nameTextField.delegate = self;
        // Do any additional setup after loading the view.
    }
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil);
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		
		// The info dictionary may contain multiple representations of the image. You want to use the original.
		guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
			fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
		}
		
		// Set photoImageView to display the selected image.
		photoImageView.image = selectedImage
		
		// Dismiss the picker.
		dismiss(animated: true, completion: nil)
	}
    
    // MARK: Actions
    
	@IBAction func editingEnd(_ sender: UITextField) {
		changeAllColors();
		buttOn.setTitle(nameTextField.text, for: .normal);
		self.resignFirstResponder();
	}
	@IBAction func editingBegin(_ sender: UITextField) {
		mealNameLabel.text = "See me";
		changeAllColors();
		flag = 0;
	}
	@IBAction func selectImageFromPhotoLibrary(_ sender:
        UITapGestureRecognizer) {
        nameTextField.resignFirstResponder();
        let imagePickerController = UIImagePickerController();
        imagePickerController.sourceType = .photoLibrary;
        imagePickerController.delegate = self;
        present(imagePickerController, animated: true, completion: nil)
    }
    
	@IBAction func OnClick(_ sender: UIButton) {
		mealNameLabel.text = String(flag)
        nameTextField.resignFirstResponder();
        flag+=1;
        if (.random(in: 0...3) == 3)
        {
            flag-=2;
        }
	}
	
	@IBAction func lobsterSwitch(_ sender: UISwitch) {
		if lobsterSwitch.isOn
		{
			photoImageView.isHidden = false;
		}
		else{
			photoImageView.isHidden = true;
		}
	}
	
	// MARK: Functions
	
    func changeAllColors()
	{
		mealNameLabel.backgroundColor = uiColorArray.randomElement();
		self.view.backgroundColor = uiColorArray.randomElement();
		nameTextField.background = nil;
		nameTextField.backgroundColor = uiColorArray.randomElement();
		nameTextField.textColor = uiColorArray.randomElement();
	}

}

