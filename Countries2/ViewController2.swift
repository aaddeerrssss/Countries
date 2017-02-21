

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var capital: UILabel!
    @IBOutlet weak var population: UILabel!
    @IBOutlet weak var area: UILabel!
    @IBOutlet weak var language: UILabel!
    
    @IBOutlet weak var tx: UILabel!
    
    
    var xname = ""
    var xcapital = ""
    var xpopulation = 0
    var xarea = 0
    var ylanguage = ""
    var xlanguage = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in xlanguage{
            ylanguage = ylanguage + " \(i)"
        }
        name.text = xname
        capital.text = xcapital
        population.text = "\(xpopulation)"
        area.text = "\(xarea)"
        language.text = ylanguage
        
        
    }

    @IBAction func back(_ sender: UIButton) {
        let _ = self.navigationController?.popViewController(animated: true)
    }
  
}
