//
//  ViewController.swift
//  COVID19
//
//  Created by Joseph Cha on 2022/04/13.
//

import UIKit
import Alamofire
import Charts

class ViewController: UIViewController {
    @IBOutlet weak var totalCaseLabel: UILabel!
    @IBOutlet weak var newCaseLabel: UILabel!
    @IBOutlet weak var pieChartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 순환 참조 방지
        self.fetchCovidOverView(completionHandler: { [weak self] result in
            guard self != nil else { return }
            switch result {
            case let .success(value):
                debugPrint("success \(value)")
            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
    }
    
    func fetchCovidOverView (
        completionHandler: @escaping (Result<CityCovidOverivew, Error>) -> Void
    ) {
        let url = "https://api.corona-19.kr/korea/country/new/"
        let param = [
            "serviceKey": "RgZpzPyid1DOoI7B6L5NXf94UGSqwu2cx"
        ]
        
        AF.request(url, method: .get, parameters: param)
            .responseData(completionHandler: { response in
                switch response.result {
                case let .success(data):
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(CityCovidOverivew.self, from: data)
                        completionHandler(.success(result))
                    } catch {
                        completionHandler(.failure(error))
                    }
                case let .failure(error):
                    completionHandler(.failure(error))
                }
            })
    }
}
