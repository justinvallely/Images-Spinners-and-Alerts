//
//  ViewController.swift
//  Images Spinners and Alerts
//
//  Created by Justin Vallely on 5/22/15.
//  Copyright (c) 2015 JMVapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    // UINavigationControllerDelegate allows us to navigate to another app to get photos
    // UIImagePickerControllerDelegate allows us to use the UI Image picker to allow the user to pick an image
    
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBAction func pause(sender: AnyObject) {
        
        // Create spinner animation
        activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        // Prevent the user from doing anything
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
    }
    
    @IBAction func restore(sender: AnyObject) {
        
        activityIndicator.stopAnimating()
        // Disappears because .hidesWhenStopped == true as set above
        
        // Re-activate the app
        //UIApplication.sharedApplication().endIgnoringInteractionEvents()
        
    }
    
    @IBAction func createAlert(sender: AnyObject) {
        
        var alert = UIAlertController(title: "Whoa there big fella", message: "Are you sure?", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            // Dismiss the alert
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }))
        
        // Present the view controller to the user
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        
        //println("Image selected")
        
        // This line gets rid of the UIImagePickerController
        self.dismissViewControllerAnimated(true, completion: nil)
        
        importedImage.image = image
    }
    
    @IBOutlet var importedImage: UIImageView!
    
    @IBAction func importImage(sender: AnyObject) {
        
        var image = UIImagePickerController()
        image.delegate = self
        // Choose between camera and photo stream with .Camera or .PhotoLibrary
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = false
        
        self.presentViewController(image, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

