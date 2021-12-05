//
//  ViewController.swift
//  APIProgect
//
//  Created by لمى فرحان on 27/04/1443 AH.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var showTeanslation: UITextView!
    @IBOutlet weak var showResult: UITextView!
    var result = Welcome()
    var tafsir : [Tafsir] = []
    var trainsltion : [Translation] = []
    let session = URLSession.shared
        override func viewDidLoad() {
            fetchData()
            gitData()
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
    func fetchData(){
    var tafser1 = URLComponents()
        tafser1.scheme = "https"
        tafser1.host = "api.quran.com"
        tafser1.path = "/api/v4/resources/tafsirs"
let language = URLQueryItem(name:"language" , value: "en")
        tafser1.queryItems = [language]
        let request = URLRequest(url:tafser1.url!)
        print(request)
      session.dataTask(with: request) { (data, res, err) in
            do {
                let jsonDecoder = JSONDecoder()
                let decodedRes = try jsonDecoder.decode(Welcome.self, from: data!)
                self.result = decodedRes
                print(decodedRes.tafsirs)
                DispatchQueue.main.async {
                    self.showResult.text = decodedRes.tafsirs.description
                }
//                decodedRes.tafsirs
            } catch {
                print(err?.localizedDescription)
            }
        }.resume()
    }
//https://api.quran.com/api/v4/resources/translations

    func gitData(){
    var tafser1 = URLComponents()
        tafser1.scheme = "https"
        tafser1.host = "api.quran.com"
        tafser1.path = "/api/v4/resources/translations"
let language = URLQueryItem(name: "language", value: "en")
        tafser1.queryItems = [language]
        let request = URLRequest(url:tafser1.url!)
        print(request)
      session.dataTask(with: request) { (data, res, err) in
            do {
                let jsonDecoder = JSONDecoder()
                
                let decodedRes = try jsonDecoder.decode(FetchTrans.self, from: data!)
                DispatchQueue.main.async {
                    self.showTeanslation.text = decodedRes.translations?.description
                }
            
//                print(decodedRes)
//                decodedRes.tafsirs
                
                for t in decodedRes.translations!{

                    self.trainsltion.append(t)
//                    print("name: \(t.name) author: \(t.authorName)")
                }
                print(self.trainsltion[0].name)
            } catch {
                print(err?.localizedDescription)
            }
        }.resume()
    }
    
}

