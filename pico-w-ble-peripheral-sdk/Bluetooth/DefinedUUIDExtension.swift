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

public extension BluetoothUUID {

    /// SDP (`0x0001`)
    static var sdp: BluetoothUUID {
        return .bit16(0x0001)
    }

    /// RFCOMM (`0x0003`)
    static var rfcomm: BluetoothUUID {
        return .bit16(0x0003)
    }

    /// TCS-BIN (`0x0005`)
    static var tcsBin: BluetoothUUID {
        return .bit16(0x0005)
    }

    /// ATT (`0x0007`)
    static var att: BluetoothUUID {
        return .bit16(0x0007)
    }

    /// OBEX (`0x0008`)
    static var obex: BluetoothUUID {
        return .bit16(0x0008)
    }

    /// BNEP (`0x000F`)
    static var bnep: BluetoothUUID {
        return .bit16(0x000F)
    }

    /// UPNP (`0x0010`)
    static var upnp: BluetoothUUID {
        return .bit16(0x0010)
    }

    /// HIDP (`0x0011`)
    static var hidp: BluetoothUUID {
        return .bit16(0x0011)
    }

    /// Hardcopy Control Channel (`0x0012`)
    static var hardcopyControlChannel: BluetoothUUID {
        return .bit16(0x0012)
    }

    /// Hardcopy Data Channel (`0x0014`)
    static var hardcopyDataChannel: BluetoothUUID {
        return .bit16(0x0014)
    }

    /// Hardcopy Notification (`0x0016`)
    static var hardcopyNotification: BluetoothUUID {
        return .bit16(0x0016)
    }

    /// AVCTP (`0x0017`)
    static var avctp: BluetoothUUID {
        return .bit16(0x0017)
    }

    /// AVDTP (`0x0019`)
    static var avdtp: BluetoothUUID {
        return .bit16(0x0019)
    }

    /// CMTP (`0x001B`)
    static var cmtp: BluetoothUUID {
        return .bit16(0x001B)
    }

    /// MCAP Control Channel (`0x001E`)
    static var mcapControlChannel: BluetoothUUID {
        return .bit16(0x001E)
    }

    /// MCAP Data Channel (`0x001F`)
    static var mcapDataChannel: BluetoothUUID {
        return .bit16(0x001F)
    }

    /// L2CAP (`0x0100`)
    static var l2Cap: BluetoothUUID {
        return .bit16(0x0100)
    }

    /// Service Discovery Server Service Class (`0x1000`)
    static var serviceDiscoveryServerServiceClass: BluetoothUUID {
        return .bit16(0x1000)
    }

    /// Browse Group Descriptor Service Class (`0x1001`)
    static var browseGroupDescriptorServiceClass: BluetoothUUID {
        return .bit16(0x1001)
    }

    /// Public Browse Root (`0x1002`)
    static var publicBrowseRoot: BluetoothUUID {
        return .bit16(0x1002)
    }

    /// Serial Port (`0x1101`)
    static var serialPort: BluetoothUUID {
        return .bit16(0x1101)
    }

    /// LAN Access Using PPP (`0x1102`)
    static var lanAccessUsingPpp: BluetoothUUID {
        return .bit16(0x1102)
    }

    /// Dialup Networking (`0x1103`)
    static var dialupNetworking: BluetoothUUID {
        return .bit16(0x1103)
    }

    /// IrMC Sync (`0x1104`)
    static var irmcSync: BluetoothUUID {
        return .bit16(0x1104)
    }

    /// OBEX Object Push (`0x1105`)
    static var obexObjectPush: BluetoothUUID {
        return .bit16(0x1105)
    }

    /// OBEX File Transfer (`0x1106`)
    static var obexFileTransfer: BluetoothUUID {
        return .bit16(0x1106)
    }

    /// IrMC Sync Command (`0x1107`)
    static var irmcSyncCommand: BluetoothUUID {
        return .bit16(0x1107)
    }

    /// Headset (`0x1108`)
    static var headset: BluetoothUUID {
        return .bit16(0x1108)
    }

    /// Cordless Telephony (`0x1109`)
    static var cordlessTelephony: BluetoothUUID {
        return .bit16(0x1109)
    }

    /// Audio Source (`0x110A`)
    static var audioSource: BluetoothUUID {
        return .bit16(0x110A)
    }

    /// Audio Sink (`0x110B`)
    static var audioSink: BluetoothUUID {
        return .bit16(0x110B)
    }

    /// A/V Remote Control Target (`0x110C`)
    static var avRemoteControlTarget: BluetoothUUID {
        return .bit16(0x110C)
    }

    /// Advanced Audio Distribution (`0x110D`)
    static var advancedAudioDistribution: BluetoothUUID {
        return .bit16(0x110D)
    }

    /// A/V Remote Control (`0x110E`)
    static var avRemoteControl: BluetoothUUID {
        return .bit16(0x110E)
    }

    /// A/V Remote Control Controller (`0x110F`)
    static var avRemoteControlController: BluetoothUUID {
        return .bit16(0x110F)
    }

    /// Intercom (`0x1110`)
    static var intercom: BluetoothUUID {
        return .bit16(0x1110)
    }

    /// Fax (`0x1111`)
    static var fax: BluetoothUUID {
        return .bit16(0x1111)
    }

    /// Headset AG (`0x1112`)
    static var headset2: BluetoothUUID {
        return .bit16(0x1112)
    }

    /// WAP (`0x1113`)
    static var wap: BluetoothUUID {
        return .bit16(0x1113)
    }

    /// WAP Client (`0x1114`)
    static var wapClient: BluetoothUUID {
        return .bit16(0x1114)
    }

    /// PANU (`0x1115`)
    static var panu: BluetoothUUID {
        return .bit16(0x1115)
    }

    /// NAP (`0x1116`)
    static var nap: BluetoothUUID {
        return .bit16(0x1116)
    }

    /// GN (`0x1117`)
    static var gn: BluetoothUUID {
        return .bit16(0x1117)
    }

    /// Direct Printing (`0x1118`)
    static var directPrinting: BluetoothUUID {
        return .bit16(0x1118)
    }

    /// Reference Printing (`0x1119`)
    static var referencePrinting: BluetoothUUID {
        return .bit16(0x1119)
    }

    /// Basic Imaging Profile (`0x111A`)
    static var basicImagingProfile: BluetoothUUID {
        return .bit16(0x111A)
    }

    /// Imaging Responder (`0x111B`)
    static var imagingResponder: BluetoothUUID {
        return .bit16(0x111B)
    }

    /// Imaging Automatic Archive (`0x111C`)
    static var imagingAutomaticArchive: BluetoothUUID {
        return .bit16(0x111C)
    }

    /// Imaging Referenced Objects (`0x111D`)
    static var imagingReferencedObjects: BluetoothUUID {
        return .bit16(0x111D)
    }

    /// Handsfree (`0x111E`)
    static var handsfree: BluetoothUUID {
        return .bit16(0x111E)
    }

    /// Handsfree Audio Gateway (`0x111F`)
    static var handsfreeAudioGateway: BluetoothUUID {
        return .bit16(0x111F)
    }

    /// Direct Printing Refrence Objects Service (`0x1120`)
    static var directPrintingRefrenceObjectsService: BluetoothUUID {
        return .bit16(0x1120)
    }

    /// Reflected UI (`0x1121`)
    static var reflectedUi: BluetoothUUID {
        return .bit16(0x1121)
    }

    /// Basic Printing (`0x1122`)
    static var basicPrinting: BluetoothUUID {
        return .bit16(0x1122)
    }

    /// Printing Status (`0x1123`)
    static var printingStatus: BluetoothUUID {
        return .bit16(0x1123)
    }

    /// Human Interface Device Service (`0x1124`)
    static var humanInterfaceDeviceService: BluetoothUUID {
        return .bit16(0x1124)
    }

    /// Hardcopy Cable Replacement (`0x1125`)
    static var hardcopyCableReplacement: BluetoothUUID {
        return .bit16(0x1125)
    }

    /// HCR Print (`0x1126`)
    static var hcrPrint: BluetoothUUID {
        return .bit16(0x1126)
    }

    /// HCR Scan (`0x1127`)
    static var hcrScan: BluetoothUUID {
        return .bit16(0x1127)
    }

    /// Common ISDN Access (`0x1128`)
    static var commonIsdnAccess: BluetoothUUID {
        return .bit16(0x1128)
    }

    /// SIM Access (`0x112D`)
    static var simAccess: BluetoothUUID {
        return .bit16(0x112D)
    }

    /// Phonebook Access Client (`0x112E`)
    static var phonebookAccessClient: BluetoothUUID {
        return .bit16(0x112E)
    }

    /// Phonebook Access Server (`0x112F`)
    static var phonebookAccessServer: BluetoothUUID {
        return .bit16(0x112F)
    }

    /// Phonebook Access (`0x1130`)
    static var phonebookAccess: BluetoothUUID {
        return .bit16(0x1130)
    }

    /// Headset HS (`0x1131`)
    static var headsetHs: BluetoothUUID {
        return .bit16(0x1131)
    }

    /// Message Access Server (`0x1132`)
    static var messageAccessServer: BluetoothUUID {
        return .bit16(0x1132)
    }

    /// Message Notification Server (`0x1133`)
    static var messageNotificationServer: BluetoothUUID {
        return .bit16(0x1133)
    }

    /// Message Access Profile (`0x1134`)
    static var messageAccessProfile: BluetoothUUID {
        return .bit16(0x1134)
    }

    /// GNSS (`0x1135`)
    static var gnss: BluetoothUUID {
        return .bit16(0x1135)
    }

    /// GNSS Server (`0x1136`)
    static var gnssServer: BluetoothUUID {
        return .bit16(0x1136)
    }

    /// 3D Display (`0x1137`)
    static var uuid3Ddisplay: BluetoothUUID {
        return .bit16(0x1137)
    }

    /// 3D Glasses (`0x1138`)
    static var uuid3Dglasses: BluetoothUUID {
        return .bit16(0x1138)
    }

    /// 3D Synchronization (`0x1139`)
    static var uuid3Dsynchronization: BluetoothUUID {
        return .bit16(0x1139)
    }

    /// MPS Profile (`0x113A`)
    static var mpsProfile: BluetoothUUID {
        return .bit16(0x113A)
    }

    /// MPS Service (`0x113B`)
    static var mpsService: BluetoothUUID {
        return .bit16(0x113B)
    }

    /// PnP Information (`0x1200`)
    static var pnpInformation: BluetoothUUID {
        return .bit16(0x1200)
    }

    /// Generic Networking (`0x1201`)
    static var genericNetworking: BluetoothUUID {
        return .bit16(0x1201)
    }

    /// Generic File Transfer (`0x1202`)
    static var genericFileTransfer: BluetoothUUID {
        return .bit16(0x1202)
    }

    /// Generic Audio (`0x1203`)
    static var genericAudio: BluetoothUUID {
        return .bit16(0x1203)
    }

    /// Generic Telephony (`0x1204`)
    static var genericTelephony: BluetoothUUID {
        return .bit16(0x1204)
    }

    /// UPNP Service (`0x1205`)
    static var upnpService: BluetoothUUID {
        return .bit16(0x1205)
    }

    /// UPNP IP Service (`0x1206`)
    static var upnpIpService: BluetoothUUID {
        return .bit16(0x1206)
    }

    /// UPNP IP PAN (`0x1300`)
    static var upnpIpPan: BluetoothUUID {
        return .bit16(0x1300)
    }

    /// UPNP IP LAP (`0x1301`)
    static var upnpIpLap: BluetoothUUID {
        return .bit16(0x1301)
    }

    /// UPNP IP L2CAP (`0x1302`)
    static var upnpIpL2Cap: BluetoothUUID {
        return .bit16(0x1302)
    }

    /// Video Source (`0x1303`)
    static var videoSource: BluetoothUUID {
        return .bit16(0x1303)
    }

    /// Video Sink (`0x1304`)
    static var videoSink: BluetoothUUID {
        return .bit16(0x1304)
    }

    /// Video Distribution (`0x1305`)
    static var videoDistribution: BluetoothUUID {
        return .bit16(0x1305)
    }

    /// HDP (`0x1400`)
    static var hdp: BluetoothUUID {
        return .bit16(0x1400)
    }

    /// HDP Source (`0x1401`)
    static var hdpSource: BluetoothUUID {
        return .bit16(0x1401)
    }

    /// HDP Sink (`0x1402`)
    static var hdpSink: BluetoothUUID {
        return .bit16(0x1402)
    }

    /// Generic Access Profile (`0x1800`)
    static var genericAccessProfile: BluetoothUUID {
        return .bit16(0x1800)
    }

    /// Generic Attribute Profile (`0x1801`)
    static var genericAttributeProfile: BluetoothUUID {
        return .bit16(0x1801)
    }

    /// Immediate Alert (`0x1802`)
    static var immediateAlert: BluetoothUUID {
        return .bit16(0x1802)
    }

    /// Link Loss (`0x1803`)
    static var linkLoss: BluetoothUUID {
        return .bit16(0x1803)
    }

    /// Tx Power (`0x1804`)
    static var txPower: BluetoothUUID {
        return .bit16(0x1804)
    }

    /// Current Time Service (`0x1805`)
    static var currentTimeService: BluetoothUUID {
        return .bit16(0x1805)
    }

    /// Reference Time Update Service (`0x1806`)
    static var referenceTimeUpdateService: BluetoothUUID {
        return .bit16(0x1806)
    }

    /// Next DST Change Service (`0x1807`)
    static var nextDstChangeService: BluetoothUUID {
        return .bit16(0x1807)
    }

    /// Glucose (`0x1808`)
    static var glucose: BluetoothUUID {
        return .bit16(0x1808)
    }

    /// Health Thermometer (`0x1809`)
    static var healthThermometer: BluetoothUUID {
        return .bit16(0x1809)
    }

    /// Device Information (`0x180A`)
    static var deviceInformation: BluetoothUUID {
        return .bit16(0x180A)
    }

    /// Heart Rate (`0x180D`)
    static var heartRate: BluetoothUUID {
        return .bit16(0x180D)
    }

    /// Phone Alert Status Service (`0x180E`)
    static var phoneAlertStatusService: BluetoothUUID {
        return .bit16(0x180E)
    }

    /// Battery Service (`0x180F`)
    static var batteryService: BluetoothUUID {
        return .bit16(0x180F)
    }

    /// Blood Pressure (`0x1810`)
    static var bloodPressure: BluetoothUUID {
        return .bit16(0x1810)
    }

    /// Alert Notification Service (`0x1811`)
    static var alertNotificationService: BluetoothUUID {
        return .bit16(0x1811)
    }

    /// Human Interface Device (`0x1812`)
    static var humanInterfaceDevice: BluetoothUUID {
        return .bit16(0x1812)
    }

    /// Scan Parameters (`0x1813`)
    static var scanParameters: BluetoothUUID {
        return .bit16(0x1813)
    }

    /// Running Speed and Cadence (`0x1814`)
    static var runningSpeedAndCadence: BluetoothUUID {
        return .bit16(0x1814)
    }

    /// Automation IO (`0x1815`)
    static var automationIo: BluetoothUUID {
        return .bit16(0x1815)
    }

    /// Cycling Speed and Cadence (`0x1816`)
    static var cyclingSpeedAndCadence: BluetoothUUID {
        return .bit16(0x1816)
    }

    /// Cycling Power (`0x1818`)
    static var cyclingPower: BluetoothUUID {
        return .bit16(0x1818)
    }

    /// Location and Navigation (`0x1819`)
    static var locationAndNavigation: BluetoothUUID {
        return .bit16(0x1819)
    }

    /// Environmental Sensing (`0x181A`)
    static var environmentalSensing: BluetoothUUID {
        return .bit16(0x181A)
    }

    /// Body Composition (`0x181B`)
    static var bodyComposition: BluetoothUUID {
        return .bit16(0x181B)
    }

    /// User Data (`0x181C`)
    static var userData: BluetoothUUID {
        return .bit16(0x181C)
    }

    /// Weight Scale (`0x181D`)
    static var weightScale: BluetoothUUID {
        return .bit16(0x181D)
    }

    /// Bond Management (`0x181E`)
    static var bondManagement: BluetoothUUID {
        return .bit16(0x181E)
    }

    /// Continuous Glucose Monitoring (`0x181F`)
    static var continuousGlucoseMonitoring: BluetoothUUID {
        return .bit16(0x181F)
    }

    /// Internet Protocol Support (`0x1820`)
    static var internetProtocolSupport: BluetoothUUID {
        return .bit16(0x1820)
    }

    /// Indoor Positioning (`0x1821`)
    static var indoorPositioning: BluetoothUUID {
        return .bit16(0x1821)
    }

    /// Pulse Oximeter (`0x1822`)
    static var pulseOximeter: BluetoothUUID {
        return .bit16(0x1822)
    }

    /// HTTP Proxy (`0x1823`)
    static var httpProxy: BluetoothUUID {
        return .bit16(0x1823)
    }

    /// Transport Discovery (`0x1824`)
    static var transportDiscovery: BluetoothUUID {
        return .bit16(0x1824)
    }

    /// Object Transfer (`0x1825`)
    static var objectTransfer: BluetoothUUID {
        return .bit16(0x1825)
    }

    /// Primary Service (`0x2800`)
    static var primaryService: BluetoothUUID {
        return .bit16(0x2800)
    }

    /// Secondary Service (`0x2801`)
    static var secondaryService: BluetoothUUID {
        return .bit16(0x2801)
    }

    /// Include (`0x2802`)
    static var include: BluetoothUUID {
        return .bit16(0x2802)
    }

    /// Characteristic (`0x2803`)
    static var characteristic: BluetoothUUID {
        return .bit16(0x2803)
    }

    /// Characteristic Extended Properties (`0x2900`)
    static var characteristicExtendedProperties: BluetoothUUID {
        return .bit16(0x2900)
    }

    /// Characteristic User Description (`0x2901`)
    static var characteristicUserDescription: BluetoothUUID {
        return .bit16(0x2901)
    }

    /// Client Characteristic Configuration (`0x2902`)
    static var clientCharacteristicConfiguration: BluetoothUUID {
        return .bit16(0x2902)
    }

    /// Server Characteristic Configuration (`0x2903`)
    static var serverCharacteristicConfiguration: BluetoothUUID {
        return .bit16(0x2903)
    }

    /// Characteristic Format (`0x2904`)
    static var characteristicFormat: BluetoothUUID {
        return .bit16(0x2904)
    }

    /// Characteristic Aggregate Format (`0x2905`)
    static var characteristicAggregateFormat: BluetoothUUID {
        return .bit16(0x2905)
    }

    /// Valid Range (`0x2906`)
    static var validRange: BluetoothUUID {
        return .bit16(0x2906)
    }

    /// External Report Reference (`0x2907`)
    static var externalReportReference: BluetoothUUID {
        return .bit16(0x2907)
    }

    /// Report Reference (`0x2908`)
    static var reportReference: BluetoothUUID {
        return .bit16(0x2908)
    }

    /// Number of Digitals (`0x2909`)
    static var numberOfDigitals: BluetoothUUID {
        return .bit16(0x2909)
    }

    /// Value Trigger Setting (`0x290A`)
    static var valueTriggerSetting: BluetoothUUID {
        return .bit16(0x290A)
    }

    /// Environmental Sensing Configuration (`0x290B`)
    static var environmentalSensingConfiguration: BluetoothUUID {
        return .bit16(0x290B)
    }

    /// Environmental Sensing Measurement (`0x290C`)
    static var environmentalSensingMeasurement: BluetoothUUID {
        return .bit16(0x290C)
    }

    /// Environmental Sensing Trigger Setting (`0x290D`)
    static var environmentalSensingTriggerSetting: BluetoothUUID {
        return .bit16(0x290D)
    }

    /// Time Trigger Setting (`0x290E`)
    static var timeTriggerSetting: BluetoothUUID {
        return .bit16(0x290E)
    }

    /// Device Name (`0x2A00`)
    static var deviceName: BluetoothUUID {
        return .bit16(0x2A00)
    }

    /// Appearance (`0x2A01`)
    static var appearance: BluetoothUUID {
        return .bit16(0x2A01)
    }

    /// Peripheral Privacy Flag (`0x2A02`)
    static var peripheralPrivacyFlag: BluetoothUUID {
        return .bit16(0x2A02)
    }

    /// Reconnection Address (`0x2A03`)
    static var reconnectionAddress: BluetoothUUID {
        return .bit16(0x2A03)
    }

    /// Peripheral Preferred Connection Parameters (`0x2A04`)
    static var peripheralPreferredConnectionParameters: BluetoothUUID {
        return .bit16(0x2A04)
    }

    /// Service Changed (`0x2A05`)
    static var serviceChanged: BluetoothUUID {
        return .bit16(0x2A05)
    }

    /// Alert Level (`0x2A06`)
    static var alertLevel: BluetoothUUID {
        return .bit16(0x2A06)
    }

    /// Tx Power Level (`0x2A07`)
    static var txPowerLevel: BluetoothUUID {
        return .bit16(0x2A07)
    }

    /// Date Time (`0x2A08`)
    static var dateTime: BluetoothUUID {
        return .bit16(0x2A08)
    }

    /// Day of Week (`0x2A09`)
    static var dayOfWeek: BluetoothUUID {
        return .bit16(0x2A09)
    }

    /// Day Date Time (`0x2A0A`)
    static var dayDateTime: BluetoothUUID {
        return .bit16(0x2A0A)
    }

    /// Exact Time 100 (`0x2A0B`)
    static var exactTime100: BluetoothUUID {
        return .bit16(0x2A0B)
    }

    /// Exact Time 256 (`0x2A0C`)
    static var exactTime256: BluetoothUUID {
        return .bit16(0x2A0C)
    }

    /// DST Offset (`0x2A0D`)
    static var dstOffset: BluetoothUUID {
        return .bit16(0x2A0D)
    }

    /// Time Zone (`0x2A0E`)
    static var timeZone: BluetoothUUID {
        return .bit16(0x2A0E)
    }

    /// Local Time Information (`0x2A0F`)
    static var localTimeInformation: BluetoothUUID {
        return .bit16(0x2A0F)
    }

    /// Secondary Time Zone (`0x2A10`)
    static var secondaryTimeZone: BluetoothUUID {
        return .bit16(0x2A10)
    }

    /// Time with DST (`0x2A11`)
    static var timeWithDst: BluetoothUUID {
        return .bit16(0x2A11)
    }

    /// Time Accuracy (`0x2A12`)
    static var timeAccuracy: BluetoothUUID {
        return .bit16(0x2A12)
    }

    /// Time Source (`0x2A13`)
    static var timeSource: BluetoothUUID {
        return .bit16(0x2A13)
    }

    /// Reference Time Information (`0x2A14`)
    static var referenceTimeInformation: BluetoothUUID {
        return .bit16(0x2A14)
    }

    /// Time Broadcast (`0x2A15`)
    static var timeBroadcast: BluetoothUUID {
        return .bit16(0x2A15)
    }

    /// Time Update Control Point (`0x2A16`)
    static var timeUpdateControlPoint: BluetoothUUID {
        return .bit16(0x2A16)
    }

    /// Time Update State (`0x2A17`)
    static var timeUpdateState: BluetoothUUID {
        return .bit16(0x2A17)
    }

    /// Glucose Measurement (`0x2A18`)
    static var glucoseMeasurement: BluetoothUUID {
        return .bit16(0x2A18)
    }

    /// Battery Level (`0x2A19`)
    static var batteryLevel: BluetoothUUID {
        return .bit16(0x2A19)
    }

    /// Battery Power State (`0x2A1A`)
    static var batteryPowerState: BluetoothUUID {
        return .bit16(0x2A1A)
    }

    /// Battery Level State (`0x2A1B`)
    static var batteryLevelState: BluetoothUUID {
        return .bit16(0x2A1B)
    }

    /// Temperature Measurement (`0x2A1C`)
    static var temperatureMeasurement: BluetoothUUID {
        return .bit16(0x2A1C)
    }

    /// Temperature Type (`0x2A1D`)
    static var temperatureType: BluetoothUUID {
        return .bit16(0x2A1D)
    }

    /// Intermediate Temperature (`0x2A1E`)
    static var intermediateTemperature: BluetoothUUID {
        return .bit16(0x2A1E)
    }

    /// Measurement Interval (`0x2A21`)
    static var measurementInterval: BluetoothUUID {
        return .bit16(0x2A21)
    }

    /// Boot Keyboard Input Report (`0x2A22`)
    static var bootKeyboardInputReport: BluetoothUUID {
        return .bit16(0x2A22)
    }

    /// System ID (`0x2A23`)
    static var systemId: BluetoothUUID {
        return .bit16(0x2A23)
    }

    /// Model Number String (`0x2A24`)
    static var modelNumberString: BluetoothUUID {
        return .bit16(0x2A24)
    }

    /// Serial Number String (`0x2A25`)
    static var serialNumberString: BluetoothUUID {
        return .bit16(0x2A25)
    }

    /// Firmware Revision String (`0x2A26`)
    static var firmwareRevisionString: BluetoothUUID {
        return .bit16(0x2A26)
    }

    /// Hardware Revision String (`0x2A27`)
    static var hardwareRevisionString: BluetoothUUID {
        return .bit16(0x2A27)
    }

    /// Software Revision String (`0x2A28`)
    static var softwareRevisionString: BluetoothUUID {
        return .bit16(0x2A28)
    }

    /// Manufacturer Name String (`0x2A29`)
    static var manufacturerNameString: BluetoothUUID {
        return .bit16(0x2A29)
    }

    /// IEEE 11073-20601 Regulatory Cert. Data List (`0x2A2A`)
    static var ieee1107320601RegulatoryCertDataList: BluetoothUUID {
        return .bit16(0x2A2A)
    }

    /// Current Time (`0x2A2B`)
    static var currentTime: BluetoothUUID {
        return .bit16(0x2A2B)
    }

    /// Magnetic Declination (`0x2A2C`)
    static var magneticDeclination: BluetoothUUID {
        return .bit16(0x2A2C)
    }

    /// Scan Refresh (`0x2A31`)
    static var scanRefresh: BluetoothUUID {
        return .bit16(0x2A31)
    }

    /// Boot Keyboard Output Report (`0x2A32`)
    static var bootKeyboardOutputReport: BluetoothUUID {
        return .bit16(0x2A32)
    }

    /// Boot Mouse Input Report (`0x2A33`)
    static var bootMouseInputReport: BluetoothUUID {
        return .bit16(0x2A33)
    }

    /// Glucose Measurement Context (`0x2A34`)
    static var glucoseMeasurementContext: BluetoothUUID {
        return .bit16(0x2A34)
    }

    /// Blood Pressure Measurement (`0x2A35`)
    static var bloodPressureMeasurement: BluetoothUUID {
        return .bit16(0x2A35)
    }

    /// Intermediate Cuff Pressure (`0x2A36`)
    static var intermediateCuffPressure: BluetoothUUID {
        return .bit16(0x2A36)
    }

    /// Heart Rate Measurement (`0x2A37`)
    static var heartRateMeasurement: BluetoothUUID {
        return .bit16(0x2A37)
    }

    /// Body Sensor Location (`0x2A38`)
    static var bodySensorLocation: BluetoothUUID {
        return .bit16(0x2A38)
    }

    /// Heart Rate Control Point (`0x2A39`)
    static var heartRateControlPoint: BluetoothUUID {
        return .bit16(0x2A39)
    }

    /// Alert Status (`0x2A3F`)
    static var alertStatus: BluetoothUUID {
        return .bit16(0x2A3F)
    }

    /// Ringer Control Point (`0x2A40`)
    static var ringerControlPoint: BluetoothUUID {
        return .bit16(0x2A40)
    }

    /// Ringer Setting (`0x2A41`)
    static var ringerSetting: BluetoothUUID {
        return .bit16(0x2A41)
    }

    /// Alert Category ID Bit Mask (`0x2A42`)
    static var alertCategoryIdBitMask: BluetoothUUID {
        return .bit16(0x2A42)
    }

    /// Alert Category ID (`0x2A43`)
    static var alertCategoryId: BluetoothUUID {
        return .bit16(0x2A43)
    }

    /// Alert Notification Control Point (`0x2A44`)
    static var alertNotificationControlPoint: BluetoothUUID {
        return .bit16(0x2A44)
    }

    /// Unread Alert Status (`0x2A45`)
    static var unreadAlertStatus: BluetoothUUID {
        return .bit16(0x2A45)
    }

    /// New Alert (`0x2A46`)
    static var newAlert: BluetoothUUID {
        return .bit16(0x2A46)
    }

    /// Supported New Alert Category (`0x2A47`)
    static var supportedNewAlertCategory: BluetoothUUID {
        return .bit16(0x2A47)
    }

    /// Supported Unread Alert Category (`0x2A48`)
    static var supportedUnreadAlertCategory: BluetoothUUID {
        return .bit16(0x2A48)
    }

    /// Blood Pressure Feature (`0x2A49`)
    static var bloodPressureFeature: BluetoothUUID {
        return .bit16(0x2A49)
    }

    /// HID Information (`0x2A4A`)
    static var hidInformation: BluetoothUUID {
        return .bit16(0x2A4A)
    }

    /// Report Map (`0x2A4B`)
    static var reportMap: BluetoothUUID {
        return .bit16(0x2A4B)
    }

    /// HID Control Point (`0x2A4C`)
    static var hidControlPoint: BluetoothUUID {
        return .bit16(0x2A4C)
    }

    /// Report (`0x2A4D`)
    static var report: BluetoothUUID {
        return .bit16(0x2A4D)
    }

    /// Protocol Mode (`0x2A4E`)
    static var protocolMode: BluetoothUUID {
        return .bit16(0x2A4E)
    }

    /// Scan Interval Window (`0x2A4F`)
    static var scanIntervalWindow: BluetoothUUID {
        return .bit16(0x2A4F)
    }

    /// PnP ID (`0x2A50`)
    static var pnpId: BluetoothUUID {
        return .bit16(0x2A50)
    }

    /// Glucose Feature (`0x2A51`)
    static var glucoseFeature: BluetoothUUID {
        return .bit16(0x2A51)
    }

    /// Record Access Control Point (`0x2A52`)
    static var recordAccessControlPoint: BluetoothUUID {
        return .bit16(0x2A52)
    }

    /// RSC Measurement (`0x2A53`)
    static var rscMeasurement: BluetoothUUID {
        return .bit16(0x2A53)
    }

    /// RSC Feature (`0x2A54`)
    static var rscFeature: BluetoothUUID {
        return .bit16(0x2A54)
    }

    /// SC Control Point (`0x2A55`)
    static var scControlPoint: BluetoothUUID {
        return .bit16(0x2A55)
    }

    /// Digital (`0x2A56`)
    static var digital: BluetoothUUID {
        return .bit16(0x2A56)
    }

    /// Analog (`0x2A58`)
    static var analog: BluetoothUUID {
        return .bit16(0x2A58)
    }

    /// Analog Output (`0x2A59`)
    static var analogOutput: BluetoothUUID {
        return .bit16(0x2A59)
    }

    /// Aggregate (`0x2A5A`)
    static var aggregate: BluetoothUUID {
        return .bit16(0x2A5A)
    }

    /// CSC Measurement (`0x2A5B`)
    static var cscMeasurement: BluetoothUUID {
        return .bit16(0x2A5B)
    }

    /// CSC Feature (`0x2A5C`)
    static var cscFeature: BluetoothUUID {
        return .bit16(0x2A5C)
    }

    /// Sensor Location (`0x2A5D`)
    static var sensorLocation: BluetoothUUID {
        return .bit16(0x2A5D)
    }

    /// Cycling Power Measurement (`0x2A63`)
    static var cyclingPowerMeasurement: BluetoothUUID {
        return .bit16(0x2A63)
    }

    /// Cycling Power Vector (`0x2A64`)
    static var cyclingPowerVector: BluetoothUUID {
        return .bit16(0x2A64)
    }

    /// Cycling Power Feature (`0x2A65`)
    static var cyclingPowerFeature: BluetoothUUID {
        return .bit16(0x2A65)
    }

    /// Cycling Power Control Point (`0x2A66`)
    static var cyclingPowerControlPoint: BluetoothUUID {
        return .bit16(0x2A66)
    }

    /// Location and Speed (`0x2A67`)
    static var locationAndSpeed: BluetoothUUID {
        return .bit16(0x2A67)
    }

    /// Navigation (`0x2A68`)
    static var navigation: BluetoothUUID {
        return .bit16(0x2A68)
    }

    /// Position Quality (`0x2A69`)
    static var positionQuality: BluetoothUUID {
        return .bit16(0x2A69)
    }

    /// LN Feature (`0x2A6A`)
    static var lnFeature: BluetoothUUID {
        return .bit16(0x2A6A)
    }

    /// LN Control Point (`0x2A6B`)
    static var lnControlPoint: BluetoothUUID {
        return .bit16(0x2A6B)
    }

    /// Elevation (`0x2A6C`)
    static var elevation: BluetoothUUID {
        return .bit16(0x2A6C)
    }

    /// Pressure (`0x2A6D`)
    static var pressure: BluetoothUUID {
        return .bit16(0x2A6D)
    }

    /// Temperature (`0x2A6E`)
    static var temperature: BluetoothUUID {
        return .bit16(0x2A6E)
    }

    /// Humidity (`0x2A6F`)
    static var humidity: BluetoothUUID {
        return .bit16(0x2A6F)
    }

    /// True Wind Speed (`0x2A70`)
    static var trueWindSpeed: BluetoothUUID {
        return .bit16(0x2A70)
    }

    /// True Wind Direction (`0x2A71`)
    static var trueWindDirection: BluetoothUUID {
        return .bit16(0x2A71)
    }

    /// Apparent Wind Speed (`0x2A72`)
    static var apparentWindSpeed: BluetoothUUID {
        return .bit16(0x2A72)
    }

    /// Apparent Wind Direction (`0x2A73`)
    static var apparentWindDirection: BluetoothUUID {
        return .bit16(0x2A73)
    }

    /// Gust Factor (`0x2A74`)
    static var gustFactor: BluetoothUUID {
        return .bit16(0x2A74)
    }

    /// Pollen Concentration (`0x2A75`)
    static var pollenConcentration: BluetoothUUID {
        return .bit16(0x2A75)
    }

    /// UV Index (`0x2A76`)
    static var uvIndex: BluetoothUUID {
        return .bit16(0x2A76)
    }

    /// Irradiance (`0x2A77`)
    static var irradiance: BluetoothUUID {
        return .bit16(0x2A77)
    }

    /// Rainfall (`0x2A78`)
    static var rainfall: BluetoothUUID {
        return .bit16(0x2A78)
    }

    /// Wind Chill (`0x2A79`)
    static var windChill: BluetoothUUID {
        return .bit16(0x2A79)
    }

    /// Heat Index (`0x2A7A`)
    static var heatIndex: BluetoothUUID {
        return .bit16(0x2A7A)
    }

    /// Dew Point (`0x2A7B`)
    static var dewPoint: BluetoothUUID {
        return .bit16(0x2A7B)
    }

    /// Trend (`0x2A7C`)
    static var trend: BluetoothUUID {
        return .bit16(0x2A7C)
    }

    /// Descriptor Value Changed (`0x2A7D`)
    static var descriptorValueChanged: BluetoothUUID {
        return .bit16(0x2A7D)
    }

    /// Aerobic Heart Rate Lower Limit (`0x2A7E`)
    static var aerobicHeartRateLowerLimit: BluetoothUUID {
        return .bit16(0x2A7E)
    }

    /// Aerobic Threshold (`0x2A7F`)
    static var aerobicThreshold: BluetoothUUID {
        return .bit16(0x2A7F)
    }

    /// Age (`0x2A80`)
    static var age: BluetoothUUID {
        return .bit16(0x2A80)
    }

    /// Anaerobic Heart Rate Lower Limit (`0x2A81`)
    static var anaerobicHeartRateLowerLimit: BluetoothUUID {
        return .bit16(0x2A81)
    }

    /// Anaerobic Heart Rate Upper Limit (`0x2A82`)
    static var anaerobicHeartRateUpperLimit: BluetoothUUID {
        return .bit16(0x2A82)
    }

    /// Anaerobic Threshold (`0x2A83`)
    static var anaerobicThreshold: BluetoothUUID {
        return .bit16(0x2A83)
    }

    /// Aerobic Heart Rate Upper Limit (`0x2A84`)
    static var aerobicHeartRateUpperLimit: BluetoothUUID {
        return .bit16(0x2A84)
    }

    /// Date of Birth (`0x2A85`)
    static var dateOfBirth: BluetoothUUID {
        return .bit16(0x2A85)
    }

    /// Date of Threshold Assessment (`0x2A86`)
    static var dateOfThresholdAssessment: BluetoothUUID {
        return .bit16(0x2A86)
    }

    /// Email Address (`0x2A87`)
    static var emailAddress: BluetoothUUID {
        return .bit16(0x2A87)
    }

    /// Fat Burn Heart Rate Lower Limit (`0x2A88`)
    static var fatBurnHeartRateLowerLimit: BluetoothUUID {
        return .bit16(0x2A88)
    }

    /// Fat Burn Heart Rate Upper Limit (`0x2A89`)
    static var fatBurnHeartRateUpperLimit: BluetoothUUID {
        return .bit16(0x2A89)
    }

    /// First Name (`0x2A8A`)
    static var firstName: BluetoothUUID {
        return .bit16(0x2A8A)
    }

    /// Five Zone Heart Rate Limits (`0x2A8B`)
    static var fiveZoneHeartRateLimits: BluetoothUUID {
        return .bit16(0x2A8B)
    }

    /// Gender (`0x2A8C`)
    static var gender: BluetoothUUID {
        return .bit16(0x2A8C)
    }

    /// Heart Rate Max (`0x2A8D`)
    static var heartRateMax: BluetoothUUID {
        return .bit16(0x2A8D)
    }

    /// Height (`0x2A8E`)
    static var height: BluetoothUUID {
        return .bit16(0x2A8E)
    }

    /// Hip Circumference (`0x2A8F`)
    static var hipCircumference: BluetoothUUID {
        return .bit16(0x2A8F)
    }

    /// Last Name (`0x2A90`)
    static var lastName: BluetoothUUID {
        return .bit16(0x2A90)
    }

    /// Maximum Recommended Heart Rate (`0x2A91`)
    static var maximumRecommendedHeartRate: BluetoothUUID {
        return .bit16(0x2A91)
    }

    /// Resting Heart Rate (`0x2A92`)
    static var restingHeartRate: BluetoothUUID {
        return .bit16(0x2A92)
    }

    /// Sport Type for Aerobic/Anaerobic Thresholds (`0x2A93`)
    static var sportTypeForAerobicAnaerobicThresholds: BluetoothUUID {
        return .bit16(0x2A93)
    }

    /// Three Zone Heart Rate Limits (`0x2A94`)
    static var threeZoneHeartRateLimits: BluetoothUUID {
        return .bit16(0x2A94)
    }

    /// Two Zone Heart Rate Limit (`0x2A95`)
    static var twoZoneHeartRateLimit: BluetoothUUID {
        return .bit16(0x2A95)
    }

    /// VO2 Max (`0x2A96`)
    static var vo2Max: BluetoothUUID {
        return .bit16(0x2A96)
    }

    /// Waist Circumference (`0x2A97`)
    static var waistCircumference: BluetoothUUID {
        return .bit16(0x2A97)
    }

    /// Weight (`0x2A98`)
    static var weight: BluetoothUUID {
        return .bit16(0x2A98)
    }

    /// Database Change Increment (`0x2A99`)
    static var databaseChangerement: BluetoothUUID {
        return .bit16(0x2A99)
    }

    /// User Index (`0x2A9A`)
    static var userIndex: BluetoothUUID {
        return .bit16(0x2A9A)
    }

    /// Body Composition Feature (`0x2A9B`)
    static var bodyCompositionFeature: BluetoothUUID {
        return .bit16(0x2A9B)
    }

    /// Body Composition Measurement (`0x2A9C`)
    static var bodyCompositionMeasurement: BluetoothUUID {
        return .bit16(0x2A9C)
    }

    /// Weight Measurement (`0x2A9D`)
    static var weightMeasurement: BluetoothUUID {
        return .bit16(0x2A9D)
    }

    /// Weight Scale Feature (`0x2A9E`)
    static var weightScaleFeature: BluetoothUUID {
        return .bit16(0x2A9E)
    }

    /// User Control Point (`0x2A9F`)
    static var userControlPoint: BluetoothUUID {
        return .bit16(0x2A9F)
    }

    /// Magnetic Flux Density - 2D (`0x2AA0`)
    static var magneticFluxDensity2D: BluetoothUUID {
        return .bit16(0x2AA0)
    }

    /// Magnetic Flux Density - 3D (`0x2AA1`)
    static var magneticFluxDensity3D: BluetoothUUID {
        return .bit16(0x2AA1)
    }

    /// Language (`0x2AA2`)
    static var language: BluetoothUUID {
        return .bit16(0x2AA2)
    }

    /// Barometric Pressure Trend (`0x2AA3`)
    static var barometricPressureTrend: BluetoothUUID {
        return .bit16(0x2AA3)
    }

    /// Bond Management Control Point (`0x2AA4`)
    static var bondManagementControlPoint: BluetoothUUID {
        return .bit16(0x2AA4)
    }

    /// Bond Management Feature (`0x2AA5`)
    static var bondManagementFeature: BluetoothUUID {
        return .bit16(0x2AA5)
    }

    /// Central Address Resolution (`0x2AA6`)
    static var centralAddressResolution: BluetoothUUID {
        return .bit16(0x2AA6)
    }

    /// CGM Measurement (`0x2AA7`)
    static var cgmMeasurement: BluetoothUUID {
        return .bit16(0x2AA7)
    }

    /// CGM Feature (`0x2AA8`)
    static var cgmFeature: BluetoothUUID {
        return .bit16(0x2AA8)
    }

    /// CGM Status (`0x2AA9`)
    static var cgmStatus: BluetoothUUID {
        return .bit16(0x2AA9)
    }

    /// CGM Session Start Time (`0x2AAA`)
    static var cgmSessionStartTime: BluetoothUUID {
        return .bit16(0x2AAA)
    }

    /// CGM Session Run Time (`0x2AAB`)
    static var cgmSessionRunTime: BluetoothUUID {
        return .bit16(0x2AAB)
    }

    /// CGM Specific Ops Control Point (`0x2AAC`)
    static var cgmSpecificOpsControlPoint: BluetoothUUID {
        return .bit16(0x2AAC)
    }

    /// Indoor Positioning Configuration (`0x2AAD`)
    static var indoorPositioningConfiguration: BluetoothUUID {
        return .bit16(0x2AAD)
    }

    /// Latitude (`0x2AAE`)
    static var latitude: BluetoothUUID {
        return .bit16(0x2AAE)
    }

    /// Longitude (`0x2AAF`)
    static var longitude: BluetoothUUID {
        return .bit16(0x2AAF)
    }

    /// Local North Coordinate (`0x2AB0`)
    static var localNorthCoordinate: BluetoothUUID {
        return .bit16(0x2AB0)
    }

    /// Local East Coordinate (`0x2AB1`)
    static var localEastCoordinate: BluetoothUUID {
        return .bit16(0x2AB1)
    }

    /// Floor Number (`0x2AB2`)
    static var floorNumber: BluetoothUUID {
        return .bit16(0x2AB2)
    }

    /// Altitude (`0x2AB3`)
    static var altitude: BluetoothUUID {
        return .bit16(0x2AB3)
    }

    /// Uncertainty (`0x2AB4`)
    static var uncertainty: BluetoothUUID {
        return .bit16(0x2AB4)
    }

    /// Location Name (`0x2AB5`)
    static var locationName: BluetoothUUID {
        return .bit16(0x2AB5)
    }

    /// URI (`0x2AB6`)
    static var uri: BluetoothUUID {
        return .bit16(0x2AB6)
    }

    /// HTTP Headers (`0x2AB7`)
    static var httpHeaders: BluetoothUUID {
        return .bit16(0x2AB7)
    }

    /// HTTP Status Code (`0x2AB8`)
    static var httpStatusCode: BluetoothUUID {
        return .bit16(0x2AB8)
    }

    /// HTTP Entity Body (`0x2AB9`)
    static var httpEntityBody: BluetoothUUID {
        return .bit16(0x2AB9)
    }

    /// HTTP Control Point (`0x2ABA`)
    static var httpControlPoint: BluetoothUUID {
        return .bit16(0x2ABA)
    }

    /// HTTPS Security (`0x2ABB`)
    static var httpsSecurity: BluetoothUUID {
        return .bit16(0x2ABB)
    }

    /// TDS Control Point (`0x2ABC`)
    static var tdsControlPoint: BluetoothUUID {
        return .bit16(0x2ABC)
    }

    /// OTS Feature (`0x2ABD`)
    static var otsFeature: BluetoothUUID {
        return .bit16(0x2ABD)
    }

    /// Object Name (`0x2ABE`)
    static var objectName: BluetoothUUID {
        return .bit16(0x2ABE)
    }

    /// Object Type (`0x2ABF`)
    static var objectType: BluetoothUUID {
        return .bit16(0x2ABF)
    }

    /// Object Size (`0x2AC0`)
    static var objectSize: BluetoothUUID {
        return .bit16(0x2AC0)
    }

    /// Object First-Created (`0x2AC1`)
    static var objectFirstCreated: BluetoothUUID {
        return .bit16(0x2AC1)
    }

    /// Object Last-Modified (`0x2AC2`)
    static var objectLastModified: BluetoothUUID {
        return .bit16(0x2AC2)
    }

    /// Object ID (`0x2AC3`)
    static var objectId: BluetoothUUID {
        return .bit16(0x2AC3)
    }

    /// Object Properties (`0x2AC4`)
    static var objectProperties: BluetoothUUID {
        return .bit16(0x2AC4)
    }

    /// Object Action Control Point (`0x2AC5`)
    static var objectActionControlPoint: BluetoothUUID {
        return .bit16(0x2AC5)
    }

    /// Object List Control Point (`0x2AC6`)
    static var objectListControlPoint: BluetoothUUID {
        return .bit16(0x2AC6)
    }

    /// Object List Filter (`0x2AC7`)
    static var objectListFilter: BluetoothUUID {
        return .bit16(0x2AC7)
    }

    /// Object Changed (`0x2AC8`)
    static var objectChanged: BluetoothUUID {
        return .bit16(0x2AC8)
    }

    /// Cross Trainer Data (`0x2ACE`)
    static var crossTrainerData: BluetoothUUID {
        return .bit16(0x2ACE)
    }

    /// Date UTC (`0x2AED`)
    static var dateUtc: BluetoothUUID {
        return .bit16(0x2AED)
    }

    /// Abbott Diabetes Care (`0xFDE3`)
    static var abbottDiabetesCare: BluetoothUUID {
        return .bit16(0xFDE3)
    }

    /// JUUL Labs, Inc. (`0xFDE4`)
    static var juulLabs: BluetoothUUID {
        return .bit16(0xFDE4)
    }

    /// SMK Corporation (`0xFDE5`)
    static var smk: BluetoothUUID {
        return .bit16(0xFDE5)
    }

    /// Intelletto Technologies Inc (`0xFDE6`)
    static var intellettoTechnologies: BluetoothUUID {
        return .bit16(0xFDE6)
    }

    /// SECOM Co., LTD (`0xFDE7`)
    static var secom: BluetoothUUID {
        return .bit16(0xFDE7)
    }

    /// Robert Bosch GmbH (`0xFDE8`)
    static var robertBosch: BluetoothUUID {
        return .bit16(0xFDE8)
    }

    /// Spacesaver Corporation (`0xFDE9`)
    static var spacesaver: BluetoothUUID {
        return .bit16(0xFDE9)
    }

    /// SeeScan, Inc (`0xFDEA`)
    static var seescan: BluetoothUUID {
        return .bit16(0xFDEA)
    }

    /// Syntronix Corporation (`0xFDEB`)
    static var syntronix: BluetoothUUID {
        return .bit16(0xFDEB)
    }

    /// Mannkind Corporation (`0xFDEC`)
    static var mannkind: BluetoothUUID {
        return .bit16(0xFDEC)
    }

    /// Pole Star (`0xFDED`)
    static var poleStar: BluetoothUUID {
        return .bit16(0xFDED)
    }

    /// Huawei Technologies Co., Ltd. (`0xFDEE`)
    static var huaweiTechnologies: BluetoothUUID {
        return .bit16(0xFDEE)
    }

    /// ART AND PROGRAM, INC. (`0xFDEF`)
    static var artAndProgram: BluetoothUUID {
        return .bit16(0xFDEF)
    }

    /// Google Inc. (`0xFDF0`)
    static var google: BluetoothUUID {
        return .bit16(0xFDF0)
    }

    /// LAMPLIGHT Co.,Ltd (`0xFDF1`)
    static var lamplight: BluetoothUUID {
        return .bit16(0xFDF1)
    }

    /// AMICCOM Electronics Corporation (`0xFDF2`)
    static var amiccomElectronics: BluetoothUUID {
        return .bit16(0xFDF2)
    }

    /// Amersports (`0xFDF3`)
    static var amersports: BluetoothUUID {
        return .bit16(0xFDF3)
    }

    /// O. E. M. Controls, Inc. (`0xFDF4`)
    static var oEMControls: BluetoothUUID {
        return .bit16(0xFDF4)
    }

    /// Milwaukee Electric Tools (`0xFDF5`)
    static var milwaukeeElectricTools: BluetoothUUID {
        return .bit16(0xFDF5)
    }

    /// AIAIAI ApS (`0xFDF6`)
    static var aiaiai: BluetoothUUID {
        return .bit16(0xFDF6)
    }

    /// HP Inc. (`0xFDF7`)
    static var hp: BluetoothUUID {
        return .bit16(0xFDF7)
    }

    /// Onvocal (`0xFDF8`)
    static var onvocal: BluetoothUUID {
        return .bit16(0xFDF8)
    }

    /// INIA (`0xFDF9`)
    static var inia: BluetoothUUID {
        return .bit16(0xFDF9)
    }

    /// Tandem Diabetes Care (`0xFDFA`)
    static var tandemDiabetesCare: BluetoothUUID {
        return .bit16(0xFDFA)
    }

    /// Tandem Diabetes Care (`0xFDFB`)
    static var tandemDiabetesCare2: BluetoothUUID {
        return .bit16(0xFDFB)
    }

    /// Optrel AG (`0xFDFC`)
    static var optrel: BluetoothUUID {
        return .bit16(0xFDFC)
    }

    /// RecursiveSoft Inc. (`0xFDFD`)
    static var recursivesoft: BluetoothUUID {
        return .bit16(0xFDFD)
    }

    /// ADHERIUM(NZ) LIMITED (`0xFDFE`)
    static var adheriumNzLimited: BluetoothUUID {
        return .bit16(0xFDFE)
    }

    /// OSRAM GmbH (`0xFDFF`)
    static var osram: BluetoothUUID {
        return .bit16(0xFDFF)
    }

    /// Amazon.com Services, Inc. (`0xFE00`)
    static var amazon: BluetoothUUID {
        return .bit16(0xFE00)
    }

    /// Duracell U.S. Operations Inc. (`0xFE01`)
    static var duracellUSOperations: BluetoothUUID {
        return .bit16(0xFE01)
    }

    /// Robert Bosch GmbH (`0xFE02`)
    static var robertBosch2: BluetoothUUID {
        return .bit16(0xFE02)
    }

    /// Amazon.com Services, Inc. (`0xFE03`)
    static var amazon2: BluetoothUUID {
        return .bit16(0xFE03)
    }

    /// OpenPath Security Inc (`0xFE04`)
    static var openpathSecurity: BluetoothUUID {
        return .bit16(0xFE04)
    }

    /// CORE Transport Technologies NZ Limited (`0xFE05`)
    static var coreTransportTechnologiesNz: BluetoothUUID {
        return .bit16(0xFE05)
    }

    /// Qualcomm Technologies, Inc. (`0xFE06`)
    static var qualcommTechnologies: BluetoothUUID {
        return .bit16(0xFE06)
    }

    /// Microsoft (`0xFE08`)
    static var microsoft: BluetoothUUID {
        return .bit16(0xFE08)
    }

    /// Pillsy, Inc. (`0xFE09`)
    static var pillsy: BluetoothUUID {
        return .bit16(0xFE09)
    }

    /// ruwido austria gmbh (`0xFE0A`)
    static var ruwidoAustria: BluetoothUUID {
        return .bit16(0xFE0A)
    }

    /// ruwido austria gmbh (`0xFE0B`)
    static var ruwidoAustria2: BluetoothUUID {
        return .bit16(0xFE0B)
    }

    /// Procter & Gamble (`0xFE0C`)
    static var procterGamble: BluetoothUUID {
        return .bit16(0xFE0C)
    }

    /// Procter & Gamble (`0xFE0D`)
    static var procterGamble2: BluetoothUUID {
        return .bit16(0xFE0D)
    }

    /// Setec Pty Ltd (`0xFE0E`)
    static var setecPty: BluetoothUUID {
        return .bit16(0xFE0E)
    }

    /// Philips Lighting B.V. (`0xFE0F`)
    static var philipsLighting: BluetoothUUID {
        return .bit16(0xFE0F)
    }

    /// Lapis Semiconductor Co., Ltd. (`0xFE10`)
    static var lapisSemiconductor: BluetoothUUID {
        return .bit16(0xFE10)
    }

    /// GMC-I Messtechnik GmbH (`0xFE11`)
    static var gmcIMesstechnik: BluetoothUUID {
        return .bit16(0xFE11)
    }

    /// M-Way Solutions GmbH (`0xFE12`)
    static var mWaySolutions: BluetoothUUID {
        return .bit16(0xFE12)
    }

    /// Apple Inc. (`0xFE13`)
    static var apple: BluetoothUUID {
        return .bit16(0xFE13)
    }

    /// Flextronics International USA Inc. (`0xFE14`)
    static var flextronicsInternationalUsa: BluetoothUUID {
        return .bit16(0xFE14)
    }

    /// Amazon.com Services, Inc. (`0xFE15`)
    static var amazon3: BluetoothUUID {
        return .bit16(0xFE15)
    }

    /// Footmarks, Inc. (`0xFE16`)
    static var footmarks: BluetoothUUID {
        return .bit16(0xFE16)
    }

    /// Telit Wireless Solutions GmbH (`0xFE17`)
    static var telitWirelessSolutions: BluetoothUUID {
        return .bit16(0xFE17)
    }

    /// Runtime, Inc. (`0xFE18`)
    static var runtime: BluetoothUUID {
        return .bit16(0xFE18)
    }

    /// Google Inc. (`0xFE19`)
    static var google2: BluetoothUUID {
        return .bit16(0xFE19)
    }

    /// Tyto Life LLC (`0xFE1A`)
    static var tytoLife: BluetoothUUID {
        return .bit16(0xFE1A)
    }

    /// Tyto Life LLC (`0xFE1B`)
    static var tytoLife2: BluetoothUUID {
        return .bit16(0xFE1B)
    }

    /// NetMedia, Inc. (`0xFE1C`)
    static var netmedia: BluetoothUUID {
        return .bit16(0xFE1C)
    }

    /// Illuminati Instrument Corporation (`0xFE1D`)
    static var illuminatiInstrument: BluetoothUUID {
        return .bit16(0xFE1D)
    }

    /// Smart Innovations Co., Ltd (`0xFE1E`)
    static var smartInnovations: BluetoothUUID {
        return .bit16(0xFE1E)
    }

    /// Garmin International, Inc. (`0xFE1F`)
    static var garminInternational: BluetoothUUID {
        return .bit16(0xFE1F)
    }

    /// Emerson (`0xFE20`)
    static var emerson: BluetoothUUID {
        return .bit16(0xFE20)
    }

    /// Bose Corporation (`0xFE21`)
    static var bose: BluetoothUUID {
        return .bit16(0xFE21)
    }

    /// Zoll Medical Corporation (`0xFE22`)
    static var zollMedical: BluetoothUUID {
        return .bit16(0xFE22)
    }

    /// Zoll Medical Corporation (`0xFE23`)
    static var zollMedical2: BluetoothUUID {
        return .bit16(0xFE23)
    }

    /// August Home Inc (`0xFE24`)
    static var augustHome: BluetoothUUID {
        return .bit16(0xFE24)
    }

    /// Apple, Inc. (`0xFE25`)
    static var apple2: BluetoothUUID {
        return .bit16(0xFE25)
    }

    /// Google Inc. (`0xFE26`)
    static var google3: BluetoothUUID {
        return .bit16(0xFE26)
    }

    /// Google Inc. (`0xFE27`)
    static var google4: BluetoothUUID {
        return .bit16(0xFE27)
    }

    /// Ayla Networks (`0xFE28`)
    static var aylaNetworks: BluetoothUUID {
        return .bit16(0xFE28)
    }

    /// Gibson Innovations (`0xFE29`)
    static var gibsonInnovations: BluetoothUUID {
        return .bit16(0xFE29)
    }

    /// DaisyWorks, Inc. (`0xFE2A`)
    static var daisyworks: BluetoothUUID {
        return .bit16(0xFE2A)
    }

    /// ITT Industries (`0xFE2B`)
    static var ittIndustries: BluetoothUUID {
        return .bit16(0xFE2B)
    }

    /// Google Inc. (`0xFE2C`)
    static var google5: BluetoothUUID {
        return .bit16(0xFE2C)
    }

    /// SMART INNOVATION Co.,Ltd (`0xFE2D`)
    static var smartInnovation: BluetoothUUID {
        return .bit16(0xFE2D)
    }

    /// ERi,Inc. (`0xFE2E`)
    static var eri: BluetoothUUID {
        return .bit16(0xFE2E)
    }

    /// CRESCO Wireless, Inc (`0xFE2F`)
    static var crescoWireless: BluetoothUUID {
        return .bit16(0xFE2F)
    }

    /// Volkswagen AG (`0xFE30`)
    static var volkswagen: BluetoothUUID {
        return .bit16(0xFE30)
    }

    /// Volkswagen AG (`0xFE31`)
    static var volkswagen2: BluetoothUUID {
        return .bit16(0xFE31)
    }

    /// Pro-Mark, Inc. (`0xFE32`)
    static var proMark: BluetoothUUID {
        return .bit16(0xFE32)
    }

    /// CHIPOLO d.o.o. (`0xFE33`)
    static var chipolo: BluetoothUUID {
        return .bit16(0xFE33)
    }

    /// SmallLoop LLC (`0xFE34`)
    static var smallloop: BluetoothUUID {
        return .bit16(0xFE34)
    }

    /// HUAWEI Technologies Co., Ltd (`0xFE35`)
    static var huaweiTechnologies2: BluetoothUUID {
        return .bit16(0xFE35)
    }

    /// HUAWEI Technologies Co., Ltd (`0xFE36`)
    static var huaweiTechnologies3: BluetoothUUID {
        return .bit16(0xFE36)
    }

    /// Spaceek LTD (`0xFE37`)
    static var spaceek: BluetoothUUID {
        return .bit16(0xFE37)
    }

    /// Spaceek LTD (`0xFE38`)
    static var spaceek2: BluetoothUUID {
        return .bit16(0xFE38)
    }

    /// TTS Tooltechnic Systems AG & Co. (`0xFE39`)
    static var ttsTooltechnicSystems: BluetoothUUID {
        return .bit16(0xFE39)
    }

    /// TTS Tooltechnic Systems AG & Co. (`0xFE3A`)
    static var ttsTooltechnicSystems2: BluetoothUUID {
        return .bit16(0xFE3A)
    }

    /// Dolby Laboratories (`0xFE3B`)
    static var dolbyLaboratories: BluetoothUUID {
        return .bit16(0xFE3B)
    }

    /// Alibaba (`0xFE3C`)
    static var alibaba: BluetoothUUID {
        return .bit16(0xFE3C)
    }

    /// BD Medical (`0xFE3D`)
    static var bdMedical: BluetoothUUID {
        return .bit16(0xFE3D)
    }

    /// BD Medical (`0xFE3E`)
    static var bdMedical2: BluetoothUUID {
        return .bit16(0xFE3E)
    }

    /// Friday Labs Limited (`0xFE3F`)
    static var fridayLabs: BluetoothUUID {
        return .bit16(0xFE3F)
    }

    /// Inugo Systems Limited (`0xFE40`)
    static var inugoSystems: BluetoothUUID {
        return .bit16(0xFE40)
    }

    /// Inugo Systems Limited (`0xFE41`)
    static var inugoSystems2: BluetoothUUID {
        return .bit16(0xFE41)
    }

    /// Nets A/S (`0xFE42`)
    static var nets: BluetoothUUID {
        return .bit16(0xFE42)
    }

    /// Andreas Stihl AG & Co. KG (`0xFE43`)
    static var andreasStihl: BluetoothUUID {
        return .bit16(0xFE43)
    }

    /// SK Telecom (`0xFE44`)
    static var skTelecom: BluetoothUUID {
        return .bit16(0xFE44)
    }

    /// Snapchat Inc (`0xFE45`)
    static var snapchat: BluetoothUUID {
        return .bit16(0xFE45)
    }

    /// B&O Play A/S (`0xFE46`)
    static var bOPlay: BluetoothUUID {
        return .bit16(0xFE46)
    }

    /// General Motors (`0xFE47`)
    static var generalMotors: BluetoothUUID {
        return .bit16(0xFE47)
    }

    /// General Motors (`0xFE48`)
    static var generalMotors2: BluetoothUUID {
        return .bit16(0xFE48)
    }

    /// SenionLab AB (`0xFE49`)
    static var senionlab: BluetoothUUID {
        return .bit16(0xFE49)
    }

    /// OMRON HEALTHCARE Co., Ltd. (`0xFE4A`)
    static var omronHealthcare: BluetoothUUID {
        return .bit16(0xFE4A)
    }

    /// Philips Lighting B.V. (`0xFE4B`)
    static var philipsLighting2: BluetoothUUID {
        return .bit16(0xFE4B)
    }

    /// Volkswagen AG (`0xFE4C`)
    static var volkswagen3: BluetoothUUID {
        return .bit16(0xFE4C)
    }

    /// Casambi Technologies Oy (`0xFE4D`)
    static var casambiTechnologies: BluetoothUUID {
        return .bit16(0xFE4D)
    }

    /// NTT docomo (`0xFE4E`)
    static var nttDocomo: BluetoothUUID {
        return .bit16(0xFE4E)
    }

    /// Molekule, Inc. (`0xFE4F`)
    static var molekule: BluetoothUUID {
        return .bit16(0xFE4F)
    }

    /// Google Inc. (`0xFE50`)
    static var google6: BluetoothUUID {
        return .bit16(0xFE50)
    }

    /// SRAM (`0xFE51`)
    static var sram: BluetoothUUID {
        return .bit16(0xFE51)
    }

    /// SetPoint Medical (`0xFE52`)
    static var setpointMedical: BluetoothUUID {
        return .bit16(0xFE52)
    }

    /// 3M (`0xFE53`)
    static var uuid3M: BluetoothUUID {
        return .bit16(0xFE53)
    }

    /// Motiv, Inc. (`0xFE54`)
    static var motiv: BluetoothUUID {
        return .bit16(0xFE54)
    }

    /// Google Inc. (`0xFE55`)
    static var google7: BluetoothUUID {
        return .bit16(0xFE55)
    }

    /// Google Inc. (`0xFE56`)
    static var google8: BluetoothUUID {
        return .bit16(0xFE56)
    }

    /// Dotted Labs (`0xFE57`)
    static var dottedLabs: BluetoothUUID {
        return .bit16(0xFE57)
    }

    /// Nordic Semiconductor ASA (`0xFE58`)
    static var nordicSemiconductor: BluetoothUUID {
        return .bit16(0xFE58)
    }

    /// Nordic Semiconductor ASA (`0xFE59`)
    static var nordicSemiconductor2: BluetoothUUID {
        return .bit16(0xFE59)
    }

    /// Chronologics Corporation (`0xFE5A`)
    static var chronologics: BluetoothUUID {
        return .bit16(0xFE5A)
    }

    /// GT-tronics HK Ltd (`0xFE5B`)
    static var gtTronicsHk: BluetoothUUID {
        return .bit16(0xFE5B)
    }

    /// million hunters GmbH (`0xFE5C`)
    static var millionHunters: BluetoothUUID {
        return .bit16(0xFE5C)
    }

    /// Grundfos A/S (`0xFE5D`)
    static var grundfos: BluetoothUUID {
        return .bit16(0xFE5D)
    }

    /// Plastc Corporation (`0xFE5E`)
    static var plastc: BluetoothUUID {
        return .bit16(0xFE5E)
    }

    /// Eyefi, Inc. (`0xFE5F`)
    static var eyefi: BluetoothUUID {
        return .bit16(0xFE5F)
    }

    /// Lierda Science & Technology Group Co., Ltd. (`0xFE60`)
    static var lierdaScienceTechnologyGroup: BluetoothUUID {
        return .bit16(0xFE60)
    }

    /// Logitech International SA (`0xFE61`)
    static var logitechInternational: BluetoothUUID {
        return .bit16(0xFE61)
    }

    /// Indagem Tech LLC (`0xFE62`)
    static var indagemTech: BluetoothUUID {
        return .bit16(0xFE62)
    }

    /// Connected Yard, Inc. (`0xFE63`)
    static var connectedYard: BluetoothUUID {
        return .bit16(0xFE63)
    }

    /// Siemens AG (`0xFE64`)
    static var siemens: BluetoothUUID {
        return .bit16(0xFE64)
    }

    /// CHIPOLO d.o.o. (`0xFE65`)
    static var chipolo2: BluetoothUUID {
        return .bit16(0xFE65)
    }

    /// Intel Corporation (`0xFE66`)
    static var intel: BluetoothUUID {
        return .bit16(0xFE66)
    }

    /// Lab Sensor Solutions (`0xFE67`)
    static var labSensorSolutions: BluetoothUUID {
        return .bit16(0xFE67)
    }

    /// Qualcomm Life Inc (`0xFE68`)
    static var qualcommLife: BluetoothUUID {
        return .bit16(0xFE68)
    }

    /// Qualcomm Life Inc (`0xFE69`)
    static var qualcommLife2: BluetoothUUID {
        return .bit16(0xFE69)
    }

    /// Kontakt Micro-Location Sp. z o.o. (`0xFE6A`)
    static var kontaktMicroLocation: BluetoothUUID {
        return .bit16(0xFE6A)
    }

    /// TASER International, Inc. (`0xFE6B`)
    static var taserInternational: BluetoothUUID {
        return .bit16(0xFE6B)
    }

    /// TASER International, Inc. (`0xFE6C`)
    static var taserInternational2: BluetoothUUID {
        return .bit16(0xFE6C)
    }

    /// The University of Tokyo (`0xFE6D`)
    static var universityOfTokyo: BluetoothUUID {
        return .bit16(0xFE6D)
    }

    /// The University of Tokyo (`0xFE6E`)
    static var universityOfTokyo2: BluetoothUUID {
        return .bit16(0xFE6E)
    }

    /// LINE Corporation (`0xFE6F`)
    static var line: BluetoothUUID {
        return .bit16(0xFE6F)
    }

    /// Beijing Jingdong Century Trading Co., Ltd. (`0xFE70`)
    static var beijingJingdongCenturyTrading: BluetoothUUID {
        return .bit16(0xFE70)
    }

    /// Plume Design Inc (`0xFE71`)
    static var plumeDesign: BluetoothUUID {
        return .bit16(0xFE71)
    }

    /// St. Jude Medical, Inc. (`0xFE72`)
    static var stJudeMedical: BluetoothUUID {
        return .bit16(0xFE72)
    }

    /// St. Jude Medical, Inc. (`0xFE73`)
    static var stJudeMedical2: BluetoothUUID {
        return .bit16(0xFE73)
    }

    /// unwire (`0xFE74`)
    static var unwire: BluetoothUUID {
        return .bit16(0xFE74)
    }

    /// TangoMe (`0xFE75`)
    static var tangome: BluetoothUUID {
        return .bit16(0xFE75)
    }

    /// TangoMe (`0xFE76`)
    static var tangome2: BluetoothUUID {
        return .bit16(0xFE76)
    }

    /// Hewlett-Packard Company (`0xFE77`)
    static var hewlettPackardCompany: BluetoothUUID {
        return .bit16(0xFE77)
    }

    /// Hewlett-Packard Company (`0xFE78`)
    static var hewlettPackardCompany2: BluetoothUUID {
        return .bit16(0xFE78)
    }

    /// Zebra Technologies (`0xFE79`)
    static var zebraTechnologies: BluetoothUUID {
        return .bit16(0xFE79)
    }

    /// Bragi GmbH (`0xFE7A`)
    static var bragi: BluetoothUUID {
        return .bit16(0xFE7A)
    }

    /// Orion Labs, Inc. (`0xFE7B`)
    static var orionLabs: BluetoothUUID {
        return .bit16(0xFE7B)
    }

    /// Stollmann E+V GmbH (`0xFE7C`)
    static var stollmannEV: BluetoothUUID {
        return .bit16(0xFE7C)
    }

    /// Aterica Health Inc. (`0xFE7D`)
    static var atericaHealth: BluetoothUUID {
        return .bit16(0xFE7D)
    }

    /// Awear Solutions Ltd (`0xFE7E`)
    static var awearSolutions: BluetoothUUID {
        return .bit16(0xFE7E)
    }

    /// Doppler Lab (`0xFE7F`)
    static var dopplerLab: BluetoothUUID {
        return .bit16(0xFE7F)
    }

    /// Doppler Lab (`0xFE80`)
    static var dopplerLab2: BluetoothUUID {
        return .bit16(0xFE80)
    }

    /// Medtronic Inc. (`0xFE81`)
    static var medtronic: BluetoothUUID {
        return .bit16(0xFE81)
    }

    /// Medtronic Inc. (`0xFE82`)
    static var medtronic2: BluetoothUUID {
        return .bit16(0xFE82)
    }

    /// Blue Bite (`0xFE83`)
    static var blueBite: BluetoothUUID {
        return .bit16(0xFE83)
    }

    /// RF Digital Corp (`0xFE84`)
    static var rfDigital: BluetoothUUID {
        return .bit16(0xFE84)
    }

    /// RF Digital Corp (`0xFE85`)
    static var rfDigital2: BluetoothUUID {
        return .bit16(0xFE85)
    }

    /// HUAWEI Technologies Co., Ltd. ( 华为技术有限公司 ) (`0xFE86`)
    static var huaweiTechnologies华为技术有限公司: BluetoothUUID {
        return .bit16(0xFE86)
    }

    /// Qingdao Yeelink Information Technology Co., Ltd. ( 青岛亿联客信息技术有限公司 ) (`0xFE87`)
    static var qingdaoYeelinkInformationTechnology青岛亿联客信息技术有限公司: BluetoothUUID {
        return .bit16(0xFE87)
    }

    /// SALTO SYSTEMS S.L. (`0xFE88`)
    static var saltoSystems: BluetoothUUID {
        return .bit16(0xFE88)
    }

    /// B&O Play A/S (`0xFE89`)
    static var bOPlay2: BluetoothUUID {
        return .bit16(0xFE89)
    }

    /// Apple, Inc. (`0xFE8A`)
    static var apple3: BluetoothUUID {
        return .bit16(0xFE8A)
    }

    /// Apple, Inc. (`0xFE8B`)
    static var apple4: BluetoothUUID {
        return .bit16(0xFE8B)
    }

    /// TRON Forum (`0xFE8C`)
    static var tronForum: BluetoothUUID {
        return .bit16(0xFE8C)
    }

    /// Interaxon Inc. (`0xFE8D`)
    static var interaxon: BluetoothUUID {
        return .bit16(0xFE8D)
    }

    /// ARM Ltd (`0xFE8E`)
    static var arm: BluetoothUUID {
        return .bit16(0xFE8E)
    }

    /// CSR (`0xFE8F`)
    static var csr: BluetoothUUID {
        return .bit16(0xFE8F)
    }

    /// JUMA (`0xFE90`)
    static var juma: BluetoothUUID {
        return .bit16(0xFE90)
    }

    /// Shanghai Imilab Technology Co.,Ltd (`0xFE91`)
    static var shanghaiImilabTechnology: BluetoothUUID {
        return .bit16(0xFE91)
    }

    /// Jarden Safety & Security (`0xFE92`)
    static var jardenSafetySecurity: BluetoothUUID {
        return .bit16(0xFE92)
    }

    /// OttoQ Inc. (`0xFE93`)
    static var ottoq: BluetoothUUID {
        return .bit16(0xFE93)
    }

    /// OttoQ Inc. (`0xFE94`)
    static var ottoq2: BluetoothUUID {
        return .bit16(0xFE94)
    }

    /// Xiaomi Inc. (`0xFE95`)
    static var xiaomi: BluetoothUUID {
        return .bit16(0xFE95)
    }

    /// Tesla Motor Inc. (`0xFE96`)
    static var teslaMotor: BluetoothUUID {
        return .bit16(0xFE96)
    }

    /// Tesla Motor Inc. (`0xFE97`)
    static var teslaMotor2: BluetoothUUID {
        return .bit16(0xFE97)
    }

    /// Currant, Inc. (`0xFE98`)
    static var currant: BluetoothUUID {
        return .bit16(0xFE98)
    }

    /// Currant, Inc. (`0xFE99`)
    static var currant2: BluetoothUUID {
        return .bit16(0xFE99)
    }

    /// Estimote (`0xFE9A`)
    static var estimote: BluetoothUUID {
        return .bit16(0xFE9A)
    }

    /// Samsara Networks, Inc (`0xFE9B`)
    static var samsaraNetworks: BluetoothUUID {
        return .bit16(0xFE9B)
    }

    /// GSI Laboratories, Inc. (`0xFE9C`)
    static var gsiLaboratories: BluetoothUUID {
        return .bit16(0xFE9C)
    }

    /// Mobiquity Networks Inc (`0xFE9D`)
    static var mobiquityNetworks: BluetoothUUID {
        return .bit16(0xFE9D)
    }

    /// Dialog Semiconductor B.V. (`0xFE9E`)
    static var dialogSemiconductor: BluetoothUUID {
        return .bit16(0xFE9E)
    }

    /// Google Inc. (`0xFE9F`)
    static var google9: BluetoothUUID {
        return .bit16(0xFE9F)
    }

    /// Google Inc. (`0xFEA0`)
    static var google10: BluetoothUUID {
        return .bit16(0xFEA0)
    }

    /// Intrepid Control Systems, Inc. (`0xFEA1`)
    static var intrepidControlSystems: BluetoothUUID {
        return .bit16(0xFEA1)
    }

    /// Intrepid Control Systems, Inc. (`0xFEA2`)
    static var intrepidControlSystems2: BluetoothUUID {
        return .bit16(0xFEA2)
    }

    /// ITT Industries (`0xFEA3`)
    static var ittIndustries2: BluetoothUUID {
        return .bit16(0xFEA3)
    }

    /// Paxton Access Ltd (`0xFEA4`)
    static var paxtonAccess: BluetoothUUID {
        return .bit16(0xFEA4)
    }

    /// GoPro, Inc. (`0xFEA5`)
    static var gopro: BluetoothUUID {
        return .bit16(0xFEA5)
    }

    /// GoPro, Inc. (`0xFEA6`)
    static var gopro2: BluetoothUUID {
        return .bit16(0xFEA6)
    }

    /// UTC Fire and Security (`0xFEA7`)
    static var utcFireAndSecurity: BluetoothUUID {
        return .bit16(0xFEA7)
    }

    /// Savant Systems LLC (`0xFEA8`)
    static var savantSystems: BluetoothUUID {
        return .bit16(0xFEA8)
    }

    /// Savant Systems LLC (`0xFEA9`)
    static var savantSystems2: BluetoothUUID {
        return .bit16(0xFEA9)
    }

    /// Google Inc. (`0xFEAA`)
    static var google11: BluetoothUUID {
        return .bit16(0xFEAA)
    }

    /// Nokia Corporation (`0xFEAB`)
    static var nokia: BluetoothUUID {
        return .bit16(0xFEAB)
    }

    /// Nokia Corporation (`0xFEAC`)
    static var nokia2: BluetoothUUID {
        return .bit16(0xFEAC)
    }

    /// Nokia Corporation (`0xFEAD`)
    static var nokia3: BluetoothUUID {
        return .bit16(0xFEAD)
    }

    /// Nokia Corporation (`0xFEAE`)
    static var nokia4: BluetoothUUID {
        return .bit16(0xFEAE)
    }

    /// Nest Labs Inc. (`0xFEAF`)
    static var nestLabs: BluetoothUUID {
        return .bit16(0xFEAF)
    }

    /// Nest Labs Inc. (`0xFEB0`)
    static var nestLabs2: BluetoothUUID {
        return .bit16(0xFEB0)
    }

    /// Electronics Tomorrow Limited (`0xFEB1`)
    static var electronicsTomorrow: BluetoothUUID {
        return .bit16(0xFEB1)
    }

    /// Microsoft Corporation (`0xFEB2`)
    static var microsoft2: BluetoothUUID {
        return .bit16(0xFEB2)
    }

    /// Taobao (`0xFEB3`)
    static var taobao: BluetoothUUID {
        return .bit16(0xFEB3)
    }

    /// WiSilica Inc. (`0xFEB4`)
    static var wisilica: BluetoothUUID {
        return .bit16(0xFEB4)
    }

    /// WiSilica Inc. (`0xFEB5`)
    static var wisilica2: BluetoothUUID {
        return .bit16(0xFEB5)
    }

    /// Vencer Co, Ltd (`0xFEB6`)
    static var vencerCo: BluetoothUUID {
        return .bit16(0xFEB6)
    }

    /// Facebook, Inc. (`0xFEB7`)
    static var facebook: BluetoothUUID {
        return .bit16(0xFEB7)
    }

    /// Facebook, Inc. (`0xFEB8`)
    static var facebook2: BluetoothUUID {
        return .bit16(0xFEB8)
    }

    /// LG Electronics (`0xFEB9`)
    static var lgElectronics: BluetoothUUID {
        return .bit16(0xFEB9)
    }

    /// Tencent Holdings Limited (`0xFEBA`)
    static var tencentHoldings: BluetoothUUID {
        return .bit16(0xFEBA)
    }

    /// adafruit industries (`0xFEBB`)
    static var adafruitIndustries: BluetoothUUID {
        return .bit16(0xFEBB)
    }

    /// Dexcom, Inc. (`0xFEBC`)
    static var dexcom: BluetoothUUID {
        return .bit16(0xFEBC)
    }

    /// Clover Network, Inc. (`0xFEBD`)
    static var cloverNetwork: BluetoothUUID {
        return .bit16(0xFEBD)
    }

    /// Bose Corporation (`0xFEBE`)
    static var bose2: BluetoothUUID {
        return .bit16(0xFEBE)
    }

    /// Nod, Inc. (`0xFEBF`)
    static var nod: BluetoothUUID {
        return .bit16(0xFEBF)
    }

    /// KDDI Corporation (`0xFEC0`)
    static var kddi: BluetoothUUID {
        return .bit16(0xFEC0)
    }

    /// KDDI Corporation (`0xFEC1`)
    static var kddi2: BluetoothUUID {
        return .bit16(0xFEC1)
    }

    /// Blue Spark Technologies, Inc. (`0xFEC2`)
    static var blueSparkTechnologies: BluetoothUUID {
        return .bit16(0xFEC2)
    }

    /// 360fly, Inc. (`0xFEC3`)
    static var uuid360Fly: BluetoothUUID {
        return .bit16(0xFEC3)
    }

    /// PLUS Location Systems (`0xFEC4`)
    static var plusLocationSystems: BluetoothUUID {
        return .bit16(0xFEC4)
    }

    /// Realtek Semiconductor Corp. (`0xFEC5`)
    static var realtekSemiconductor: BluetoothUUID {
        return .bit16(0xFEC5)
    }

    /// Kocomojo, LLC (`0xFEC6`)
    static var kocomojo: BluetoothUUID {
        return .bit16(0xFEC6)
    }

    /// Apple, Inc. (`0xFEC7`)
    static var apple5: BluetoothUUID {
        return .bit16(0xFEC7)
    }

    /// Apple, Inc. (`0xFEC8`)
    static var apple6: BluetoothUUID {
        return .bit16(0xFEC8)
    }

    /// Apple, Inc. (`0xFEC9`)
    static var apple7: BluetoothUUID {
        return .bit16(0xFEC9)
    }

    /// Apple, Inc. (`0xFECA`)
    static var apple8: BluetoothUUID {
        return .bit16(0xFECA)
    }

    /// Apple, Inc. (`0xFECB`)
    static var apple9: BluetoothUUID {
        return .bit16(0xFECB)
    }

    /// Apple, Inc. (`0xFECC`)
    static var apple10: BluetoothUUID {
        return .bit16(0xFECC)
    }

    /// Apple, Inc. (`0xFECD`)
    static var apple11: BluetoothUUID {
        return .bit16(0xFECD)
    }

    /// Apple, Inc. (`0xFECE`)
    static var apple12: BluetoothUUID {
        return .bit16(0xFECE)
    }

    /// Apple, Inc. (`0xFECF`)
    static var apple13: BluetoothUUID {
        return .bit16(0xFECF)
    }

    /// Apple, Inc. (`0xFED0`)
    static var apple14: BluetoothUUID {
        return .bit16(0xFED0)
    }

    /// Apple, Inc. (`0xFED1`)
    static var apple15: BluetoothUUID {
        return .bit16(0xFED1)
    }

    /// Apple, Inc. (`0xFED2`)
    static var apple16: BluetoothUUID {
        return .bit16(0xFED2)
    }

    /// Apple, Inc. (`0xFED3`)
    static var apple17: BluetoothUUID {
        return .bit16(0xFED3)
    }

    /// Apple, Inc. (`0xFED4`)
    static var apple18: BluetoothUUID {
        return .bit16(0xFED4)
    }

    /// Plantronics Inc. (`0xFED5`)
    static var plantronics: BluetoothUUID {
        return .bit16(0xFED5)
    }

    /// Broadcom Corporation (`0xFED6`)
    static var broadcom: BluetoothUUID {
        return .bit16(0xFED6)
    }

    /// Broadcom Corporation (`0xFED7`)
    static var broadcom2: BluetoothUUID {
        return .bit16(0xFED7)
    }

    /// Google Inc. (`0xFED8`)
    static var google12: BluetoothUUID {
        return .bit16(0xFED8)
    }

    /// Pebble Technology Corporation (`0xFED9`)
    static var pebbleTechnology: BluetoothUUID {
        return .bit16(0xFED9)
    }

    /// ISSC Technologies Corporation (`0xFEDA`)
    static var isscTechnologies: BluetoothUUID {
        return .bit16(0xFEDA)
    }

    /// Perka, Inc. (`0xFEDB`)
    static var perka: BluetoothUUID {
        return .bit16(0xFEDB)
    }

    /// Jawbone (`0xFEDC`)
    static var jawbone: BluetoothUUID {
        return .bit16(0xFEDC)
    }

    /// Jawbone (`0xFEDD`)
    static var jawbone2: BluetoothUUID {
        return .bit16(0xFEDD)
    }

    /// Coin, Inc. (`0xFEDE`)
    static var coin: BluetoothUUID {
        return .bit16(0xFEDE)
    }

    /// Design SHIFT (`0xFEDF`)
    static var designShift: BluetoothUUID {
        return .bit16(0xFEDF)
    }

    /// Anhui Huami Information Technology Co. (`0xFEE0`)
    static var anhuiHuamiInformationTechnology: BluetoothUUID {
        return .bit16(0xFEE0)
    }

    /// Anhui Huami Information Technology Co. (`0xFEE1`)
    static var anhuiHuamiInformationTechnology2: BluetoothUUID {
        return .bit16(0xFEE1)
    }

    /// Anki, Inc. (`0xFEE2`)
    static var anki: BluetoothUUID {
        return .bit16(0xFEE2)
    }

    /// Anki, Inc. (`0xFEE3`)
    static var anki2: BluetoothUUID {
        return .bit16(0xFEE3)
    }

    /// Nordic Semiconductor ASA (`0xFEE4`)
    static var nordicSemiconductor3: BluetoothUUID {
        return .bit16(0xFEE4)
    }

    /// Nordic Semiconductor ASA (`0xFEE5`)
    static var nordicSemiconductor4: BluetoothUUID {
        return .bit16(0xFEE5)
    }

    /// Silvair, Inc. (`0xFEE6`)
    static var silvair: BluetoothUUID {
        return .bit16(0xFEE6)
    }

    /// Tencent Holdings Limited (`0xFEE7`)
    static var tencentHoldings2: BluetoothUUID {
        return .bit16(0xFEE7)
    }

    /// Quintic Corp. (`0xFEE8`)
    static var quintic: BluetoothUUID {
        return .bit16(0xFEE8)
    }

    /// Quintic Corp. (`0xFEE9`)
    static var quintic2: BluetoothUUID {
        return .bit16(0xFEE9)
    }

    /// Swirl Networks, Inc. (`0xFEEA`)
    static var swirlNetworks: BluetoothUUID {
        return .bit16(0xFEEA)
    }

    /// Swirl Networks, Inc. (`0xFEEB`)
    static var swirlNetworks2: BluetoothUUID {
        return .bit16(0xFEEB)
    }

    /// Tile, Inc. (`0xFEEC`)
    static var tile: BluetoothUUID {
        return .bit16(0xFEEC)
    }

    /// Tile, Inc. (`0xFEED`)
    static var tile2: BluetoothUUID {
        return .bit16(0xFEED)
    }

    /// Polar Electro Oy (`0xFEEE`)
    static var polarElectro: BluetoothUUID {
        return .bit16(0xFEEE)
    }

    /// Polar Electro Oy (`0xFEEF`)
    static var polarElectro2: BluetoothUUID {
        return .bit16(0xFEEF)
    }

    /// Intel (`0xFEF0`)
    static var intel2: BluetoothUUID {
        return .bit16(0xFEF0)
    }

    /// CSR (`0xFEF1`)
    static var csr2: BluetoothUUID {
        return .bit16(0xFEF1)
    }

    /// CSR (`0xFEF2`)
    static var csr3: BluetoothUUID {
        return .bit16(0xFEF2)
    }

    /// Google Inc. (`0xFEF3`)
    static var google13: BluetoothUUID {
        return .bit16(0xFEF3)
    }

    /// Google Inc. (`0xFEF4`)
    static var google14: BluetoothUUID {
        return .bit16(0xFEF4)
    }

    /// Dialog Semiconductor GmbH (`0xFEF5`)
    static var dialogSemiconductor2: BluetoothUUID {
        return .bit16(0xFEF5)
    }

    /// Wicentric, Inc. (`0xFEF6`)
    static var wicentric: BluetoothUUID {
        return .bit16(0xFEF6)
    }

    /// Aplix Corporation (`0xFEF7`)
    static var aplix: BluetoothUUID {
        return .bit16(0xFEF7)
    }

    /// Aplix Corporation (`0xFEF8`)
    static var aplix2: BluetoothUUID {
        return .bit16(0xFEF8)
    }

    /// PayPal, Inc. (`0xFEF9`)
    static var paypal: BluetoothUUID {
        return .bit16(0xFEF9)
    }

    /// PayPal, Inc. (`0xFEFA`)
    static var paypal2: BluetoothUUID {
        return .bit16(0xFEFA)
    }

    /// Telit Wireless Solutions (`0xFEFB`)
    static var telitWirelessSolutions2: BluetoothUUID {
        return .bit16(0xFEFB)
    }

    /// Gimbal, Inc. (`0xFEFC`)
    static var gimbal: BluetoothUUID {
        return .bit16(0xFEFC)
    }

    /// Gimbal, Inc. (`0xFEFD`)
    static var gimbal2: BluetoothUUID {
        return .bit16(0xFEFD)
    }

    /// GN ReSound A/S (`0xFEFE`)
    static var gnResound: BluetoothUUID {
        return .bit16(0xFEFE)
    }

    /// GN Netcom (`0xFEFF`)
    static var gnNetcom: BluetoothUUID {
        return .bit16(0xFEFF)
    }

    /// Fast IDentity Online Alliance (FIDO) (`0xFFFD`)
    static var fastIdentityOnlineAllianceFido: BluetoothUUID {
        return .bit16(0xFFFD)
    }

    /// Alliance for Wireless Power (A4WP) (`0xFFFE`)
    static var allianceForWirelessPowerA4Wp: BluetoothUUID {
        return .bit16(0xFFFE)
    }

}
