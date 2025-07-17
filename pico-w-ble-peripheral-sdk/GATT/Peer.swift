//
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

/// Bluetooth LE Peer (Central, Peripheral)
public protocol Peer: Hashable, Sendable where ID: Hashable {
    
    associatedtype ID: Hashable
    
    /// Unique identifier of the peer.
    var id: ID { get }
}

// MARK: Hashable

public extension Peer {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        id.hash(into: &hasher)
    }
}

// MARK: CustomStringConvertible

extension Peer where Self: CustomStringConvertible, ID: CustomStringConvertible {
    
    public var description: String {
        return id.description
    }
}

// MARK: - Central

/// Central Peer
///
/// Represents a remote central device that has connected to an app implementing the peripheral role on a local device.
public struct Central: Peer, Identifiable, Sendable, CustomStringConvertible {
    
    public let id: BluetoothAddress
    
    public init(id: BluetoothAddress) {
        self.id = id
    }
}

// MARK: - Peripheral

/// Peripheral Peer
///
/// Represents a remote peripheral device that has been discovered.
public struct Peripheral: Peer, Identifiable, Sendable, CustomStringConvertible {
    
    public let id: BluetoothAddress
    
    public init(id: BluetoothAddress) {
        self.id = id
    }
}
