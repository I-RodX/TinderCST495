//
//  ProfileViewController.swift
//  TinderApp
//
//  Created by Isaac on 10/30/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var tinderDetailImage: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    var detailImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tinderDetailImage.image = detailImage
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapDone(_ sender: Any) {
        performSegue(withIdentifier: "doneSegue", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
