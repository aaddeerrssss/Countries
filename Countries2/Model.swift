
import Foundation


class Model {
   fileprivate var _name: String?
   fileprivate var _capital: String?
   fileprivate var _population: Int?
   fileprivate var _area: Int?
    fileprivate var _language: [String]?
    
    
    var name: String{
        get {
            guard let name = _name else {
                return "usaxelo"
            }
            return name
        }
        set{
            _name = newValue
        }
    }
    
    var capital: String{
        get {
            guard let capital = _capital else{
                return "usaxelo"
            }

            return capital
        }
        set{
            _capital = newValue
        }
    }
    
    var population: Int{
        get {
            guard let population = _population else{
                return 0
            }

            return population
        }
        set{
            _population = newValue
        }
    }

    var area: Int{
        get {
            guard let area = _area else{
                return 0
            }

            return area
        }
        set{
            _area = newValue
        }
    }
    
    var language: [String]{
        get{
            guard let language = _language else{
                return []
            }
            return language
        }
        set{
            _language = newValue
        }
    }


    init(name: String?, capital: String?, population: Int?, area: Int?, language: [String]?){
       self._name = name
       self._capital = capital
       self._population = population
       self._area = area
       self._language = language
  }
}

