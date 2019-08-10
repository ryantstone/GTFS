//
//  DateHelpers.swift
//  GTFS
//
//  Created by Ryan Stone on 8/2/19.
//

import Foundation

struct DateHelpers {
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter
    }()
}
