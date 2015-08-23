//
//  HomePageViewController.swift
//  MyFirstApp
//
//  Created by Lee Janghyup on 8/16/15.
//  Copyright (c) 2015 jay. All rights reserved.
//

import UIKit
import Parse

class HomePageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource   {

    @IBOutlet weak var homPageTableView: UITableView!
    var imageFiles = [PFFile]()
    var imageText = [String]()
    
    
    
    override func   viewDidLoad() {
        super.viewDidLoad()
        
        // DO any additional setup after loading the view
        var query = PFQuery(className: "Posts")
        query.orderByAscending("createdAt")
        query.findObjectsInBackgroundWithBlock {
            (posts : [AnyObject]?, error : NSError?) -> Void in
            
            if error == nil {
                
                for post in posts!{
                    
                //success fetxhing objects
                self.imageFiles.append(post["imageFile"] as! PFFile)
                self.imageText.append(post["imageText"] as! String)
                }
                //reload the Table
           }
      }
            
    }
//tableView begins
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return imageFiles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let singleCell : SingleRowCell = tableView.dequeueReusableCellWithIdentifier("mySingleCell") as! SingleRowCell
        
        //text
       // singleCell.swiftagramImageLabel.text = imageText[indexPath.row]
        
        //images
        imageFiles[indexPath.row].getDataInBackgroundWithBlock({ (imageData : NSData?, error : NSError?) -> Void in
            
            if imageData != nil {
            
            let image = UIImage(data: imageData!)
            singleCell.swiftagramImageView.image = image
            } else {
                println(error)
            }
        })
        
        return singleCell
        
    }
    
    
    
    
    
}


