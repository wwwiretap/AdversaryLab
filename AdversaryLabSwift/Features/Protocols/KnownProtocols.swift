//
//  Sequences.swift
//  AdversaryLabSwift
//
//  Created by Adelita Schule on 2/8/18.
//  Copyright © 2018 Operator Foundation. All rights reserved.
//

import Foundation
import Auburn

func detectKnownProtocol(connection: ObservedConnection) -> KnownProtocolType? {
    if isTls12(forConnection: connection) {
        return KnownProtocolType.TLS12
    } else {
        return nil
    }
}

func processKnownProtocol(_ prot: KnownProtocolType, _ connection: ObservedConnection) {
    switch prot {
        case .TLS12:
            processTls12(connection)
    }
}
