//
//  UploadTableViewController.swift
//  MyFirstApp
//
//  Created by Lee Janghyup on 8/16/15.
//  Copyright (c) 2015 jay. All rights reserved.
//

import UIKit
import Parse

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var uploadPreviewImage: UIImageView!
    @IBOutlet weak var uploadMessage: UITextField!
    @IBOutlet weak var uploadImageText: UIButton!
    
    @IBAction func uploadImageFromSource(sender: AnyObject) {
        var imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.allowsEditing = false
        self.presentViewController(imagePicker, animated: true, completion: nil)
        
            }
        func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        uploadPreviewImage.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
        
        uploadImageText.titleLabel?.text = "Change Pic"
    }
    
    @IBAction func uploadButton(sender: AnyObject) {
        
        var imageText = uploadMessage.text
        
        if uploadPreviewImage.image == nil {
            // image is not included alert user
            
        println("Image not uploaded")
            
            
        }else {
            
            //이미지가 있을경우
            var posts = PFObject(className: "Posts")
            posts["imageText"] = imageText
            posts["uploader"] = PFUser.currentUser()
            posts.saveInBackgroundWithBlock(){
                (success: Bool, error: NSError?) -> Void in
                
                 if error == nil {
            // success saving, now save image 저정 성공
            
                /**success saving, Now save image.***/
                
                //create an image data 이미지 데이터 만들기
                var imageData = UIImagePNGRepresentation(self.uploadPreviewImage.image)
                //create a parse file to store in cloud  파스로 하여금 파일을 클라우드로 업로드 하게 하기
                    
                    var parseImageFile = PFFile(name: "uploaded_image.png", data: imageData)
                    //이 이름으로 파스에 저장
                    
                    posts["imageFile"] = parseImageFile
                    posts.saveInBackgroundWithBlock({ (success : Bool, error:NSError?) -> Void in
                        
                        if error == nil {
                            //take user home
                            println("Data uploaded")
                            self.performSegueWithIdentifier("goHomeFromUpload", sender: self)
                            
                            
                        }else {
                            println(error)
                           }
                    })
                    }
                
            
                
                }
            }
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
       // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
/*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }
*/
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
