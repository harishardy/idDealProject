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
        return photoData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellX = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdX2", for: indexPath) as! collectionX1CollectionViewCell

        
        let urlX = URL(string: photoData [indexPath.item])
        let dataX = try?Data(contentsOf: urlX!)
        cellX.imageViewX2.image = UIImage(data: dataX!)
        
        return cellX
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        self.performSegue(withIdentifier: "goToImageVC", sender: self)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.globalSelectedItemIndex = photoData[indexPath.item]
    }
    
    
    @IBOutlet weak var collectionViewX1: UICollectionView!
    
        
    
    
    @IBAction func locationButton(_ sender: Any) {
        
        performSegue(withIdentifier: "goToMapVC", sender: self)
    }
    
    
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    
    var link = "https://www.myprivatedeal.com/API/getDeals.php?key=jcjn79b8f043f4y74yh48ug984u"
    
    var photoURL = [NSArray] ()
    var photoData = [String] ()
    
    
    
    override func viewDidLoad() {
        
        
        //labelRowIndex.text = appDelegate.globalSelectedRowIndex
        
        let ind = Int(appDelegate.globalSelectedRowIndex!)
       
        
        print(ind!)
        
        //var selectedRowIndex = 34
        
        let url = URL(string: link)

        URLSession.shared.dataTask(with: url!) {(data,response, error) in
            if error != nil
            {
                print(error!)
            }else{
                print ("Started")
                //                print (response)
                //                print (error)
                //                print ("test",data)
                do{

                    if let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any]
                    {




                        let myArray = json["Deal"] as! NSArray
                        for ssss in myArray
                        {
                            if let path = ssss as?[String: Any]
                            {
                                
                                
                                self.photoURL.append(path["photo"] as! NSArray)
                                
                            }
                            
                        }
                        
        print(self.photoURL[ind!])
                        
                        
                        
                        for pppp in self.photoURL[ind!]
                        {
                        self.photoData.append(pppp as! String)
                        }
                        
        //print(self.photoData[2])
//                        for pppp in thisArray
//                        {
//
//                            if let pathX = pppp as?[String: Any]
//                            {
//
//                                self.photoURL.append(pathX["thisArray"] as! NSArray)
//
//                            }
//                        }
                        
                        
                            
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
