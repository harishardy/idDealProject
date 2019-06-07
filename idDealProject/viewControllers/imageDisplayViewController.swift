//
//  imageDisplayViewController.swift
//  idDealProject
//
//  Created by harishardy on 07/06/19.
//  Copyright © 2019 iosdev. All rights reserved.
//

import UIKit

class imageDisplayViewController: UIViewController {
    
    
    
    @IBOutlet weak var largeDisplayImageView: UIImageView!
    
     let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    
    
    override func viewDidLoad() {
        
        
        let urlX = URL(string: (appDelegate.globalSelectedItemIndex!))
        let dataX = try?Data(contentsOf: urlX!)
        largeDisplayImageView.image = UIImage(data: dataX!)
        
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
