//
//  FavoritesController.swift
//  ResistorCodeCalculator
//
//  Created by Five Admin on 6/22/19.
//  Copyright © 2019 Five Admin. All rights reserved.
//

import UIKit

class FavoritesController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var labelInstructionsToDelete: UILabel!
    var resistorsFav: Array<ResistorClass> = CDManager().retrieveData()
    var filteredResistors: Array<ResistorClass>=[]
    
    @IBOutlet weak var buttonDelete: UIButton!
    @IBAction func deleteData(_ sender: Any) {
        
        labelInstructionsToDelete.isHidden = false

        UIView.animate(withDuration: 0.25, delay: 0.0, animations: {
            self.buttonDelete.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        }) { _ in
        }
        UIView.animate(withDuration: 0.5, delay: 0.25, animations: {
            self.buttonDelete.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }) { _ in
        }
        
        favoritesTableView.allowsSelection = true;
        

    
    }
    
    @IBAction func valueChangeTextField(_ sender: Any) {
        
        let text: String = self.searchTextField!.text!
        //print(text.lowercased())
        filteredResistors = resistorsFav
        filteredResistors = resistorsFav.filter({e in
            
            //return (e.value as! String).lowercased().contains(text.lowercased())
            return (e.value).lowercased().starts(with: text.lowercased())
        })
        for nes in filteredResistors{
            print(nes.value)
        }
        DispatchQueue.main.async {
            
            self.favoritesTableView.reloadData()
        }
    }
    
    @IBAction func startedTyping(_ sender: Any) {
    
        let text: String = self.searchTextField!.text!
        //print(text.lowercased())
        filteredResistors = resistorsFav
        filteredResistors = resistorsFav.filter({e in
            
            //return (e.value as! String).lowercased().contains(text.lowercased())
            return (e.value).lowercased().starts(with: text.lowercased())
        })
        for nes in filteredResistors{
            print(nes.value)
        }
        
        self.favoritesTableView.reloadData()
    }
    
    
    
    @IBOutlet weak var searchTextField: UITextField!
    
    
    @IBAction func searchResistorsAction(_ sender: Any) {
        
        let text: String = self.searchTextField!.text!
        //print(text.lowercased())
        DispatchQueue.main.async {
            self.resistorsFav = CDManager().retrieveData()
        }
        filteredResistors = resistorsFav
        filteredResistors = resistorsFav.filter({e in
            
            //return (e.value as! String).lowercased().contains(text.lowercased())
            return (e.value).lowercased().starts(with: text.lowercased())
        })
        for nes in filteredResistors{
            print(nes.value)
        }
 
        self.favoritesTableView.reloadData()
    }
    
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var labelFavs: UILabel!
    @IBOutlet weak var favoritesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoritesTableView.allowsSelection = false;
        
        DispatchQueue.main.async {
            self.resistorsFav = CDManager().retrieveData()
        }
        

            self.filteredResistors = self.resistorsFav
            self.favoritesTableView.register(UINib(nibName: "resistorTableViewCell", bundle: nil), forCellReuseIdentifier: "resistorTableViewCell")
            
            self.favoritesTableView.delegate = self
            self.favoritesTableView.dataSource = self
            //self.favoritesTableView.reloadData()
        
       
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredResistors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resistorTableViewCell", for: indexPath) as! resistorTableViewCell
        
        
        cell.valueResistorLabel.text = (filteredResistors[indexPath.row]).value
        cell.color1Res.backgroundColor = (filteredResistors[indexPath.row]).color1
        cell.color2Res.backgroundColor = (filteredResistors[indexPath.row]).color2
        cell.color3Res.backgroundColor = (filteredResistors[indexPath.row]).color3
        cell.color4Res.backgroundColor = (filteredResistors[indexPath.row]).color4
        cell.color5Res.backgroundColor = (filteredResistors[indexPath.row]).color5
        cell.color6Res.backgroundColor = (filteredResistors[indexPath.row]).color6
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        showSimpleAlert(data: (self.filteredResistors[indexPath.row]).value)

        self.favoritesTableView.allowsSelection = false;
        //self.favoritesTableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.resistorsFav = CDManager().retrieveData()
            self.filteredResistors = self.resistorsFav
        }
        favoritesTableView.allowsSelection = false;
        //self.favoritesTableView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
            self.favoritesTableView.reloadData()
        }
    }
    
    
    func showSimpleAlert(data: String) {
        let alert = UIAlertController(title: "Are you sure you want to delete this resistor?", message: "The change you make is premanent",         preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Delete", style: UIAlertAction.Style.default, handler: { _ in
        
            DispatchQueue.main.async {
                CDManager().deleteData(valueOfResistor: data)
                self.resistorsFav = CDManager().retrieveData()
                self.filteredResistors=self.resistorsFav
                let text: String = self.searchTextField!.text!
                self.filteredResistors = self.resistorsFav.filter({e in
                    
                    //return (e.value as! String).lowercased().contains(text.lowercased())
                    return (e.value).lowercased().starts(with: text.lowercased())
                })
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
                self.favoritesTableView.reloadData()
            }
            
            

            
        }))
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: UIAlertAction.Style.default,
                                      handler: {(_: UIAlertAction!) in
                                        
                                        self.favoritesTableView.allowsSelection = false;
                                        for i in 0...self.filteredResistors.count{
                                            self.favoritesTableView.deselectRow(at: IndexPath(row: i, section: 0), animated: true)
                                        }
        }))
        labelInstructionsToDelete.isHidden = true
        self.present(alert, animated: true, completion: nil)
    }

}
