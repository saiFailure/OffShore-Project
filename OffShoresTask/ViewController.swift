//
//  ViewController.swift
//  OffShoresTask
//
//  Created by Sainath MAC on 02/04/1942 Saka.
//  Copyright © 1942 Sainath MAC. All rights reserved.
//

import UIKit


var mainDataArray = [String]()


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchDisplayDelegate {

    
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    var isFilter = true
    
    
    
    
    var  mainData = [OffShoreData]()
    
    let dataArray = [String]()
    
    
    
    
    var selectedStockProducts = [String]()
    
    var filteredData = [String]()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        searchBarOutlet.delegate = self
        

    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mainData = DataBaseManager.manager.fetchData()
        tableViewOutlet.reloadData()
    }

    
    //MARK:- TableView Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFilter == true{
            
            return mainData.count
            
        }else{
            
            return filteredData.count
        }
    
        

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        if isFilter == true {
            
                    let astudent = mainData[indexPath.row]
                  
                  cell.titleNameOutlet.text = astudent.name
                  cell.descriptionOutlet.text = astudent.data
            
                  
                       cell.checkUncheckButtonAction.setImage(#imageLiteral(resourceName: "unchecked_blue"), for: .normal)
                       cell.selectionStyle = .none
                       
                       for obj in selectedStockProducts
                       {
                           if String(indexPath.row) == obj
                           {
                               cell.checkUncheckButtonAction.setImage(#imageLiteral(resourceName: "checked_blue"), for: .normal)
                               searchBarOutlet.resignFirstResponder()
                         
                               
                           }
                       }

            
        }else{
            
                 let astudent = filteredData[indexPath.row]
                       
            cell.titleNameOutlet.text = astudent
            cell.descriptionOutlet.text = astudent
                 
                       
                            cell.checkUncheckButtonAction.setImage(#imageLiteral(resourceName: "unchecked_blue"), for: .normal)
                            cell.selectionStyle = .none
                            
                            for obj in selectedStockProducts
                            {
                                if String(indexPath.row) == obj
                                {
                                    cell.checkUncheckButtonAction.setImage(#imageLiteral(resourceName: "checked_blue"), for: .normal)
                                    searchBarOutlet.resignFirstResponder()
                              
                                    
                                }
                            }
            
            
            
        }
  

        return cell
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
    }
    // MARK: - Searchbar Delegate
        
    
        
     func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
 
        let filtered = (mainData.filter{ ($0.name)!.lowercased().contains(searchText.lowercased())
            
        })
        isFilter = true
        
        //filteredData = filtered
        
        print("ni amma\(filtered)")
        
        tableViewOutlet.reloadData()
        
        
    }
        
     func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchBarOutlet.showsCancelButton = false
        searchBarOutlet.text = ""
        searchBarOutlet.resignFirstResponder()
    }
 
    @IBAction func checkUncheckButtonAction(_ sender: UIButton) {
        
         if let cell = sender.superview?.superview as? TableViewCell
               {
                   
                   let indexPath = tableViewOutlet.indexPath(for: cell)
                   
                   print(indexPath!.row)
                   
                   
                   if !selectedStockProducts.contains(String((indexPath?.row)!))
                   {
                       
                       let indx:Int = (indexPath?.row)!
                       
                       selectedStockProducts.append(String(indx))
                    
                    
                    
                    
                        DataBaseManager.manager.context.delete(mainData[indexPath!.row])
                       mainData.remove(at: indexPath!.row)
                    
                            let new = OffShoreData(context: DataBaseManager.manager.context)
                            new.name = cell.titleNameOutlet.text ?? ""
                            new.data = cell.descriptionOutlet.text ?? ""
                                                                   
                             DataBaseManager.manager.saveContext()
                        
                        
                 
                    
                    tableViewOutlet.reloadData()
                    
                    
                    
                   }
              
                       
                       print(selectedStockProducts)
                       
                   }
                   
    }
    
    
    @IBAction func addButtonAction(_ sender: Any) {
        
             let  vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
           self.present(vc, animated: true, completion: nil)
    }
}

    
 
    
    
    


 
