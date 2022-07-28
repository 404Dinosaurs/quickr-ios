//
//  ClassicBatchBarcodeScanner.swift
//  SBBarcodeSDKDemo
//
//  Created by Yevgeniy Knizhnik on 28.11.19.
//  Copyright © 2019 doo GmbH. All rights reserved.
//

import UIKit
import ScanbotBarcodeScannerSDK

class ClassicBatchBarcodeScannerTableCell: UITableViewCell {
    @IBOutlet var barcodeImageView: UIImageView!
    @IBOutlet var barcodeLabel: UILabel!
    @IBOutlet var barcodeTypeLabel: UILabel!
}

class ClassicBatchBarcodeScanner: UIViewController {
    @IBOutlet var cameraContainer: UIView!
    @IBOutlet var tableView: UITableView!
    
    private var detectedBarcodes: [SBSDKBarcodeScannerResult] = []
    private var detectedItems: [UpcItem] = []
    private var scannerController: SBSDKBarcodeScannerViewController!
    private var isScrolling: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scannerController = SBSDKBarcodeScannerViewController(parentViewController: self,
                                                                   parentView: self.cameraContainer)
        
        let energyConfiguration = self.scannerController.energyConfiguration
        energyConfiguration.detectionRate = 10
        
        self.scannerController.energyConfiguration = energyConfiguration
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.scannerController.acceptedBarcodeTypes = Array(SharedParameters.acceptedBarcodeTypes)
    }
}

extension ClassicBatchBarcodeScanner: SBSDKBarcodeScannerViewControllerDelegate {
    
    func barcodeScannerControllerShouldDetectBarcodes(_ controller: SBSDKBarcodeScannerViewController) -> Bool {
        return !self.isScrolling
    }
    

    func barcodeScannerController(_ controller: SBSDKBarcodeScannerViewController, 
                                  didDetectBarcodes codes: [SBSDKBarcodeScannerResult], 
                                  on image: UIImage) {
        
        if codes.count == 0 {
            return
        }
        
        for code in codes.reversed() {
            if !self.detectedBarcodes.contains(code) {
                let cut = String(code.rawTextString.dropFirst(4).dropLast())
                print(cut)
                let url = URL(string: "http://mrmerchanttest.eastus2.cloudapp.azure.com:5001/flms/cart/stores/1/items/" + cut)!
                print(url)
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data {
                        let item: UpcItem = try! JSONDecoder().decode(UpcItem.self, from: data)
                        self.detectedBarcodes.insert(code, at: 0)
                        self.detectedItems.insert(item, at: 0)

                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }

                        // send POST request to url and get response data
                        let url = URL(string: "http://mrmerchanttest.eastus2.cloudapp.azure.com:5001/flms/cart/stores/1/items/\(cut)")!
                        var request = URLRequest(url: url)
                        request.httpMethod = "POST"
                        let task = URLSession.shared.dataTask(with: request) { data, response, error in
                            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                                print("error=\(error)")
                                return
                            }
                            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                                print("response = \(response)")
                            }
                            let responseString = String(data: data, encoding: .utf8)
                            print("responseString = \(responseString)")
                        }
                        task.resume()




                        // let JSON = """
                        // {"upc":"1068470","description":"18.21 Bitters","price":899}
                        // """

                        // let jsonData = JSON.data(using: .utf8)!
                        // let item: UpcItem = try! JSONDecoder().decode(UpcItem.self, from: jsonData)
                        // print(item.upc)
                        // var request = URLRequest(url: url)
                            
                    }
                    self.tableView.reloadData()
                }
                task.resume()
            }
        }
    }
}

extension ClassicBatchBarcodeScanner: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.detectedBarcodes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "barcodeCell") as! ClassicBatchBarcodeScannerTableCell
        let code = self.detectedBarcodes[indexPath.row]
        let item = self.detectedItems[indexPath.row]
        
        //Begin hijacking
        
        

    //    let JSON = """
    //    {"upc":"1068470","description":"18.21 Bitters","price":899}
    //    """

    //    let jsonData = JSON.data(using: .utf8)!
    //    let item: UpcItem = try! JSONDecoder().decode(UpcItem.self, from: jsonData)
    //    print(item.upc)
    //    var request = URLRequest(url: url)
        
        cell.barcodeImageView.image = code.barcodeImage
        cell.barcodeLabel.text = item.upc
        cell.barcodeTypeLabel.text = item.description
        
        return cell
    }
    
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.isScrolling = true
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        self.isScrolling = false
    }
    
}

struct UpcItem: Decodable {
    let upc: String
    let description: String
    let price: Float
}
//
//
//@available(iOS 15.0.0, *)
//func fetch(cut: String) async throws -> UpcItem {
//    guard let url = URL(string: "http://mrmerchanttest.eastus2.cloudapp.azure.com:5001/flms/cart/stores/1/items/" + cut) else {
//        print("error")
//    }
//    let data = try await URLSession.shared.data(from: url)
//    let toRet = JSONDecoder().decode(UpcItem.self, from:)
//    return toRet
//}
