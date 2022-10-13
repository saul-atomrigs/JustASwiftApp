//
//  ViewController.swift
//  JustASwiftApp
//
//  Created by Saul Lee on 2022/09/28.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    var isZoom = false
    var imgOn: UIImage?
    var imgOff: UIImage?
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    @IBOutlet var lblHello: UILabel!
    @IBOutlet var txtName: UITextField!
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "img_on.png")
        imgOff = UIImage(named: "img_off.png")
        
        imgView.image = imgOn
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
        loadWebPage("http://2sam.net")
    }


    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        
        if (isZoom) {
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            btnResize.setTitle("확대", for: .normal)
        } else {
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            btnResize.setTitle("축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imgView.image = imgOn
        } else {
            imgView.image = imgOff
        }
    }
    @IBAction func btnSend(_ sender: UIButton) {
        lblHello.text = "Hello, " + txtName.text!
    }
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime() {
//        lblCurrentTime.text = String(count)
//        count = count + 1
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
    }
    @IBAction func btnGoSite1(_ sender: UIButton) {
    }
    @IBAction func btnGoSite2(_ sender: UIButton) {
    }
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
    }
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
    }
}

