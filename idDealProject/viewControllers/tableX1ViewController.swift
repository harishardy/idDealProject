//
//  tableX1ViewController.swift
//  idDealProject
//
//  Created by harishardy on 06/06/19.
//  Copyright © 2019 iosdev. All rights reserved.
//

import UIKit

class tableX1ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellX = tableView.dequeueReusableCell(withIdentifier: "cellIdX1", for: indexPath) as! tableX1TableViewCell
        
        cellX.labelX1.text = idDeal [indexPath.row]
        
        cellX.labelX2.text =  name [indexPath.row]
        
        
        
        let urlX = URL(string: imageURL [indexPath.row])
        let dataX = try?Data(contentsOf: urlX!)
        cellX.imageViewX1.image = UIImage(data: dataX!)
        
        
        return cellX
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.performSegue(withIdentifier: "goToSecondVC", sender: self)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.globalSelectedRowIndex = String(indexPath.row)
        appDelegate.globalLatitude = String(latitudeX[indexPath.row])
        appDelegate.globalLongitude = String(longitudeX[indexPath.row])
        appDelegate.globalStoreTitle = String(storeTitleX[indexPath.row])
    }
    
    
    @IBOutlet var tableViewX1: UITableView!
    
    
    var link = "https://www.myprivatedeal.com/API/getDeals.php?key=jcjn79b8f043f4y74yh48ug984u"
    var name = [String] ()
    var imageURL = [String] ()
    var idDeal = [String] ()
    var latitudeX = [String] ()
    var longitudeX = [String] ()
    var storeTitleX = [String] ()
    
   
    
    
    
    
    override func viewDidLoad() {
        
        
    
        
        
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
                        
                        
                        
                        
                        let myarray = json["Deal"] as! NSArray
                        for ssss in myarray
                        {
                            if let path = ssss as?[String: Any]
                            {
                                
                                self.name.append(path["title"] as! String)
                                self.imageURL.append(path["cat_icon"] as! String)
                                self.idDeal.append(path["id_deal"] as! String)
                                self.latitudeX.append(path["latitude"] as! String)
                                self.longitudeX.append(path["longitude"] as! String)
                                self.storeTitleX.append(path["store_title"] as! String)
                            }
                            
                            //                            if let imagePath = ssss as?[String: Any]
                            //                            {
                            //
                            //                                self.imageURL.append(imagePath["cat_icon"] as! String)
                            //                            }
                            
                        }
                        
                        
                        
//                        print(self.storeTitleX[0])
//                        print(self.latitudeX[0])
//                        print(self.longitudeX[0])
                        
                        
                        
                        DispatchQueue.main.async {
                            self.tableViewX1.reloadData()
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
