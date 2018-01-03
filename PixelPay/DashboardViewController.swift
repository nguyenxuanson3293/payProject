//
//  SecondViewController.swift
//  PixelPay
//
//  Created by ClickStaff on 12/25/17.
//  Copyright © 2017 ClickStaff. All rights reserved.
//

import UIKit
import Charts

class SecondViewController: DemoBaseViewController {

    @IBOutlet weak var btnMenu: UIBarButtonItem!
    @IBOutlet var chartView2: LineChartView!
    @IBOutlet var buyLabel: UILabel!
    @IBOutlet var sellLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnMenu.target = self.revealViewController()
        btnMenu.action = Selector("revealToggle:")
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        
        buyLabel.layer.cornerRadius = 2
        buyLabel.layer.masksToBounds = true
        sellLabel.layer.cornerRadius = 2
        sellLabel.layer.masksToBounds = true
        self.title = "Dashboard"
        self.options = [.toggleValues,
                        .toggleFilled,
                        .toggleCircles,
                        .toggleCubic,
                        .toggleHorizontalCubic,
                        .toggleStepped,
                        .toggleHighlight,
                        .animateX,
                        .animateY,
                        .animateXY,
                        .saveToGallery,
                        .togglePinchZoom,
                        .toggleAutoScaleMinMax,
                        .toggleData]
        
        chartView2.delegate = self
        
        chartView2.chartDescription?.enabled = false
        
        chartView2.dragEnabled = true
        chartView2.setScaleEnabled(true)
        chartView2.pinchZoomEnabled = false
        chartView2.highlightPerDragEnabled = true
        
        chartView2.backgroundColor = UIColor(red: 28/255, green: 33/255, blue: 45/255, alpha: 1)
        
        chartView2.legend.enabled = false
        
        let xAxis = chartView2.xAxis
        xAxis.labelPosition = .topInside
        xAxis.labelFont = .systemFont(ofSize: 10, weight: .light)
        xAxis.labelTextColor = UIColor(red: 28/255, green: 33/255, blue: 45/255, alpha: 1)
        xAxis.drawAxisLineEnabled = false
        xAxis.drawGridLinesEnabled = true
        xAxis.centerAxisLabelsEnabled = true
        xAxis.granularity = 3600
        //        xAxis.valueFormatter = DateValueFormatter()
        
        let leftAxis = chartView2.leftAxis
        leftAxis.labelPosition = .insideChart
        leftAxis.labelFont = .systemFont(ofSize: 12, weight: .light)
        leftAxis.drawGridLinesEnabled = true
        leftAxis.granularityEnabled = true
        leftAxis.axisMinimum = 0
        leftAxis.axisMaximum = 170
        leftAxis.yOffset = -9
        leftAxis.labelTextColor = UIColor(red: 255/255, green: 192/255, blue: 56/255, alpha: 1)
        
        chartView2.rightAxis.enabled = false
        
        chartView2.legend.form = .line
        
        chartView2.animate(xAxisDuration: 2.5)
        
        self.updateChartData()
        
    }
    
    override func updateChartData() {
        if self.shouldHideData {
            chartView2.data = nil
            return
        }
        
        self.setDataCount(100, range: 100)
    }
    
    func setDataCount(_ count: Int, range: UInt32) {
        let now = Date().timeIntervalSince1970
        let hourSeconds: TimeInterval = 3600
        
        let from = now - (Double(count) / 2) * hourSeconds
        let to = now + (Double(count) / 2) * hourSeconds
        
        let values = stride(from: from, to: to, by: hourSeconds).map { (x) -> ChartDataEntry in
            let y = arc4random_uniform(range) + 50
            return ChartDataEntry(x: x, y: Double(y))
        }
        
        let set1 = LineChartDataSet(values: values, label: "DataSet 1")
        set1.axisDependency = .left
        set1.setColor(UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1))
        set1.lineWidth = 1.5
        set1.drawCirclesEnabled = false
        set1.drawValuesEnabled = false
        set1.fillAlpha = 0.26
        set1.fillColor = UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)
        set1.highlightColor = UIColor(red: 244/255, green: 117/255, blue: 117/255, alpha: 1)
        set1.drawCircleHoleEnabled = false
        
        let data = LineChartData(dataSet: set1)
        data.setValueTextColor(.white)
        data.setValueFont(.systemFont(ofSize: 9, weight: .light))
        
        chartView2.data = data
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

