

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var model = [Model]()
    var filteredModel = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        Alamofire.request("https://restcountries.eu/rest/v1/all")
            .responseData { response in
                switch response.result {
                case .success(let value):
                    if let json = try? JSONSerialization.jsonObject(with: value,
                                                options: JSONSerialization.ReadingOptions.allowFragments),
                    let array = json as? [[String: Any]]{
                        
                        
                        for i in array {
                            let name = i["name"] as? String
                            let capital = i["capital"] as? String
                            let population = i["population"] as? Int
                            let area = i["area"] as? Int
                            let language = i["languages"] as? [String]
                            
                            let country = Model(name: name, capital: capital, population: population, area: area, language: language)
                            self.model.append(country)
                        }
                    }
                    self.filteredModel.append(contentsOf: self.model)
                    self.tableView.reloadData()
                    break
                case .failure:
                    print("error")
                    
                }
        }
        
    }
    
    func filter (text: String){
        model = filteredModel.filter({ (item) -> Bool in
            return item.name.contains(text) || text==""
            
        })
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filter(text: searchText)
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.name.text = model[(indexPath as NSIndexPath).row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       performSegue(withIdentifier: "segue", sender: (indexPath as NSIndexPath).row)
     
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue"{
        let controller2 = segue.destination as! ViewController2
            
            let index = sender as! Int
                
            controller2.xname = model[index].name
            controller2.xcapital = model[index].capital
            controller2.xpopulation = model[index].population
            controller2.xarea = model[index].area
            controller2.xlanguage = model[index].language            
                
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

