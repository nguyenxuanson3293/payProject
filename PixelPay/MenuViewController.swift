//
//  MenuViewController.swift
//  PixelPay
//
//  Created by ClickStaff on 12/26/17.
//  Copyright © 2017 ClickStaff. All rights reserved.
//

import UIKit

struct cellData {
    let cell : Int
    let name : String!
    let image : UIImage!
}

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var labelCell:[String] = ["Dashboard", "Transfer", "Request", "TransferHistory", "PaymentHistory", "Buy", "Sell"]
    var arrayOfSellData = [cellData]()
    
    @IBOutlet weak var mTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mTable.delegate = self
        mTable.dataSource = self
        arrayOfSellData = [cellData(cell : 1, name : "Dashboard", image : #imageLiteral(resourceName: "ic_chart")),
                           cellData(cell : 2, name : "Transfer", image : #imageLiteral(resourceName: "ic_history")),
                           cellData(cell : 3, name : "Request", image : #imageLiteral(resourceName: "ic_history2")),
                           cellData(cell : 4, name : "TransferHistory", image : #imageLiteral(resourceName: "ic_history1")),
                           cellData(cell : 5, name : "PaymentHistory", image : #imageLiteral(resourceName: "ic_sell")),
                           cellData(cell : 6, name : "Buy", image : #imageLiteral(resourceName: "ic_buy")),
                           cellData(cell : 7, name : "Sell", image : #imageLiteral(resourceName: "ic_buy"))]
        
        let nib = UINib.init(nibName: "MainMenuCell", bundle: nil)
        self.mTable.register(nib, forCellReuseIdentifier: "MainMenuCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfSellData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainMenuCell", for: indexPath) as! MainMenuCell
        
        cell.menuLabel.text = arrayOfSellData[indexPath.row].name
        cell.menuIcon.image = arrayOfSellData[indexPath.row].image
        
        return cell
    }

    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
//            if let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "TestViewController") as? TestViewController {
//                let navController = UINavigationController(rootViewController: secondViewController)
//                navController.setViewControllers([secondViewController], animated:true)
//                self.revealViewController().pushFrontViewController(secondViewController, animated: true)
//            }
            
        } else if indexPath.row == 1 {
            if let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "TestViewController") as? TestViewController {
                let navController = UINavigationController(rootViewController: secondViewController)
                navController.setViewControllers([secondViewController], animated:true)
                self.revealViewController().pushFrontViewController(secondViewController, animated: true)
            }
    
        } else {
        
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}
