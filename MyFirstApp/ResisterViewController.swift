//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Lee Janghyup on 8/16/15.
//  Copyright (c) 2015 jay. All rights reserved.
//

import UIKit
import Parse


class ResisterViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func createAccountbtn(sender: AnyObject) {
      
        var username = usernameTextField.text
        var email = emailTextField.text
        var password = passwordTextField.text
        
        // check for empty field and alert the user
        
        if username.isEmpty || email.isEmpty || password.isEmpty {
            //alert user of empty field
            println("레지스터: 빈칸확인")
            
        } else {
            //proceed to sign up user.
            var user = PFUser()
            
            
            user.username = username
            user.email = email
            user.password = password
            user.signUpInBackgroundWithBlock({ (isSuccesful : Bool, error : NSError?) -> Void in
                
                if error == nil {
                    //SUCCESS user signed up
                    println(isSuccesful)
                    self.performSegueWithIdentifier("resisterToHome", sender: self)
                    
                    println("레지스터: 가입성공")
                    
                }else {
                    //there was an error
                    println(error)
                    println("레지스터: 가입 프로세스 실패")
                }
            })
        
            }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

