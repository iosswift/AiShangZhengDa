//
//  FriendViewController.swift
//  Live-zzu
//
//  Created by 如是我闻 on 2017/5/5.
//  Copyright © 2017年 如是我闻. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController,UIPopoverPresentationControllerDelegate {
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var secondView: UIView!
 
    @IBOutlet weak var btn: UIButton!

    
    
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            firstView.isHidden = false
            secondView.isHidden = true
        case 1:
            firstView.isHidden = true
            secondView.isHidden = false
        default:
            break;
        }

        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnTap(_ sender: Any) {
        
        let pop = PopViewController()
        pop.modalPresentationStyle = .popover
        pop.popoverPresentationController?.delegate = self
        pop.popoverPresentationController?.sourceView = btn
        pop.popoverPresentationController?.sourceRect = btn.bounds
        pop.preferredContentSize = CGSize(width: 150, height: 150)
        
        self.present(pop, animated: true, completion: nil)

        
    }
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
