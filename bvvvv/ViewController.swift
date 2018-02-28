//
//  ViewController.swift
//  bvvvv
//
//  Created by sameh mohammed on 2/28/18.
//  Copyright © 2018 com.trio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonBotCon: NSLayoutConstraint!
    @IBOutlet weak var myBu: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        print("keyboardWillShow")
        let userInfo:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        self.buttonBotCon.constant = keyboardHeight
        self.view.layoutIfNeeded()
    }
    
  
    
    @objc func keyboardWillHide(notification: NSNotification){
        print("keyboardWillHide")
        self.buttonBotCon.constant = 0
        self.view.layoutIfNeeded()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnClciked(_ sender: Any) {
        
        print("clickedddd")
        
        let searchController = UISearchController(searchResultsController: self)
      //  searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        
        searchController.searchBar.becomeFirstResponder()
        definesPresentationContext = true
        self.present(searchController, animated: true, completion: nil)
    }
    
}

