//
//  NetworkService.swift
//  EmployeeDirectory
//
//  Created by Yaz Burrell on 9/9/22.
//

import Foundation
import UIKit


class NetworkService {
    static var shared = NetworkService()
    
    var employees = [Employee]()
    
     func fetchJSON() {
        let urlString = "https://s3.amazonaws.com/sq-mobile-interview/employees.json"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                
            }
        }
    }
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonEmployees = try? decoder.decode(Employees.self, from: json) {
            employees = jsonEmployees.employees
            
        }
    }

}
