//
//  LoginViewController.swift
//  MyFirstApp
//
//  Created by Lee Janghyup on 8/16/15.
//  Copyright (c) 2015 jay. All rights reserved.
//


import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func loginbutton(sender: AnyObject) {
        
        var username = usernameTextField.text
        var password = passwordTextField.text
        
        if username.isEmpty || password.isEmpty {
           println("로그인 : 칸 안채움")
           //유저에게 알리기
            
        }else {
            //로그인 프로세스
            
            PFUser.logInWithUsernameInBackground(username, password: password, block: { (user : PFUser?, error : NSError?) -> Void in
                if error == nil {
                    //로그인 성공
                    println(user)
                    
                    //로그인 성공 유저 홈으로
                    self.performSegueWithIdentifier("goHomeFromLogin", sender: self)
                    
                }else {
                    
                    //에러
                    println(error)
                    println("로그인: 로그인 프로세스 실패")
                }
            
            })
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
