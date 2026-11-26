//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift open source project
//
// Copyright (c) 2024 Apple Inc. and the Swift project authors.
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

/// Bluetooth HCI Errors
///
/// If an HCI Command that should generate a Command Complete event generates an error 
/// then this error shall be reported in the Command Complete event.
///
/// If an HCI Command that sent a Command Status with the error code ‘Success’
/// to the Host before processing may find an error during execution then the error may 
/// be reported in the normal completion command for the original command or in a Command Status event.
///
/// Some HCI Commands may generate errors that need to be reported to the Host, 
/// but there is insufficient information to determine how the command would normally be processed.
/// In this case, two events can be used to indicate this to the Host, the Command Complete event 
/// and Command Status events. Which of the two events is used is implementation-dependent.
@frozen
public enum HCIError: UInt8, Error {
    
    /// Unknown HCI Command
    /// 
    /// The Unknown HCI Command error code indicates that the Controller 
    /// does not understand the HCI Command Packet OpCode that the Host sent. 
    /// The OpCode given might not correspond to any of the OpCodes specified 
    /// in this document, or any vendor-specific OpCodes, or the command may not have been implemented.
    case unknownCommand                     = 0x01
    
    /// Unknown Connection Identifier
    /// 
    /// The Unknown Connection Identifier error code indicates that
    /// a command was sent from the Host that should identify a 
    /// connection, but that connection does not exist.
    case noConnection                       = 0x02
    
    /// Hardware Failure
    /// 
    /// The Hardware Failure error code indicates to the Host that 
    /// something in the Controller has failed in a manner that cannot 
    /// be described with any other error code. 
    /// The meaning implied with this error code is implementation dependent.
    case hardwareFailure                    = 0x03
    
    /// Page Timeout
    /// 
    /// The Page Timeout error code indicates that a page timed out because 
    /// of the Page Timeout configuration parameter. 
    ///
    /// - Note: This error code may occur only with the `.remoteNameRequest` and `.createConnection` commands.
    case pageTimeout                        = 0x04
    
    /// Authentication Failure
    /// 
    /// The Authentication Failure error code indicates that pairing 
    /// or authentication failed due to incorrect results in the pairing 
    /// or authentication procedure. 
    /// This could be due to an incorrect PIN or Link Key.
    case authenticationFailure              = 0x05
    
    /// PIN or Key Missing
    /// 
    /// The PIN or Key Missing error code is used when pairing failed 
    /// because of a missing PIN, or authentication failed because of a missing Key.
    case keyMissing                         = 0x06
    
    /// Memory Capacity Exceeded
    /// 
    /// The Memory Capacity Exceeded error code indicates to the Host that 
    /// the Controller has run out of memory to store new parameters.
    case memoryFull                         = 0x07
    
    /// Connection Timeout
    /// 
    /// The Connection Timeout error code indicates that the 
    /// link supervision timeout has expired for a given connection.
    case connectionTimeout                  = 0x08
    
    /// Connection Limit Exceeded
    /// 
    /// The Connection Limit Exceeded error code indicates that 
    /// an attempt to create another connection failed because 
    /// the Controller is already at its limit of the number of
    /// connections it can support. 
    ///
    /// - Note: The number of connections a device can support is implementation dependent.
    case maxConnections                     = 0x09
    
    /// Synchronous Connection Limit To A Device Exceeded
    /// 
    /// The Synchronous Connection Limit to a Device Exceeded error code 
    /// indicates that the Controller has reached the limit to the number
    /// of synchronous connections that can be achieved to a device. 
    ///
    /// - Note: The number of synchronous connections a device can support is implementation dependent.
    case maxSCOConnections                  = 0x0A
    
    /// ACL Connection Already Exists
    /// 
    /// The ACL Connection Already Exists error code indicates that an 
    /// attempt to create a new ACL Connection to a device when there 
    /// is already a connection to this device.
    case aclConnectionExists                = 0x0B
    
    /// Command Disallowed
    /// 
    /// The Command Disallowed error code indicates that the command requested 
    /// cannot be executed because the Controller is in a state where it cannot 
    /// process this command at this time. 
    ///
    /// - Note: This error shall not be used for command OpCodes where the error code Unknown HCI Command is valid.
    case commandDisallowed                  = 0x0C
    
    /// Connection Rejected due to Limited Resources
    /// 
    /// The Connection Rejected Due To Limited Resources error code 
    /// indicates that an incoming connection was rejected due to limited resources.
    case rejectedLimitedResources           = 0x0D
    
    /// Connection Rejected Due To Security Reasons
    /// 
    /// The Connection Rejected Due To Security Reasons error code 
    /// indicates that a connection was rejected due to security requirements 
    /// not being fulfilled, like authentication or pairing.
    case rejectedSecurity                   = 0x0E
    
    /// Connection Rejected due to Unacceptable `Bluetooth.Address`
    /// 
    /// The Connection Rejected due to Unacceptable Bluetooth Address
    /// error code indicates that a connection was rejected because this
    /// device does not accept the Bluetooth Address (`BD_ADDR`).
    ///
    /// This may be because the device will only accept connections from specific Bluetooth Addresses.
    case rejectedAddress                    = 0x0F
    
    /// Connection Accept Timeout Exceeded
    /// 
    /// The Connection Accept Timeout Exceeded error code indicates that 
    /// the Connection Accept Timeout has been exceeded for this connection attempt.
    case hostTimeout                        = 0x10
    
    /// Unsupported Feature or Parameter Value
    /// 
    /// The Unsupported Feature Or Parameter Value error code indicates that 
    /// a feature or parameter value in the HCI command is not supported. 
    ///
    /// - Note: This error code shall not be used in an LMP PDU.
    case unsupportedFeature                 = 0x11
    
    /// Invalid HCI Command Parameters
    /// 
    /// The Invalid HCI Command Parameters error code indicates that at 
    /// least one of the HCI command parameters is invalid.
    ///
    /// This shall be used when:
    /// - the parameter total length is invalid.
    /// - a command parameter is an invalid type.
    /// - a connection identifier does not match the corresponding event.
    /// - a parameter value shall be even.
    /// - a parameter is outside of the specified range.
    /// - two or more parameter values have inconsistent values.
    /// 
    /// Note: An invalid type can be, for example, when an SCO connection
    /// handle is used where an ACL connection handle is required.
    case invalidParameters                  = 0x012
    
    /// Remote User Terminated Connection
    /// 
    /// The Remote User Terminated Connection error code indicates that 
    /// the user on the remote device terminated the connection.
    case remoteUserEndedConnection          = 0x13
    
    /// Remote Device Terminated Connection due to Low Resources
    /// 
    /// The Remote Device Terminated Connection due to Low Resources 
    /// error code indicates that the remote device terminated 
    /// the connection because of low resources.
    case remoteLowResources                 = 0x14
    
    /// Remote Device Terminated Connection due to Power Off
    /// 
    /// The Remote Device Terminated Connection due to Power Off 
    /// error code indicates that the remote device terminated 
    /// the connection because the device is about to power off.
    case remotePowerOff                     = 0x15
    
    /// Connection Terminated By Local Host
    /// 
    /// The Connection Terminated By Local Host error code 
    /// indicates that the local device terminated the connection.
    case connectionTerminated               = 0x16
    
    /// Repeated Attempts
    /// 
    /// The Repeated Attempts error code indicates that the Controller 
    /// is disallowing an authentication or pairing procedure because 
    /// too little time has elapsed since the last authentication or pairing attempt failed.
    case repeatedAttempts                   = 0x17
    
    /// Pairing Not Allowed
    /// 
    /// The Pairing Not Allowed error code indicates that the device does not allow pairing. 
    /// For example, when a device only allows pairing during a certain time window after some user input allows pairing.
    case pairingNotAllowed                  = 0x18
    
    /// Unknown LMP PDU
    /// 
    /// The Unknown LMP PDU error code indicates that the Controller has received an unknown LMP OpCode.
    case unknownLMPPDU                      = 0x19
    
    /// Unsupported Remote Feature / Unsupported LMP Feature
    /// 
    /// The Unsupported Remote Feature error code indicates that the remote device 
    /// does not support the feature associated with the issued command or LMP PDU.
    case unsupportedRemoteFeature           = 0x1A
    
    /// SCO Offset Rejected
    /// 
    /// The SCO Offset Rejected error code indicates that the offset requested in 
    /// the `LMP_SCO_link_req` PDU has been rejected.
    case scoOffsetRejected                  = 0x1B
    
    /// SCO Interval Rejected
    /// 
    /// The SCO Interval Rejected error code indicates that the interval requested in
    /// the `LMP_SCO_link_req` PDU has been rejected.
    case scoIntervalRejected                = 0x1C
    
    /// SCO Air Mode Rejected
    /// 
    /// The SCO Air Mode Rejected error code indicates that the air mode requested in
    /// the `LMP_SCO_link_req` PDU has been rejected.
    case scoAirModeRejected                 = 0x1D
    
    /// Invalid LMP Parameters
    /// 
    /// The Invalid LMP Parameters error code indicates that some LMP PDU parameters were invalid.
    /// This shall be used when:
    /// - the PDU length is invalid.
    /// - a parameter value shall be even.
    /// - a parameter is outside of the specified range.
    /// - two or more parameters have inconsistent values.
    case invalidLMPParameters               = 0x1E
    
    /// Unspecified Error
    /// 
    /// The Unspecified Error error code indicates that 
    /// no other error code specified is appropriate to use.
    case unspecifiedError                   = 0x1F
    
    /// Unsupported LMP Parameter Value
    /// 
    /// The Unsupported LMP Parameter Value error code indicates 
    /// that an LMP PDU contains at least one parameter value that 
    /// is not supported by the Controller at this time. 
    /// This is normally used after a long negotiation procedure,
    /// for example during an `LMP_hold_req`, `LMP_sniff_req` 
    /// and `LMP_encryption_key_size_req` PDU exchanges.
    case unsupportedLMPParameterValue       = 0x20
    
    /// Role Change Not Allowed
    /// 
    /// The Role Change Not Allowed error code indicates that 
    /// a Controller will not allow a role change at this time.
    case roleChangeNotAllowed               = 0x21
    
    /// LMP Response Timeout / LL Response Timeout
    /// 
    /// The LMP Response Timeout / LL Response Timeout error code
    /// indicates that an LMP transaction failed to respond within 
    /// the LMP response timeout or an LL transaction failed to respond within the LL response timeout.
    case lmpResponseTimeout                 = 0x22
    
    /// LMP Error Transaction Collision
    /// 
    /// The LMP Error Transaction Collision error code indicates 
    /// that an LMP transaction has collided with the same transaction
    /// that is already in progress.
    case lmpErrorTransactionCollision       = 0x23
    
    /// LMP PDU Not Allowed
    /// 
    /// The LMP PDU Not Allowed error code indicates that a Controller 
    /// sent an LMP PDU with an OpCode that was not allowed.
    case lmpPDUNotAllowed                   = 0x24
    
    /// Encryption Mode Not Acceptable
    /// 
    /// The Encryption Mode Not Acceptable error code indicates 
    /// that the requested encryption mode is not acceptable at this time.
    case encryptionModeNotAcceptable        = 0x25
    
    /// Link Key cannot be Changed
    /// 
    /// The Link Key cannot be Changed error code indicates that 
    /// a link key cannot be changed because a fixed unit key is being used.
    case linkKeyCannotChange                = 0x26
    
    /// Requested QoS Not Supported
    /// 
    /// The Requested QoS Not Supported error code indicates that the requested Quality of Service is not supported.
    case requestedQoSNotSupported           = 0x27
    
    /// Instant Passed
    /// 
    /// The Instant Passed error code indicates that an LMP PDU 
    /// or LL PDU that includes an instant cannot be performed 
    /// because the instant when this would have occurred has passed.
    case instantPassed                      = 0x28
    
    /// Pairing With Unit Key Not Supported
    /// 
    /// The Pairing With Unit Key Not Supported error code indicates 
    /// that it was not possible to pair as a unit key was requested 
    /// and it is not supported.
    case pairingWithUnitKeyNotSupported     = 0x29
    
    /// Different Transaction Collision
    /// 
    /// The Different Transaction Collision error code indicates that 
    /// an LMP transaction was started that collides with an ongoing transaction.
    case differentTransactionCollision      = 0x2A
    
    /// Reserved
    case reserved2B                         = 0x2B
    
    /// QoS Unacceptable Parameter
    /// 
    /// The QoS Unacceptable Parameter error code indicates 
    /// that the specified quality of service parameters could 
    /// not be accepted at this time, but other parameters may be acceptable.
    case qosUnacceptableParameter           = 0x2C
    
    /// QoS Rejected
    /// 
    /// The QoS Rejected error code indicates that the specified quality 
    /// of service parameters cannot be accepted and QoS negotiation should be terminated.
    case qosRejected                        = 0x2D
    
    /// Channel Classification Not Supported
    /// 
    /// The Channel Assessment Not Supported error code indicates that
    /// the Controller cannot perform channel assessment because it is not supported.
    case channelClassificationNotSupported  = 0x2E
    
    /// Insufficient Security
    /// 
    /// The Insufficient Security error code indicates that the 
    /// HCI command or LMP PDU sent is only possible on an encrypted link.
    case insufficientSecurity               = 0x2F
    
    /// Parameter Out Of Mandatory Range
    /// 
    /// The Parameter Out Of Mandatory Range error code indicates 
    /// that a parameter value requested is outside the mandatory 
    /// range of parameters for the given HCI command or LMP PDU.
    case parameterOutOfMandatoryRange       = 0x30
    
    /// Reserved
    case reserved31                         = 0x31
    
    /// Role Switch Pending
    /// 
    /// The Role Switch Pending error code indicates that a Role Switch is pending. 
    /// This can be used when an HCI command or LMP PDU cannot be accepted because
    /// of a pending role switch. This can also be used to notify a peer device 
    /// about a pending role switch.
    case roleSwitchPending                  = 0x32
    
    /// Reserved
    case reserved33                         = 0x33
    
    /// Reserved Slot Violation
    /// 
    /// The Reserved Slot Violation error code indicates that the current 
    /// Synchronous negotiation was terminated with the negotiation state set to Reserved Slot Violation.
    case reservedSlotViolation              = 0x34
    
    /// Role Switch Failed
    /// 
    /// The Role Switch Failed error code indicates that a role switch 
    /// was attempted but it failed and the original piconet structure is restored. 
    /// The switch may have failed because the TDD switch or piconet switch failed.
    case roleSwitchFailed                   = 0x35
    
    /// Extended Inquiry Response Too Large
    /// 
    /// The Extended Inquiry Response Too Large error code indicates 
    /// that the extended inquiry response, with the requested requirements for FEC,
    /// is too large to fit in any of the packet types supported by the Controller.
    case extendedInquiryResponseTooLarge    = 0x36
    
    /// Secure Simple Pairing Not Supported By Host
    /// 
    /// The Secure Simple Pairing Not Supported by Host error code indicates that
    /// the IO capabilities request or response was rejected because the sending 
    /// Host does not support Secure Simple Pairing even though the receiving Link Manager does.
    case secureSimplePairingNotSupported    = 0x37
    
    /// Host Busy - Pairing
    /// 
    /// The Host Busy - Pairing error code indicates that the Host is busy
    /// with another pairing operation and unable to support the requested pairing. 
    /// The receiving device should retry pairing again later.
    case hostBusyPairing                    = 0x38
    
    /// Connection Rejected due to No Suitable Channel Found
    /// 
    /// The Connection Rejected due to No Suitable Channel Found error code 
    /// indicates that the Controller could not calculate an appropriate 
    /// value for the Channel selection operation.
    case noSuitableChannelFound             = 0x39
    
    /// Controller Busy
    /// 
    /// The Controller Busy error code indicates that the operation 
    /// was rejected because the Controller was busy and unable to process the request.
    case controllerBusy                     = 0x3A
    
    /// Unacceptable Connection Interval
    /// 
    /// The Unacceptable Connection Interval error code indicates that 
    /// the remote device terminated the connection because of an unacceptable connection interval.
    case unacceptableConnectionInterval     = 0x3B
    
    /// Directed Advertising Timeout
    /// 
    /// The Directed Advertising Timeout error code indicates that 
    /// directed advertising completed without a connection being created.
    case directedAdvertisingTimeout         = 0x3C
    
    /// Connection Terminated due to MIC Failure
    /// 
    /// The Connection Terminated Due to MIC Failure error code indicates 
    /// that the connection was terminated because the Message Integrity Check (MIC) 
    /// failed on a received packet.
    case micFailure                         = 0x3D
    
    /// Connection Failed to be Established
    /// 
    /// The Connection Failed to be Established error code indicates that the LL 
    /// initiated a connection but the connection has failed to be established.
    case connectionFailed                   = 0x3E
    
    /// MAC Connection Failed
    /// 
    /// The MAC of the 802.11 AMP was requested to connect to a peer, but the connection failed.
    case macConnectionFailed                = 0x3F
}

// MARK: - CustomStringConvertible

extension HCIError: CustomStringConvertible {
    
    public var description: String {
        return name
    }
    
    public var name: String {
        return Self.names[Int(rawValue)]
    }
    
    internal static let names = [
        "Success",
        "Unknown HCI Command",
        "Unknown Connection Identifier",
        "Hardware Failure",
        "Page Timeout",
        "Authentication Failure",
        "PIN or Key Missing",
        "Memory Capacity Exceeded",
        "Connection Timeout",
        "Connection Limit Exceeded",
        "Synchronous Connection to a Device Exceeded",
        "ACL Connection Already Exists",
        "Command Disallowed",
        "Connection Rejected due to Limited Resources",
        "Connection Rejected due to Security Reasons",
        "Connection Rejected due to Unacceptable BD_ADDR",
        "Connection Accept Timeout Exceeded",
        "Unsupported Feature or Parameter Value",
        "Invalid HCI Command Parameters",
        "Remote User Terminated Connection",
        "Remote Device Terminated Connection due to Low Resources",
        "Remote Device Terminated Connection due to Power Off",
        "Connection Terminated by Local Host",
        "Repeated Attempts",
        "Pairing Not Allowed",
        "Unknown LMP PDU",
        "Unsupported Remote Feature / Unsupported LMP Feature",
        "SCO Offset Rejected",
        "SCO Interval Rejected",
        "SCO Air Mode Rejected",
        "Invalid LMP Parameters / Invalid LL Parameters",
        "Unspecified Error",
        "Unsupported LMP Parameter Value / Unsupported LL Parameter Value",
        "Role Change Not Allowed",
        "LMP Response Timeout",
        "LMP Error Transaction Collision",
        "LMP PDU Not Allowed",
        "Encryption Mode Not Acceptable",
        "Link Key Can Not be Changed",
        "Requested QoS Not Supported",
        "Instant Passed",
        "Pairing with Unit Key Not Supported",
        "Different Transaction Collision",
        "Reserved",
        "QoS Unacceptable Parameter",
        "QoS Rejected",
        "Channel Classification Not Supported",
        "Insufficient Security",
        "Parameter out of Mandatory Range",
        "Reserved",
        "Role Switch Pending",
        "Reserved",
        "Reserved Slot Violation",
        "Role Switch Failed",
        "Extended Inquiry Response Too Large",
        "Simple Pairing Not Supported by Host",
        "Host Busy - Pairing",
        "Connection Rejected due to No Suitable Channel Found",
        "Controller Busy",
        "Unacceptable Connection Parameters",
        "Directed Advertising Timeout",
        "Connection Terminated Due to MIC Failure",
        "Connection Failed to be Established",
        "MAC Connection Failed"
    ]
}