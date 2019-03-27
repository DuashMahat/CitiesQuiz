//
//  ViewController.swift
//  CitiesQuiz
//
//  Created by Duale on 3/13/19.
//  Copyright © 2019 Duale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    @IBAction func onPressButton(_ sender: UIButton) {
         performSegue(withIdentifier: "goToSecondScreen", sender: self)
    }
   
}

