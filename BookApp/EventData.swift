//
//  EventData.swift
//  BookApp
//
//  Created by Shin on 11/01/2019.
//  Copyright © 2019 hybrid. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class EventData {
    var bookTitle : String?
    var bookAuthor : String?
    var place : String?
    var fee : String?
    var bookImage : UIImage?
    var entry : Int?
    
    //MemoMO 인스턴스를 구별하기 위한 변수
    var objectID : NSManagedObjectID?
}
