//
//  Employee.swift
//  EmployeeDirectory
//
//  Created by Yaz Burrell on 9/7/22.
//

import Foundation

struct Employees: Codable {
    let employees: [Employee]
}

struct Employee: Codable {
    let uuid: String
    let full_name: String
    let phone_number: String
    let email_address: String
    let biography: String
    let photo_url_small: String
    let photo_url_large: String
    let team: String
    let employee_type: String
}
