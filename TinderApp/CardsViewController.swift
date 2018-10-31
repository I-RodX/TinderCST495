//
//  CardsViewController.swift
//  TinderApp
//
//  Created by Isaac on 10/30/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var tinderNavBar: UIImageView!
    @IBOutlet weak var tinderProfileImage: UIImageView!
    @IBOutlet weak var tinderActionButtons: UIImageView!
    var imageInitialCenter: CGPoint!
    var divisor: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        divisor = (view.frame.width/2)/0.78
        // Do any additional setup after loading the view.
        // Here we use the method didPan(sender:), which we defined in the previous step, as the action.
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPanGesture(_:)))
        
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        tinderProfileImage.isUserInteractionEnabled = true
        tinderProfileImage.addGestureRecognizer(panGestureRecognizer)
    }
    
    func resetImagePosition() {
        tinderProfileImage.transform = CGAffineTransform.identity
        tinderProfileImage.center = imageInitialCenter
        tinderProfileImage.alpha = 1
        
    }
    
    
    @IBAction func didPanGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let xCenter = tinderProfileImage.center.x - view.center.x
        tinderProfileImage.transform = CGAffineTransform(rotationAngle: xCenter/divisor)
        
        if sender.state == .began {
            print("Gesture began")
            imageInitialCenter =  tinderProfileImage.center
        } else if sender.state == .changed {
            tinderProfileImage.center = CGPoint(x: imageInitialCenter.x+translation.x, y: imageInitialCenter.y)
            print("Gesture is changing")
        } else if sender.state == .ended {
            print("Gesture ended")
            if (tinderProfileImage.center.x < 75){
                UIView.animate(withDuration: 0.3, animations: {
                    self.tinderProfileImage.alpha = 0
                    self.tinderProfileImage.center = CGPoint(x: self.tinderProfileImage.center.x - 150, y: self.tinderProfileImage.center.y)
                }){(Bool) in
                    self.resetImagePosition()
                }
                return
            }else if (tinderProfileImage.center.x > (view.frame.width - 75)) {
                UIView.animate(withDuration: 0.3, animations: {
                    self.tinderProfileImage.alpha = 0
                    self.tinderProfileImage.center = CGPoint(x: self.tinderProfileImage.center.x + 150, y: self.tinderProfileImage.center.y)
                }){(Bool) in
                    self.resetImagePosition()
                }
                return
            }
            resetImagePosition()
        }
        
    }


    @IBAction func didTapImage(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let ProfileVC = segue.destination as? ProfileViewController
            ProfileVC?.detailImage = UIImage(named: "ryan")!
        }
    }
    
    
    /*
     
     let profileVC = storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileViewController
     
     profileVC.detailImage = tinderProfileImage.image
 
 tinderProfileImage.transform = .identity
 tinderProfileImage.center = cardInitialCenter
 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
