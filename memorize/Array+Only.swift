//
//  Array+Only.swift
//  memorize
//
//  Created by choijisoo on 2021/04/12.
//

import Foundation

extension Array {
    var only:Element?{
        count==1 ? first:nil
    }
}
