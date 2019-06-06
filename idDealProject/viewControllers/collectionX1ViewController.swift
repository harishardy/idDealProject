//
//  collectionX1ViewController.swift
//  idDealProject
//
//  Created by harishardy on 06/06/19.
//  Copyright © 2019 iosdev. All rights reserved.
//

import UIKit

class collectionX1ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoURL.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellX = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdX2", for: indexPath) as! collectionX1CollectionViewCell

        
        let urlX = URL(string: photoURL [indexPath.row])
        let dataX = try?Data(contentsOf: urlX!)
        cellX.imageViewX2.image = UIImage(data: dataX!)
        
        return cellX
    }
    
    
    @IBOutlet weak var collectionViewX1: UICollectionView!
    
    @IBOutlet weak var labelRowIndex: UILabel!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    
    var link = "https://www.myprivatedeal.com/API/getDeals.php?key=jcjn79b8f043f4y74yh48ug984u"
    
    var photoURL = [String] ()
    
    
    
    override func viewDidLoad() {
        
        
        labelRowIndex.text = appDelegate.globalSelectedRowIndex
        
        let ind = Int(appDelegate.globalSelectedRowIndex!)
       
        
        print(ind!)
        
        //var selectedRowIndex = 34
        
        let url = URL(string: link)

        URLSession.shared.dataTask(with: url!) {(data,response, error) in
            if error != nil
            {
                print(error!)
            }else{
                print ("abcd")
                //                print (response)
                //                print (error)
                //                print ("test",data)
                do{

                    if let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any]
                    {




                        var myarray = json["Deal"] as! NSArray

                        //var photosArray = myarray[selectedRowIndex]

                        var currentArray = myarray[ind!] as! NSArray

                        var photosArray = currentArray{photo} as! NSArray

                        for ssss in photosArray
                        {
                            if let path = ssss as?[String: Any]
                            {

                                self.photoURL.append(path["photos"] as! String)

                            }

                        }
                        DispatchQueue.main.async {
                            self.collectionViewX1.reloadData()
                        }
                    }
                }catch let error as NSError{
                    print(error)
                }
            }
            }.resume()
    
        
        
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