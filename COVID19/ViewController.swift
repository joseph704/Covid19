//
//  ViewController.swift
//  COVID19
//
//  Created by Joseph Cha on 2022/04/13.
//

import UIKit
import Charts

class ViewController: UIViewController {
    @IBOutlet weak var totalCaseLabel: UILabel!
    @IBOutlet weak var newCaseLabel: UILabel!
    @IBOutlet weak var pieChartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}