//
//  ViewController.swift
//  Social-Labs
//
//  Created by Bhargav Kondapalli on 9/19/16.
//  Copyright © 2016 KikrLabs. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {
    
    
    
    @IBOutlet var emailField: FancyField!   
    @IBOutlet var pwdField: FancyField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func facebookBtnTapped(_ sender: AnyObject) {
        
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                
                print("Danny: Unable to authenticate with Facebook - \(error)")
            } else if result?.isCancelled == true {
                print("Danny: User cancelled Facebook authentication")
            } else {
                print("Danny: Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
        
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Danny: Unable to authenticate with Firebase - \(error)")
            } else {
                print("Danny: Successfully authenticated with Firebase")
            }
        })
    }

    @IBAction func signInTapped(_ sender: AnyObject) {
        
        if let email = emailField.text, let pwd = pwdField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("Danny: Email User authenticated with Firebase")
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("Danny: Unable to authenticate Email User with Firebase")
                        } else {
                            print("Danny: Successfully authenticated Email User with Firebase")
                        }
                    })
                }
            })
        }
        
    }

}

