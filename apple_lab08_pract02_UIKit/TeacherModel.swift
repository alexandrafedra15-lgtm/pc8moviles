//
//  TeacherModel.swift
//  apple_lab08_pract02_UIKit
//

import UIKit

struct Teacher {
    let name: String
    let department: String
    let initials: String
    let color: UIColor
    
    static func sampleTeachers() -> [Teacher] {
        return [
            Teacher(
                name: "John Doe",
                department: "Mathematics",
                initials: "JD",
                color: UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1.0) // Blue #007AFF
            ),
            Teacher(
                name: "Anna Smith",
                department: "Physics",
                initials: "AS",
                color: UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1.0) // Orange #FF9500
            ),
            Teacher(
                name: "Robert Johnson",
                department: "Chemistry",
                initials: "RJ",
                color: UIColor(red: 52/255, green: 199/255, blue: 89/255, alpha: 1.0) // Green #34C759
            ),
            Teacher(
                name: "Maria Brown",
                department: "Biology",
                initials: "MB",
                color: UIColor(red: 88/255, green: 86/255, blue: 214/255, alpha: 1.0) // Purple #5856D6
            ),
            Teacher(
                name: "David Wilson",
                department: "History",
                initials: "DW",
                color: UIColor(red: 255/255, green: 45/255, blue: 85/255, alpha: 1.0) // Pink #FF2D55
            ),
            Teacher(
                name: "Emily Garcia",
                department: "English",
                initials: "EG",
                color: UIColor(red: 175/255, green: 82/255, blue: 222/255, alpha: 1.0) // Violet #AF52DE
            ),
            Teacher(
                name: "Thomas Martinez",
                department: "Computer Science",
                initials: "TM",
                color: UIColor(red: 0/255, green: 199/255, blue: 190/255, alpha: 1.0) // Teal #00C7BE
            ),
            Teacher(
                name: "Laura Taylor",
                department: "Art",
                initials: "LT",
                color: UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1.0) // Orange #FF9500
            )
        ]
    }
}
