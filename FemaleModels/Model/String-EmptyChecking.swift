//
//  String-EmptyChecking.swift
//  FemaleModels
//
//  Created by Lem Euro on 02.08.2022.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
