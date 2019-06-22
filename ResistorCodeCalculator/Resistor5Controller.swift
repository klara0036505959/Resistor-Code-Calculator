//
//  Resistor5Controller.swift
//  ResistorCodeCalculator
//
//  Created by Five Admin on 6/21/19.
//  Copyright © 2019 Five Admin. All rights reserved.
//

import UIKit

class Resistor5Controller: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITabBarControllerDelegate{
    @IBOutlet weak var resistanceLabel5: UILabel!
    @IBOutlet weak var valueLabel5: UILabel!
    @IBOutlet weak var imageView5: UIImageView!
    @IBOutlet weak var collectionViewColors5: UICollectionView!
    
    @IBAction func saveToFavs5(_ sender: Any) {
        
        UIView.animate(withDuration: 0.25, delay: 0.0, animations: {
            self.buttonSave5.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        }) { _ in
        }
        UIView.animate(withDuration: 0.5, delay: 0.25, animations: {
            self.buttonSave5.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }) { _ in
        }
        
        let value: String = valueLabel5.text!
        let color1: UIColor = colorBand51.backgroundColor!
        let color2: UIColor = colorBand52.backgroundColor!
        let color3: UIColor = colorBand53.backgroundColor!
        let color4: UIColor = colorBand54.backgroundColor!
        let color5: UIColor = colorBand55.backgroundColor!
        let color6: UIColor = colorBand56.backgroundColor!
        CDManager().createData(value: value, color1: color1, color2: color2, color3: color3, color4: color4, color5: color5, color6: color6)
        
    }
    
    @IBOutlet weak var buttonSave5: UIButton!
    @IBOutlet weak var colorBand51: UIView!
    @IBOutlet weak var colorBand52: UIView!
    @IBOutlet weak var colorBand53: UIView!
    @IBOutlet weak var colorBand54: UIView!
    @IBOutlet weak var colorBand55: UIView!
    @IBOutlet weak var colorBand56: UIView!
    
    
    
    var items: Array<Double> = []
    var digitBand: Array<Double> = []
    var multiplierBand: Array<Double> = []
    var toleranceBand: Array<Double> = []
    var tempCoefBand: Array<Double> = []
    var colors: Array<UIColor> = []
    var currentSelection: Array<Double> = [0,0,0,0,0]
    var colorBandViews: Array<UIView> = []
    var selectedTab: Int = 0
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "uiCollectionViewCell", for: indexPath as IndexPath) as! uiCollectionViewCell
        
        let dividedBySix = indexPath.row / 5
        
        /*
        if Int(indexPath.row % 6) == 5{ //ako su 4 ili 5 traka pa ne smije biti temp koef
            cell.backgroundColor = Color.WHITE.color
            cell.labelColorCell.text=""
            cell.alpha = 0.0
        }
        */
        if items[indexPath.row] == -1 {
            cell.backgroundColor = Color.WHITE.color
            cell.labelColorCell.text=""
            cell.alpha = 0.0
        }
            
        else{
            cell.backgroundColor = colors[Int(indexPath.row / 5)]
            cell.labelColorCell.text = String(items[indexPath.row])
            cell.labelColorCell.textColor = Color.BLACK.color
            
            if (dividedBySix == 0 || dividedBySix == 10){
                cell.labelColorCell.textColor = Color.WHITE.color
            }
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedFeature: Int = indexPath.row % 5
        currentSelection[selectedFeature] = Double(items[indexPath.row])
        
        let selectedBandView: UIView = colorBandViews[selectedFeature]
        selectedBandView.backgroundColor = colors[Int(indexPath.row / 5)]
        var value: Double = currentSelection[0]*100+currentSelection[1]*10+currentSelection[2]
        
        
        value = (value*currentSelection[3])
        let tolerance: Double = currentSelection[4]
        //let tempCoef: Double = currentSelection[5]
        
        //print("You selected cell #\(indexPath.item)!")
        let display:String = String(format:"%.2f",value) + "Ω ± " + String(tolerance) + "%" 
        self.valueLabel5.text = display
        
        
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBarIndex = tabBarController.selectedIndex
        selectedTab = tabBarIndex
        print(tabBarIndex)
        
    }
    
    
    
    func setupCollection(){
        
        digitBand = [0,1,2,3,4,5,6,7,8,9, -1, -1]
        multiplierBand = [ 1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, -1, -1, 0.01, 0.1]
        toleranceBand = [-1, 1, 2, -1, -1, 0.5, 0.25, 0.1, 0.05, -1, 10, 5]
        //tempCoefBand = [ -1, 100, 50, 15, 25, -1, -1, -1, -1, -1, -1, -1]
        colors = [Color.BLACK.color, Color.BROWN.color , Color.RED.color, Color.ORANGE.color, Color.YELLOW.color
            , Color.GREEN.color, Color.BLUE.color, Color.PURPLE.color, Color.GREY.color, Color.WHITE.color, Color.SILVER.color, Color.GOLD.color]
        
        let listOfBands = [digitBand, digitBand, digitBand, multiplierBand, toleranceBand]
        colorBandViews = [colorBand51, colorBand52, colorBand53, colorBand54, colorBand55, colorBand56]
        
        for i in 0...11{
            for j in 0...4{
                let elem: Double = (listOfBands[j])[i]
                items.append(elem)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let columnLayout = FlowLayoutCollection(
            cellsPerRow: 5,
            minimumInteritemSpacing: 5,
            minimumLineSpacing: 5,
            sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        )
        
        self.collectionViewColors5?.collectionViewLayout = columnLayout
        
        
        setupCollection()
        
        self.collectionViewColors5.register(UINib(nibName: "uiCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "uiCollectionViewCell")
        
        self.tabBarController?.delegate = self
        
        self.collectionViewColors5.delegate = self
        self.collectionViewColors5.dataSource = self
        
        
    }
    
    
    
    
    
}

