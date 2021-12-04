//
//  ViewController.swift
//  APIProgect
//
//  Created by لمى فرحان on 27/04/1443 AH.
//

import UIKit

class ViewController: UIViewController{
    var result = Welcome()
    var tafsir : [Tafsir] = []
    let session = URLSession.shared
        override func viewDidLoad() {
            fetchData()
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
    func fetchData(){
    var ulrComponents = URLComponents()
        ulrComponents.scheme = "https"
        ulrComponents.host = "api.quran.com"
        ulrComponents.path = "/api/v4/resources/tafsirs"
let language = URLQueryItem(name:"language" , value: "en")
        ulrComponents.queryItems = [language]
        let request = URLRequest(url:ulrComponents.url!)
        print(request)
      session.dataTask(with: request) { (data, res, err) in
            do {
                let jsonDecoder = JSONDecoder()
                let decodedRes = try jsonDecoder.decode(Welcome.self, from: data!)
                self.result = decodedRes
                print(decodedRes.tafsirs)
            } catch {
                print(err?.localizedDescription)
            }
        }.resume()
    }
}
