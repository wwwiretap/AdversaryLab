//
//  Constants.swift
//  AdversaryLabSwift
//
//  Created by Adelita Schule on 1/23/18.
//  Copyright © 2018 Operator Foundation. All rights reserved.
//

import Foundation
import CreateML

let packetStatsKey = "Packet:Stats"
let newConnectionsChannel = "New:Connections:Channel"

/// Allowed Connections
let allowedConnectionsKey = "Allowed:Connections"
let allowedIncomingKey = "Allowed:Incoming:Packets"
let allowedOutgoingKey = "Allowed:Outgoing:Packets"

let allowedIncomingDatesKey = "Allowed:Incoming:Dates"
let allowedOutgoingDatesKey = "Allowed:Outgoing:Dates"
let allowedConnectionsTimeDiffKey = "Allowed:Connections:TimeDifference"

let allowedIncomingLengthsKey = "Allowed:Incoming:Lengths"
let allowedOutgoingLengthsKey = "Allowed:Outgoing:Lengths"

let allowedIncomingOffsetSequencesKey = "Allowed:Incoming:OffsetSequence"
let allowedOutgoingOffsetSequencesKey = "Allowed:Outgoing:OffsetSequence"
let allowedIncomingFloatingSequencesKey = "Allowed:Incoming:FloatingSequence"
let allowedOutgoingFloatingSequencesKey = "Allowed:Outgoing:FloatingSequence"

let allowedIncomingEntropyKey = "Allowed:Incoming:Entropy"
let allowedOutgoingEntropyKey = "Allowed:Outgoing:Entropy"
let allowedIncomingEntropyBinsKey = "Allowed:Incoming:EntropyBins"
let allowedOutgoingEntropyBinsKey = "Allowed:Outgoing:EntropyBins"

let allowedPacketsSeenKey = "Allowed:Connections:Seen"
let allowedPacketsAnalyzedKey = "Allowed:Connections:Analyzed"

/// Blocked Connections
let blockedConnectionsKey = "Blocked:Connections"
let blockedIncomingKey = "Blocked:Incoming:Packets"
let blockedOutgoingKey = "Blocked:Outgoing:Packets"

let blockedIncomingDatesKey = "Blocked:Incoming:Dates"
let blockedOutgoingDatesKey = "Blocked:Outgoing:Dates"
let blockedConnectionsTimeDiffKey = "Blocked:Connections:TimeDifference"

let blockedIncomingLengthsKey = "Blocked:Incoming:Lengths"
let blockedOutgoingLengthsKey = "Blocked:Outgoing:Lengths"

let blockedIncomingOffsetSequencesKey = "Blocked:Incoming:OffsetSequence"
let blockedOutgoingOffsetSequencesKey = "Blocked:Outgoing:OffsetSequence"
let blockedIncomingFloatingSequencesKey = "Blocked:Incoming:FloatingSequence"
let blockedOutgoingFloatingSequencesKey = "Blocked:Outgoing:FloatingSequence"

let blockedIncomingEntropyKey = "Blocked:Incoming:Entropy"
let blockedOutgoingEntropyKey = "Blocked:Outgoing:Entropy"
let blockedIncomingEntropyBinsKey = "Blocked:Incoming:EntropyBins"
let blockedOutgoingEntropyBinsKey = "Blocked:Outgoing:EntropyBins"

let blockedPacketsSeenKey = "Blocked:Connections:Seen"
let blockedPacketsAnalyzedKey = "Blocked:Connections:Analyzed"

/// Scores

// Lengths
let packetLengthsResultsKey = "PacketLengths:Results"
let incomingRequiredLengthKey = "IncomingRequiredLength"
let incomingForbiddenLengthKey = "IncomingForbiddenLength"
let incomingLengthsTAccKey = "IncomingLengthsTrainingAccuracy"
let incomingLengthsVAccKey = "IncomingValidationAccuracy"
let incomingLengthsEAccKey = "IncomingEvaluationAccuracy"

let outgoingRequiredLengthKey = "OutgoingRequiredLength"
let outgoingForbiddenLengthKey = "OutgoingForbiddenLength"
let outgoingLengthsTAccKey = "OutgoingLengthsTrainingAccuracy"
let outgoingLengthsVAccKey = "OutgoingLengthsValidationAccuracy"
let outgoingLengthsEAccKey = "OutgoingLengthsEvaluationAccuracy"

// Float Sequences
let incomingRequiredFloatSequencesKey = "Incoming:Required:FloatSequence"
let incomingForbiddenFloatSequencesKey = "Incoming:Forbidden:FloatSequence"
let incomingFloatSequenceScoresKey = "Incoming:FloatSequence:Scores"
let outgoingRequiredFloatSequencesKey = "Outgoing:Required:FloatSequence"
let outgoingForbiddenFloatSequencesKey = "Outgoing:Forbidden:FloatSequence"
let outgoingFloatSequenceScoresKey = "Outgoing:FloatSequence:Scores"

// Offset Sequences
let requiredOffsetSequenceKey = "Incoming:Required:OffsetSequence"
let requiredOffsetByteCountKey = "Incoming:Required:OffsetByteCount"
let requiredOffsetIndexKey = "Incoming:Required:OffsetIndex"
let requiredOffsetAccuracyKey = "Incoming:Required:OffsetAccuracy"

let forbiddenOffsetSequenceKey = "Incoming:Forbidden:OffsetSequence"
let forbiddenOffsetByteCountKey = "Incoming:Forbidden:OffsetByteCount"
let forbiddenOffsetIndexKey = "Incoming:Forbidden:OffsetIndex"
let forbiddenOffsetAccuracyKey = "Incoming:Forbidden:OffsetAccuracy"

let incomingForbiddenOffsetKey = "Incoming:Forbidden:Offset"
let incomingRequiredOffsetKey = "Incoming:Required:Offset"
let outgoingRequiredOffsetKey = "Outgoing:Required:Offset"
let outgoingForbiddenOffsetKey = "Outgoing:Forbidden:Offset"

// Entropy
let entropyResultsKey = "Entropy:Results"

let incomingRequiredEntropyKey = "IncomingRequiredEntropy"
let incomingForbiddenEntropyKey = "IncomingForbiddenEntropy"
let incomingEntropyTAccKey = "IncomingEntropyTrainingAccuracy"
let incomingEntropyVAccKey = "IncomingEntropyValidationAccuracy"
let incomingEntropyEAccKey = "IncomingEntropyEvaluationAccuracy"

let outgoingRequiredEntropyKey = "OutgoingRequiredEntropy"
let outgoingForbiddenEntropyKey = "OutgoingForbiddenEntropy"
let outgoingEntropyTAccKey = "OutgoingEntropyTrainingAccuracy"
let outgoingEntropyVAccKey = "OutgoingEntropyValidationAccuracy"
let outgoingEntropyEAccKey = "OutgoingEntropyEvaluationAccuracy"

// Timing
let timeDifferenceResultsKey = "TimeDifference:Results"
let requiredTimeDiffKey = "RequiredTimeDifference"
let forbiddenTimeDiffKey = "ForbiddenTimeDifference"
let timeDiffTAccKey = "TimeDifferenceTAccuracy"
let timeDiffVAccKey = "TimeDifferenceVAccuracy"
let timeDiffEAccKey = "TimeDifferenceEAccuracy"

// TLS
let allowedTlsCommonNameKey = "Allowed:Outgoing:TLS:CommonName"
let blockedTlsCommonNameKey = "Blocked:Outgoing:TLS:CommonName"

let tlsResultsKey = "TLS:Results"
let requiredTLSKey = "RequiredTLS"
let forbiddenTLSKey = "ForbiddenTLS"
let tlsAccuracyKey = "TLS:Accuracy"
let tlsTAccKey = "TLSTrainingAccuracy"
let tlsVAccKey = "TLSValidationAccuracy"
let tlsEAccKey = "TLSEvaluationAccuracy"
//let allowedTlsScoreKey = "Allowed:Outgoing:TLS:Score"
//let blockedTlsScoreKey = "Blocked:Outgoing:TLS:Score"

///
let newConnectionMessage = "NewConnectionAdded"

// Human Reaable Strings
let analyzingAllowedConnectionsString = "Analyzing allowed connection"
let analyzingBlockedConnectionString = "Analyzing blocked connection"
let scoringPacketLengthsString = "Scoring packet lengths"
let scoringPacketTimingString = "Scoring packet timing"
let scoringEntropyString = "Scoring entropy"
let scoringTLSNamesString = "Scoring TLS names"
let scoringOffsetsString = "Scoring offset sequences"
let scoringFloatSequencesString = "Scoring float sequences"

//
let analysisQueue = DispatchQueue(label: "AnalysisQueue")
let testQueue = DispatchQueue(label: "AdversaryTestQueue")

let entropyRegressorMetadata = MLModelMetadata(author: "Canary", shortDescription: "Predicts Required/Forbidden Entropy for a Connection", version: "1.0")
let entropyClassifierMetadata = MLModelMetadata(author: "Canary", shortDescription: "Predicts whether a given entropy is from an allowed or blocked connection.", version: "1.0")
let timingRegressorMetadata = MLModelMetadata(author: "Canary", shortDescription: "Predicts Required/Forbidden Entropy for a Connection", version: "1.0")
let timingClassifierMetadata = MLModelMetadata(author: "Canary", shortDescription: "Predicts whether a timing is from an allowed or blocked connection.", version: "1.0")
let lengthsRegressorMetadata = MLModelMetadata(author: "Canary", shortDescription: "Predicts Required/Forbidden Entropy for a Connection", version: "1.0")
let lengthsClassifierMetadata = MLModelMetadata(author: "Canary", shortDescription: "Predicts whether a packet length is from an allowed or blocked connection.", version: "1.0")
let tlsRegressorMetadata = MLModelMetadata(author: "Canary", shortDescription: "Predicts Required/Forbidden tls name for a Connection", version: "1.0")
let tlsClassifierMetadata = MLModelMetadata(author: "Canary", shortDescription: "Predicts whether a tls name is from an allowed or blocked connection.", version: "1.0")

extension Notification.Name
{
    static let updateDBFilename = Notification.Name("UpdateDatabaseFilename")
    static let updateStats = Notification.Name("UpdatedConnectionStats")
    static let updateProgressIndicator = Notification.Name("UpdatedProgress")
}

enum KnownProtocolType {
    case TLS12 // TLS 1.2
}

enum PacketLengthError: Error
{
    case noOutPacketForConnection(String)
    case noInPacketForConnection(String)
    case unableToIncremementScore(packetSize: Int, connectionID: String)
}

enum PacketTimingError: Error
{
    case noOutPacketDateForConnection(String)
    case noInPacketDateForConnection(String)
    case unableToAddTimeDifference(timeDifference: TimeInterval, connectionID: String)
}

enum ClassificationLabel: String
{
    case allowed = "allowed"
    case blocked = "blocked"
}

enum ColumnLabel: String
{
    case length = "length"
    case entropy = "entropy"
    case timeDifference = "timeDifference"
    case tlsNames = "tlsNames"
    case classification = "classification"
    case direction = "direction"
}
