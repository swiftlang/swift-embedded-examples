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

#if (swift(<5.6) || !SWIFTPM_ENABLE_PLUGINS) && !os(WASI)
public extension CompanyIdentifier {

    /// Ericsson AB (`0`)
    @_alwaysEmitIntoClient
    static var ericsson: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 0)
    }

    /// Nokia Mobile Phones (`1`)
    @_alwaysEmitIntoClient
    static var nokiaMobilePhones: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1)
    }

    /// Intel Corp. (`2`)
    @_alwaysEmitIntoClient
    static var intel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2)
    }

    /// IBM Corp. (`3`)
    @_alwaysEmitIntoClient
    static var ibm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3)
    }

    /// Toshiba Corp. (`4`)
    @_alwaysEmitIntoClient
    static var toshiba: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 4)
    }

    /// 3Com (`5`)
    @_alwaysEmitIntoClient
    static var company3Com: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 5)
    }

    /// Microsoft (`6`)
    @_alwaysEmitIntoClient
    static var microsoft: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 6)
    }

    /// Lucent (`7`)
    @_alwaysEmitIntoClient
    static var lucent: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 7)
    }

    /// Motorola (`8`)
    @_alwaysEmitIntoClient
    static var motorola: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 8)
    }

    /// Infineon Technologies AG (`9`)
    @_alwaysEmitIntoClient
    static var infineonTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 9)
    }

    /// Qualcomm Technologies International, Ltd. (QTIL) (`10`)
    @_alwaysEmitIntoClient
    static var qualcommTechnologiesInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 10)
    }

    /// Silicon Wave (`11`)
    @_alwaysEmitIntoClient
    static var siliconWave: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 11)
    }

    /// Digianswer A/S (`12`)
    @_alwaysEmitIntoClient
    static var digianswer: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 12)
    }

    /// Texas Instruments Inc. (`13`)
    @_alwaysEmitIntoClient
    static var texasInstruments: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 13)
    }

    /// Parthus Technologies Inc. (`14`)
    @_alwaysEmitIntoClient
    static var parthusTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 14)
    }

    /// Broadcom Corporation (`15`)
    @_alwaysEmitIntoClient
    static var broadcom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 15)
    }

    /// Mitel Semiconductor (`16`)
    @_alwaysEmitIntoClient
    static var mitelSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 16)
    }

    /// Widcomm, Inc. (`17`)
    @_alwaysEmitIntoClient
    static var widcomm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 17)
    }

    /// Zeevo, Inc. (`18`)
    @_alwaysEmitIntoClient
    static var zeevo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 18)
    }

    /// Atmel Corporation (`19`)
    @_alwaysEmitIntoClient
    static var atmel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 19)
    }

    /// Mitsubishi Electric Corporation (`20`)
    @_alwaysEmitIntoClient
    static var mitsubishiElectric: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 20)
    }

    /// RTX A/S (`21`)
    @_alwaysEmitIntoClient
    static var rtx: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 21)
    }

    /// KC Technology Inc. (`22`)
    @_alwaysEmitIntoClient
    static var kcTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 22)
    }

    /// Newlogic (`23`)
    @_alwaysEmitIntoClient
    static var newlogic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 23)
    }

    /// Transilica, Inc. (`24`)
    @_alwaysEmitIntoClient
    static var transilica: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 24)
    }

    /// Rohde & Schwarz GmbH & Co. KG (`25`)
    @_alwaysEmitIntoClient
    static var rohdeSchwarz: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 25)
    }

    /// TTPCom Limited (`26`)
    @_alwaysEmitIntoClient
    static var ttpcom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 26)
    }

    /// Signia Technologies, Inc. (`27`)
    @_alwaysEmitIntoClient
    static var signiaTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 27)
    }

    /// Conexant Systems Inc. (`28`)
    @_alwaysEmitIntoClient
    static var conexantSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 28)
    }

    /// Qualcomm (`29`)
    @_alwaysEmitIntoClient
    static var qualcomm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 29)
    }

    /// Inventel (`30`)
    @_alwaysEmitIntoClient
    static var inventel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 30)
    }

    /// AVM Berlin (`31`)
    @_alwaysEmitIntoClient
    static var avmBerlin: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 31)
    }

    /// BandSpeed, Inc. (`32`)
    @_alwaysEmitIntoClient
    static var bandspeed: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 32)
    }

    /// Mansella Ltd (`33`)
    @_alwaysEmitIntoClient
    static var mansella: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 33)
    }

    /// NEC Corporation (`34`)
    @_alwaysEmitIntoClient
    static var nec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 34)
    }

    /// WavePlus Technology Co., Ltd. (`35`)
    @_alwaysEmitIntoClient
    static var waveplusTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 35)
    }

    /// Alcatel (`36`)
    @_alwaysEmitIntoClient
    static var alcatel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 36)
    }

    /// NXP B.V. (`37`)
    @_alwaysEmitIntoClient
    static var nxp: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 37)
    }

    /// C Technologies (`38`)
    @_alwaysEmitIntoClient
    static var cTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 38)
    }

    /// Open Interface (`39`)
    @_alwaysEmitIntoClient
    static var openInterface: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 39)
    }

    /// R F Micro Devices (`40`)
    @_alwaysEmitIntoClient
    static var rFMicroDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 40)
    }

    /// Hitachi Ltd (`41`)
    @_alwaysEmitIntoClient
    static var hitachi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 41)
    }

    /// Symbol Technologies, Inc. (`42`)
    @_alwaysEmitIntoClient
    static var symbolTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 42)
    }

    /// Tenovis (`43`)
    @_alwaysEmitIntoClient
    static var tenovis: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 43)
    }

    /// Macronix International Co. Ltd. (`44`)
    @_alwaysEmitIntoClient
    static var macronixInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 44)
    }

    /// GCT Semiconductor (`45`)
    @_alwaysEmitIntoClient
    static var gctSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 45)
    }

    /// Norwood Systems (`46`)
    @_alwaysEmitIntoClient
    static var norwoodSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 46)
    }

    /// MewTel Technology Inc. (`47`)
    @_alwaysEmitIntoClient
    static var mewtelTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 47)
    }

    /// ST Microelectronics (`48`)
    @_alwaysEmitIntoClient
    static var stMicroelectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 48)
    }

    /// Synopsys, Inc. (`49`)
    @_alwaysEmitIntoClient
    static var synopsys: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 49)
    }

    /// Red-M (Communications) Ltd (`50`)
    @_alwaysEmitIntoClient
    static var redMCommunications: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 50)
    }

    /// Commil Ltd (`51`)
    @_alwaysEmitIntoClient
    static var commil: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 51)
    }

    /// Computer Access Technology Corporation (CATC) (`52`)
    @_alwaysEmitIntoClient
    static var computerAccessTechnologyCatc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 52)
    }

    /// Eclipse (HQ Espana) S.L. (`53`)
    @_alwaysEmitIntoClient
    static var eclipseHqEspana: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 53)
    }

    /// Renesas Electronics Corporation (`54`)
    @_alwaysEmitIntoClient
    static var renesasElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 54)
    }

    /// Mobilian Corporation (`55`)
    @_alwaysEmitIntoClient
    static var mobilian: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 55)
    }

    /// Syntronix Corporation (`56`)
    @_alwaysEmitIntoClient
    static var syntronix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 56)
    }

    /// Integrated System Solution Corp. (`57`)
    @_alwaysEmitIntoClient
    static var integratedSystemSolution: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 57)
    }

    /// Panasonic Holdings Corporation (`58`)
    @_alwaysEmitIntoClient
    static var panasonicHoldings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 58)
    }

    /// Gennum Corporation (`59`)
    @_alwaysEmitIntoClient
    static var gennum: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 59)
    }

    /// BlackBerry Limited (`60`)
    @_alwaysEmitIntoClient
    static var blackberry: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 60)
    }

    /// IPextreme, Inc. (`61`)
    @_alwaysEmitIntoClient
    static var ipextreme: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 61)
    }

    /// Systems and Chips, Inc (`62`)
    @_alwaysEmitIntoClient
    static var systemsAndChips: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 62)
    }

    /// Bluetooth SIG, Inc (`63`)
    @_alwaysEmitIntoClient
    static var bluetoothSig: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 63)
    }

    /// Seiko Epson Corporation (`64`)
    @_alwaysEmitIntoClient
    static var seikoEpson: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 64)
    }

    /// Integrated Silicon Solution Taiwan, Inc. (`65`)
    @_alwaysEmitIntoClient
    static var integratedSiliconSolutionTaiwan: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 65)
    }

    /// CONWISE Technology Corporation Ltd (`66`)
    @_alwaysEmitIntoClient
    static var conwiseTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 66)
    }

    /// PARROT AUTOMOTIVE SAS (`67`)
    @_alwaysEmitIntoClient
    static var parrotAutomotives: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 67)
    }

    /// Socket Mobile (`68`)
    @_alwaysEmitIntoClient
    static var socketMobile: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 68)
    }

    /// Atheros Communications, Inc. (`69`)
    @_alwaysEmitIntoClient
    static var atherosCommunications: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 69)
    }

    /// MediaTek, Inc. (`70`)
    @_alwaysEmitIntoClient
    static var mediatek: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 70)
    }

    /// Bluegiga (`71`)
    @_alwaysEmitIntoClient
    static var bluegiga: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 71)
    }

    /// Marvell Technology Group Ltd. (`72`)
    @_alwaysEmitIntoClient
    static var marvellTechnologyGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 72)
    }

    /// 3DSP Corporation (`73`)
    @_alwaysEmitIntoClient
    static var company3Dsp: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 73)
    }

    /// Accel Semiconductor Ltd. (`74`)
    @_alwaysEmitIntoClient
    static var accelSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 74)
    }

    /// Continental Automotive Systems (`75`)
    @_alwaysEmitIntoClient
    static var continentalAutomotiveSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 75)
    }

    /// Apple, Inc. (`76`)
    @_alwaysEmitIntoClient
    static var apple: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 76)
    }

    /// Staccato Communications, Inc. (`77`)
    @_alwaysEmitIntoClient
    static var staccatoCommunications: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 77)
    }

    /// Avago Technologies (`78`)
    @_alwaysEmitIntoClient
    static var avagoTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 78)
    }

    /// APT Ltd. (`79`)
    @_alwaysEmitIntoClient
    static var apt: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 79)
    }

    /// SiRF Technology, Inc. (`80`)
    @_alwaysEmitIntoClient
    static var sirfTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 80)
    }

    /// Tzero Technologies, Inc. (`81`)
    @_alwaysEmitIntoClient
    static var tzeroTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 81)
    }

    /// J&M Corporation (`82`)
    @_alwaysEmitIntoClient
    static var jM: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 82)
    }

    /// Free2move AB (`83`)
    @_alwaysEmitIntoClient
    static var free2Move: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 83)
    }

    /// 3DiJoy Corporation (`84`)
    @_alwaysEmitIntoClient
    static var company3Dijoy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 84)
    }

    /// Plantronics, Inc. (`85`)
    @_alwaysEmitIntoClient
    static var plantronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 85)
    }

    /// Sony Ericsson Mobile Communications (`86`)
    @_alwaysEmitIntoClient
    static var sonyEricssonMobileCommunications: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 86)
    }

    /// Harman International Industries, Inc. (`87`)
    @_alwaysEmitIntoClient
    static var harmanInternationalIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 87)
    }

    /// Vizio, Inc. (`88`)
    @_alwaysEmitIntoClient
    static var vizio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 88)
    }

    /// Nordic Semiconductor ASA (`89`)
    @_alwaysEmitIntoClient
    static var nordicSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 89)
    }

    /// EM Microelectronic-Marin SA (`90`)
    @_alwaysEmitIntoClient
    static var emMicroelectronicMarin: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 90)
    }

    /// Ralink Technology Corporation (`91`)
    @_alwaysEmitIntoClient
    static var ralinkTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 91)
    }

    /// Belkin International, Inc. (`92`)
    @_alwaysEmitIntoClient
    static var belkinInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 92)
    }

    /// Realtek Semiconductor Corporation (`93`)
    @_alwaysEmitIntoClient
    static var realtekSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 93)
    }

    /// Stonestreet One, LLC (`94`)
    @_alwaysEmitIntoClient
    static var stonestreetOne: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 94)
    }

    /// Wicentric, Inc. (`95`)
    @_alwaysEmitIntoClient
    static var wicentric: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 95)
    }

    /// RivieraWaves S.A.S (`96`)
    @_alwaysEmitIntoClient
    static var rivierawaves: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 96)
    }

    /// RDA Microelectronics (`97`)
    @_alwaysEmitIntoClient
    static var rdaMicroelectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 97)
    }

    /// Gibson Guitars (`98`)
    @_alwaysEmitIntoClient
    static var gibsonGuitars: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 98)
    }

    /// MiCommand Inc. (`99`)
    @_alwaysEmitIntoClient
    static var micommand: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 99)
    }

    /// Band XI International, LLC (`100`)
    @_alwaysEmitIntoClient
    static var bandXiInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 100)
    }

    /// HP, Inc. (`101`)
    @_alwaysEmitIntoClient
    static var hp: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 101)
    }

    /// 9Solutions Oy (`102`)
    @_alwaysEmitIntoClient
    static var company9Solutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 102)
    }

    /// GN Audio A/S (`103`)
    @_alwaysEmitIntoClient
    static var gnAudio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 103)
    }

    /// General Motors (`104`)
    @_alwaysEmitIntoClient
    static var generalMotors: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 104)
    }

    /// A&D Engineering, Inc. (`105`)
    @_alwaysEmitIntoClient
    static var aDEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 105)
    }

    /// LTIMINDTREE LIMITED (`106`)
    @_alwaysEmitIntoClient
    static var ltimindtree: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 106)
    }

    /// Polar Electro OY (`107`)
    @_alwaysEmitIntoClient
    static var polarElectro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 107)
    }

    /// Beautiful Enterprise Co., Ltd. (`108`)
    @_alwaysEmitIntoClient
    static var beautifulEnterprise: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 108)
    }

    /// BriarTek, Inc (`109`)
    @_alwaysEmitIntoClient
    static var briartek: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 109)
    }

    /// Summit Data Communications, Inc. (`110`)
    @_alwaysEmitIntoClient
    static var summitDataCommunications: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 110)
    }

    /// Sound ID (`111`)
    @_alwaysEmitIntoClient
    static var soundId: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 111)
    }

    /// Monster, LLC (`112`)
    @_alwaysEmitIntoClient
    static var monster: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 112)
    }

    /// connectBlue AB (`113`)
    @_alwaysEmitIntoClient
    static var connectblue: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 113)
    }

    /// ShangHai Super Smart Electronics Co. Ltd. (`114`)
    @_alwaysEmitIntoClient
    static var shanghaiSuperSmartElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 114)
    }

    /// Group Sense Ltd. (`115`)
    @_alwaysEmitIntoClient
    static var groupSense: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 115)
    }

    /// Zomm, LLC (`116`)
    @_alwaysEmitIntoClient
    static var zomm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 116)
    }

    /// Samsung Electronics Co. Ltd. (`117`)
    @_alwaysEmitIntoClient
    static var samsungElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 117)
    }

    /// Creative Technology Ltd. (`118`)
    @_alwaysEmitIntoClient
    static var creativeTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 118)
    }

    /// Laird Connectivity LLC (`119`)
    @_alwaysEmitIntoClient
    static var lairdConnectivity: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 119)
    }

    /// Nike, Inc. (`120`)
    @_alwaysEmitIntoClient
    static var nike: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 120)
    }

    /// lesswire AG (`121`)
    @_alwaysEmitIntoClient
    static var lesswire: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 121)
    }

    /// MStar Semiconductor, Inc. (`122`)
    @_alwaysEmitIntoClient
    static var mstarSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 122)
    }

    /// Hanlynn Technologies (`123`)
    @_alwaysEmitIntoClient
    static var hanlynnTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 123)
    }

    /// A & R Cambridge (`124`)
    @_alwaysEmitIntoClient
    static var aRCambridge: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 124)
    }

    /// Seers Technology Co., Ltd. (`125`)
    @_alwaysEmitIntoClient
    static var seersTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 125)
    }

    /// Sports Tracking Technologies Ltd. (`126`)
    @_alwaysEmitIntoClient
    static var sportsTrackingTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 126)
    }

    /// Autonet Mobile (`127`)
    @_alwaysEmitIntoClient
    static var autonetMobile: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 127)
    }

    /// DeLorme Publishing Company, Inc. (`128`)
    @_alwaysEmitIntoClient
    static var delormePublishing: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 128)
    }

    /// WuXi Vimicro (`129`)
    @_alwaysEmitIntoClient
    static var wuxiVimicro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 129)
    }

    /// DSEA A/S (`130`)
    @_alwaysEmitIntoClient
    static var dsea: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 130)
    }

    /// TimeKeeping Systems, Inc. (`131`)
    @_alwaysEmitIntoClient
    static var timekeepingSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 131)
    }

    /// Ludus Helsinki Ltd. (`132`)
    @_alwaysEmitIntoClient
    static var ludusHelsinki: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 132)
    }

    /// BlueRadios, Inc. (`133`)
    @_alwaysEmitIntoClient
    static var blueradios: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 133)
    }

    /// Equinux AG (`134`)
    @_alwaysEmitIntoClient
    static var equinux: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 134)
    }

    /// Garmin International, Inc. (`135`)
    @_alwaysEmitIntoClient
    static var garminInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 135)
    }

    /// Ecotest (`136`)
    @_alwaysEmitIntoClient
    static var ecotest: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 136)
    }

    /// GN Hearing A/S (`137`)
    @_alwaysEmitIntoClient
    static var gnHearing: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 137)
    }

    /// Jawbone (`138`)
    @_alwaysEmitIntoClient
    static var jawbone: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 138)
    }

    /// Topcon Positioning Systems, LLC (`139`)
    @_alwaysEmitIntoClient
    static var topconPositioningSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 139)
    }

    /// Gimbal Inc. (`140`)
    @_alwaysEmitIntoClient
    static var gimbal: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 140)
    }

    /// Zscan Software (`141`)
    @_alwaysEmitIntoClient
    static var zscanSoftware: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 141)
    }

    /// Quintic Corp (`142`)
    @_alwaysEmitIntoClient
    static var quintic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 142)
    }

    /// Telit Wireless Solutions GmbH (`143`)
    @_alwaysEmitIntoClient
    static var telitWirelessSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 143)
    }

    /// Funai Electric Co., Ltd. (`144`)
    @_alwaysEmitIntoClient
    static var funaiElectric: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 144)
    }

    /// Advanced PANMOBIL systems GmbH & Co. KG (`145`)
    @_alwaysEmitIntoClient
    static var advancedPanmobilSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 145)
    }

    /// ThinkOptics, Inc. (`146`)
    @_alwaysEmitIntoClient
    static var thinkoptics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 146)
    }

    /// Universal Electronics, Inc. (`147`)
    @_alwaysEmitIntoClient
    static var universalElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 147)
    }

    /// Airoha Technology Corp. (`148`)
    @_alwaysEmitIntoClient
    static var airohaTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 148)
    }

    /// NEC Lighting, Ltd. (`149`)
    @_alwaysEmitIntoClient
    static var necLighting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 149)
    }

    /// ODM Technology, Inc. (`150`)
    @_alwaysEmitIntoClient
    static var odmTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 150)
    }

    /// ConnecteDevice Ltd. (`151`)
    @_alwaysEmitIntoClient
    static var connectedevice: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 151)
    }

    /// zero1.tv GmbH (`152`)
    @_alwaysEmitIntoClient
    static var zero1Tv: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 152)
    }

    /// i.Tech Dynamic Global Distribution Ltd. (`153`)
    @_alwaysEmitIntoClient
    static var iTechDynamicGlobalDistribution: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 153)
    }

    /// Alpwise (`154`)
    @_alwaysEmitIntoClient
    static var alpwise: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 154)
    }

    /// Jiangsu Toppower Automotive Electronics Co., Ltd. (`155`)
    @_alwaysEmitIntoClient
    static var jiangsuToppowerAutomotiveElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 155)
    }

    /// Colorfy, Inc. (`156`)
    @_alwaysEmitIntoClient
    static var colorfy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 156)
    }

    /// Geoforce Inc. (`157`)
    @_alwaysEmitIntoClient
    static var geoforce: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 157)
    }

    /// Bose Corporation (`158`)
    @_alwaysEmitIntoClient
    static var bose: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 158)
    }

    /// Suunto Oy (`159`)
    @_alwaysEmitIntoClient
    static var suunto: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 159)
    }

    /// Kensington Computer Products Group (`160`)
    @_alwaysEmitIntoClient
    static var kensingtonComputerProductsGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 160)
    }

    /// SR-Medizinelektronik (`161`)
    @_alwaysEmitIntoClient
    static var srMedizinelektronik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 161)
    }

    /// Vertu Corporation Limited (`162`)
    @_alwaysEmitIntoClient
    static var vertu: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 162)
    }

    /// Meta Watch Ltd. (`163`)
    @_alwaysEmitIntoClient
    static var metaWatch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 163)
    }

    /// LINAK A/S (`164`)
    @_alwaysEmitIntoClient
    static var linak: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 164)
    }

    /// OTL Dynamics LLC (`165`)
    @_alwaysEmitIntoClient
    static var otlDynamics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 165)
    }

    /// Panda Ocean Inc. (`166`)
    @_alwaysEmitIntoClient
    static var pandaOcean: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 166)
    }

    /// Visteon Corporation (`167`)
    @_alwaysEmitIntoClient
    static var visteon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 167)
    }

    /// ARP Devices Limited (`168`)
    @_alwaysEmitIntoClient
    static var arpDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 168)
    }

    /// MARELLI EUROPE S.P.A. (`169`)
    @_alwaysEmitIntoClient
    static var marelliEurope: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 169)
    }

    /// CAEN RFID srl (`170`)
    @_alwaysEmitIntoClient
    static var caenRfid: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 170)
    }

    /// Ingenieur-Systemgruppe Zahn GmbH (`171`)
    @_alwaysEmitIntoClient
    static var ingenieurSystemgruppeZahn: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 171)
    }

    /// Green Throttle Games (`172`)
    @_alwaysEmitIntoClient
    static var greenThrottleGames: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 172)
    }

    /// Peter Systemtechnik GmbH (`173`)
    @_alwaysEmitIntoClient
    static var peterSystemtechnik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 173)
    }

    /// Omegawave Oy (`174`)
    @_alwaysEmitIntoClient
    static var omegawave: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 174)
    }

    /// Cinetix (`175`)
    @_alwaysEmitIntoClient
    static var cinetix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 175)
    }

    /// Passif Semiconductor Corp (`176`)
    @_alwaysEmitIntoClient
    static var passifSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 176)
    }

    /// Saris Cycling Group, Inc (`177`)
    @_alwaysEmitIntoClient
    static var sarisCyclingGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 177)
    }

    /// Bekey A/S (`178`)
    @_alwaysEmitIntoClient
    static var bekey: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 178)
    }

    /// Clarinox Technologies Pty. Ltd. (`179`)
    @_alwaysEmitIntoClient
    static var clarinoxTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 179)
    }

    /// BDE Technology Co., Ltd. (`180`)
    @_alwaysEmitIntoClient
    static var bdeTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 180)
    }

    /// Swirl Networks (`181`)
    @_alwaysEmitIntoClient
    static var swirlNetworks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 181)
    }

    /// Meso international (`182`)
    @_alwaysEmitIntoClient
    static var mesoInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 182)
    }

    /// TreLab Ltd (`183`)
    @_alwaysEmitIntoClient
    static var trelab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 183)
    }

    /// Qualcomm Innovation Center, Inc. (QuIC) (`184`)
    @_alwaysEmitIntoClient
    static var qualcommInnovationCenterQuic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 184)
    }

    /// Johnson Controls, Inc. (`185`)
    @_alwaysEmitIntoClient
    static var johnsonControls: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 185)
    }

    /// Starkey Hearing Technologies (`186`)
    @_alwaysEmitIntoClient
    static var starkeyHearingTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 186)
    }

    /// S-Power Electronics Limited (`187`)
    @_alwaysEmitIntoClient
    static var sPowerElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 187)
    }

    /// Ace Sensor Inc (`188`)
    @_alwaysEmitIntoClient
    static var aceSensor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 188)
    }

    /// Aplix Corporation (`189`)
    @_alwaysEmitIntoClient
    static var aplix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 189)
    }

    /// AAMP of America (`190`)
    @_alwaysEmitIntoClient
    static var aampOfAmerica: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 190)
    }

    /// Stalmart Technology Limited (`191`)
    @_alwaysEmitIntoClient
    static var stalmartTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 191)
    }

    /// AMICCOM Electronics Corporation (`192`)
    @_alwaysEmitIntoClient
    static var amiccomElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 192)
    }

    /// Shenzhen Excelsecu Data Technology Co.,Ltd (`193`)
    @_alwaysEmitIntoClient
    static var shenzhenExcelsecuDataTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 193)
    }

    /// Geneq Inc. (`194`)
    @_alwaysEmitIntoClient
    static var geneq: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 194)
    }

    /// adidas AG (`195`)
    @_alwaysEmitIntoClient
    static var adidas: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 195)
    }

    /// LG Electronics (`196`)
    @_alwaysEmitIntoClient
    static var lgElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 196)
    }

    /// Onset Computer Corporation (`197`)
    @_alwaysEmitIntoClient
    static var onsetComputer: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 197)
    }

    /// Selfly BV (`198`)
    @_alwaysEmitIntoClient
    static var selfly: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 198)
    }

    /// Quuppa Oy. (`199`)
    @_alwaysEmitIntoClient
    static var quuppa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 199)
    }

    /// GeLo Inc (`200`)
    @_alwaysEmitIntoClient
    static var gelo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 200)
    }

    /// Evluma (`201`)
    @_alwaysEmitIntoClient
    static var evluma: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 201)
    }

    /// MC10 (`202`)
    @_alwaysEmitIntoClient
    static var mc10: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 202)
    }

    /// Binauric SE (`203`)
    @_alwaysEmitIntoClient
    static var binauric: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 203)
    }

    /// Beats Electronics (`204`)
    @_alwaysEmitIntoClient
    static var beatsElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 204)
    }

    /// Microchip Technology Inc. (`205`)
    @_alwaysEmitIntoClient
    static var microchipTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 205)
    }

    /// Eve Systems GmbH (`206`)
    @_alwaysEmitIntoClient
    static var eveSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 206)
    }

    /// ARCHOS SA (`207`)
    @_alwaysEmitIntoClient
    static var archos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 207)
    }

    /// Dexcom, Inc. (`208`)
    @_alwaysEmitIntoClient
    static var dexcom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 208)
    }

    /// Polar Electro Europe B.V. (`209`)
    @_alwaysEmitIntoClient
    static var polarElectroEurope: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 209)
    }

    /// Dialog Semiconductor B.V. (`210`)
    @_alwaysEmitIntoClient
    static var dialogSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 210)
    }

    /// Taixingbang Technology (HK) Co,. LTD. (`211`)
    @_alwaysEmitIntoClient
    static var taixingbangTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 211)
    }

    /// Kawantech (`212`)
    @_alwaysEmitIntoClient
    static var kawantech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 212)
    }

    /// Austco Communication Systems (`213`)
    @_alwaysEmitIntoClient
    static var austcoCommunicationSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 213)
    }

    /// Timex Group USA, Inc. (`214`)
    @_alwaysEmitIntoClient
    static var timexGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 214)
    }

    /// Qualcomm Technologies, Inc. (`215`)
    @_alwaysEmitIntoClient
    static var qualcommTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 215)
    }

    /// Qualcomm Connected Experiences, Inc. (`216`)
    @_alwaysEmitIntoClient
    static var qualcommConnectedExperiences: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 216)
    }

    /// Voyetra Turtle Beach (`217`)
    @_alwaysEmitIntoClient
    static var voyetraTurtleBeach: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 217)
    }

    /// txtr GmbH (`218`)
    @_alwaysEmitIntoClient
    static var txtr: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 218)
    }

    /// Snuza (Pty) Ltd (`219`)
    @_alwaysEmitIntoClient
    static var snuzaPty: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 219)
    }

    /// Procter & Gamble (`220`)
    @_alwaysEmitIntoClient
    static var procterGamble: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 220)
    }

    /// Hosiden Corporation (`221`)
    @_alwaysEmitIntoClient
    static var hosiden: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 221)
    }

    /// Muzik LLC (`222`)
    @_alwaysEmitIntoClient
    static var muzik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 222)
    }

    /// Misfit Wearables Corp (`223`)
    @_alwaysEmitIntoClient
    static var misfitWearables: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 223)
    }

    /// Google (`224`)
    @_alwaysEmitIntoClient
    static var google: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 224)
    }

    /// Danlers Ltd (`225`)
    @_alwaysEmitIntoClient
    static var danlers: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 225)
    }

    /// Semilink Inc (`226`)
    @_alwaysEmitIntoClient
    static var semilink: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 226)
    }

    /// inMusic Brands, Inc (`227`)
    @_alwaysEmitIntoClient
    static var inmusicBrands: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 227)
    }

    /// L.S. Research, Inc. (`228`)
    @_alwaysEmitIntoClient
    static var lSResearch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 228)
    }

    /// Eden Software Consultants Ltd. (`229`)
    @_alwaysEmitIntoClient
    static var edenSoftwareConsultants: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 229)
    }

    /// Freshtemp (`230`)
    @_alwaysEmitIntoClient
    static var freshtemp: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 230)
    }

    /// KS Technologies (`231`)
    @_alwaysEmitIntoClient
    static var ksTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 231)
    }

    /// ACTS Technologies (`232`)
    @_alwaysEmitIntoClient
    static var actsTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 232)
    }

    /// Vtrack Systems (`233`)
    @_alwaysEmitIntoClient
    static var vtrackSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 233)
    }

    /// www.vtracksystems.com (`234`)
    @_alwaysEmitIntoClient
    static var wwwVtracksystemsCom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 234)
    }

    /// Server Technology Inc. (`235`)
    @_alwaysEmitIntoClient
    static var serverTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 235)
    }

    /// BioResearch Associates (`236`)
    @_alwaysEmitIntoClient
    static var bioresearchAssociates: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 236)
    }

    /// Jolly Logic, LLC (`237`)
    @_alwaysEmitIntoClient
    static var jollyLogic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 237)
    }

    /// Above Average Outcomes, Inc. (`238`)
    @_alwaysEmitIntoClient
    static var aboveAverageOutcomes: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 238)
    }

    /// Bitsplitters GmbH (`239`)
    @_alwaysEmitIntoClient
    static var bitsplitters: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 239)
    }

    /// PayPal, Inc. (`240`)
    @_alwaysEmitIntoClient
    static var paypal: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 240)
    }

    /// Witron Technology Limited (`241`)
    @_alwaysEmitIntoClient
    static var witronTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 241)
    }

    /// Morse Project Inc. (`242`)
    @_alwaysEmitIntoClient
    static var morseProject: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 242)
    }

    /// Kent Displays Inc. (`243`)
    @_alwaysEmitIntoClient
    static var kentDisplays: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 243)
    }

    /// Nautilus Inc. (`244`)
    @_alwaysEmitIntoClient
    static var nautilus: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 244)
    }

    /// Smartifier Oy (`245`)
    @_alwaysEmitIntoClient
    static var smartifier: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 245)
    }

    /// Elcometer Limited (`246`)
    @_alwaysEmitIntoClient
    static var elcometer: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 246)
    }

    /// VSN Technologies, Inc. (`247`)
    @_alwaysEmitIntoClient
    static var vsnTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 247)
    }

    /// AceUni Corp., Ltd. (`248`)
    @_alwaysEmitIntoClient
    static var aceuni: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 248)
    }

    /// StickNFind (`249`)
    @_alwaysEmitIntoClient
    static var sticknfind: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 249)
    }

    /// Crystal Alarm AB (`250`)
    @_alwaysEmitIntoClient
    static var crystalAlarm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 250)
    }

    /// KOUKAAM a.s. (`251`)
    @_alwaysEmitIntoClient
    static var koukaam: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 251)
    }

    /// Delphi Corporation (`252`)
    @_alwaysEmitIntoClient
    static var delphi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 252)
    }

    /// ValenceTech Limited (`253`)
    @_alwaysEmitIntoClient
    static var valencetech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 253)
    }

    /// Stanley Black and Decker (`254`)
    @_alwaysEmitIntoClient
    static var stanleyBlackAndDecker: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 254)
    }

    /// Typo Products, LLC (`255`)
    @_alwaysEmitIntoClient
    static var typoProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 255)
    }

    /// TomTom International BV (`256`)
    @_alwaysEmitIntoClient
    static var tomtomInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 256)
    }

    /// Fugoo, Inc. (`257`)
    @_alwaysEmitIntoClient
    static var fugoo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 257)
    }

    /// Keiser Corporation (`258`)
    @_alwaysEmitIntoClient
    static var keiser: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 258)
    }

    /// Bang & Olufsen A/S (`259`)
    @_alwaysEmitIntoClient
    static var bangOlufsen: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 259)
    }

    /// PLUS Location Systems Pty Ltd (`260`)
    @_alwaysEmitIntoClient
    static var plusLocationSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 260)
    }

    /// Ubiquitous Computing Technology Corporation (`261`)
    @_alwaysEmitIntoClient
    static var ubiquitousComputingTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 261)
    }

    /// Innovative Yachtter Solutions (`262`)
    @_alwaysEmitIntoClient
    static var innovativeYachtterSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 262)
    }

    /// Demant A/S (`263`)
    @_alwaysEmitIntoClient
    static var demant: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 263)
    }

    /// Chicony Electronics Co., Ltd. (`264`)
    @_alwaysEmitIntoClient
    static var chiconyElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 264)
    }

    /// Atus BV (`265`)
    @_alwaysEmitIntoClient
    static var atus: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 265)
    }

    /// Codegate Ltd (`266`)
    @_alwaysEmitIntoClient
    static var codegate: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 266)
    }

    /// ERi, Inc (`267`)
    @_alwaysEmitIntoClient
    static var eri: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 267)
    }

    /// Transducers Direct, LLC (`268`)
    @_alwaysEmitIntoClient
    static var transducersDirect: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 268)
    }

    /// DENSO TEN Limited (`269`)
    @_alwaysEmitIntoClient
    static var densoTen: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 269)
    }

    /// Audi AG (`270`)
    @_alwaysEmitIntoClient
    static var audi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 270)
    }

    /// HiSilicon Technologies CO., LIMITED (`271`)
    @_alwaysEmitIntoClient
    static var hisiliconTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 271)
    }

    /// Nippon Seiki Co., Ltd. (`272`)
    @_alwaysEmitIntoClient
    static var nipponSeiki: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 272)
    }

    /// Steelseries ApS (`273`)
    @_alwaysEmitIntoClient
    static var steelseries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 273)
    }

    /// Visybl Inc. (`274`)
    @_alwaysEmitIntoClient
    static var visybl: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 274)
    }

    /// Openbrain Technologies, Co., Ltd. (`275`)
    @_alwaysEmitIntoClient
    static var openbrainTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 275)
    }

    /// Xensr (`276`)
    @_alwaysEmitIntoClient
    static var xensr: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 276)
    }

    /// e.solutions (`277`)
    @_alwaysEmitIntoClient
    static var eSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 277)
    }

    /// 10AK Technologies (`278`)
    @_alwaysEmitIntoClient
    static var company10AkTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 278)
    }

    /// Wimoto Technologies Inc (`279`)
    @_alwaysEmitIntoClient
    static var wimotoTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 279)
    }

    /// Radius Networks, Inc. (`280`)
    @_alwaysEmitIntoClient
    static var radiusNetworks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 280)
    }

    /// Wize Technology Co., Ltd. (`281`)
    @_alwaysEmitIntoClient
    static var wizeTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 281)
    }

    /// Qualcomm Labs, Inc. (`282`)
    @_alwaysEmitIntoClient
    static var qualcommLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 282)
    }

    /// Hewlett Packard Enterprise (`283`)
    @_alwaysEmitIntoClient
    static var hewlettPackardEnterprise: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 283)
    }

    /// Baidu (`284`)
    @_alwaysEmitIntoClient
    static var baidu: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 284)
    }

    /// Arendi AG (`285`)
    @_alwaysEmitIntoClient
    static var arendi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 285)
    }

    /// Skoda Auto a.s. (`286`)
    @_alwaysEmitIntoClient
    static var skodaAuto: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 286)
    }

    /// Volkswagen AG (`287`)
    @_alwaysEmitIntoClient
    static var volkswagen: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 287)
    }

    /// Porsche AG (`288`)
    @_alwaysEmitIntoClient
    static var porsche: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 288)
    }

    /// Sino Wealth Electronic Ltd. (`289`)
    @_alwaysEmitIntoClient
    static var sinoWealthElectronic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 289)
    }

    /// AirTurn, Inc. (`290`)
    @_alwaysEmitIntoClient
    static var airturn: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 290)
    }

    /// Kinsa, Inc (`291`)
    @_alwaysEmitIntoClient
    static var kinsa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 291)
    }

    /// HID Global (`292`)
    @_alwaysEmitIntoClient
    static var hidGlobal: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 292)
    }

    /// SEAT es (`293`)
    @_alwaysEmitIntoClient
    static var seatEs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 293)
    }

    /// Promethean Ltd. (`294`)
    @_alwaysEmitIntoClient
    static var promethean: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 294)
    }

    /// Salutica Allied Solutions (`295`)
    @_alwaysEmitIntoClient
    static var saluticaAlliedSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 295)
    }

    /// GPSI Group Pty Ltd (`296`)
    @_alwaysEmitIntoClient
    static var gpsiGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 296)
    }

    /// Nimble Devices Oy (`297`)
    @_alwaysEmitIntoClient
    static var nimbleDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 297)
    }

    /// Changzhou Yongse Infotech  Co., Ltd. (`298`)
    @_alwaysEmitIntoClient
    static var changzhouYongseInfotech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 298)
    }

    /// SportIQ (`299`)
    @_alwaysEmitIntoClient
    static var sportiq: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 299)
    }

    /// TEMEC Instruments B.V. (`300`)
    @_alwaysEmitIntoClient
    static var temecInstruments: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 300)
    }

    /// Sony Corporation (`301`)
    @_alwaysEmitIntoClient
    static var sony: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 301)
    }

    /// ASSA ABLOY (`302`)
    @_alwaysEmitIntoClient
    static var assaAbloy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 302)
    }

    /// Clarion Co. Inc. (`303`)
    @_alwaysEmitIntoClient
    static var clarion: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 303)
    }

    /// Warehouse Innovations (`304`)
    @_alwaysEmitIntoClient
    static var warehouseInnovations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 304)
    }

    /// Cypress Semiconductor (`305`)
    @_alwaysEmitIntoClient
    static var cypressSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 305)
    }

    /// MADS Inc (`306`)
    @_alwaysEmitIntoClient
    static var mads: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 306)
    }

    /// Blue Maestro Limited (`307`)
    @_alwaysEmitIntoClient
    static var blueMaestro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 307)
    }

    /// Resolution Products, Ltd. (`308`)
    @_alwaysEmitIntoClient
    static var resolutionProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 308)
    }

    /// Aireware LLC (`309`)
    @_alwaysEmitIntoClient
    static var aireware: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 309)
    }

    /// Silvair, Inc. (`310`)
    @_alwaysEmitIntoClient
    static var silvair: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 310)
    }

    /// Prestigio Plaza Ltd. (`311`)
    @_alwaysEmitIntoClient
    static var prestigioPlaza: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 311)
    }

    /// NTEO Inc. (`312`)
    @_alwaysEmitIntoClient
    static var nteo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 312)
    }

    /// Focus Systems Corporation (`313`)
    @_alwaysEmitIntoClient
    static var focusSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 313)
    }

    /// Tencent Holdings Ltd. (`314`)
    @_alwaysEmitIntoClient
    static var tencentHoldings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 314)
    }

    /// Allegion (`315`)
    @_alwaysEmitIntoClient
    static var allegion: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 315)
    }

    /// Murata Manufacturing Co., Ltd. (`316`)
    @_alwaysEmitIntoClient
    static var murataManufacturing: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 316)
    }

    /// WirelessWERX (`317`)
    @_alwaysEmitIntoClient
    static var wirelesswerx: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 317)
    }

    /// Nod, Inc. (`318`)
    @_alwaysEmitIntoClient
    static var nod: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 318)
    }

    /// B&B Manufacturing Company (`319`)
    @_alwaysEmitIntoClient
    static var bBManufacturing: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 319)
    }

    /// Alpine Electronics (China) Co., Ltd (`320`)
    @_alwaysEmitIntoClient
    static var alpineElectronicsChina: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 320)
    }

    /// FedEx Services (`321`)
    @_alwaysEmitIntoClient
    static var fedexServices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 321)
    }

    /// Grape Systems Inc. (`322`)
    @_alwaysEmitIntoClient
    static var grapeSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 322)
    }

    /// Bkon Connect (`323`)
    @_alwaysEmitIntoClient
    static var bkonConnect: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 323)
    }

    /// Lintech GmbH (`324`)
    @_alwaysEmitIntoClient
    static var lintech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 324)
    }

    /// Novatel Wireless (`325`)
    @_alwaysEmitIntoClient
    static var novatelWireless: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 325)
    }

    /// Ciright (`326`)
    @_alwaysEmitIntoClient
    static var ciright: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 326)
    }

    /// Mighty Cast, Inc. (`327`)
    @_alwaysEmitIntoClient
    static var mightyCast: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 327)
    }

    /// Ambimat Electronics (`328`)
    @_alwaysEmitIntoClient
    static var ambimatElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 328)
    }

    /// Perytons Ltd. (`329`)
    @_alwaysEmitIntoClient
    static var perytons: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 329)
    }

    /// Tivoli Audio, LLC (`330`)
    @_alwaysEmitIntoClient
    static var tivoliAudio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 330)
    }

    /// Master Lock (`331`)
    @_alwaysEmitIntoClient
    static var masterLock: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 331)
    }

    /// Mesh-Net Ltd (`332`)
    @_alwaysEmitIntoClient
    static var meshNet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 332)
    }

    /// HUIZHOU DESAY SV AUTOMOTIVE CO., LTD. (`333`)
    @_alwaysEmitIntoClient
    static var huizhouDesaySvAutomotive: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 333)
    }

    /// Tangerine, Inc. (`334`)
    @_alwaysEmitIntoClient
    static var tangerine: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 334)
    }

    /// B&W Group Ltd. (`335`)
    @_alwaysEmitIntoClient
    static var bWGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 335)
    }

    /// Pioneer Corporation (`336`)
    @_alwaysEmitIntoClient
    static var pioneer: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 336)
    }

    /// OnBeep (`337`)
    @_alwaysEmitIntoClient
    static var onbeep: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 337)
    }

    /// Vernier Software & Technology (`338`)
    @_alwaysEmitIntoClient
    static var vernierSoftwareTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 338)
    }

    /// ROL Ergo (`339`)
    @_alwaysEmitIntoClient
    static var rolErgo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 339)
    }

    /// Pebble Technology (`340`)
    @_alwaysEmitIntoClient
    static var pebbleTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 340)
    }

    /// NETATMO (`341`)
    @_alwaysEmitIntoClient
    static var netatmo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 341)
    }

    /// Accumulate AB (`342`)
    @_alwaysEmitIntoClient
    static var accumulate: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 342)
    }

    /// Anhui Huami Information Technology Co., Ltd. (`343`)
    @_alwaysEmitIntoClient
    static var anhuiHuamiInformationTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 343)
    }

    /// Inmite s.r.o. (`344`)
    @_alwaysEmitIntoClient
    static var inmite: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 344)
    }

    /// ChefSteps, Inc. (`345`)
    @_alwaysEmitIntoClient
    static var chefsteps: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 345)
    }

    /// micas AG (`346`)
    @_alwaysEmitIntoClient
    static var micas: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 346)
    }

    /// Biomedical Research Ltd. (`347`)
    @_alwaysEmitIntoClient
    static var biomedicalResearch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 347)
    }

    /// Pitius Tec S.L. (`348`)
    @_alwaysEmitIntoClient
    static var pitiusTec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 348)
    }

    /// Estimote, Inc. (`349`)
    @_alwaysEmitIntoClient
    static var estimote: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 349)
    }

    /// Unikey Technologies, Inc. (`350`)
    @_alwaysEmitIntoClient
    static var unikeyTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 350)
    }

    /// Timer Cap Co. (`351`)
    @_alwaysEmitIntoClient
    static var timerCap: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 351)
    }

    /// AwoX (`352`)
    @_alwaysEmitIntoClient
    static var awox: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 352)
    }

    /// yikes (`353`)
    @_alwaysEmitIntoClient
    static var yikes: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 353)
    }

    /// MADSGlobalNZ Ltd. (`354`)
    @_alwaysEmitIntoClient
    static var madsglobalnz: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 354)
    }

    /// PCH International (`355`)
    @_alwaysEmitIntoClient
    static var pchInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 355)
    }

    /// Qingdao Yeelink Information Technology Co., Ltd. (`356`)
    @_alwaysEmitIntoClient
    static var qingdaoYeelinkInformationTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 356)
    }

    /// Milwaukee Electric Tools (`357`)
    @_alwaysEmitIntoClient
    static var milwaukeeElectricTools: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 357)
    }

    /// MISHIK Pte Ltd (`358`)
    @_alwaysEmitIntoClient
    static var mishikPte: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 358)
    }

    /// Ascensia Diabetes Care US Inc. (`359`)
    @_alwaysEmitIntoClient
    static var ascensiaDiabetesCareUs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 359)
    }

    /// Spicebox LLC (`360`)
    @_alwaysEmitIntoClient
    static var spicebox: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 360)
    }

    /// emberlight (`361`)
    @_alwaysEmitIntoClient
    static var emberlight: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 361)
    }

    /// Copeland Cold Chain LP (`362`)
    @_alwaysEmitIntoClient
    static var copelandColdChainLp: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 362)
    }

    /// Qblinks (`363`)
    @_alwaysEmitIntoClient
    static var qblinks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 363)
    }

    /// MYSPHERA (`364`)
    @_alwaysEmitIntoClient
    static var mysphera: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 364)
    }

    /// LifeScan Inc (`365`)
    @_alwaysEmitIntoClient
    static var lifescan: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 365)
    }

    /// Volantic AB (`366`)
    @_alwaysEmitIntoClient
    static var volantic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 366)
    }

    /// Podo Labs, Inc (`367`)
    @_alwaysEmitIntoClient
    static var podoLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 367)
    }

    /// Roche Diabetes Care AG (`368`)
    @_alwaysEmitIntoClient
    static var rocheDiabetesCare: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 368)
    }

    /// Amazon.com Services LLC (`369`)
    @_alwaysEmitIntoClient
    static var amazonComServices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 369)
    }

    /// Connovate Technology Private Limited (`370`)
    @_alwaysEmitIntoClient
    static var connovateTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 370)
    }

    /// Kocomojo, LLC (`371`)
    @_alwaysEmitIntoClient
    static var kocomojo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 371)
    }

    /// Everykey Inc. (`372`)
    @_alwaysEmitIntoClient
    static var everykey: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 372)
    }

    /// Dynamic Controls (`373`)
    @_alwaysEmitIntoClient
    static var dynamicControls: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 373)
    }

    /// SentriLock (`374`)
    @_alwaysEmitIntoClient
    static var sentrilock: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 374)
    }

    /// I-SYST inc. (`375`)
    @_alwaysEmitIntoClient
    static var iSyst: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 375)
    }

    /// CASIO COMPUTER CO., LTD. (`376`)
    @_alwaysEmitIntoClient
    static var casioComputer: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 376)
    }

    /// LAPIS Semiconductor Co.,Ltd (`377`)
    @_alwaysEmitIntoClient
    static var lapisSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 377)
    }

    /// Telemonitor, Inc. (`378`)
    @_alwaysEmitIntoClient
    static var telemonitor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 378)
    }

    /// taskit GmbH (`379`)
    @_alwaysEmitIntoClient
    static var taskit: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 379)
    }

    /// Mercedes-Benz Group AG (`380`)
    @_alwaysEmitIntoClient
    static var mercedesBenzGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 380)
    }

    /// BatAndCat (`381`)
    @_alwaysEmitIntoClient
    static var batandcat: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 381)
    }

    /// BluDotz Ltd (`382`)
    @_alwaysEmitIntoClient
    static var bludotz: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 382)
    }

    /// XTel Wireless ApS (`383`)
    @_alwaysEmitIntoClient
    static var xtelWireless: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 383)
    }

    /// Gigaset Technologies GmbH (`384`)
    @_alwaysEmitIntoClient
    static var gigasetTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 384)
    }

    /// Gecko Health Innovations, Inc. (`385`)
    @_alwaysEmitIntoClient
    static var geckoHealthInnovations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 385)
    }

    /// HOP Ubiquitous (`386`)
    @_alwaysEmitIntoClient
    static var hopUbiquitous: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 386)
    }

    /// Walt Disney (`387`)
    @_alwaysEmitIntoClient
    static var waltDisney: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 387)
    }

    /// Nectar (`388`)
    @_alwaysEmitIntoClient
    static var nectar: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 388)
    }

    /// bel'apps LLC (`389`)
    @_alwaysEmitIntoClient
    static var belApps: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 389)
    }

    /// CORE Lighting Ltd (`390`)
    @_alwaysEmitIntoClient
    static var coreLighting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 390)
    }

    /// Seraphim Sense Ltd (`391`)
    @_alwaysEmitIntoClient
    static var seraphimSense: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 391)
    }

    /// Unico RBC (`392`)
    @_alwaysEmitIntoClient
    static var unicoRbc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 392)
    }

    /// Physical Enterprises Inc. (`393`)
    @_alwaysEmitIntoClient
    static var physicalEnterprises: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 393)
    }

    /// Able Trend Technology Limited (`394`)
    @_alwaysEmitIntoClient
    static var ableTrendTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 394)
    }

    /// Konica Minolta, Inc. (`395`)
    @_alwaysEmitIntoClient
    static var konicaMinolta: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 395)
    }

    /// Wilo SE (`396`)
    @_alwaysEmitIntoClient
    static var wilo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 396)
    }

    /// Extron Design Services (`397`)
    @_alwaysEmitIntoClient
    static var extronDesignServices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 397)
    }

    /// Google LLC (`398`)
    @_alwaysEmitIntoClient
    static var google2: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 398)
    }

    /// Fireflies Systems (`399`)
    @_alwaysEmitIntoClient
    static var firefliesSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 399)
    }

    /// Intelletto Technologies Inc. (`400`)
    @_alwaysEmitIntoClient
    static var intellettoTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 400)
    }

    /// FDK CORPORATION (`401`)
    @_alwaysEmitIntoClient
    static var fdk: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 401)
    }

    /// Cloudleaf, Inc (`402`)
    @_alwaysEmitIntoClient
    static var cloudleaf: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 402)
    }

    /// Maveric Automation LLC (`403`)
    @_alwaysEmitIntoClient
    static var mavericAutomation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 403)
    }

    /// Acoustic Stream Corporation (`404`)
    @_alwaysEmitIntoClient
    static var acousticStream: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 404)
    }

    /// Zuli (`405`)
    @_alwaysEmitIntoClient
    static var zuli: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 405)
    }

    /// Paxton Access Ltd (`406`)
    @_alwaysEmitIntoClient
    static var paxtonAccess: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 406)
    }

    /// WiSilica Inc. (`407`)
    @_alwaysEmitIntoClient
    static var wisilica: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 407)
    }

    /// VENGIT Korlatolt Felelossegu Tarsasag (`408`)
    @_alwaysEmitIntoClient
    static var vengitKorlatoltFelelosseguTarsasag: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 408)
    }

    /// SALTO SYSTEMS S.L. (`409`)
    @_alwaysEmitIntoClient
    static var saltoSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 409)
    }

    /// TRON Forum (`410`)
    @_alwaysEmitIntoClient
    static var tronForum: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 410)
    }

    /// CUBETECH s.r.o. (`411`)
    @_alwaysEmitIntoClient
    static var cubetech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 411)
    }

    /// Cokiya Incorporated (`412`)
    @_alwaysEmitIntoClient
    static var cokiya: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 412)
    }

    /// CVS Health (`413`)
    @_alwaysEmitIntoClient
    static var cvsHealth: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 413)
    }

    /// Ceruus (`414`)
    @_alwaysEmitIntoClient
    static var ceruus: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 414)
    }

    /// Strainstall Ltd (`415`)
    @_alwaysEmitIntoClient
    static var strainstall: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 415)
    }

    /// Channel Enterprises (HK) Ltd. (`416`)
    @_alwaysEmitIntoClient
    static var channelEnterprises: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 416)
    }

    /// FIAMM (`417`)
    @_alwaysEmitIntoClient
    static var fiamm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 417)
    }

    /// GIGALANE.CO.,LTD (`418`)
    @_alwaysEmitIntoClient
    static var gigalane: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 418)
    }

    /// EROAD (`419`)
    @_alwaysEmitIntoClient
    static var eroad: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 419)
    }

    /// MSA Innovation, LLC (`420`)
    @_alwaysEmitIntoClient
    static var msaInnovation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 420)
    }

    /// Icon Health and Fitness (`421`)
    @_alwaysEmitIntoClient
    static var iconHealthAndFitness: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 421)
    }

    /// Wille Engineering (`422`)
    @_alwaysEmitIntoClient
    static var willeEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 422)
    }

    /// ENERGOUS CORPORATION (`423`)
    @_alwaysEmitIntoClient
    static var energous: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 423)
    }

    /// Taobao (`424`)
    @_alwaysEmitIntoClient
    static var taobao: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 424)
    }

    /// Canon Inc. (`425`)
    @_alwaysEmitIntoClient
    static var canon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 425)
    }

    /// Geophysical Technology Inc. (`426`)
    @_alwaysEmitIntoClient
    static var geophysicalTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 426)
    }

    /// Meta Platforms, Inc. (`427`)
    @_alwaysEmitIntoClient
    static var metaPlatforms: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 427)
    }

    /// Trividia Health, Inc. (`428`)
    @_alwaysEmitIntoClient
    static var trividiaHealth: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 428)
    }

    /// FlightSafety International (`429`)
    @_alwaysEmitIntoClient
    static var flightsafetyInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 429)
    }

    /// Earlens Corporation (`430`)
    @_alwaysEmitIntoClient
    static var earlens: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 430)
    }

    /// Sunrise Micro Devices, Inc. (`431`)
    @_alwaysEmitIntoClient
    static var sunriseMicroDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 431)
    }

    /// Star Micronics Co., Ltd. (`432`)
    @_alwaysEmitIntoClient
    static var starMicronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 432)
    }

    /// Netizens Sp. z o.o. (`433`)
    @_alwaysEmitIntoClient
    static var netizens: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 433)
    }

    /// Nymi Inc. (`434`)
    @_alwaysEmitIntoClient
    static var nymi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 434)
    }

    /// Nytec, Inc. (`435`)
    @_alwaysEmitIntoClient
    static var nytec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 435)
    }

    /// Trineo Sp. z o.o. (`436`)
    @_alwaysEmitIntoClient
    static var trineo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 436)
    }

    /// Nest Labs Inc. (`437`)
    @_alwaysEmitIntoClient
    static var nestLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 437)
    }

    /// LM Technologies Ltd (`438`)
    @_alwaysEmitIntoClient
    static var lmTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 438)
    }

    /// General Electric Company (`439`)
    @_alwaysEmitIntoClient
    static var generalElectric: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 439)
    }

    /// i+D3 S.L. (`440`)
    @_alwaysEmitIntoClient
    static var iD3: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 440)
    }

    /// HANA Micron (`441`)
    @_alwaysEmitIntoClient
    static var hanaMicron: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 441)
    }

    /// Stages Cycling LLC (`442`)
    @_alwaysEmitIntoClient
    static var stagesCycling: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 442)
    }

    /// Cochlear Bone Anchored Solutions AB (`443`)
    @_alwaysEmitIntoClient
    static var cochlearBoneAnchoredSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 443)
    }

    /// SenionLab AB (`444`)
    @_alwaysEmitIntoClient
    static var senionlab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 444)
    }

    /// Syszone Co., Ltd (`445`)
    @_alwaysEmitIntoClient
    static var syszone: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 445)
    }

    /// Pulsate Mobile Ltd. (`446`)
    @_alwaysEmitIntoClient
    static var pulsateMobile: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 446)
    }

    /// Hongkong OnMicro Electronics Limited (`447`)
    @_alwaysEmitIntoClient
    static var hongkongOnmicroElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 447)
    }

    /// pironex GmbH (`448`)
    @_alwaysEmitIntoClient
    static var pironex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 448)
    }

    /// BRADATECH Corp. (`449`)
    @_alwaysEmitIntoClient
    static var bradatech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 449)
    }

    /// Transenergooil AG (`450`)
    @_alwaysEmitIntoClient
    static var transenergooil: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 450)
    }

    /// Bunch (`451`)
    @_alwaysEmitIntoClient
    static var bunch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 451)
    }

    /// DME Microelectronics (`452`)
    @_alwaysEmitIntoClient
    static var dmeMicroelectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 452)
    }

    /// Bitcraze AB (`453`)
    @_alwaysEmitIntoClient
    static var bitcraze: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 453)
    }

    /// HASWARE Inc. (`454`)
    @_alwaysEmitIntoClient
    static var hasware: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 454)
    }

    /// Abiogenix Inc. (`455`)
    @_alwaysEmitIntoClient
    static var abiogenix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 455)
    }

    /// Poly-Control ApS (`456`)
    @_alwaysEmitIntoClient
    static var polyControl: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 456)
    }

    /// Avi-on (`457`)
    @_alwaysEmitIntoClient
    static var aviOn: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 457)
    }

    /// Laerdal Medical AS (`458`)
    @_alwaysEmitIntoClient
    static var laerdalMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 458)
    }

    /// Fetch My Pet (`459`)
    @_alwaysEmitIntoClient
    static var fetchMyPet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 459)
    }

    /// Sam Labs Ltd. (`460`)
    @_alwaysEmitIntoClient
    static var samLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 460)
    }

    /// Chengdu Synwing Technology Ltd (`461`)
    @_alwaysEmitIntoClient
    static var chengduSynwingTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 461)
    }

    /// HOUWA SYSTEM DESIGN, k.k. (`462`)
    @_alwaysEmitIntoClient
    static var houwaSystemDesignKK: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 462)
    }

    /// BSH (`463`)
    @_alwaysEmitIntoClient
    static var bsh: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 463)
    }

    /// Primus Inter Pares Ltd (`464`)
    @_alwaysEmitIntoClient
    static var primusInterPares: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 464)
    }

    /// August Home, Inc (`465`)
    @_alwaysEmitIntoClient
    static var augustHome: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 465)
    }

    /// Gill Electronics (`466`)
    @_alwaysEmitIntoClient
    static var gillElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 466)
    }

    /// Sky Wave Design (`467`)
    @_alwaysEmitIntoClient
    static var skyWaveDesign: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 467)
    }

    /// Newlab S.r.l. (`468`)
    @_alwaysEmitIntoClient
    static var newlab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 468)
    }

    /// ELAD srl (`469`)
    @_alwaysEmitIntoClient
    static var elad: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 469)
    }

    /// G-wearables inc. (`470`)
    @_alwaysEmitIntoClient
    static var gWearables: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 470)
    }

    /// Squadrone Systems Inc. (`471`)
    @_alwaysEmitIntoClient
    static var squadroneSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 471)
    }

    /// Code Corporation (`472`)
    @_alwaysEmitIntoClient
    static var code: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 472)
    }

    /// Savant Systems LLC (`473`)
    @_alwaysEmitIntoClient
    static var savantSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 473)
    }

    /// Logitech International SA (`474`)
    @_alwaysEmitIntoClient
    static var logitechInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 474)
    }

    /// Innblue Consulting (`475`)
    @_alwaysEmitIntoClient
    static var innblueConsulting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 475)
    }

    /// iParking Ltd. (`476`)
    @_alwaysEmitIntoClient
    static var iparking: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 476)
    }

    /// Koninklijke Philips N.V. (`477`)
    @_alwaysEmitIntoClient
    static var koninklijkePhilips: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 477)
    }

    /// Minelab Electronics Pty Limited (`478`)
    @_alwaysEmitIntoClient
    static var minelabElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 478)
    }

    /// Bison Group Ltd. (`479`)
    @_alwaysEmitIntoClient
    static var bisonGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 479)
    }

    /// Widex A/S (`480`)
    @_alwaysEmitIntoClient
    static var widex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 480)
    }

    /// Jolla Ltd (`481`)
    @_alwaysEmitIntoClient
    static var jolla: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 481)
    }

    /// Lectronix, Inc. (`482`)
    @_alwaysEmitIntoClient
    static var lectronix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 482)
    }

    /// Caterpillar Inc (`483`)
    @_alwaysEmitIntoClient
    static var caterpillar: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 483)
    }

    /// Freedom Innovations (`484`)
    @_alwaysEmitIntoClient
    static var freedomInnovations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 484)
    }

    /// Dynamic Devices Ltd (`485`)
    @_alwaysEmitIntoClient
    static var dynamicDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 485)
    }

    /// Technology Solutions (UK) Ltd (`486`)
    @_alwaysEmitIntoClient
    static var technologySolutionsUk: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 486)
    }

    /// IPS Group Inc. (`487`)
    @_alwaysEmitIntoClient
    static var ipsGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 487)
    }

    /// STIR (`488`)
    @_alwaysEmitIntoClient
    static var stir: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 488)
    }

    /// Sano, Inc. (`489`)
    @_alwaysEmitIntoClient
    static var sano: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 489)
    }

    /// Advanced Application Design, Inc. (`490`)
    @_alwaysEmitIntoClient
    static var advancedApplicationDesign: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 490)
    }

    /// AutoMap LLC (`491`)
    @_alwaysEmitIntoClient
    static var automap: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 491)
    }

    /// Spreadtrum Communications Shanghai Ltd (`492`)
    @_alwaysEmitIntoClient
    static var spreadtrumCommunicationsShanghai: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 492)
    }

    /// CuteCircuit LTD (`493`)
    @_alwaysEmitIntoClient
    static var cutecircuit: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 493)
    }

    /// Valeo Service (`494`)
    @_alwaysEmitIntoClient
    static var valeoService: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 494)
    }

    /// Fullpower Technologies, Inc. (`495`)
    @_alwaysEmitIntoClient
    static var fullpowerTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 495)
    }

    /// KloudNation (`496`)
    @_alwaysEmitIntoClient
    static var kloudnation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 496)
    }

    /// Zebra Technologies Corporation (`497`)
    @_alwaysEmitIntoClient
    static var zebraTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 497)
    }

    /// Itron, Inc. (`498`)
    @_alwaysEmitIntoClient
    static var itron: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 498)
    }

    /// The University of Tokyo (`499`)
    @_alwaysEmitIntoClient
    static var universityOfTokyo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 499)
    }

    /// UTC Fire and Security (`500`)
    @_alwaysEmitIntoClient
    static var utcFireAndSecurity: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 500)
    }

    /// Cool Webthings Limited (`501`)
    @_alwaysEmitIntoClient
    static var coolWebthings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 501)
    }

    /// DJO Global (`502`)
    @_alwaysEmitIntoClient
    static var djoGlobal: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 502)
    }

    /// Gelliner Limited (`503`)
    @_alwaysEmitIntoClient
    static var gelliner: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 503)
    }

    /// Anyka (Guangzhou) Microelectronics Technology Co, LTD (`504`)
    @_alwaysEmitIntoClient
    static var anykaGuangzhouMicroelectronicsTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 504)
    }

    /// Medtronic Inc. (`505`)
    @_alwaysEmitIntoClient
    static var medtronic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 505)
    }

    /// Gozio Inc. (`506`)
    @_alwaysEmitIntoClient
    static var gozio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 506)
    }

    /// Form Lifting, LLC (`507`)
    @_alwaysEmitIntoClient
    static var formLifting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 507)
    }

    /// Wahoo Fitness, LLC (`508`)
    @_alwaysEmitIntoClient
    static var wahooFitness: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 508)
    }

    /// Kontakt Micro-Location Sp. z o.o. (`509`)
    @_alwaysEmitIntoClient
    static var kontaktMicroLocation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 509)
    }

    /// Radio Systems Corporation (`510`)
    @_alwaysEmitIntoClient
    static var radioSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 510)
    }

    /// Freescale Semiconductor, Inc. (`511`)
    @_alwaysEmitIntoClient
    static var freescaleSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 511)
    }

    /// Verifone Systems Pte Ltd. Taiwan Branch (`512`)
    @_alwaysEmitIntoClient
    static var verifoneSystemsPteTaiwanBranch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 512)
    }

    /// AR Timing (`513`)
    @_alwaysEmitIntoClient
    static var arTiming: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 513)
    }

    /// Rigado LLC (`514`)
    @_alwaysEmitIntoClient
    static var rigado: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 514)
    }

    /// Kemppi Oy (`515`)
    @_alwaysEmitIntoClient
    static var kemppi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 515)
    }

    /// Tapcentive Inc. (`516`)
    @_alwaysEmitIntoClient
    static var tapcentive: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 516)
    }

    /// Smartbotics Inc. (`517`)
    @_alwaysEmitIntoClient
    static var smartbotics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 517)
    }

    /// Otter Products, LLC (`518`)
    @_alwaysEmitIntoClient
    static var otterProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 518)
    }

    /// STEMP Inc. (`519`)
    @_alwaysEmitIntoClient
    static var stemp: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 519)
    }

    /// LumiGeek LLC (`520`)
    @_alwaysEmitIntoClient
    static var lumigeek: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 520)
    }

    /// InvisionHeart Inc. (`521`)
    @_alwaysEmitIntoClient
    static var invisionheart: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 521)
    }

    /// Macnica Inc. (`522`)
    @_alwaysEmitIntoClient
    static var macnica: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 522)
    }

    /// Jaguar Land Rover Limited (`523`)
    @_alwaysEmitIntoClient
    static var jaguarLandRover: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 523)
    }

    /// CoroWare Technologies, Inc (`524`)
    @_alwaysEmitIntoClient
    static var corowareTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 524)
    }

    /// Simplo Technology Co., LTD (`525`)
    @_alwaysEmitIntoClient
    static var simploTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 525)
    }

    /// Omron Healthcare Co., LTD (`526`)
    @_alwaysEmitIntoClient
    static var omronHealthcare: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 526)
    }

    /// Comodule GMBH (`527`)
    @_alwaysEmitIntoClient
    static var comodule: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 527)
    }

    /// ikeGPS (`528`)
    @_alwaysEmitIntoClient
    static var ikegps: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 528)
    }

    /// Telink Semiconductor Co. Ltd (`529`)
    @_alwaysEmitIntoClient
    static var telinkSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 529)
    }

    /// Interplan Co., Ltd (`530`)
    @_alwaysEmitIntoClient
    static var interplan: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 530)
    }

    /// Wyler AG (`531`)
    @_alwaysEmitIntoClient
    static var wyler: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 531)
    }

    /// IK Multimedia Production srl (`532`)
    @_alwaysEmitIntoClient
    static var ikMultimediaProduction: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 532)
    }

    /// Lukoton Experience Oy (`533`)
    @_alwaysEmitIntoClient
    static var lukotonExperience: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 533)
    }

    /// MTI Ltd (`534`)
    @_alwaysEmitIntoClient
    static var mti: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 534)
    }

    /// Tech4home, Lda (`535`)
    @_alwaysEmitIntoClient
    static var tech4HomeLda: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 535)
    }

    /// Hiotech AB (`536`)
    @_alwaysEmitIntoClient
    static var hiotech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 536)
    }

    /// DOTT Limited (`537`)
    @_alwaysEmitIntoClient
    static var dott: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 537)
    }

    /// Blue Speck Labs, LLC (`538`)
    @_alwaysEmitIntoClient
    static var blueSpeckLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 538)
    }

    /// Cisco Systems, Inc (`539`)
    @_alwaysEmitIntoClient
    static var ciscoSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 539)
    }

    /// Mobicomm Inc (`540`)
    @_alwaysEmitIntoClient
    static var mobicomm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 540)
    }

    /// Edamic (`541`)
    @_alwaysEmitIntoClient
    static var edamic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 541)
    }

    /// Goodnet, Ltd (`542`)
    @_alwaysEmitIntoClient
    static var goodnet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 542)
    }

    /// Luster Leaf Products  Inc (`543`)
    @_alwaysEmitIntoClient
    static var lusterLeafProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 543)
    }

    /// Manus Machina BV (`544`)
    @_alwaysEmitIntoClient
    static var manusMachina: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 544)
    }

    /// Mobiquity Networks Inc (`545`)
    @_alwaysEmitIntoClient
    static var mobiquityNetworks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 545)
    }

    /// Praxis Dynamics (`546`)
    @_alwaysEmitIntoClient
    static var praxisDynamics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 546)
    }

    /// Philip Morris Products S.A. (`547`)
    @_alwaysEmitIntoClient
    static var philipMorrisProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 547)
    }

    /// Comarch SA (`548`)
    @_alwaysEmitIntoClient
    static var comarch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 548)
    }

    /// Nestlé Nespresso S.A. (`549`)
    @_alwaysEmitIntoClient
    static var nestleNespresso: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 549)
    }

    /// Merlinia A/S (`550`)
    @_alwaysEmitIntoClient
    static var merlinia: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 550)
    }

    /// LifeBEAM Technologies (`551`)
    @_alwaysEmitIntoClient
    static var lifebeamTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 551)
    }

    /// Twocanoes Labs, LLC (`552`)
    @_alwaysEmitIntoClient
    static var twocanoesLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 552)
    }

    /// Muoverti Limited (`553`)
    @_alwaysEmitIntoClient
    static var muoverti: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 553)
    }

    /// Stamer Musikanlagen GMBH (`554`)
    @_alwaysEmitIntoClient
    static var stamerMusikanlagen: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 554)
    }

    /// Tesla, Inc. (`555`)
    @_alwaysEmitIntoClient
    static var tesla: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 555)
    }

    /// Pharynks Corporation (`556`)
    @_alwaysEmitIntoClient
    static var pharynks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 556)
    }

    /// Lupine (`557`)
    @_alwaysEmitIntoClient
    static var lupine: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 557)
    }

    /// Siemens AG (`558`)
    @_alwaysEmitIntoClient
    static var siemens: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 558)
    }

    /// Huami (Shanghai) Culture Communication CO., LTD (`559`)
    @_alwaysEmitIntoClient
    static var huamiShanghaiCultureCommunication: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 559)
    }

    /// Foster Electric Company, Ltd (`560`)
    @_alwaysEmitIntoClient
    static var fosterElectric: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 560)
    }

    /// ETA SA (`561`)
    @_alwaysEmitIntoClient
    static var eta: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 561)
    }

    /// x-Senso Solutions Kft (`562`)
    @_alwaysEmitIntoClient
    static var xSensoSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 562)
    }

    /// Shenzhen SuLong Communication Ltd (`563`)
    @_alwaysEmitIntoClient
    static var shenzhenSulongCommunication: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 563)
    }

    /// FengFan (BeiJing) Technology Co, Ltd (`564`)
    @_alwaysEmitIntoClient
    static var fengfanBeijingTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 564)
    }

    /// Qrio Inc (`565`)
    @_alwaysEmitIntoClient
    static var qrio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 565)
    }

    /// Pitpatpet Ltd (`566`)
    @_alwaysEmitIntoClient
    static var pitpatpet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 566)
    }

    /// MSHeli s.r.l. (`567`)
    @_alwaysEmitIntoClient
    static var msheli: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 567)
    }

    /// Trakm8 Ltd (`568`)
    @_alwaysEmitIntoClient
    static var trakm8: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 568)
    }

    /// JIN CO, Ltd (`569`)
    @_alwaysEmitIntoClient
    static var jin: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 569)
    }

    /// Alatech Tehnology (`570`)
    @_alwaysEmitIntoClient
    static var alatechTehnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 570)
    }

    /// Beijing CarePulse Electronic Technology Co, Ltd (`571`)
    @_alwaysEmitIntoClient
    static var beijingCarepulseElectronicTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 571)
    }

    /// Awarepoint (`572`)
    @_alwaysEmitIntoClient
    static var awarepoint: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 572)
    }

    /// ViCentra B.V. (`573`)
    @_alwaysEmitIntoClient
    static var vicentra: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 573)
    }

    /// Raven Industries (`574`)
    @_alwaysEmitIntoClient
    static var ravenIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 574)
    }

    /// WaveWare Technologies Inc. (`575`)
    @_alwaysEmitIntoClient
    static var wavewareTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 575)
    }

    /// Argenox Technologies (`576`)
    @_alwaysEmitIntoClient
    static var argenoxTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 576)
    }

    /// Bragi GmbH (`577`)
    @_alwaysEmitIntoClient
    static var bragi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 577)
    }

    /// 16Lab Inc (`578`)
    @_alwaysEmitIntoClient
    static var company16Lab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 578)
    }

    /// Masimo Corp (`579`)
    @_alwaysEmitIntoClient
    static var masimo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 579)
    }

    /// Iotera Inc (`580`)
    @_alwaysEmitIntoClient
    static var iotera: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 580)
    }

    /// Endress+Hauser (`581`)
    @_alwaysEmitIntoClient
    static var endressHauser: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 581)
    }

    /// ACKme Networks, Inc. (`582`)
    @_alwaysEmitIntoClient
    static var ackmeNetworks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 582)
    }

    /// FiftyThree Inc. (`583`)
    @_alwaysEmitIntoClient
    static var fiftythree: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 583)
    }

    /// Parker Hannifin Corp (`584`)
    @_alwaysEmitIntoClient
    static var parkerHannifin: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 584)
    }

    /// Transcranial Ltd (`585`)
    @_alwaysEmitIntoClient
    static var transcranial: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 585)
    }

    /// Uwatec AG (`586`)
    @_alwaysEmitIntoClient
    static var uwatec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 586)
    }

    /// Orlan LLC (`587`)
    @_alwaysEmitIntoClient
    static var orlan: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 587)
    }

    /// Blue Clover Devices (`588`)
    @_alwaysEmitIntoClient
    static var blueCloverDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 588)
    }

    /// M-Way Solutions GmbH (`589`)
    @_alwaysEmitIntoClient
    static var mWaySolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 589)
    }

    /// Microtronics Engineering GmbH (`590`)
    @_alwaysEmitIntoClient
    static var microtronicsEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 590)
    }

    /// Schneider Schreibgeräte GmbH (`591`)
    @_alwaysEmitIntoClient
    static var schneiderSchreibgerate: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 591)
    }

    /// Sapphire Circuits LLC (`592`)
    @_alwaysEmitIntoClient
    static var sapphireCircuits: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 592)
    }

    /// Lumo Bodytech Inc. (`593`)
    @_alwaysEmitIntoClient
    static var lumoBodytech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 593)
    }

    /// UKC Technosolution (`594`)
    @_alwaysEmitIntoClient
    static var ukcTechnosolution: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 594)
    }

    /// Xicato Inc. (`595`)
    @_alwaysEmitIntoClient
    static var xicato: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 595)
    }

    /// Playbrush (`596`)
    @_alwaysEmitIntoClient
    static var playbrush: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 596)
    }

    /// Dai Nippon Printing Co., Ltd. (`597`)
    @_alwaysEmitIntoClient
    static var daiNipponPrinting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 597)
    }

    /// G24 Power Limited (`598`)
    @_alwaysEmitIntoClient
    static var g24Power: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 598)
    }

    /// AdBabble Local Commerce Inc. (`599`)
    @_alwaysEmitIntoClient
    static var adbabbleLocalCommerce: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 599)
    }

    /// Devialet SA (`600`)
    @_alwaysEmitIntoClient
    static var devialet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 600)
    }

    /// ALTYOR (`601`)
    @_alwaysEmitIntoClient
    static var altyor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 601)
    }

    /// University of Applied Sciences Valais/Haute Ecole Valaisanne (`602`)
    @_alwaysEmitIntoClient
    static var universityOfAppliedSciencesValaisHauteEcoleValaisanne: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 602)
    }

    /// Five Interactive, LLC dba Zendo (`603`)
    @_alwaysEmitIntoClient
    static var fiveInteractiveDbaZendo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 603)
    }

    /// NetEase（Hangzhou）Network co.Ltd. (`604`)
    @_alwaysEmitIntoClient
    static var neteaseHangzhouNetwork: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 604)
    }

    /// Lexmark International Inc. (`605`)
    @_alwaysEmitIntoClient
    static var lexmarkInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 605)
    }

    /// Fluke Corporation (`606`)
    @_alwaysEmitIntoClient
    static var fluke: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 606)
    }

    /// Yardarm Technologies (`607`)
    @_alwaysEmitIntoClient
    static var yardarmTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 607)
    }

    /// SensaRx (`608`)
    @_alwaysEmitIntoClient
    static var sensarx: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 608)
    }

    /// SECVRE GmbH (`609`)
    @_alwaysEmitIntoClient
    static var secvre: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 609)
    }

    /// Glacial Ridge Technologies (`610`)
    @_alwaysEmitIntoClient
    static var glacialRidgeTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 610)
    }

    /// Identiv, Inc. (`611`)
    @_alwaysEmitIntoClient
    static var identiv: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 611)
    }

    /// DDS, Inc. (`612`)
    @_alwaysEmitIntoClient
    static var dds: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 612)
    }

    /// SMK Corporation (`613`)
    @_alwaysEmitIntoClient
    static var smk: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 613)
    }

    /// Schawbel Technologies LLC (`614`)
    @_alwaysEmitIntoClient
    static var schawbelTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 614)
    }

    /// XMI Systems SA (`615`)
    @_alwaysEmitIntoClient
    static var xmiSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 615)
    }

    /// Cerevo (`616`)
    @_alwaysEmitIntoClient
    static var cerevo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 616)
    }

    /// Torrox GmbH & Co KG (`617`)
    @_alwaysEmitIntoClient
    static var torrox: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 617)
    }

    /// Gemalto (`618`)
    @_alwaysEmitIntoClient
    static var gemalto: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 618)
    }

    /// DEKA Research & Development Corp. (`619`)
    @_alwaysEmitIntoClient
    static var dekaResearchDevelopment: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 619)
    }

    /// Domster Tadeusz Szydlowski (`620`)
    @_alwaysEmitIntoClient
    static var domsterTadeuszSzydlowski: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 620)
    }

    /// Technogym SPA (`621`)
    @_alwaysEmitIntoClient
    static var technogymSpa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 621)
    }

    /// FLEURBAEY BVBA (`622`)
    @_alwaysEmitIntoClient
    static var fleurbaeyba: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 622)
    }

    /// Aptcode Solutions (`623`)
    @_alwaysEmitIntoClient
    static var aptcodeSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 623)
    }

    /// LSI ADL Technology (`624`)
    @_alwaysEmitIntoClient
    static var lsiAdlTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 624)
    }

    /// Animas Corp (`625`)
    @_alwaysEmitIntoClient
    static var animas: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 625)
    }

    /// Alps Alpine Co., Ltd. (`626`)
    @_alwaysEmitIntoClient
    static var alpsAlpine: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 626)
    }

    /// OCEASOFT (`627`)
    @_alwaysEmitIntoClient
    static var oceasoft: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 627)
    }

    /// Motsai Research (`628`)
    @_alwaysEmitIntoClient
    static var motsaiResearch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 628)
    }

    /// Geotab (`629`)
    @_alwaysEmitIntoClient
    static var geotab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 629)
    }

    /// E.G.O. Elektro-Geraetebau GmbH (`630`)
    @_alwaysEmitIntoClient
    static var eGOElektroGeraetebau: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 630)
    }

    /// bewhere inc (`631`)
    @_alwaysEmitIntoClient
    static var bewhere: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 631)
    }

    /// Johnson Outdoors Inc (`632`)
    @_alwaysEmitIntoClient
    static var johnsonOutdoors: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 632)
    }

    /// steute Schaltgerate GmbH & Co. KG (`633`)
    @_alwaysEmitIntoClient
    static var steuteSchaltgerate: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 633)
    }

    /// Ekomini inc. (`634`)
    @_alwaysEmitIntoClient
    static var ekomini: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 634)
    }

    /// DEFA AS (`635`)
    @_alwaysEmitIntoClient
    static var defa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 635)
    }

    /// Aseptika Ltd (`636`)
    @_alwaysEmitIntoClient
    static var aseptika: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 636)
    }

    /// HUAWEI Technologies Co., Ltd. (`637`)
    @_alwaysEmitIntoClient
    static var huaweiTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 637)
    }

    /// HabitAware, LLC (`638`)
    @_alwaysEmitIntoClient
    static var habitaware: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 638)
    }

    /// ruwido austria gmbh (`639`)
    @_alwaysEmitIntoClient
    static var ruwidoAustria: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 639)
    }

    /// ITEC corporation (`640`)
    @_alwaysEmitIntoClient
    static var itec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 640)
    }

    /// StoneL (`641`)
    @_alwaysEmitIntoClient
    static var stonel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 641)
    }

    /// Sonova AG (`642`)
    @_alwaysEmitIntoClient
    static var sonova: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 642)
    }

    /// Maven Machines, Inc. (`643`)
    @_alwaysEmitIntoClient
    static var mavenMachines: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 643)
    }

    /// Synapse Electronics (`644`)
    @_alwaysEmitIntoClient
    static var synapseElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 644)
    }

    /// WOWTech Canada Ltd. (`645`)
    @_alwaysEmitIntoClient
    static var wowtechCanada: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 645)
    }

    /// RF Code, Inc. (`646`)
    @_alwaysEmitIntoClient
    static var rfCode: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 646)
    }

    /// Wally Ventures S.L. (`647`)
    @_alwaysEmitIntoClient
    static var wallyVentures: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 647)
    }

    /// Willowbank Electronics Ltd (`648`)
    @_alwaysEmitIntoClient
    static var willowbankElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 648)
    }

    /// SK Telecom (`649`)
    @_alwaysEmitIntoClient
    static var skTelecom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 649)
    }

    /// Jetro AS (`650`)
    @_alwaysEmitIntoClient
    static var jetro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 650)
    }

    /// Code Gears LTD (`651`)
    @_alwaysEmitIntoClient
    static var codeGears: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 651)
    }

    /// NANOLINK APS (`652`)
    @_alwaysEmitIntoClient
    static var nanolink: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 652)
    }

    /// IF, LLC (`653`)
    @_alwaysEmitIntoClient
    static var ifllc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 653)
    }

    /// RF Digital Corp (`654`)
    @_alwaysEmitIntoClient
    static var rfDigital: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 654)
    }

    /// Church & Dwight Co., Inc (`655`)
    @_alwaysEmitIntoClient
    static var churchDwight: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 655)
    }

    /// Multibit Oy (`656`)
    @_alwaysEmitIntoClient
    static var multibit: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 656)
    }

    /// CliniCloud Inc (`657`)
    @_alwaysEmitIntoClient
    static var clinicloud: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 657)
    }

    /// SwiftSensors (`658`)
    @_alwaysEmitIntoClient
    static var swiftsensors: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 658)
    }

    /// Blue Bite (`659`)
    @_alwaysEmitIntoClient
    static var blueBite: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 659)
    }

    /// ELIAS GmbH (`660`)
    @_alwaysEmitIntoClient
    static var elias: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 660)
    }

    /// Sivantos GmbH (`661`)
    @_alwaysEmitIntoClient
    static var sivantos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 661)
    }

    /// Petzl (`662`)
    @_alwaysEmitIntoClient
    static var petzl: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 662)
    }

    /// storm power ltd (`663`)
    @_alwaysEmitIntoClient
    static var stormPower: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 663)
    }

    /// EISST Ltd (`664`)
    @_alwaysEmitIntoClient
    static var eisst: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 664)
    }

    /// Inexess Technology Simma KG (`665`)
    @_alwaysEmitIntoClient
    static var inexessTechnologySimmaKg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 665)
    }

    /// Currant, Inc. (`666`)
    @_alwaysEmitIntoClient
    static var currant: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 666)
    }

    /// C2 Development, Inc. (`667`)
    @_alwaysEmitIntoClient
    static var c2Development: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 667)
    }

    /// Blue Sky Scientific, LLC (`668`)
    @_alwaysEmitIntoClient
    static var blueSkyScientific: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 668)
    }

    /// ALOTTAZS LABS, LLC (`669`)
    @_alwaysEmitIntoClient
    static var alottazsLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 669)
    }

    /// Kupson spol. s r.o. (`670`)
    @_alwaysEmitIntoClient
    static var kupsonSpolSRO: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 670)
    }

    /// Areus Engineering GmbH (`671`)
    @_alwaysEmitIntoClient
    static var areusEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 671)
    }

    /// Impossible Camera GmbH (`672`)
    @_alwaysEmitIntoClient
    static var impossibleCamera: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 672)
    }

    /// InventureTrack Systems (`673`)
    @_alwaysEmitIntoClient
    static var inventuretrackSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 673)
    }

    /// Sera4 Ltd. (`674`)
    @_alwaysEmitIntoClient
    static var sera4: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 674)
    }

    /// Itude (`675`)
    @_alwaysEmitIntoClient
    static var itude: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 675)
    }

    /// Pacific Lock Company (`676`)
    @_alwaysEmitIntoClient
    static var pacificLock: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 676)
    }

    /// Tendyron Corporation (`677`)
    @_alwaysEmitIntoClient
    static var tendyron: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 677)
    }

    /// Robert Bosch GmbH (`678`)
    @_alwaysEmitIntoClient
    static var robertBosch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 678)
    }

    /// Illuxtron international B.V. (`679`)
    @_alwaysEmitIntoClient
    static var illuxtronInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 679)
    }

    /// miSport Ltd. (`680`)
    @_alwaysEmitIntoClient
    static var misport: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 680)
    }

    /// Chargelib (`681`)
    @_alwaysEmitIntoClient
    static var chargelib: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 681)
    }

    /// Doppler Lab (`682`)
    @_alwaysEmitIntoClient
    static var dopplerLab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 682)
    }

    /// BBPOS Limited (`683`)
    @_alwaysEmitIntoClient
    static var bbpos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 683)
    }

    /// RTB Elektronik GmbH & Co. KG (`684`)
    @_alwaysEmitIntoClient
    static var rtbElektronik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 684)
    }

    /// Rx Networks, Inc. (`685`)
    @_alwaysEmitIntoClient
    static var rxNetworks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 685)
    }

    /// WeatherFlow, Inc. (`686`)
    @_alwaysEmitIntoClient
    static var weatherflow: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 686)
    }

    /// Technicolor USA Inc. (`687`)
    @_alwaysEmitIntoClient
    static var technicolor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 687)
    }

    /// Bestechnic(Shanghai),Ltd (`688`)
    @_alwaysEmitIntoClient
    static var bestechnicShanghaiLtd: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 688)
    }

    /// Raden Inc (`689`)
    @_alwaysEmitIntoClient
    static var raden: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 689)
    }

    /// Oura Health Oy (`690`)
    @_alwaysEmitIntoClient
    static var ouraHealth: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 690)
    }

    /// CLABER S.P.A. (`691`)
    @_alwaysEmitIntoClient
    static var claber: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 691)
    }

    /// Hyginex, Inc. (`692`)
    @_alwaysEmitIntoClient
    static var hyginex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 692)
    }

    /// HANSHIN ELECTRIC RAILWAY CO.,LTD. (`693`)
    @_alwaysEmitIntoClient
    static var hanshinElectricRailway: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 693)
    }

    /// Schneider Electric (`694`)
    @_alwaysEmitIntoClient
    static var schneiderElectric: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 694)
    }

    /// Oort Technologies LLC (`695`)
    @_alwaysEmitIntoClient
    static var oortTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 695)
    }

    /// Chrono Therapeutics (`696`)
    @_alwaysEmitIntoClient
    static var chronoTherapeutics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 696)
    }

    /// Rinnai Corporation (`697`)
    @_alwaysEmitIntoClient
    static var rinnai: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 697)
    }

    /// Swissprime Technologies AG (`698`)
    @_alwaysEmitIntoClient
    static var swissprimeTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 698)
    }

    /// Koha.,Co.Ltd (`699`)
    @_alwaysEmitIntoClient
    static var koha: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 699)
    }

    /// Genevac Ltd (`700`)
    @_alwaysEmitIntoClient
    static var genevac: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 700)
    }

    /// Chemtronics (`701`)
    @_alwaysEmitIntoClient
    static var chemtronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 701)
    }

    /// Seguro Technology Sp. z o.o. (`702`)
    @_alwaysEmitIntoClient
    static var seguroTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 702)
    }

    /// Redbird Flight Simulations (`703`)
    @_alwaysEmitIntoClient
    static var redbirdFlightSimulations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 703)
    }

    /// Dash Robotics (`704`)
    @_alwaysEmitIntoClient
    static var dashRobotics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 704)
    }

    /// LINE Corporation (`705`)
    @_alwaysEmitIntoClient
    static var line: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 705)
    }

    /// Guillemot Corporation (`706`)
    @_alwaysEmitIntoClient
    static var guillemot: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 706)
    }

    /// Techtronic Power Tools Technology Limited (`707`)
    @_alwaysEmitIntoClient
    static var techtronicPowerToolsTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 707)
    }

    /// Wilson Sporting Goods (`708`)
    @_alwaysEmitIntoClient
    static var wilsonSportingGoods: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 708)
    }

    /// Lenovo (Singapore) Pte Ltd. (`709`)
    @_alwaysEmitIntoClient
    static var lenovoSingaporePte: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 709)
    }

    /// Ayatan Sensors (`710`)
    @_alwaysEmitIntoClient
    static var ayatanSensors: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 710)
    }

    /// Electronics Tomorrow Limited (`711`)
    @_alwaysEmitIntoClient
    static var electronicsTomorrow: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 711)
    }

    /// OneSpan (`712`)
    @_alwaysEmitIntoClient
    static var onespan: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 712)
    }

    /// PayRange Inc. (`713`)
    @_alwaysEmitIntoClient
    static var payrange: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 713)
    }

    /// ABOV Semiconductor (`714`)
    @_alwaysEmitIntoClient
    static var abovSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 714)
    }

    /// AINA-Wireless Inc. (`715`)
    @_alwaysEmitIntoClient
    static var ainaWireless: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 715)
    }

    /// Eijkelkamp Soil & Water (`716`)
    @_alwaysEmitIntoClient
    static var eijkelkampSoilWater: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 716)
    }

    /// BMA ergonomics b.v. (`717`)
    @_alwaysEmitIntoClient
    static var bmaErgonomics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 717)
    }

    /// Teva Branded Pharmaceutical Products R&D, Inc. (`718`)
    @_alwaysEmitIntoClient
    static var tevaBrandedPharmaceuticalProductsRD: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 718)
    }

    /// Anima (`719`)
    @_alwaysEmitIntoClient
    static var anima: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 719)
    }

    /// 3M (`720`)
    @_alwaysEmitIntoClient
    static var company3M: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 720)
    }

    /// Empatica Srl (`721`)
    @_alwaysEmitIntoClient
    static var empatica: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 721)
    }

    /// Afero, Inc. (`722`)
    @_alwaysEmitIntoClient
    static var afero: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 722)
    }

    /// Powercast Corporation (`723`)
    @_alwaysEmitIntoClient
    static var powercast: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 723)
    }

    /// Secuyou ApS (`724`)
    @_alwaysEmitIntoClient
    static var secuyou: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 724)
    }

    /// OMRON Corporation (`725`)
    @_alwaysEmitIntoClient
    static var omron: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 725)
    }

    /// Send Solutions (`726`)
    @_alwaysEmitIntoClient
    static var sendSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 726)
    }

    /// NIPPON SYSTEMWARE CO.,LTD. (`727`)
    @_alwaysEmitIntoClient
    static var nipponSystemware: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 727)
    }

    /// Neosfar (`728`)
    @_alwaysEmitIntoClient
    static var neosfar: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 728)
    }

    /// Fliegl Agrartechnik GmbH (`729`)
    @_alwaysEmitIntoClient
    static var flieglAgrartechnik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 729)
    }

    /// Gilvader (`730`)
    @_alwaysEmitIntoClient
    static var gilvader: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 730)
    }

    /// Digi International Inc (R) (`731`)
    @_alwaysEmitIntoClient
    static var digiInternationalR: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 731)
    }

    /// DeWalch Technologies, Inc. (`732`)
    @_alwaysEmitIntoClient
    static var dewalchTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 732)
    }

    /// Flint Rehabilitation Devices, LLC (`733`)
    @_alwaysEmitIntoClient
    static var flintRehabilitationDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 733)
    }

    /// Samsung SDS Co., Ltd. (`734`)
    @_alwaysEmitIntoClient
    static var samsungSds: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 734)
    }

    /// Blur Product Development (`735`)
    @_alwaysEmitIntoClient
    static var blurProductDevelopment: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 735)
    }

    /// University of Michigan (`736`)
    @_alwaysEmitIntoClient
    static var universityOfMichigan: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 736)
    }

    /// Victron Energy BV (`737`)
    @_alwaysEmitIntoClient
    static var victronEnergy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 737)
    }

    /// NTT docomo (`738`)
    @_alwaysEmitIntoClient
    static var nttDocomo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 738)
    }

    /// Carmanah Technologies Corp. (`739`)
    @_alwaysEmitIntoClient
    static var carmanahTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 739)
    }

    /// Bytestorm Ltd. (`740`)
    @_alwaysEmitIntoClient
    static var bytestorm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 740)
    }

    /// Espressif Systems (Shanghai) Co., Ltd. (`741`)
    @_alwaysEmitIntoClient
    static var espressifSystemsShanghai: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 741)
    }

    /// Unwire (`742`)
    @_alwaysEmitIntoClient
    static var unwire: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 742)
    }

    /// Connected Yard, Inc. (`743`)
    @_alwaysEmitIntoClient
    static var connectedYard: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 743)
    }

    /// American Music Environments (`744`)
    @_alwaysEmitIntoClient
    static var americanMusicEnvironments: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 744)
    }

    /// Sensogram Technologies, Inc. (`745`)
    @_alwaysEmitIntoClient
    static var sensogramTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 745)
    }

    /// Fujitsu Limited (`746`)
    @_alwaysEmitIntoClient
    static var fujitsu: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 746)
    }

    /// Ardic Technology (`747`)
    @_alwaysEmitIntoClient
    static var ardicTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 747)
    }

    /// Delta Systems, Inc (`748`)
    @_alwaysEmitIntoClient
    static var deltaSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 748)
    }

    /// HTC Corporation (`749`)
    @_alwaysEmitIntoClient
    static var htc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 749)
    }

    /// Citizen Holdings Co., Ltd. (`750`)
    @_alwaysEmitIntoClient
    static var citizenHoldings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 750)
    }

    /// SMART-INNOVATION.inc (`751`)
    @_alwaysEmitIntoClient
    static var smartInnovationInc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 751)
    }

    /// Blackrat Software (`752`)
    @_alwaysEmitIntoClient
    static var blackratSoftware: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 752)
    }

    /// The Idea Cave, LLC (`753`)
    @_alwaysEmitIntoClient
    static var ideaCave: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 753)
    }

    /// GoPro, Inc. (`754`)
    @_alwaysEmitIntoClient
    static var gopro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 754)
    }

    /// AuthAir, Inc (`755`)
    @_alwaysEmitIntoClient
    static var authair: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 755)
    }

    /// Vensi, Inc. (`756`)
    @_alwaysEmitIntoClient
    static var vensi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 756)
    }

    /// Indagem Tech LLC (`757`)
    @_alwaysEmitIntoClient
    static var indagemTech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 757)
    }

    /// Intemo Technologies (`758`)
    @_alwaysEmitIntoClient
    static var intemoTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 758)
    }

    /// DreamVisions co., Ltd. (`759`)
    @_alwaysEmitIntoClient
    static var dreamvisions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 759)
    }

    /// Runteq Oy Ltd (`760`)
    @_alwaysEmitIntoClient
    static var runteq: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 760)
    }

    /// IMAGINATION TECHNOLOGIES LTD (`761`)
    @_alwaysEmitIntoClient
    static var imaginationTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 761)
    }

    /// CoSTAR TEchnologies (`762`)
    @_alwaysEmitIntoClient
    static var costarTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 762)
    }

    /// Clarius Mobile Health Corp. (`763`)
    @_alwaysEmitIntoClient
    static var clariusMobileHealth: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 763)
    }

    /// Shanghai Frequen Microelectronics Co., Ltd. (`764`)
    @_alwaysEmitIntoClient
    static var shanghaiFrequenMicroelectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 764)
    }

    /// Uwanna, Inc. (`765`)
    @_alwaysEmitIntoClient
    static var uwanna: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 765)
    }

    /// Lierda Science & Technology Group Co., Ltd. (`766`)
    @_alwaysEmitIntoClient
    static var lierdaScienceTechnologyGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 766)
    }

    /// Silicon Laboratories (`767`)
    @_alwaysEmitIntoClient
    static var siliconLaboratories: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 767)
    }

    /// World Moto Inc. (`768`)
    @_alwaysEmitIntoClient
    static var worldMoto: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 768)
    }

    /// Giatec Scientific Inc. (`769`)
    @_alwaysEmitIntoClient
    static var giatecScientific: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 769)
    }

    /// Loop Devices, Inc (`770`)
    @_alwaysEmitIntoClient
    static var loopDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 770)
    }

    /// IACA electronique (`771`)
    @_alwaysEmitIntoClient
    static var iacaElectronique: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 771)
    }

    /// Oura Health Ltd (`772`)
    @_alwaysEmitIntoClient
    static var ouraHealth2: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 772)
    }

    /// Swipp ApS (`773`)
    @_alwaysEmitIntoClient
    static var swipp: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 773)
    }

    /// Life Laboratory Inc. (`774`)
    @_alwaysEmitIntoClient
    static var lifeLaboratory: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 774)
    }

    /// FUJI INDUSTRIAL CO.,LTD. (`775`)
    @_alwaysEmitIntoClient
    static var fujiIndustrial: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 775)
    }

    /// Surefire, LLC (`776`)
    @_alwaysEmitIntoClient
    static var surefire: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 776)
    }

    /// Dolby Labs (`777`)
    @_alwaysEmitIntoClient
    static var dolbyLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 777)
    }

    /// Ellisys (`778`)
    @_alwaysEmitIntoClient
    static var ellisys: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 778)
    }

    /// Magnitude Lighting Converters (`779`)
    @_alwaysEmitIntoClient
    static var magnitudeLightingConverters: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 779)
    }

    /// Hilti AG (`780`)
    @_alwaysEmitIntoClient
    static var hilti: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 780)
    }

    /// Devdata S.r.l. (`781`)
    @_alwaysEmitIntoClient
    static var devdata: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 781)
    }

    /// Deviceworx (`782`)
    @_alwaysEmitIntoClient
    static var deviceworx: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 782)
    }

    /// Shortcut Labs (`783`)
    @_alwaysEmitIntoClient
    static var shortcutLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 783)
    }

    /// SGL Italia S.r.l. (`784`)
    @_alwaysEmitIntoClient
    static var sglItalia: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 784)
    }

    /// PEEQ DATA (`785`)
    @_alwaysEmitIntoClient
    static var peeqData: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 785)
    }

    /// Ducere Technologies Pvt Ltd (`786`)
    @_alwaysEmitIntoClient
    static var ducereTechnologiesPvt: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 786)
    }

    /// DiveNav, Inc. (`787`)
    @_alwaysEmitIntoClient
    static var divenav: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 787)
    }

    /// RIIG AI Sp. z o.o. (`788`)
    @_alwaysEmitIntoClient
    static var riigAi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 788)
    }

    /// Thermo Fisher Scientific (`789`)
    @_alwaysEmitIntoClient
    static var thermoFisherScientific: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 789)
    }

    /// AG Measurematics Pvt. Ltd. (`790`)
    @_alwaysEmitIntoClient
    static var agMeasurematics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 790)
    }

    /// CHUO Electronics CO., LTD. (`791`)
    @_alwaysEmitIntoClient
    static var chuoElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 791)
    }

    /// Aspenta International (`792`)
    @_alwaysEmitIntoClient
    static var aspentaInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 792)
    }

    /// Eugster Frismag AG (`793`)
    @_alwaysEmitIntoClient
    static var eugsterFrismag: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 793)
    }

    /// Wurth Elektronik eiSos GmbH & Co. KG (`794`)
    @_alwaysEmitIntoClient
    static var wurthElektronikEisos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 794)
    }

    /// HQ Inc (`795`)
    @_alwaysEmitIntoClient
    static var hq: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 795)
    }

    /// Lab Sensor Solutions (`796`)
    @_alwaysEmitIntoClient
    static var labSensorSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 796)
    }

    /// Enterlab ApS (`797`)
    @_alwaysEmitIntoClient
    static var enterlab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 797)
    }

    /// Eyefi, Inc. (`798`)
    @_alwaysEmitIntoClient
    static var eyefi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 798)
    }

    /// MetaSystem S.p.A. (`799`)
    @_alwaysEmitIntoClient
    static var metasystem: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 799)
    }

    /// SONO ELECTRONICS. CO., LTD (`800`)
    @_alwaysEmitIntoClient
    static var sonoElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 800)
    }

    /// Jewelbots (`801`)
    @_alwaysEmitIntoClient
    static var jewelbots: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 801)
    }

    /// Compumedics Limited (`802`)
    @_alwaysEmitIntoClient
    static var compumedics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 802)
    }

    /// Rotor Bike Components (`803`)
    @_alwaysEmitIntoClient
    static var rotorBikeComponents: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 803)
    }

    /// Astro, Inc. (`804`)
    @_alwaysEmitIntoClient
    static var astro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 804)
    }

    /// Amotus Solutions (`805`)
    @_alwaysEmitIntoClient
    static var amotusSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 805)
    }

    /// Healthwear Technologies (Changzhou)Ltd (`806`)
    @_alwaysEmitIntoClient
    static var healthwearTechnologiesChangzhouLtd: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 806)
    }

    /// Essex Electronics (`807`)
    @_alwaysEmitIntoClient
    static var essexElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 807)
    }

    /// Grundfos A/S (`808`)
    @_alwaysEmitIntoClient
    static var grundfos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 808)
    }

    /// Eargo, Inc. (`809`)
    @_alwaysEmitIntoClient
    static var eargo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 809)
    }

    /// Electronic Design Lab (`810`)
    @_alwaysEmitIntoClient
    static var electronicDesignLab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 810)
    }

    /// ESYLUX (`811`)
    @_alwaysEmitIntoClient
    static var esylux: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 811)
    }

    /// NIPPON SMT.CO.,Ltd (`812`)
    @_alwaysEmitIntoClient
    static var nipponSmt: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 812)
    }

    /// BM innovations GmbH (`813`)
    @_alwaysEmitIntoClient
    static var bmInnovations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 813)
    }

    /// indoormap (`814`)
    @_alwaysEmitIntoClient
    static var indoormap: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 814)
    }

    /// OttoQ Inc (`815`)
    @_alwaysEmitIntoClient
    static var ottoq: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 815)
    }

    /// North Pole Engineering (`816`)
    @_alwaysEmitIntoClient
    static var northPoleEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 816)
    }

    /// 3flares Technologies Inc. (`817`)
    @_alwaysEmitIntoClient
    static var company3FlaresTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 817)
    }

    /// Electrocompaniet A.S. (`818`)
    @_alwaysEmitIntoClient
    static var electrocompaniet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 818)
    }

    /// Mul-T-Lock (`819`)
    @_alwaysEmitIntoClient
    static var mulTLock: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 819)
    }

    /// Airthings ASA (`820`)
    @_alwaysEmitIntoClient
    static var airthings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 820)
    }

    /// Enlighted Inc (`821`)
    @_alwaysEmitIntoClient
    static var enlighted: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 821)
    }

    /// GISTIC (`822`)
    @_alwaysEmitIntoClient
    static var gistic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 822)
    }

    /// AJP2 Holdings, LLC (`823`)
    @_alwaysEmitIntoClient
    static var ajp2Holdings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 823)
    }

    /// COBI GmbH (`824`)
    @_alwaysEmitIntoClient
    static var cobi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 824)
    }

    /// Blue Sky Scientific, LLC (`825`)
    @_alwaysEmitIntoClient
    static var blueSkyScientific2: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 825)
    }

    /// Appception, Inc. (`826`)
    @_alwaysEmitIntoClient
    static var appception: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 826)
    }

    /// Courtney Thorne Limited (`827`)
    @_alwaysEmitIntoClient
    static var courtneyThorne: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 827)
    }

    /// Virtuosys (`828`)
    @_alwaysEmitIntoClient
    static var virtuosys: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 828)
    }

    /// TPV Technology Limited (`829`)
    @_alwaysEmitIntoClient
    static var tpvTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 829)
    }

    /// Monitra SA (`830`)
    @_alwaysEmitIntoClient
    static var monitra: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 830)
    }

    /// Automation Components, Inc. (`831`)
    @_alwaysEmitIntoClient
    static var automationComponents: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 831)
    }

    /// Letsense s.r.l. (`832`)
    @_alwaysEmitIntoClient
    static var letsense: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 832)
    }

    /// Etesian Technologies LLC (`833`)
    @_alwaysEmitIntoClient
    static var etesianTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 833)
    }

    /// GERTEC BRASIL LTDA. (`834`)
    @_alwaysEmitIntoClient
    static var gertecBrasil: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 834)
    }

    /// Drekker Development Pty. Ltd. (`835`)
    @_alwaysEmitIntoClient
    static var drekkerDevelopment: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 835)
    }

    /// Whirl Inc (`836`)
    @_alwaysEmitIntoClient
    static var whirl: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 836)
    }

    /// Locus Positioning (`837`)
    @_alwaysEmitIntoClient
    static var locusPositioning: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 837)
    }

    /// Acuity Brands Lighting, Inc (`838`)
    @_alwaysEmitIntoClient
    static var acuityBrandsLighting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 838)
    }

    /// Prevent Biometrics (`839`)
    @_alwaysEmitIntoClient
    static var preventBiometrics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 839)
    }

    /// Arioneo (`840`)
    @_alwaysEmitIntoClient
    static var arioneo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 840)
    }

    /// VersaMe (`841`)
    @_alwaysEmitIntoClient
    static var versame: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 841)
    }

    /// Vaddio (`842`)
    @_alwaysEmitIntoClient
    static var vaddio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 842)
    }

    /// Libratone A/S (`843`)
    @_alwaysEmitIntoClient
    static var libratone: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 843)
    }

    /// HM Electronics, Inc. (`844`)
    @_alwaysEmitIntoClient
    static var hmElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 844)
    }

    /// TASER International, Inc. (`845`)
    @_alwaysEmitIntoClient
    static var taserInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 845)
    }

    /// SafeTrust Inc. (`846`)
    @_alwaysEmitIntoClient
    static var safetrust: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 846)
    }

    /// Heartland Payment Systems (`847`)
    @_alwaysEmitIntoClient
    static var heartlandPaymentSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 847)
    }

    /// Bitstrata Systems Inc. (`848`)
    @_alwaysEmitIntoClient
    static var bitstrataSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 848)
    }

    /// Pieps GmbH (`849`)
    @_alwaysEmitIntoClient
    static var pieps: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 849)
    }

    /// iRiding(Xiamen)Technology Co.,Ltd. (`850`)
    @_alwaysEmitIntoClient
    static var iridingXiamenTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 850)
    }

    /// Alpha Audiotronics, Inc. (`851`)
    @_alwaysEmitIntoClient
    static var alphaAudiotronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 851)
    }

    /// TOPPAN FORMS CO.,LTD. (`852`)
    @_alwaysEmitIntoClient
    static var toppanForms: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 852)
    }

    /// Sigma Designs, Inc. (`853`)
    @_alwaysEmitIntoClient
    static var sigmaDesigns: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 853)
    }

    /// Spectrum Brands, Inc. (`854`)
    @_alwaysEmitIntoClient
    static var spectrumBrands: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 854)
    }

    /// Polymap Wireless (`855`)
    @_alwaysEmitIntoClient
    static var polymapWireless: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 855)
    }

    /// MagniWare Ltd. (`856`)
    @_alwaysEmitIntoClient
    static var magniware: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 856)
    }

    /// Novotec Medical GmbH (`857`)
    @_alwaysEmitIntoClient
    static var novotecMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 857)
    }

    /// Phillips-Medisize A/S (`858`)
    @_alwaysEmitIntoClient
    static var phillipsMedisize: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 858)
    }

    /// Matrix Inc. (`859`)
    @_alwaysEmitIntoClient
    static var matrix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 859)
    }

    /// Eaton Corporation (`860`)
    @_alwaysEmitIntoClient
    static var eaton: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 860)
    }

    /// KYS (`861`)
    @_alwaysEmitIntoClient
    static var kys: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 861)
    }

    /// Naya Health, Inc. (`862`)
    @_alwaysEmitIntoClient
    static var nayaHealth: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 862)
    }

    /// Acromag (`863`)
    @_alwaysEmitIntoClient
    static var acromag: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 863)
    }

    /// Insulet Corporation (`864`)
    @_alwaysEmitIntoClient
    static var insulet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 864)
    }

    /// Wellinks Inc. (`865`)
    @_alwaysEmitIntoClient
    static var wellinks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 865)
    }

    /// ON Semiconductor (`866`)
    @_alwaysEmitIntoClient
    static var onSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 866)
    }

    /// FREELAP SA (`867`)
    @_alwaysEmitIntoClient
    static var freelap: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 867)
    }

    /// Favero Electronics Srl (`868`)
    @_alwaysEmitIntoClient
    static var faveroElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 868)
    }

    /// BioMech Sensor LLC (`869`)
    @_alwaysEmitIntoClient
    static var biomechSensor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 869)
    }

    /// BOLTT Sports technologies Private limited (`870`)
    @_alwaysEmitIntoClient
    static var bolttSportsTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 870)
    }

    /// Saphe International (`871`)
    @_alwaysEmitIntoClient
    static var sapheInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 871)
    }

    /// Metormote AB (`872`)
    @_alwaysEmitIntoClient
    static var metormote: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 872)
    }

    /// littleBits (`873`)
    @_alwaysEmitIntoClient
    static var littlebits: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 873)
    }

    /// SetPoint Medical (`874`)
    @_alwaysEmitIntoClient
    static var setpointMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 874)
    }

    /// BRControls Products BV (`875`)
    @_alwaysEmitIntoClient
    static var brcontrolsProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 875)
    }

    /// Zipcar (`876`)
    @_alwaysEmitIntoClient
    static var zipcar: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 876)
    }

    /// AirBolt Pty Ltd (`877`)
    @_alwaysEmitIntoClient
    static var airbolt: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 877)
    }

    /// MOTIVE TECHNOLOGIES, INC. (`878`)
    @_alwaysEmitIntoClient
    static var motiveTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 878)
    }

    /// Motiv, Inc. (`879`)
    @_alwaysEmitIntoClient
    static var motiv: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 879)
    }

    /// Wazombi Labs OÜ (`880`)
    @_alwaysEmitIntoClient
    static var wazombiLabsOu: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 880)
    }

    /// ORBCOMM (`881`)
    @_alwaysEmitIntoClient
    static var orbcomm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 881)
    }

    /// Nixie Labs, Inc. (`882`)
    @_alwaysEmitIntoClient
    static var nixieLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 882)
    }

    /// AppNearMe Ltd (`883`)
    @_alwaysEmitIntoClient
    static var appnearme: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 883)
    }

    /// Holman Industries (`884`)
    @_alwaysEmitIntoClient
    static var holmanIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 884)
    }

    /// Expain AS (`885`)
    @_alwaysEmitIntoClient
    static var expain: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 885)
    }

    /// Electronic Temperature Instruments Ltd (`886`)
    @_alwaysEmitIntoClient
    static var electronicTemperatureInstruments: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 886)
    }

    /// Plejd AB (`887`)
    @_alwaysEmitIntoClient
    static var plejd: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 887)
    }

    /// Propeller Health (`888`)
    @_alwaysEmitIntoClient
    static var propellerHealth: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 888)
    }

    /// Shenzhen iMCO Electronic Technology Co.,Ltd (`889`)
    @_alwaysEmitIntoClient
    static var shenzhenImcoElectronicTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 889)
    }

    /// Algoria (`890`)
    @_alwaysEmitIntoClient
    static var algoria: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 890)
    }

    /// Apption Labs Inc. (`891`)
    @_alwaysEmitIntoClient
    static var apptionLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 891)
    }

    /// Cronologics Corporation (`892`)
    @_alwaysEmitIntoClient
    static var cronologics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 892)
    }

    /// MICRODIA Ltd. (`893`)
    @_alwaysEmitIntoClient
    static var microdia: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 893)
    }

    /// lulabytes S.L. (`894`)
    @_alwaysEmitIntoClient
    static var lulabytes: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 894)
    }

    /// Société des Produits Nestlé S.A. (`895`)
    @_alwaysEmitIntoClient
    static var societeDesProduitsNestle: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 895)
    }

    /// LLC "MEGA-F service" (`896`)
    @_alwaysEmitIntoClient
    static var megaFService: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 896)
    }

    /// Sharp Corporation (`897`)
    @_alwaysEmitIntoClient
    static var sharp: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 897)
    }

    /// Precision Outcomes Ltd (`898`)
    @_alwaysEmitIntoClient
    static var precisionOutcomes: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 898)
    }

    /// Kronos Incorporated (`899`)
    @_alwaysEmitIntoClient
    static var kronos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 899)
    }

    /// OCOSMOS Co., Ltd. (`900`)
    @_alwaysEmitIntoClient
    static var ocosmos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 900)
    }

    /// Embedded Electronic Solutions Ltd. dba e2Solutions (`901`)
    @_alwaysEmitIntoClient
    static var embeddedElectronicSolutionsDbaE2Solutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 901)
    }

    /// Aterica Inc. (`902`)
    @_alwaysEmitIntoClient
    static var aterica: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 902)
    }

    /// BluStor PMC, Inc. (`903`)
    @_alwaysEmitIntoClient
    static var blustorPmc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 903)
    }

    /// Kapsch TrafficCom AB (`904`)
    @_alwaysEmitIntoClient
    static var kapschTrafficcom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 904)
    }

    /// ActiveBlu Corporation (`905`)
    @_alwaysEmitIntoClient
    static var activeblu: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 905)
    }

    /// Kohler Mira Limited (`906`)
    @_alwaysEmitIntoClient
    static var kohlerMira: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 906)
    }

    /// Noke (`907`)
    @_alwaysEmitIntoClient
    static var noke: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 907)
    }

    /// Appion Inc. (`908`)
    @_alwaysEmitIntoClient
    static var appion: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 908)
    }

    /// Resmed Ltd (`909`)
    @_alwaysEmitIntoClient
    static var resmed: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 909)
    }

    /// Crownstone B.V. (`910`)
    @_alwaysEmitIntoClient
    static var crownstone: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 910)
    }

    /// Xiaomi Inc. (`911`)
    @_alwaysEmitIntoClient
    static var xiaomi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 911)
    }

    /// INFOTECH s.r.o. (`912`)
    @_alwaysEmitIntoClient
    static var infotech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 912)
    }

    /// Thingsquare AB (`913`)
    @_alwaysEmitIntoClient
    static var thingsquare: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 913)
    }

    /// T&D (`914`)
    @_alwaysEmitIntoClient
    static var tD: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 914)
    }

    /// LAVAZZA S.p.A. (`915`)
    @_alwaysEmitIntoClient
    static var lavazza: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 915)
    }

    /// Netclearance Systems, Inc. (`916`)
    @_alwaysEmitIntoClient
    static var netclearanceSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 916)
    }

    /// SDATAWAY (`917`)
    @_alwaysEmitIntoClient
    static var sdataway: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 917)
    }

    /// BLOKS GmbH (`918`)
    @_alwaysEmitIntoClient
    static var bloks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 918)
    }

    /// LEGO System A/S (`919`)
    @_alwaysEmitIntoClient
    static var legoSystem: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 919)
    }

    /// Thetatronics Ltd (`920`)
    @_alwaysEmitIntoClient
    static var thetatronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 920)
    }

    /// Nikon Corporation (`921`)
    @_alwaysEmitIntoClient
    static var nikon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 921)
    }

    /// NeST (`922`)
    @_alwaysEmitIntoClient
    static var nest: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 922)
    }

    /// South Silicon Valley Microelectronics (`923`)
    @_alwaysEmitIntoClient
    static var southSiliconValleyMicroelectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 923)
    }

    /// ALE International (`924`)
    @_alwaysEmitIntoClient
    static var aleInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 924)
    }

    /// CareView Communications, Inc. (`925`)
    @_alwaysEmitIntoClient
    static var careviewCommunications: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 925)
    }

    /// SchoolBoard Limited (`926`)
    @_alwaysEmitIntoClient
    static var schoolboard: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 926)
    }

    /// Molex Corporation (`927`)
    @_alwaysEmitIntoClient
    static var molex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 927)
    }

    /// IVT Wireless Limited (`928`)
    @_alwaysEmitIntoClient
    static var ivtWireless: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 928)
    }

    /// Alpine Labs LLC (`929`)
    @_alwaysEmitIntoClient
    static var alpineLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 929)
    }

    /// Candura Instruments (`930`)
    @_alwaysEmitIntoClient
    static var canduraInstruments: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 930)
    }

    /// SmartMovt Technology Co., Ltd (`931`)
    @_alwaysEmitIntoClient
    static var smartmovtTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 931)
    }

    /// Token Zero Ltd (`932`)
    @_alwaysEmitIntoClient
    static var tokenZero: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 932)
    }

    /// ACE CAD Enterprise Co., Ltd. (ACECAD) (`933`)
    @_alwaysEmitIntoClient
    static var aceCadEnterpriseAcecad: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 933)
    }

    /// Medela, Inc (`934`)
    @_alwaysEmitIntoClient
    static var medela: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 934)
    }

    /// AeroScout (`935`)
    @_alwaysEmitIntoClient
    static var aeroscout: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 935)
    }

    /// Esrille Inc. (`936`)
    @_alwaysEmitIntoClient
    static var esrille: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 936)
    }

    /// THINKERLY SRL (`937`)
    @_alwaysEmitIntoClient
    static var thinkerly: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 937)
    }

    /// Exon Sp. z o.o. (`938`)
    @_alwaysEmitIntoClient
    static var exon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 938)
    }

    /// Meizu Technology Co., Ltd. (`939`)
    @_alwaysEmitIntoClient
    static var meizuTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 939)
    }

    /// Smablo LTD (`940`)
    @_alwaysEmitIntoClient
    static var smablo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 940)
    }

    /// XiQ (`941`)
    @_alwaysEmitIntoClient
    static var xiq: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 941)
    }

    /// Allswell Inc. (`942`)
    @_alwaysEmitIntoClient
    static var allswell: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 942)
    }

    /// Comm-N-Sense Corp DBA Verigo (`943`)
    @_alwaysEmitIntoClient
    static var commNSenseDbaVerigo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 943)
    }

    /// VIBRADORM GmbH (`944`)
    @_alwaysEmitIntoClient
    static var vibradorm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 944)
    }

    /// Otodata Wireless Network Inc. (`945`)
    @_alwaysEmitIntoClient
    static var otodataWirelessNetwork: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 945)
    }

    /// Propagation Systems Limited (`946`)
    @_alwaysEmitIntoClient
    static var propagationSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 946)
    }

    /// Midwest Instruments & Controls (`947`)
    @_alwaysEmitIntoClient
    static var midwestInstrumentsControls: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 947)
    }

    /// Alpha Nodus, inc. (`948`)
    @_alwaysEmitIntoClient
    static var alphaNodus: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 948)
    }

    /// petPOMM, Inc (`949`)
    @_alwaysEmitIntoClient
    static var petpomm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 949)
    }

    /// Mattel (`950`)
    @_alwaysEmitIntoClient
    static var mattel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 950)
    }

    /// Airbly Inc. (`951`)
    @_alwaysEmitIntoClient
    static var airbly: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 951)
    }

    /// A-Safe Limited (`952`)
    @_alwaysEmitIntoClient
    static var aSafe: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 952)
    }

    /// FREDERIQUE CONSTANT SA (`953`)
    @_alwaysEmitIntoClient
    static var frederiqueConstant: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 953)
    }

    /// Maxscend Microelectronics Company Limited (`954`)
    @_alwaysEmitIntoClient
    static var maxscendMicroelectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 954)
    }

    /// Abbott (`955`)
    @_alwaysEmitIntoClient
    static var abbott: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 955)
    }

    /// ASB Bank Ltd (`956`)
    @_alwaysEmitIntoClient
    static var asbBank: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 956)
    }

    /// amadas (`957`)
    @_alwaysEmitIntoClient
    static var amadas: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 957)
    }

    /// Applied Science, Inc. (`958`)
    @_alwaysEmitIntoClient
    static var appliedScience: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 958)
    }

    /// iLumi Solutions Inc. (`959`)
    @_alwaysEmitIntoClient
    static var ilumiSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 959)
    }

    /// Arch Systems Inc. (`960`)
    @_alwaysEmitIntoClient
    static var archSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 960)
    }

    /// Ember Technologies, Inc. (`961`)
    @_alwaysEmitIntoClient
    static var emberTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 961)
    }

    /// Snapchat Inc (`962`)
    @_alwaysEmitIntoClient
    static var snapchat: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 962)
    }

    /// Casambi Technologies Oy (`963`)
    @_alwaysEmitIntoClient
    static var casambiTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 963)
    }

    /// Pico Technology Inc. (`964`)
    @_alwaysEmitIntoClient
    static var picoTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 964)
    }

    /// St. Jude Medical, Inc. (`965`)
    @_alwaysEmitIntoClient
    static var stJudeMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 965)
    }

    /// Intricon (`966`)
    @_alwaysEmitIntoClient
    static var intricon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 966)
    }

    /// Structural Health Systems, Inc. (`967`)
    @_alwaysEmitIntoClient
    static var structuralHealthSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 967)
    }

    /// Avvel International (`968`)
    @_alwaysEmitIntoClient
    static var avvelInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 968)
    }

    /// Gallagher Group (`969`)
    @_alwaysEmitIntoClient
    static var gallagherGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 969)
    }

    /// In2things Automation Pvt. Ltd. (`970`)
    @_alwaysEmitIntoClient
    static var in2ThingsAutomation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 970)
    }

    /// SYSDEV Srl (`971`)
    @_alwaysEmitIntoClient
    static var sysdev: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 971)
    }

    /// Vonkil Technologies Ltd (`972`)
    @_alwaysEmitIntoClient
    static var vonkilTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 972)
    }

    /// Wynd Technologies, Inc. (`973`)
    @_alwaysEmitIntoClient
    static var wyndTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 973)
    }

    /// CONTRINEX S.A. (`974`)
    @_alwaysEmitIntoClient
    static var contrinex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 974)
    }

    /// MIRA, Inc. (`975`)
    @_alwaysEmitIntoClient
    static var mira: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 975)
    }

    /// Watteam Ltd (`976`)
    @_alwaysEmitIntoClient
    static var watteam: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 976)
    }

    /// Density Inc. (`977`)
    @_alwaysEmitIntoClient
    static var density: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 977)
    }

    /// IOT Pot India Private Limited (`978`)
    @_alwaysEmitIntoClient
    static var iotPotIndia: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 978)
    }

    /// Sigma Connectivity AB (`979`)
    @_alwaysEmitIntoClient
    static var sigmaConnectivity: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 979)
    }

    /// PEG PEREGO SPA (`980`)
    @_alwaysEmitIntoClient
    static var pegPeregoSpa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 980)
    }

    /// Wyzelink Systems Inc. (`981`)
    @_alwaysEmitIntoClient
    static var wyzelinkSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 981)
    }

    /// Yota Devices LTD (`982`)
    @_alwaysEmitIntoClient
    static var yotaDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 982)
    }

    /// FINSECUR (`983`)
    @_alwaysEmitIntoClient
    static var finsecur: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 983)
    }

    /// Zen-Me Labs Ltd (`984`)
    @_alwaysEmitIntoClient
    static var zenMeLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 984)
    }

    /// 3IWare Co., Ltd. (`985`)
    @_alwaysEmitIntoClient
    static var company3Iware: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 985)
    }

    /// EnOcean GmbH (`986`)
    @_alwaysEmitIntoClient
    static var enocean: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 986)
    }

    /// Instabeat, Inc (`987`)
    @_alwaysEmitIntoClient
    static var instabeat: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 987)
    }

    /// Nima Labs (`988`)
    @_alwaysEmitIntoClient
    static var nimaLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 988)
    }

    /// Andreas Stihl AG & Co. KG (`989`)
    @_alwaysEmitIntoClient
    static var andreasStihl: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 989)
    }

    /// Nathan Rhoades LLC (`990`)
    @_alwaysEmitIntoClient
    static var nathanRhoades: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 990)
    }

    /// Grob Technologies, LLC (`991`)
    @_alwaysEmitIntoClient
    static var grobTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 991)
    }

    /// Actions Technology Co.,Ltd (`992`)
    @_alwaysEmitIntoClient
    static var actionsTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 992)
    }

    /// SPD Development Company Ltd (`993`)
    @_alwaysEmitIntoClient
    static var spdDevelopment: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 993)
    }

    /// Sensoan Oy (`994`)
    @_alwaysEmitIntoClient
    static var sensoan: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 994)
    }

    /// Qualcomm Life Inc (`995`)
    @_alwaysEmitIntoClient
    static var qualcommLife: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 995)
    }

    /// Chip-ing AG (`996`)
    @_alwaysEmitIntoClient
    static var chipIng: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 996)
    }

    /// ffly4u (`997`)
    @_alwaysEmitIntoClient
    static var ffly4U: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 997)
    }

    /// IoT Instruments Oy (`998`)
    @_alwaysEmitIntoClient
    static var iotInstruments: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 998)
    }

    /// TRUE Fitness Technology (`999`)
    @_alwaysEmitIntoClient
    static var trueFitnessTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 999)
    }

    /// Reiner Kartengeraete GmbH & Co. KG. (`1000`)
    @_alwaysEmitIntoClient
    static var reinerKartengeraete: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1000)
    }

    /// SHENZHEN LEMONJOY TECHNOLOGY CO., LTD. (`1001`)
    @_alwaysEmitIntoClient
    static var shenzhenLemonjoyTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1001)
    }

    /// Hello Inc. (`1002`)
    @_alwaysEmitIntoClient
    static var hello: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1002)
    }

    /// Ozo Edu, Inc. (`1003`)
    @_alwaysEmitIntoClient
    static var ozoEdu: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1003)
    }

    /// Jigowatts Inc. (`1004`)
    @_alwaysEmitIntoClient
    static var jigowatts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1004)
    }

    /// BASIC MICRO.COM,INC. (`1005`)
    @_alwaysEmitIntoClient
    static var basicMicroCom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1005)
    }

    /// CUBE TECHNOLOGIES (`1006`)
    @_alwaysEmitIntoClient
    static var cubeTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1006)
    }

    /// foolography GmbH (`1007`)
    @_alwaysEmitIntoClient
    static var foolography: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1007)
    }

    /// CLINK (`1008`)
    @_alwaysEmitIntoClient
    static var clink: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1008)
    }

    /// Hestan Smart Cooking Inc. (`1009`)
    @_alwaysEmitIntoClient
    static var hestanSmartCooking: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1009)
    }

    /// WindowMaster A/S (`1010`)
    @_alwaysEmitIntoClient
    static var windowmaster: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1010)
    }

    /// Flowscape AB (`1011`)
    @_alwaysEmitIntoClient
    static var flowscape: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1011)
    }

    /// PAL Technologies Ltd (`1012`)
    @_alwaysEmitIntoClient
    static var palTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1012)
    }

    /// WHERE, Inc. (`1013`)
    @_alwaysEmitIntoClient
    static var whereinc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1013)
    }

    /// Iton Technology Corp. (`1014`)
    @_alwaysEmitIntoClient
    static var itonTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1014)
    }

    /// Owl Labs Inc. (`1015`)
    @_alwaysEmitIntoClient
    static var owlLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1015)
    }

    /// Rockford Corp. (`1016`)
    @_alwaysEmitIntoClient
    static var rockford: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1016)
    }

    /// Becon Technologies Co.,Ltd. (`1017`)
    @_alwaysEmitIntoClient
    static var beconTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1017)
    }

    /// Vyassoft Technologies Inc (`1018`)
    @_alwaysEmitIntoClient
    static var vyassoftTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1018)
    }

    /// Nox Medical (`1019`)
    @_alwaysEmitIntoClient
    static var noxMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1019)
    }

    /// Kimberly-Clark (`1020`)
    @_alwaysEmitIntoClient
    static var kimberlyClark: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1020)
    }

    /// Trimble Inc. (`1021`)
    @_alwaysEmitIntoClient
    static var trimble: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1021)
    }

    /// Littelfuse (`1022`)
    @_alwaysEmitIntoClient
    static var littelfuse: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1022)
    }

    /// Withings (`1023`)
    @_alwaysEmitIntoClient
    static var withings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1023)
    }

    /// i-developer IT Beratung UG (`1024`)
    @_alwaysEmitIntoClient
    static var iDeveloperItBeratungUg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1024)
    }

    /// Relations Inc. (`1025`)
    @_alwaysEmitIntoClient
    static var relations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1025)
    }

    /// Sears Holdings Corporation (`1026`)
    @_alwaysEmitIntoClient
    static var searsHoldings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1026)
    }

    /// Gantner Electronic GmbH (`1027`)
    @_alwaysEmitIntoClient
    static var gantnerElectronic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1027)
    }

    /// Authomate Inc (`1028`)
    @_alwaysEmitIntoClient
    static var authomate: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1028)
    }

    /// Vertex International, Inc. (`1029`)
    @_alwaysEmitIntoClient
    static var vertexInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1029)
    }

    /// Airtago (`1030`)
    @_alwaysEmitIntoClient
    static var airtago: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1030)
    }

    /// Swiss Audio SA (`1031`)
    @_alwaysEmitIntoClient
    static var swissAudio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1031)
    }

    /// ToGetHome Inc. (`1032`)
    @_alwaysEmitIntoClient
    static var togethome: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1032)
    }

    /// RYSE INC. (`1033`)
    @_alwaysEmitIntoClient
    static var ryse: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1033)
    }

    /// ZF OPENMATICS s.r.o. (`1034`)
    @_alwaysEmitIntoClient
    static var zfOpenmatics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1034)
    }

    /// Jana Care Inc. (`1035`)
    @_alwaysEmitIntoClient
    static var janaCare: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1035)
    }

    /// Senix Corporation (`1036`)
    @_alwaysEmitIntoClient
    static var senix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1036)
    }

    /// NorthStar Battery Company, LLC (`1037`)
    @_alwaysEmitIntoClient
    static var northstarBattery: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1037)
    }

    /// SKF (U.K.) Limited (`1038`)
    @_alwaysEmitIntoClient
    static var skfUK: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1038)
    }

    /// CO-AX Technology, Inc. (`1039`)
    @_alwaysEmitIntoClient
    static var coAxTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1039)
    }

    /// Fender Musical Instruments (`1040`)
    @_alwaysEmitIntoClient
    static var fenderMusicalInstruments: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1040)
    }

    /// Luidia Inc (`1041`)
    @_alwaysEmitIntoClient
    static var luidia: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1041)
    }

    /// SEFAM (`1042`)
    @_alwaysEmitIntoClient
    static var sefam: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1042)
    }

    /// Wireless Cables Inc (`1043`)
    @_alwaysEmitIntoClient
    static var wirelessCables: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1043)
    }

    /// Lightning Protection International Pty Ltd (`1044`)
    @_alwaysEmitIntoClient
    static var lightningProtectionInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1044)
    }

    /// Uber Technologies Inc (`1045`)
    @_alwaysEmitIntoClient
    static var uberTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1045)
    }

    /// SODA GmbH (`1046`)
    @_alwaysEmitIntoClient
    static var soda: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1046)
    }

    /// Fatigue Science (`1047`)
    @_alwaysEmitIntoClient
    static var fatigueScience: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1047)
    }

    /// Novalogy LTD (`1049`)
    @_alwaysEmitIntoClient
    static var novalogy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1049)
    }

    /// Friday Labs Limited (`1050`)
    @_alwaysEmitIntoClient
    static var fridayLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1050)
    }

    /// OrthoAccel Technologies (`1051`)
    @_alwaysEmitIntoClient
    static var orthoaccelTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1051)
    }

    /// WaterGuru, Inc. (`1052`)
    @_alwaysEmitIntoClient
    static var waterguru: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1052)
    }

    /// Benning Elektrotechnik und Elektronik GmbH & Co. KG (`1053`)
    @_alwaysEmitIntoClient
    static var benningElektrotechnikUndElektronik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1053)
    }

    /// Dell Computer Corporation (`1054`)
    @_alwaysEmitIntoClient
    static var dellComputer: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1054)
    }

    /// Kopin Corporation (`1055`)
    @_alwaysEmitIntoClient
    static var kopin: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1055)
    }

    /// TecBakery GmbH (`1056`)
    @_alwaysEmitIntoClient
    static var tecbakery: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1056)
    }

    /// Backbone Labs, Inc. (`1057`)
    @_alwaysEmitIntoClient
    static var backboneLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1057)
    }

    /// DELSEY SA (`1058`)
    @_alwaysEmitIntoClient
    static var delsey: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1058)
    }

    /// Chargifi Limited (`1059`)
    @_alwaysEmitIntoClient
    static var chargifi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1059)
    }

    /// Trainesense Ltd. (`1060`)
    @_alwaysEmitIntoClient
    static var trainesense: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1060)
    }

    /// Unify Software and Solutions GmbH & Co. KG (`1061`)
    @_alwaysEmitIntoClient
    static var unifySoftwareAndSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1061)
    }

    /// Husqvarna AB (`1062`)
    @_alwaysEmitIntoClient
    static var husqvarna: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1062)
    }

    /// Focus fleet and fuel management inc (`1063`)
    @_alwaysEmitIntoClient
    static var focusFleetAndFuelManagement: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1063)
    }

    /// SmallLoop, LLC (`1064`)
    @_alwaysEmitIntoClient
    static var smallloop: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1064)
    }

    /// Prolon Inc. (`1065`)
    @_alwaysEmitIntoClient
    static var prolon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1065)
    }

    /// BD Medical (`1066`)
    @_alwaysEmitIntoClient
    static var bdMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1066)
    }

    /// iMicroMed Incorporated (`1067`)
    @_alwaysEmitIntoClient
    static var imicromed: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1067)
    }

    /// Ticto N.V. (`1068`)
    @_alwaysEmitIntoClient
    static var ticto: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1068)
    }

    /// Meshtech AS (`1069`)
    @_alwaysEmitIntoClient
    static var meshtech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1069)
    }

    /// MemCachier Inc. (`1070`)
    @_alwaysEmitIntoClient
    static var memcachier: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1070)
    }

    /// Danfoss A/S (`1071`)
    @_alwaysEmitIntoClient
    static var danfoss: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1071)
    }

    /// SnapStyk Inc. (`1072`)
    @_alwaysEmitIntoClient
    static var snapstyk: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1072)
    }

    /// Alticor Inc. (`1073`)
    @_alwaysEmitIntoClient
    static var alticor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1073)
    }

    /// Silk Labs, Inc. (`1074`)
    @_alwaysEmitIntoClient
    static var silkLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1074)
    }

    /// Pillsy Inc. (`1075`)
    @_alwaysEmitIntoClient
    static var pillsy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1075)
    }

    /// Hatch Baby, Inc. (`1076`)
    @_alwaysEmitIntoClient
    static var hatchBaby: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1076)
    }

    /// Blocks Wearables Ltd. (`1077`)
    @_alwaysEmitIntoClient
    static var blocksWearables: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1077)
    }

    /// Drayson Technologies (Europe) Limited (`1078`)
    @_alwaysEmitIntoClient
    static var draysonTechnologiesEurope: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1078)
    }

    /// eBest IOT Inc. (`1079`)
    @_alwaysEmitIntoClient
    static var ebestIot: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1079)
    }

    /// Helvar Ltd (`1080`)
    @_alwaysEmitIntoClient
    static var helvar: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1080)
    }

    /// Radiance Technologies (`1081`)
    @_alwaysEmitIntoClient
    static var radianceTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1081)
    }

    /// Nuheara Limited (`1082`)
    @_alwaysEmitIntoClient
    static var nuheara: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1082)
    }

    /// Appside co., ltd. (`1083`)
    @_alwaysEmitIntoClient
    static var appside: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1083)
    }

    /// DeLaval (`1084`)
    @_alwaysEmitIntoClient
    static var delaval: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1084)
    }

    /// Coiler Corporation (`1085`)
    @_alwaysEmitIntoClient
    static var coiler: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1085)
    }

    /// Thermomedics, Inc. (`1086`)
    @_alwaysEmitIntoClient
    static var thermomedics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1086)
    }

    /// Tentacle Sync GmbH (`1087`)
    @_alwaysEmitIntoClient
    static var tentacleSync: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1087)
    }

    /// Valencell, Inc. (`1088`)
    @_alwaysEmitIntoClient
    static var valencell: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1088)
    }

    /// iProtoXi Oy (`1089`)
    @_alwaysEmitIntoClient
    static var iprotoxi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1089)
    }

    /// SECOM CO., LTD. (`1090`)
    @_alwaysEmitIntoClient
    static var secom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1090)
    }

    /// Tucker International LLC (`1091`)
    @_alwaysEmitIntoClient
    static var tuckerInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1091)
    }

    /// Metanate Limited (`1092`)
    @_alwaysEmitIntoClient
    static var metanate: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1092)
    }

    /// Kobian Canada Inc. (`1093`)
    @_alwaysEmitIntoClient
    static var kobianCanada: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1093)
    }

    /// NETGEAR, Inc. (`1094`)
    @_alwaysEmitIntoClient
    static var netgear: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1094)
    }

    /// Fabtronics Australia Pty Ltd (`1095`)
    @_alwaysEmitIntoClient
    static var fabtronicsAustralia: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1095)
    }

    /// Grand Centrix GmbH (`1096`)
    @_alwaysEmitIntoClient
    static var grandCentrix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1096)
    }

    /// 1UP USA.com llc (`1097`)
    @_alwaysEmitIntoClient
    static var company1UpUsaCom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1097)
    }

    /// SHIMANO INC. (`1098`)
    @_alwaysEmitIntoClient
    static var shimano: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1098)
    }

    /// Nain Inc. (`1099`)
    @_alwaysEmitIntoClient
    static var nain: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1099)
    }

    /// LifeStyle Lock, LLC (`1100`)
    @_alwaysEmitIntoClient
    static var lifestyleLock: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1100)
    }

    /// VEGA Grieshaber KG (`1101`)
    @_alwaysEmitIntoClient
    static var vegaGrieshaberKg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1101)
    }

    /// Xtrava Inc. (`1102`)
    @_alwaysEmitIntoClient
    static var xtrava: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1102)
    }

    /// TTS Tooltechnic Systems AG & Co. KG (`1103`)
    @_alwaysEmitIntoClient
    static var ttsTooltechnicSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1103)
    }

    /// Teenage Engineering AB (`1104`)
    @_alwaysEmitIntoClient
    static var teenageEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1104)
    }

    /// Tunstall Nordic AB (`1105`)
    @_alwaysEmitIntoClient
    static var tunstallNordic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1105)
    }

    /// Svep Design Center AB (`1106`)
    @_alwaysEmitIntoClient
    static var svepDesignCenter: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1106)
    }

    /// Qorvo Utrecht B.V. (`1107`)
    @_alwaysEmitIntoClient
    static var qorvoUtrecht: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1107)
    }

    /// Sphinx Electronics GmbH & Co KG (`1108`)
    @_alwaysEmitIntoClient
    static var sphinxElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1108)
    }

    /// Atomation (`1109`)
    @_alwaysEmitIntoClient
    static var atomation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1109)
    }

    /// Nemik Consulting Inc (`1110`)
    @_alwaysEmitIntoClient
    static var nemikConsulting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1110)
    }

    /// RF INNOVATION (`1111`)
    @_alwaysEmitIntoClient
    static var rfInnovation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1111)
    }

    /// Mini Solution Co., Ltd. (`1112`)
    @_alwaysEmitIntoClient
    static var miniSolution: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1112)
    }

    /// Lumenetix, Inc (`1113`)
    @_alwaysEmitIntoClient
    static var lumenetix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1113)
    }

    /// 2048450 Ontario Inc (`1114`)
    @_alwaysEmitIntoClient
    static var company2048450Ontario: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1114)
    }

    /// SPACEEK LTD (`1115`)
    @_alwaysEmitIntoClient
    static var spaceek: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1115)
    }

    /// Delta T Corporation (`1116`)
    @_alwaysEmitIntoClient
    static var deltaT: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1116)
    }

    /// Boston Scientific Corporation (`1117`)
    @_alwaysEmitIntoClient
    static var bostonScientific: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1117)
    }

    /// Nuviz, Inc. (`1118`)
    @_alwaysEmitIntoClient
    static var nuviz: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1118)
    }

    /// Real Time Automation, Inc. (`1119`)
    @_alwaysEmitIntoClient
    static var realTimeAutomation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1119)
    }

    /// Kolibree (`1120`)
    @_alwaysEmitIntoClient
    static var kolibree: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1120)
    }

    /// vhf elektronik GmbH (`1121`)
    @_alwaysEmitIntoClient
    static var vhfElektronik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1121)
    }

    /// Bonsai Systems GmbH (`1122`)
    @_alwaysEmitIntoClient
    static var bonsaiSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1122)
    }

    /// Fathom Systems Inc. (`1123`)
    @_alwaysEmitIntoClient
    static var fathomSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1123)
    }

    /// Bellman & Symfon Group AB (`1124`)
    @_alwaysEmitIntoClient
    static var bellmanSymfonGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1124)
    }

    /// International Forte Group LLC (`1125`)
    @_alwaysEmitIntoClient
    static var internationalForteGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1125)
    }

    /// CycleLabs Solutions inc. (`1126`)
    @_alwaysEmitIntoClient
    static var cyclelabsSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1126)
    }

    /// Codenex Oy (`1127`)
    @_alwaysEmitIntoClient
    static var codenex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1127)
    }

    /// Kynesim Ltd (`1128`)
    @_alwaysEmitIntoClient
    static var kynesim: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1128)
    }

    /// Palago AB (`1129`)
    @_alwaysEmitIntoClient
    static var palago: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1129)
    }

    /// INSIGMA INC. (`1130`)
    @_alwaysEmitIntoClient
    static var insigma: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1130)
    }

    /// PMD Solutions (`1131`)
    @_alwaysEmitIntoClient
    static var pmdSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1131)
    }

    /// Qingdao Realtime Technology Co., Ltd. (`1132`)
    @_alwaysEmitIntoClient
    static var qingdaoRealtimeTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1132)
    }

    /// BEGA Gantenbrink-Leuchten KG (`1133`)
    @_alwaysEmitIntoClient
    static var begaGantenbrinkLeuchtenKg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1133)
    }

    /// Pambor Ltd. (`1134`)
    @_alwaysEmitIntoClient
    static var pambor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1134)
    }

    /// Develco Products A/S (`1135`)
    @_alwaysEmitIntoClient
    static var develcoProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1135)
    }

    /// iDesign s.r.l. (`1136`)
    @_alwaysEmitIntoClient
    static var idesign: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1136)
    }

    /// TiVo Corp (`1137`)
    @_alwaysEmitIntoClient
    static var tivo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1137)
    }

    /// Control-J Pty Ltd (`1138`)
    @_alwaysEmitIntoClient
    static var controlJ: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1138)
    }

    /// Steelcase, Inc. (`1139`)
    @_alwaysEmitIntoClient
    static var steelcase: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1139)
    }

    /// iApartment co., ltd. (`1140`)
    @_alwaysEmitIntoClient
    static var iapartment: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1140)
    }

    /// Icom inc. (`1141`)
    @_alwaysEmitIntoClient
    static var icom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1141)
    }

    /// Oxstren Wearable Technologies Private Limited (`1142`)
    @_alwaysEmitIntoClient
    static var oxstrenWearableTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1142)
    }

    /// Blue Spark Technologies (`1143`)
    @_alwaysEmitIntoClient
    static var blueSparkTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1143)
    }

    /// FarSite Communications Limited (`1144`)
    @_alwaysEmitIntoClient
    static var farsiteCommunications: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1144)
    }

    /// mywerk system GmbH (`1145`)
    @_alwaysEmitIntoClient
    static var mywerkSystem: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1145)
    }

    /// Sinosun Technology Co., Ltd. (`1146`)
    @_alwaysEmitIntoClient
    static var sinosunTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1146)
    }

    /// MIYOSHI ELECTRONICS CORPORATION (`1147`)
    @_alwaysEmitIntoClient
    static var miyoshiElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1147)
    }

    /// POWERMAT LTD (`1148`)
    @_alwaysEmitIntoClient
    static var powermat: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1148)
    }

    /// Occly LLC (`1149`)
    @_alwaysEmitIntoClient
    static var occly: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1149)
    }

    /// OurHub Dev IvS (`1150`)
    @_alwaysEmitIntoClient
    static var ourhubDevIvs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1150)
    }

    /// Pro-Mark, Inc. (`1151`)
    @_alwaysEmitIntoClient
    static var proMark: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1151)
    }

    /// Dynometrics Inc. (`1152`)
    @_alwaysEmitIntoClient
    static var dynometrics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1152)
    }

    /// Quintrax Limited (`1153`)
    @_alwaysEmitIntoClient
    static var quintrax: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1153)
    }

    /// POS Tuning Udo Vosshenrich GmbH & Co. KG (`1154`)
    @_alwaysEmitIntoClient
    static var posTuningUdoVosshenrich: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1154)
    }

    /// Multi Care Systems B.V. (`1155`)
    @_alwaysEmitIntoClient
    static var multiCareSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1155)
    }

    /// Revol Technologies Inc (`1156`)
    @_alwaysEmitIntoClient
    static var revolTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1156)
    }

    /// SKIDATA AG (`1157`)
    @_alwaysEmitIntoClient
    static var skidata: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1157)
    }

    /// DEV TECNOLOGIA INDUSTRIA, COMERCIO E MANUTENCAO DE EQUIPAMENTOS LTDA. - ME (`1158`)
    @_alwaysEmitIntoClient
    static var devTecnologiaIndustriaComercioEManutencaoDeEquipamentos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1158)
    }

    /// Centrica Connected Home (`1159`)
    @_alwaysEmitIntoClient
    static var centricaConnectedHome: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1159)
    }

    /// Automotive Data Solutions Inc (`1160`)
    @_alwaysEmitIntoClient
    static var automotiveDataSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1160)
    }

    /// Igarashi Engineering (`1161`)
    @_alwaysEmitIntoClient
    static var igarashiEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1161)
    }

    /// Taelek Oy (`1162`)
    @_alwaysEmitIntoClient
    static var taelek: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1162)
    }

    /// CP Electronics Limited (`1163`)
    @_alwaysEmitIntoClient
    static var cpElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1163)
    }

    /// Vectronix AG (`1164`)
    @_alwaysEmitIntoClient
    static var vectronix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1164)
    }

    /// S-Labs Sp. z o.o. (`1165`)
    @_alwaysEmitIntoClient
    static var sLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1165)
    }

    /// Companion Medical, Inc. (`1166`)
    @_alwaysEmitIntoClient
    static var companionMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1166)
    }

    /// BlueKitchen GmbH (`1167`)
    @_alwaysEmitIntoClient
    static var bluekitchen: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1167)
    }

    /// Matting AB (`1168`)
    @_alwaysEmitIntoClient
    static var matting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1168)
    }

    /// SOREX - Wireless Solutions GmbH (`1169`)
    @_alwaysEmitIntoClient
    static var sorexWirelessSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1169)
    }

    /// ADC Technology, Inc. (`1170`)
    @_alwaysEmitIntoClient
    static var adcTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1170)
    }

    /// Lynxemi Pte Ltd (`1171`)
    @_alwaysEmitIntoClient
    static var lynxemiPte: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1171)
    }

    /// SENNHEISER electronic GmbH & Co. KG (`1172`)
    @_alwaysEmitIntoClient
    static var sennheiserElectronic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1172)
    }

    /// LMT Mercer Group, Inc (`1173`)
    @_alwaysEmitIntoClient
    static var lmtMercerGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1173)
    }

    /// Polymorphic Labs LLC (`1174`)
    @_alwaysEmitIntoClient
    static var polymorphicLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1174)
    }

    /// Cochlear Limited (`1175`)
    @_alwaysEmitIntoClient
    static var cochlear: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1175)
    }

    /// METER Group, Inc. USA (`1176`)
    @_alwaysEmitIntoClient
    static var meterGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1176)
    }

    /// Ruuvi Innovations Ltd. (`1177`)
    @_alwaysEmitIntoClient
    static var ruuviInnovations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1177)
    }

    /// Situne AS (`1178`)
    @_alwaysEmitIntoClient
    static var situne: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1178)
    }

    /// nVisti, LLC (`1179`)
    @_alwaysEmitIntoClient
    static var nvisti: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1179)
    }

    /// DyOcean (`1180`)
    @_alwaysEmitIntoClient
    static var dyocean: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1180)
    }

    /// Uhlmann & Zacher GmbH (`1181`)
    @_alwaysEmitIntoClient
    static var uhlmannZacher: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1181)
    }

    /// AND!XOR LLC (`1182`)
    @_alwaysEmitIntoClient
    static var andXor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1182)
    }

    /// Popper Pay AB (`1183`)
    @_alwaysEmitIntoClient
    static var popperPay: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1183)
    }

    /// Vypin, LLC (`1184`)
    @_alwaysEmitIntoClient
    static var vypin: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1184)
    }

    /// PNI Sensor Corporation (`1185`)
    @_alwaysEmitIntoClient
    static var pniSensor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1185)
    }

    /// ovrEngineered, LLC (`1186`)
    @_alwaysEmitIntoClient
    static var ovrengineered: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1186)
    }

    /// GT-tronics HK Ltd (`1187`)
    @_alwaysEmitIntoClient
    static var gtTronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1187)
    }

    /// Herbert Waldmann GmbH & Co. KG (`1188`)
    @_alwaysEmitIntoClient
    static var herbertWaldmann: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1188)
    }

    /// Guangzhou FiiO Electronics Technology Co.,Ltd (`1189`)
    @_alwaysEmitIntoClient
    static var guangzhouFiioElectronicsTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1189)
    }

    /// Vinetech Co., Ltd (`1190`)
    @_alwaysEmitIntoClient
    static var vinetech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1190)
    }

    /// Dallas Logic Corporation (`1191`)
    @_alwaysEmitIntoClient
    static var dallasLogic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1191)
    }

    /// BioTex, Inc. (`1192`)
    @_alwaysEmitIntoClient
    static var biotex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1192)
    }

    /// DISCOVERY SOUND TECHNOLOGY, LLC (`1193`)
    @_alwaysEmitIntoClient
    static var discoverySoundTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1193)
    }

    /// LINKIO SAS (`1194`)
    @_alwaysEmitIntoClient
    static var linkios: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1194)
    }

    /// Harbortronics, Inc. (`1195`)
    @_alwaysEmitIntoClient
    static var harbortronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1195)
    }

    /// Undagrid B.V. (`1196`)
    @_alwaysEmitIntoClient
    static var undagrid: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1196)
    }

    /// Shure Inc (`1197`)
    @_alwaysEmitIntoClient
    static var shure: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1197)
    }

    /// ERM Electronic Systems LTD (`1198`)
    @_alwaysEmitIntoClient
    static var ermElectronicSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1198)
    }

    /// BIOROWER Handelsagentur GmbH (`1199`)
    @_alwaysEmitIntoClient
    static var biorowerHandelsagentur: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1199)
    }

    /// Weba Sport und Med. Artikel GmbH (`1200`)
    @_alwaysEmitIntoClient
    static var webaSportUndMedArtikel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1200)
    }

    /// Kartographers Technologies Pvt. Ltd. (`1201`)
    @_alwaysEmitIntoClient
    static var kartographersTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1201)
    }

    /// The Shadow on the Moon (`1202`)
    @_alwaysEmitIntoClient
    static var shadowOnMoon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1202)
    }

    /// mobike (Hong Kong) Limited (`1203`)
    @_alwaysEmitIntoClient
    static var mobikeHongKong: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1203)
    }

    /// Inuheat Group AB (`1204`)
    @_alwaysEmitIntoClient
    static var inuheatGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1204)
    }

    /// Swiftronix AB (`1205`)
    @_alwaysEmitIntoClient
    static var swiftronix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1205)
    }

    /// Diagnoptics Technologies (`1206`)
    @_alwaysEmitIntoClient
    static var diagnopticsTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1206)
    }

    /// Analog Devices, Inc. (`1207`)
    @_alwaysEmitIntoClient
    static var analogDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1207)
    }

    /// Soraa Inc. (`1208`)
    @_alwaysEmitIntoClient
    static var soraa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1208)
    }

    /// CSR Building Products Limited (`1209`)
    @_alwaysEmitIntoClient
    static var csrBuildingProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1209)
    }

    /// Crestron Electronics, Inc. (`1210`)
    @_alwaysEmitIntoClient
    static var crestronElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1210)
    }

    /// Neatebox Ltd (`1211`)
    @_alwaysEmitIntoClient
    static var neatebox: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1211)
    }

    /// Draegerwerk AG & Co. KGaA (`1212`)
    @_alwaysEmitIntoClient
    static var draegerwerk: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1212)
    }

    /// AlbynMedical (`1213`)
    @_alwaysEmitIntoClient
    static var albynmedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1213)
    }

    /// Averos FZCO (`1214`)
    @_alwaysEmitIntoClient
    static var averos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1214)
    }

    /// VIT Initiative, LLC (`1215`)
    @_alwaysEmitIntoClient
    static var vitInitiative: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1215)
    }

    /// Statsports International (`1216`)
    @_alwaysEmitIntoClient
    static var statsportsInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1216)
    }

    /// Sospitas, s.r.o. (`1217`)
    @_alwaysEmitIntoClient
    static var sospitas: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1217)
    }

    /// Dmet Products Corp. (`1218`)
    @_alwaysEmitIntoClient
    static var dmetProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1218)
    }

    /// Mantracourt Electronics Limited (`1219`)
    @_alwaysEmitIntoClient
    static var mantracourtElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1219)
    }

    /// TeAM Hutchins AB (`1220`)
    @_alwaysEmitIntoClient
    static var teamHutchins: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1220)
    }

    /// Seibert Williams Glass, LLC (`1221`)
    @_alwaysEmitIntoClient
    static var seibertWilliamsGlass: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1221)
    }

    /// Insta GmbH (`1222`)
    @_alwaysEmitIntoClient
    static var insta: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1222)
    }

    /// Svantek Sp. z o.o. (`1223`)
    @_alwaysEmitIntoClient
    static var svantek: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1223)
    }

    /// Shanghai Flyco Electrical Appliance Co., Ltd. (`1224`)
    @_alwaysEmitIntoClient
    static var shanghaiFlycoElectricalAppliance: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1224)
    }

    /// Thornwave Labs Inc (`1225`)
    @_alwaysEmitIntoClient
    static var thornwaveLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1225)
    }

    /// Steiner-Optik GmbH (`1226`)
    @_alwaysEmitIntoClient
    static var steinerOptik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1226)
    }

    /// Novo Nordisk A/S (`1227`)
    @_alwaysEmitIntoClient
    static var novoNordisk: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1227)
    }

    /// Enflux Inc. (`1228`)
    @_alwaysEmitIntoClient
    static var enflux: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1228)
    }

    /// Safetech Products LLC (`1229`)
    @_alwaysEmitIntoClient
    static var safetechProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1229)
    }

    /// GOOOLED S.R.L. (`1230`)
    @_alwaysEmitIntoClient
    static var goooled: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1230)
    }

    /// DOM Sicherheitstechnik GmbH & Co. KG (`1231`)
    @_alwaysEmitIntoClient
    static var domSicherheitstechnik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1231)
    }

    /// Olympus Corporation (`1232`)
    @_alwaysEmitIntoClient
    static var olympus: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1232)
    }

    /// KTS GmbH (`1233`)
    @_alwaysEmitIntoClient
    static var kts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1233)
    }

    /// Anloq Technologies Inc. (`1234`)
    @_alwaysEmitIntoClient
    static var anloqTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1234)
    }

    /// Queercon, Inc (`1235`)
    @_alwaysEmitIntoClient
    static var queercon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1235)
    }

    /// 5th Element Ltd (`1236`)
    @_alwaysEmitIntoClient
    static var company5ThElement: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1236)
    }

    /// Gooee Limited (`1237`)
    @_alwaysEmitIntoClient
    static var gooee: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1237)
    }

    /// LUGLOC LLC (`1238`)
    @_alwaysEmitIntoClient
    static var lugloc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1238)
    }

    /// Blincam, Inc. (`1239`)
    @_alwaysEmitIntoClient
    static var blincam: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1239)
    }

    /// FUJIFILM Corporation (`1240`)
    @_alwaysEmitIntoClient
    static var fujifilm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1240)
    }

    /// RM Acquisition LLC (`1241`)
    @_alwaysEmitIntoClient
    static var rmAcquisition: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1241)
    }

    /// Franceschi Marina snc (`1242`)
    @_alwaysEmitIntoClient
    static var franceschiMarinaSnc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1242)
    }

    /// Engineered Audio, LLC. (`1243`)
    @_alwaysEmitIntoClient
    static var engineeredAudio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1243)
    }

    /// IOTTIVE (OPC) PRIVATE LIMITED (`1244`)
    @_alwaysEmitIntoClient
    static var iottiveOpc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1244)
    }

    /// 4MOD Technology (`1245`)
    @_alwaysEmitIntoClient
    static var company4ModTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1245)
    }

    /// Lutron Electronics Co., Inc. (`1246`)
    @_alwaysEmitIntoClient
    static var lutronElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1246)
    }

    /// Emerson Electric Co. (`1247`)
    @_alwaysEmitIntoClient
    static var emersonElectric: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1247)
    }

    /// Guardtec, Inc. (`1248`)
    @_alwaysEmitIntoClient
    static var guardtec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1248)
    }

    /// REACTEC LIMITED (`1249`)
    @_alwaysEmitIntoClient
    static var reactec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1249)
    }

    /// EllieGrid (`1250`)
    @_alwaysEmitIntoClient
    static var elliegrid: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1250)
    }

    /// Under Armour (`1251`)
    @_alwaysEmitIntoClient
    static var underArmour: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1251)
    }

    /// Woodenshark (`1252`)
    @_alwaysEmitIntoClient
    static var woodenshark: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1252)
    }

    /// Avack Oy (`1253`)
    @_alwaysEmitIntoClient
    static var avack: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1253)
    }

    /// Smart Solution Technology, Inc. (`1254`)
    @_alwaysEmitIntoClient
    static var smartSolutionTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1254)
    }

    /// REHABTRONICS INC. (`1255`)
    @_alwaysEmitIntoClient
    static var rehabtronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1255)
    }

    /// STABILO International (`1256`)
    @_alwaysEmitIntoClient
    static var stabiloInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1256)
    }

    /// Busch Jaeger Elektro GmbH (`1257`)
    @_alwaysEmitIntoClient
    static var buschJaegerElektro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1257)
    }

    /// Pacific Bioscience Laboratories, Inc (`1258`)
    @_alwaysEmitIntoClient
    static var pacificBioscienceLaboratories: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1258)
    }

    /// Bird Home Automation GmbH (`1259`)
    @_alwaysEmitIntoClient
    static var birdHomeAutomation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1259)
    }

    /// Motorola Solutions (`1260`)
    @_alwaysEmitIntoClient
    static var motorolaSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1260)
    }

    /// R9 Technology, Inc. (`1261`)
    @_alwaysEmitIntoClient
    static var r9Technology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1261)
    }

    /// Auxivia (`1262`)
    @_alwaysEmitIntoClient
    static var auxivia: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1262)
    }

    /// DaisyWorks, Inc (`1263`)
    @_alwaysEmitIntoClient
    static var daisyworks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1263)
    }

    /// Kosi Limited (`1264`)
    @_alwaysEmitIntoClient
    static var kosi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1264)
    }

    /// Theben AG (`1265`)
    @_alwaysEmitIntoClient
    static var theben: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1265)
    }

    /// InDreamer Techsol Private Limited (`1266`)
    @_alwaysEmitIntoClient
    static var indreamerTechsol: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1266)
    }

    /// Cerevast Medical (`1267`)
    @_alwaysEmitIntoClient
    static var cerevastMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1267)
    }

    /// ZanCompute Inc. (`1268`)
    @_alwaysEmitIntoClient
    static var zancompute: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1268)
    }

    /// Pirelli Tyre S.P.A. (`1269`)
    @_alwaysEmitIntoClient
    static var pirelliTyre: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1269)
    }

    /// McLear Limited (`1270`)
    @_alwaysEmitIntoClient
    static var mclear: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1270)
    }

    /// Shenzhen Goodix Technology Co., Ltd (`1271`)
    @_alwaysEmitIntoClient
    static var shenzhenGoodixTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1271)
    }

    /// Convergence Systems Limited (`1272`)
    @_alwaysEmitIntoClient
    static var convergenceSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1272)
    }

    /// Interactio (`1273`)
    @_alwaysEmitIntoClient
    static var interactio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1273)
    }

    /// Androtec GmbH (`1274`)
    @_alwaysEmitIntoClient
    static var androtec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1274)
    }

    /// Benchmark Drives GmbH & Co. KG (`1275`)
    @_alwaysEmitIntoClient
    static var benchmarkDrives: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1275)
    }

    /// SwingLync L. L. C. (`1276`)
    @_alwaysEmitIntoClient
    static var swinglyncLLC: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1276)
    }

    /// Tapkey GmbH (`1277`)
    @_alwaysEmitIntoClient
    static var tapkey: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1277)
    }

    /// Woosim Systems Inc. (`1278`)
    @_alwaysEmitIntoClient
    static var woosimSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1278)
    }

    /// Microsemi Corporation (`1279`)
    @_alwaysEmitIntoClient
    static var microsemi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1279)
    }

    /// Wiliot LTD. (`1280`)
    @_alwaysEmitIntoClient
    static var wiliot: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1280)
    }

    /// Polaris IND (`1281`)
    @_alwaysEmitIntoClient
    static var polarisInd: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1281)
    }

    /// Specifi-Kali LLC (`1282`)
    @_alwaysEmitIntoClient
    static var specifiKali: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1282)
    }

    /// Locoroll, Inc (`1283`)
    @_alwaysEmitIntoClient
    static var locoroll: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1283)
    }

    /// PHYPLUS Inc (`1284`)
    @_alwaysEmitIntoClient
    static var phyplus: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1284)
    }

    /// InPlay, Inc. (`1285`)
    @_alwaysEmitIntoClient
    static var inplay: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1285)
    }

    /// Hager (`1286`)
    @_alwaysEmitIntoClient
    static var hager: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1286)
    }

    /// Yellowcog (`1287`)
    @_alwaysEmitIntoClient
    static var yellowcog: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1287)
    }

    /// Axes System sp. z o. o. (`1288`)
    @_alwaysEmitIntoClient
    static var axesSystemSpZOO: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1288)
    }

    /// Garage Smart, Inc. (`1289`)
    @_alwaysEmitIntoClient
    static var garageSmart: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1289)
    }

    /// Shake-on B.V. (`1290`)
    @_alwaysEmitIntoClient
    static var shakeOn: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1290)
    }

    /// Vibrissa Inc. (`1291`)
    @_alwaysEmitIntoClient
    static var vibrissa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1291)
    }

    /// OSRAM GmbH (`1292`)
    @_alwaysEmitIntoClient
    static var osram: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1292)
    }

    /// TRSystems GmbH (`1293`)
    @_alwaysEmitIntoClient
    static var trsystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1293)
    }

    /// Yichip Microelectronics (Hangzhou) Co.,Ltd. (`1294`)
    @_alwaysEmitIntoClient
    static var yichipMicroelectronicsHangzhou: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1294)
    }

    /// Foundation Engineering LLC (`1295`)
    @_alwaysEmitIntoClient
    static var foundationEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1295)
    }

    /// UNI-ELECTRONICS, INC. (`1296`)
    @_alwaysEmitIntoClient
    static var uniElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1296)
    }

    /// Brookfield Equinox LLC (`1297`)
    @_alwaysEmitIntoClient
    static var brookfieldEquinox: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1297)
    }

    /// Soprod SA (`1298`)
    @_alwaysEmitIntoClient
    static var soprod: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1298)
    }

    /// 9974091 Canada Inc. (`1299`)
    @_alwaysEmitIntoClient
    static var company9974091Canada: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1299)
    }

    /// FIBRO GmbH (`1300`)
    @_alwaysEmitIntoClient
    static var fibro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1300)
    }

    /// RB Controls Co., Ltd. (`1301`)
    @_alwaysEmitIntoClient
    static var rbControls: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1301)
    }

    /// Footmarks (`1302`)
    @_alwaysEmitIntoClient
    static var footmarks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1302)
    }

    /// Amtronic Sverige AB (`1303`)
    @_alwaysEmitIntoClient
    static var amtronicSverige: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1303)
    }

    /// MAMORIO.inc (`1304`)
    @_alwaysEmitIntoClient
    static var mamorioInc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1304)
    }

    /// Tyto Life LLC (`1305`)
    @_alwaysEmitIntoClient
    static var tytoLife: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1305)
    }

    /// Leica Camera AG (`1306`)
    @_alwaysEmitIntoClient
    static var leicaCamera: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1306)
    }

    /// Angee Technologies Ltd. (`1307`)
    @_alwaysEmitIntoClient
    static var angeeTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1307)
    }

    /// EDPS (`1308`)
    @_alwaysEmitIntoClient
    static var edps: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1308)
    }

    /// OFF Line Co., Ltd. (`1309`)
    @_alwaysEmitIntoClient
    static var offLine: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1309)
    }

    /// Detect Blue Limited (`1310`)
    @_alwaysEmitIntoClient
    static var detectBlue: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1310)
    }

    /// Setec Pty Ltd (`1311`)
    @_alwaysEmitIntoClient
    static var setec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1311)
    }

    /// Target Corporation (`1312`)
    @_alwaysEmitIntoClient
    static var target: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1312)
    }

    /// IAI Corporation (`1313`)
    @_alwaysEmitIntoClient
    static var iai: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1313)
    }

    /// NS Tech, Inc. (`1314`)
    @_alwaysEmitIntoClient
    static var nsTech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1314)
    }

    /// MTG Co., Ltd. (`1315`)
    @_alwaysEmitIntoClient
    static var mtg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1315)
    }

    /// Hangzhou iMagic Technology Co., Ltd (`1316`)
    @_alwaysEmitIntoClient
    static var hangzhouImagicTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1316)
    }

    /// HONGKONG NANO IC TECHNOLOGIES  CO., LIMITED (`1317`)
    @_alwaysEmitIntoClient
    static var hongkongNanoIcTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1317)
    }

    /// Honeywell International Inc. (`1318`)
    @_alwaysEmitIntoClient
    static var honeywellInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1318)
    }

    /// Albrecht JUNG (`1319`)
    @_alwaysEmitIntoClient
    static var albrechtJung: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1319)
    }

    /// Lunera Lighting Inc. (`1320`)
    @_alwaysEmitIntoClient
    static var luneraLighting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1320)
    }

    /// Lumen UAB (`1321`)
    @_alwaysEmitIntoClient
    static var lumenUab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1321)
    }

    /// Keynes Controls Ltd (`1322`)
    @_alwaysEmitIntoClient
    static var keynesControls: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1322)
    }

    /// Novartis AG (`1323`)
    @_alwaysEmitIntoClient
    static var novartis: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1323)
    }

    /// Geosatis SA (`1324`)
    @_alwaysEmitIntoClient
    static var geosatis: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1324)
    }

    /// EXFO, Inc. (`1325`)
    @_alwaysEmitIntoClient
    static var exfo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1325)
    }

    /// LEDVANCE GmbH (`1326`)
    @_alwaysEmitIntoClient
    static var ledvance: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1326)
    }

    /// Center ID Corp. (`1327`)
    @_alwaysEmitIntoClient
    static var centerId: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1327)
    }

    /// Adolene, Inc. (`1328`)
    @_alwaysEmitIntoClient
    static var adolene: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1328)
    }

    /// D&M Holdings Inc. (`1329`)
    @_alwaysEmitIntoClient
    static var dMHoldings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1329)
    }

    /// CRESCO Wireless, Inc. (`1330`)
    @_alwaysEmitIntoClient
    static var crescoWireless: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1330)
    }

    /// Nura Operations Pty Ltd (`1331`)
    @_alwaysEmitIntoClient
    static var nuraOperations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1331)
    }

    /// Frontiergadget, Inc. (`1332`)
    @_alwaysEmitIntoClient
    static var frontiergadget: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1332)
    }

    /// Smart Component Technologies Limited (`1333`)
    @_alwaysEmitIntoClient
    static var smartComponentTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1333)
    }

    /// ZTR Control Systems LLC (`1334`)
    @_alwaysEmitIntoClient
    static var ztrControlSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1334)
    }

    /// MetaLogics Corporation (`1335`)
    @_alwaysEmitIntoClient
    static var metalogics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1335)
    }

    /// Medela AG (`1336`)
    @_alwaysEmitIntoClient
    static var medela2: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1336)
    }

    /// OPPLE Lighting Co., Ltd (`1337`)
    @_alwaysEmitIntoClient
    static var oppleLighting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1337)
    }

    /// Savitech Corp., (`1338`)
    @_alwaysEmitIntoClient
    static var savitech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1338)
    }

    /// prodigy (`1339`)
    @_alwaysEmitIntoClient
    static var prodigy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1339)
    }

    /// Screenovate Technologies Ltd (`1340`)
    @_alwaysEmitIntoClient
    static var screenovateTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1340)
    }

    /// TESA SA (`1341`)
    @_alwaysEmitIntoClient
    static var tesa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1341)
    }

    /// CLIM8 LIMITED (`1342`)
    @_alwaysEmitIntoClient
    static var clim8: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1342)
    }

    /// Silergy Corp (`1343`)
    @_alwaysEmitIntoClient
    static var silergy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1343)
    }

    /// SilverPlus, Inc (`1344`)
    @_alwaysEmitIntoClient
    static var silverplus: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1344)
    }

    /// Sharknet srl (`1345`)
    @_alwaysEmitIntoClient
    static var sharknet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1345)
    }

    /// Mist Systems, Inc. (`1346`)
    @_alwaysEmitIntoClient
    static var mistSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1346)
    }

    /// MIWA LOCK CO.,Ltd (`1347`)
    @_alwaysEmitIntoClient
    static var miwaLock: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1347)
    }

    /// OrthoSensor, Inc. (`1348`)
    @_alwaysEmitIntoClient
    static var orthosensor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1348)
    }

    /// Candy Hoover Group s.r.l (`1349`)
    @_alwaysEmitIntoClient
    static var candyHooverGroupSRL: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1349)
    }

    /// Apexar Technologies S.A. (`1350`)
    @_alwaysEmitIntoClient
    static var apexarTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1350)
    }

    /// LOGICDATA Electronic & Software Entwicklungs GmbH (`1351`)
    @_alwaysEmitIntoClient
    static var logicdataElectronicSoftwareEntwicklungs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1351)
    }

    /// Knick Elektronische Messgeraete GmbH & Co. KG (`1352`)
    @_alwaysEmitIntoClient
    static var knickElektronischeMessgeraete: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1352)
    }

    /// Smart Technologies and Investment Limited (`1353`)
    @_alwaysEmitIntoClient
    static var smartTechnologiesAndInvestment: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1353)
    }

    /// Linough Inc. (`1354`)
    @_alwaysEmitIntoClient
    static var linough: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1354)
    }

    /// Advanced Electronic Designs, Inc. (`1355`)
    @_alwaysEmitIntoClient
    static var advancedElectronicDesigns: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1355)
    }

    /// Carefree Scott Fetzer Co Inc (`1356`)
    @_alwaysEmitIntoClient
    static var carefreeScottFetzerCo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1356)
    }

    /// Sensome (`1357`)
    @_alwaysEmitIntoClient
    static var sensome: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1357)
    }

    /// FORTRONIK storitve d.o.o. (`1358`)
    @_alwaysEmitIntoClient
    static var fortronikStoritve: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1358)
    }

    /// Sinnoz (`1359`)
    @_alwaysEmitIntoClient
    static var sinnoz: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1359)
    }

    /// Versa Networks, Inc. (`1360`)
    @_alwaysEmitIntoClient
    static var versaNetworks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1360)
    }

    /// Sylero (`1361`)
    @_alwaysEmitIntoClient
    static var sylero: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1361)
    }

    /// Avempace SARL (`1362`)
    @_alwaysEmitIntoClient
    static var avempacerl: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1362)
    }

    /// Nintendo Co., Ltd. (`1363`)
    @_alwaysEmitIntoClient
    static var nintendo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1363)
    }

    /// National Instruments (`1364`)
    @_alwaysEmitIntoClient
    static var nationalInstruments: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1364)
    }

    /// KROHNE Messtechnik GmbH (`1365`)
    @_alwaysEmitIntoClient
    static var krohneMesstechnik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1365)
    }

    /// Otodynamics Ltd (`1366`)
    @_alwaysEmitIntoClient
    static var otodynamics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1366)
    }

    /// Arwin Technology Limited (`1367`)
    @_alwaysEmitIntoClient
    static var arwinTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1367)
    }

    /// benegear, inc. (`1368`)
    @_alwaysEmitIntoClient
    static var benegear: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1368)
    }

    /// Newcon Optik (`1369`)
    @_alwaysEmitIntoClient
    static var newconOptik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1369)
    }

    /// CANDY HOUSE, Inc. (`1370`)
    @_alwaysEmitIntoClient
    static var candyHouse: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1370)
    }

    /// FRANKLIN TECHNOLOGY INC (`1371`)
    @_alwaysEmitIntoClient
    static var franklinTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1371)
    }

    /// Lely (`1372`)
    @_alwaysEmitIntoClient
    static var lely: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1372)
    }

    /// Valve Corporation (`1373`)
    @_alwaysEmitIntoClient
    static var valve: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1373)
    }

    /// Hekatron Vertriebs GmbH (`1374`)
    @_alwaysEmitIntoClient
    static var hekatronVertriebs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1374)
    }

    /// PROTECH S.A.S. DI GIRARDI ANDREA & C. (`1375`)
    @_alwaysEmitIntoClient
    static var protechDiGirardiAndreaC: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1375)
    }

    /// Sarita CareTech APS (`1376`)
    @_alwaysEmitIntoClient
    static var saritaCaretech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1376)
    }

    /// Finder S.p.A. (`1377`)
    @_alwaysEmitIntoClient
    static var finder: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1377)
    }

    /// Thalmic Labs Inc. (`1378`)
    @_alwaysEmitIntoClient
    static var thalmicLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1378)
    }

    /// Steinel Vertrieb GmbH (`1379`)
    @_alwaysEmitIntoClient
    static var steinelVertrieb: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1379)
    }

    /// Beghelli Spa (`1380`)
    @_alwaysEmitIntoClient
    static var beghelliSpa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1380)
    }

    /// Beijing Smartspace Technologies Inc. (`1381`)
    @_alwaysEmitIntoClient
    static var beijingSmartspaceTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1381)
    }

    /// CORE TRANSPORT TECHNOLOGIES NZ LIMITED (`1382`)
    @_alwaysEmitIntoClient
    static var coreTransportTechnologiesNz: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1382)
    }

    /// Xiamen Everesports Goods Co., Ltd (`1383`)
    @_alwaysEmitIntoClient
    static var xiamenEveresportsGoods: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1383)
    }

    /// Bodyport Inc. (`1384`)
    @_alwaysEmitIntoClient
    static var bodyport: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1384)
    }

    /// Audionics System, INC. (`1385`)
    @_alwaysEmitIntoClient
    static var audionicsSystem: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1385)
    }

    /// Flipnavi Co.,Ltd. (`1386`)
    @_alwaysEmitIntoClient
    static var flipnavi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1386)
    }

    /// Rion Co., Ltd. (`1387`)
    @_alwaysEmitIntoClient
    static var rion: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1387)
    }

    /// Long Range Systems, LLC (`1388`)
    @_alwaysEmitIntoClient
    static var longRangeSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1388)
    }

    /// Redmond Industrial Group LLC (`1389`)
    @_alwaysEmitIntoClient
    static var redmondIndustrialGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1389)
    }

    /// VIZPIN INC. (`1390`)
    @_alwaysEmitIntoClient
    static var vizpin: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1390)
    }

    /// BikeFinder AS (`1391`)
    @_alwaysEmitIntoClient
    static var bikefinder: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1391)
    }

    /// Consumer Sleep Solutions LLC (`1392`)
    @_alwaysEmitIntoClient
    static var consumerSleepSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1392)
    }

    /// PSIKICK, INC. (`1393`)
    @_alwaysEmitIntoClient
    static var psikick: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1393)
    }

    /// AntTail.com (`1394`)
    @_alwaysEmitIntoClient
    static var anttailCom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1394)
    }

    /// Lighting Science Group Corp. (`1395`)
    @_alwaysEmitIntoClient
    static var lightingScienceGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1395)
    }

    /// AFFORDABLE ELECTRONICS INC (`1396`)
    @_alwaysEmitIntoClient
    static var affordableElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1396)
    }

    /// Integral Memroy Plc (`1397`)
    @_alwaysEmitIntoClient
    static var integralMemroyPlc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1397)
    }

    /// Globalstar, Inc. (`1398`)
    @_alwaysEmitIntoClient
    static var globalstar: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1398)
    }

    /// True Wearables, Inc. (`1399`)
    @_alwaysEmitIntoClient
    static var trueWearables: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1399)
    }

    /// Wellington Drive Technologies Ltd (`1400`)
    @_alwaysEmitIntoClient
    static var wellingtonDriveTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1400)
    }

    /// Ensemble Tech Private Limited (`1401`)
    @_alwaysEmitIntoClient
    static var ensembleTech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1401)
    }

    /// OMNI Remotes (`1402`)
    @_alwaysEmitIntoClient
    static var omniRemotes: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1402)
    }

    /// Duracell U.S. Operations Inc. (`1403`)
    @_alwaysEmitIntoClient
    static var duracellUSOperations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1403)
    }

    /// Toor Technologies LLC (`1404`)
    @_alwaysEmitIntoClient
    static var toorTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1404)
    }

    /// Instinct Performance (`1405`)
    @_alwaysEmitIntoClient
    static var instinctPerformance: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1405)
    }

    /// Beco, Inc (`1406`)
    @_alwaysEmitIntoClient
    static var beco: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1406)
    }

    /// Scuf Gaming International, LLC (`1407`)
    @_alwaysEmitIntoClient
    static var scufGamingInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1407)
    }

    /// ARANZ Medical Limited (`1408`)
    @_alwaysEmitIntoClient
    static var aranzMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1408)
    }

    /// LYS TECHNOLOGIES LTD (`1409`)
    @_alwaysEmitIntoClient
    static var lysTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1409)
    }

    /// Breakwall Analytics, LLC (`1410`)
    @_alwaysEmitIntoClient
    static var breakwallAnalytics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1410)
    }

    /// Code Blue Communications (`1411`)
    @_alwaysEmitIntoClient
    static var codeBlueCommunications: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1411)
    }

    /// Gira Giersiepen GmbH & Co. KG (`1412`)
    @_alwaysEmitIntoClient
    static var giraGiersiepen: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1412)
    }

    /// Hearing Lab Technology (`1413`)
    @_alwaysEmitIntoClient
    static var hearingLabTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1413)
    }

    /// LEGRAND (`1414`)
    @_alwaysEmitIntoClient
    static var legrand: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1414)
    }

    /// Derichs GmbH (`1415`)
    @_alwaysEmitIntoClient
    static var derichs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1415)
    }

    /// ALT-TEKNIK LLC (`1416`)
    @_alwaysEmitIntoClient
    static var altTeknik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1416)
    }

    /// Star Technologies (`1417`)
    @_alwaysEmitIntoClient
    static var starTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1417)
    }

    /// START TODAY CO.,LTD. (`1418`)
    @_alwaysEmitIntoClient
    static var startToday: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1418)
    }

    /// Maxim Integrated Products (`1419`)
    @_alwaysEmitIntoClient
    static var maximIntegratedProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1419)
    }

    /// Fracarro Radioindustrie SRL (`1420`)
    @_alwaysEmitIntoClient
    static var fracarroRadioindustrie: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1420)
    }

    /// Jungheinrich Aktiengesellschaft (`1421`)
    @_alwaysEmitIntoClient
    static var jungheinrichAktiengesellschaft: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1421)
    }

    /// Meta Platforms Technologies, LLC (`1422`)
    @_alwaysEmitIntoClient
    static var metaPlatformsTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1422)
    }

    /// HENDON SEMICONDUCTORS PTY LTD (`1423`)
    @_alwaysEmitIntoClient
    static var hendonSemiconductors: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1423)
    }

    /// Pur3 Ltd (`1424`)
    @_alwaysEmitIntoClient
    static var pur3: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1424)
    }

    /// Viasat Group S.p.A. (`1425`)
    @_alwaysEmitIntoClient
    static var viasatGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1425)
    }

    /// IZITHERM (`1426`)
    @_alwaysEmitIntoClient
    static var izitherm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1426)
    }

    /// Spaulding Clinical Research (`1427`)
    @_alwaysEmitIntoClient
    static var spauldingClinicalResearch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1427)
    }

    /// Kohler Company (`1428`)
    @_alwaysEmitIntoClient
    static var kohler: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1428)
    }

    /// Inor Process AB (`1429`)
    @_alwaysEmitIntoClient
    static var inorProcess: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1429)
    }

    /// My Smart Blinds (`1430`)
    @_alwaysEmitIntoClient
    static var mySmartBlinds: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1430)
    }

    /// RadioPulse Inc (`1431`)
    @_alwaysEmitIntoClient
    static var radiopulse: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1431)
    }

    /// rapitag GmbH (`1432`)
    @_alwaysEmitIntoClient
    static var rapitag: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1432)
    }

    /// Lazlo326, LLC. (`1433`)
    @_alwaysEmitIntoClient
    static var lazlo326: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1433)
    }

    /// Teledyne Lecroy, Inc. (`1434`)
    @_alwaysEmitIntoClient
    static var teledyneLecroy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1434)
    }

    /// Dataflow Systems Limited (`1435`)
    @_alwaysEmitIntoClient
    static var dataflowSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1435)
    }

    /// Macrogiga Electronics (`1436`)
    @_alwaysEmitIntoClient
    static var macrogigaElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1436)
    }

    /// Tandem Diabetes Care (`1437`)
    @_alwaysEmitIntoClient
    static var tandemDiabetesCare: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1437)
    }

    /// Polycom, Inc. (`1438`)
    @_alwaysEmitIntoClient
    static var polycom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1438)
    }

    /// Fisher & Paykel Healthcare (`1439`)
    @_alwaysEmitIntoClient
    static var fisherPaykelHealthcare: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1439)
    }

    /// Dream Devices Technologies Oy (`1440`)
    @_alwaysEmitIntoClient
    static var dreamDevicesTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1440)
    }

    /// Shanghai Xiaoyi Technology Co.,Ltd. (`1441`)
    @_alwaysEmitIntoClient
    static var shanghaiXiaoyiTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1441)
    }

    /// ADHERIUM(NZ) LIMITED (`1442`)
    @_alwaysEmitIntoClient
    static var adheriumNz: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1442)
    }

    /// Axiomware Systems Incorporated (`1443`)
    @_alwaysEmitIntoClient
    static var axiomwareSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1443)
    }

    /// O. E. M. Controls, Inc. (`1444`)
    @_alwaysEmitIntoClient
    static var oEMControls: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1444)
    }

    /// Kiiroo BV (`1445`)
    @_alwaysEmitIntoClient
    static var kiiroo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1445)
    }

    /// Telecon Mobile Limited (`1446`)
    @_alwaysEmitIntoClient
    static var teleconMobile: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1446)
    }

    /// Sonos Inc (`1447`)
    @_alwaysEmitIntoClient
    static var sonos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1447)
    }

    /// Tom Allebrandi Consulting (`1448`)
    @_alwaysEmitIntoClient
    static var tomAllebrandiConsulting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1448)
    }

    /// Monidor (`1449`)
    @_alwaysEmitIntoClient
    static var monidor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1449)
    }

    /// Tramex Limited (`1450`)
    @_alwaysEmitIntoClient
    static var tramex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1450)
    }

    /// Nofence AS (`1451`)
    @_alwaysEmitIntoClient
    static var nofence: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1451)
    }

    /// GoerTek Dynaudio Co., Ltd. (`1452`)
    @_alwaysEmitIntoClient
    static var goertekDynaudio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1452)
    }

    /// INIA (`1453`)
    @_alwaysEmitIntoClient
    static var inia: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1453)
    }

    /// CARMATE MFG.CO.,LTD (`1454`)
    @_alwaysEmitIntoClient
    static var carmateMfg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1454)
    }

    /// OV LOOP, INC. (`1455`)
    @_alwaysEmitIntoClient
    static var ovLoop: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1455)
    }

    /// NewTec GmbH (`1456`)
    @_alwaysEmitIntoClient
    static var newtec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1456)
    }

    /// Medallion Instrumentation Systems (`1457`)
    @_alwaysEmitIntoClient
    static var medallionInstrumentationSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1457)
    }

    /// CAREL INDUSTRIES S.P.A. (`1458`)
    @_alwaysEmitIntoClient
    static var carelIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1458)
    }

    /// Parabit Systems, Inc. (`1459`)
    @_alwaysEmitIntoClient
    static var parabitSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1459)
    }

    /// White Horse Scientific ltd (`1460`)
    @_alwaysEmitIntoClient
    static var whiteHorseScientific: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1460)
    }

    /// verisilicon (`1461`)
    @_alwaysEmitIntoClient
    static var verisilicon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1461)
    }

    /// Elecs Industry Co.,Ltd. (`1462`)
    @_alwaysEmitIntoClient
    static var elecsIndustry: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1462)
    }

    /// Beijing Pinecone Electronics Co.,Ltd. (`1463`)
    @_alwaysEmitIntoClient
    static var beijingPineconeElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1463)
    }

    /// Ambystoma Labs Inc. (`1464`)
    @_alwaysEmitIntoClient
    static var ambystomaLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1464)
    }

    /// Suzhou Pairlink Network Technology (`1465`)
    @_alwaysEmitIntoClient
    static var suzhouPairlinkNetworkTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1465)
    }

    /// igloohome (`1466`)
    @_alwaysEmitIntoClient
    static var igloohome: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1466)
    }

    /// Oxford Metrics plc (`1467`)
    @_alwaysEmitIntoClient
    static var oxfordMetricsPlc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1467)
    }

    /// Leviton Mfg. Co., Inc. (`1468`)
    @_alwaysEmitIntoClient
    static var levitonMfg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1468)
    }

    /// ULC Robotics Inc. (`1469`)
    @_alwaysEmitIntoClient
    static var ulcRobotics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1469)
    }

    /// RFID Global by Softwork SrL (`1470`)
    @_alwaysEmitIntoClient
    static var rfidGlobalBySoftwork: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1470)
    }

    /// Real-World-Systems Corporation (`1471`)
    @_alwaysEmitIntoClient
    static var realWorldSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1471)
    }

    /// Nalu Medical, Inc. (`1472`)
    @_alwaysEmitIntoClient
    static var naluMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1472)
    }

    /// P.I.Engineering (`1473`)
    @_alwaysEmitIntoClient
    static var pIEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1473)
    }

    /// Grote Industries (`1474`)
    @_alwaysEmitIntoClient
    static var groteIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1474)
    }

    /// Runtime, Inc. (`1475`)
    @_alwaysEmitIntoClient
    static var runtime: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1475)
    }

    /// Codecoup sp. z o.o. sp. k. (`1476`)
    @_alwaysEmitIntoClient
    static var codecoup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1476)
    }

    /// SELVE GmbH & Co. KG (`1477`)
    @_alwaysEmitIntoClient
    static var selve: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1477)
    }

    /// Smart Animal Training Systems, LLC (`1478`)
    @_alwaysEmitIntoClient
    static var smartAnimalTrainingSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1478)
    }

    /// Lippert Components, INC (`1479`)
    @_alwaysEmitIntoClient
    static var lippertComponents: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1479)
    }

    /// SOMFY SAS (`1480`)
    @_alwaysEmitIntoClient
    static var somfys: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1480)
    }

    /// TBS Electronics B.V. (`1481`)
    @_alwaysEmitIntoClient
    static var tbsElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1481)
    }

    /// MHL Custom Inc (`1482`)
    @_alwaysEmitIntoClient
    static var mhlCustom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1482)
    }

    /// LucentWear LLC (`1483`)
    @_alwaysEmitIntoClient
    static var lucentwear: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1483)
    }

    /// WATTS ELECTRONICS (`1484`)
    @_alwaysEmitIntoClient
    static var wattsElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1484)
    }

    /// RJ Brands LLC (`1485`)
    @_alwaysEmitIntoClient
    static var rjBrands: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1485)
    }

    /// V-ZUG Ltd (`1486`)
    @_alwaysEmitIntoClient
    static var vZug: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1486)
    }

    /// Biowatch SA (`1487`)
    @_alwaysEmitIntoClient
    static var biowatch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1487)
    }

    /// Anova Applied Electronics (`1488`)
    @_alwaysEmitIntoClient
    static var anovaAppliedElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1488)
    }

    /// Lindab AB (`1489`)
    @_alwaysEmitIntoClient
    static var lindab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1489)
    }

    /// frogblue TECHNOLOGY GmbH (`1490`)
    @_alwaysEmitIntoClient
    static var frogblueTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1490)
    }

    /// Acurable Limited (`1491`)
    @_alwaysEmitIntoClient
    static var acurable: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1491)
    }

    /// LAMPLIGHT Co., Ltd. (`1492`)
    @_alwaysEmitIntoClient
    static var lamplight: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1492)
    }

    /// TEGAM, Inc. (`1493`)
    @_alwaysEmitIntoClient
    static var tegam: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1493)
    }

    /// Zhuhai Jieli technology Co.,Ltd (`1494`)
    @_alwaysEmitIntoClient
    static var zhuhaiJieliTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1494)
    }

    /// modum.io AG (`1495`)
    @_alwaysEmitIntoClient
    static var modumIo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1495)
    }

    /// Farm Jenny LLC (`1496`)
    @_alwaysEmitIntoClient
    static var farmJenny: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1496)
    }

    /// Toyo Electronics Corporation (`1497`)
    @_alwaysEmitIntoClient
    static var toyoElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1497)
    }

    /// Applied Neural Research Corp (`1498`)
    @_alwaysEmitIntoClient
    static var appliedNeuralResearch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1498)
    }

    /// Avid Identification Systems, Inc. (`1499`)
    @_alwaysEmitIntoClient
    static var avidIdentificationSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1499)
    }

    /// Petronics Inc. (`1500`)
    @_alwaysEmitIntoClient
    static var petronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1500)
    }

    /// essentim GmbH (`1501`)
    @_alwaysEmitIntoClient
    static var essentim: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1501)
    }

    /// QT Medical INC. (`1502`)
    @_alwaysEmitIntoClient
    static var qtMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1502)
    }

    /// VIRTUALCLINIC.DIRECT LIMITED (`1503`)
    @_alwaysEmitIntoClient
    static var virtualclinicDirect: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1503)
    }

    /// Viper Design LLC (`1504`)
    @_alwaysEmitIntoClient
    static var viperDesign: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1504)
    }

    /// Human, Incorporated (`1505`)
    @_alwaysEmitIntoClient
    static var human: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1505)
    }

    /// stAPPtronics GmbH (`1506`)
    @_alwaysEmitIntoClient
    static var stapptronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1506)
    }

    /// Elemental Machines, Inc. (`1507`)
    @_alwaysEmitIntoClient
    static var elementalMachines: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1507)
    }

    /// Taiyo Yuden Co., Ltd (`1508`)
    @_alwaysEmitIntoClient
    static var taiyoYuden: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1508)
    }

    /// INEO ENERGY& SYSTEMS (`1509`)
    @_alwaysEmitIntoClient
    static var ineoEnergySystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1509)
    }

    /// Motion Instruments Inc. (`1510`)
    @_alwaysEmitIntoClient
    static var motionInstruments: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1510)
    }

    /// PressurePro (`1511`)
    @_alwaysEmitIntoClient
    static var pressurepro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1511)
    }

    /// COWBOY (`1512`)
    @_alwaysEmitIntoClient
    static var cowboy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1512)
    }

    /// iconmobile GmbH (`1513`)
    @_alwaysEmitIntoClient
    static var iconmobile: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1513)
    }

    /// ACS-Control-System GmbH (`1514`)
    @_alwaysEmitIntoClient
    static var acsControlSystem: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1514)
    }

    /// Bayerische Motoren Werke AG (`1515`)
    @_alwaysEmitIntoClient
    static var bayerischeMotorenWerke: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1515)
    }

    /// Gycom Svenska AB (`1516`)
    @_alwaysEmitIntoClient
    static var gycomSvenska: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1516)
    }

    /// Fuji Xerox Co., Ltd (`1517`)
    @_alwaysEmitIntoClient
    static var fujiXerox: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1517)
    }

    /// Wristcam Inc. (`1518`)
    @_alwaysEmitIntoClient
    static var wristcam: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1518)
    }

    /// SIKOM AS (`1519`)
    @_alwaysEmitIntoClient
    static var sikom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1519)
    }

    /// beken (`1520`)
    @_alwaysEmitIntoClient
    static var beken: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1520)
    }

    /// The Linux Foundation (`1521`)
    @_alwaysEmitIntoClient
    static var linuxFoundation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1521)
    }

    /// Try and E CO.,LTD. (`1522`)
    @_alwaysEmitIntoClient
    static var tryAndE: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1522)
    }

    /// SeeScan (`1523`)
    @_alwaysEmitIntoClient
    static var seescan: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1523)
    }

    /// Clearity, LLC (`1524`)
    @_alwaysEmitIntoClient
    static var clearity: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1524)
    }

    /// GS TAG (`1525`)
    @_alwaysEmitIntoClient
    static var gsTag: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1525)
    }

    /// DPTechnics (`1526`)
    @_alwaysEmitIntoClient
    static var dptechnics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1526)
    }

    /// TRACMO, INC. (`1527`)
    @_alwaysEmitIntoClient
    static var tracmo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1527)
    }

    /// Anki Inc. (`1528`)
    @_alwaysEmitIntoClient
    static var anki: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1528)
    }

    /// Hagleitner Hygiene International GmbH (`1529`)
    @_alwaysEmitIntoClient
    static var hagleitnerHygieneInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1529)
    }

    /// Konami Sports Life Co., Ltd. (`1530`)
    @_alwaysEmitIntoClient
    static var konamiSportsLife: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1530)
    }

    /// Arblet Inc. (`1531`)
    @_alwaysEmitIntoClient
    static var arblet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1531)
    }

    /// Masbando GmbH (`1532`)
    @_alwaysEmitIntoClient
    static var masbando: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1532)
    }

    /// Innoseis (`1533`)
    @_alwaysEmitIntoClient
    static var innoseis: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1533)
    }

    /// Niko nv (`1534`)
    @_alwaysEmitIntoClient
    static var nikoNv: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1534)
    }

    /// Wellnomics Ltd (`1535`)
    @_alwaysEmitIntoClient
    static var wellnomics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1535)
    }

    /// iRobot Corporation (`1536`)
    @_alwaysEmitIntoClient
    static var irobot: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1536)
    }

    /// Schrader Electronics (`1537`)
    @_alwaysEmitIntoClient
    static var schraderElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1537)
    }

    /// Geberit International AG (`1538`)
    @_alwaysEmitIntoClient
    static var geberitInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1538)
    }

    /// Fourth Evolution Inc (`1539`)
    @_alwaysEmitIntoClient
    static var fourthEvolution: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1539)
    }

    /// Cell2Jack LLC (`1540`)
    @_alwaysEmitIntoClient
    static var cell2Jack: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1540)
    }

    /// FMW electronic Futterer u. Maier-Wolf OHG (`1541`)
    @_alwaysEmitIntoClient
    static var fmwElectronicFuttererUMaierWolfOhg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1541)
    }

    /// John Deere (`1542`)
    @_alwaysEmitIntoClient
    static var johnDeere: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1542)
    }

    /// Rookery Technology Ltd (`1543`)
    @_alwaysEmitIntoClient
    static var rookeryTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1543)
    }

    /// KeySafe-Cloud (`1544`)
    @_alwaysEmitIntoClient
    static var keysafeCloud: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1544)
    }

    /// BUCHI Labortechnik AG (`1545`)
    @_alwaysEmitIntoClient
    static var buchiLabortechnik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1545)
    }

    /// IQAir AG (`1546`)
    @_alwaysEmitIntoClient
    static var iqair: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1546)
    }

    /// Triax Technologies Inc (`1547`)
    @_alwaysEmitIntoClient
    static var triaxTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1547)
    }

    /// Vuzix Corporation (`1548`)
    @_alwaysEmitIntoClient
    static var vuzix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1548)
    }

    /// TDK Corporation (`1549`)
    @_alwaysEmitIntoClient
    static var tdk: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1549)
    }

    /// Blueair AB (`1550`)
    @_alwaysEmitIntoClient
    static var blueair: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1550)
    }

    /// Signify Netherlands B.V. (`1551`)
    @_alwaysEmitIntoClient
    static var signifyNetherlands: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1551)
    }

    /// ADH GUARDIAN USA LLC (`1552`)
    @_alwaysEmitIntoClient
    static var adhGuardian: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1552)
    }

    /// Beurer GmbH (`1553`)
    @_alwaysEmitIntoClient
    static var beurer: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1553)
    }

    /// Playfinity AS (`1554`)
    @_alwaysEmitIntoClient
    static var playfinity: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1554)
    }

    /// Hans Dinslage GmbH (`1555`)
    @_alwaysEmitIntoClient
    static var hansDinslage: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1555)
    }

    /// OnAsset Intelligence, Inc. (`1556`)
    @_alwaysEmitIntoClient
    static var onassetIntelligence: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1556)
    }

    /// INTER ACTION Corporation (`1557`)
    @_alwaysEmitIntoClient
    static var interAction: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1557)
    }

    /// OS42 UG (haftungsbeschraenkt) (`1558`)
    @_alwaysEmitIntoClient
    static var os42UgHaftungsbeschraenkt: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1558)
    }

    /// WIZCONNECTED COMPANY LIMITED (`1559`)
    @_alwaysEmitIntoClient
    static var wizconnected: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1559)
    }

    /// Audio-Technica Corporation (`1560`)
    @_alwaysEmitIntoClient
    static var audioTechnica: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1560)
    }

    /// Six Guys Labs, s.r.o. (`1561`)
    @_alwaysEmitIntoClient
    static var sixGuysLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1561)
    }

    /// R.W. Beckett Corporation (`1562`)
    @_alwaysEmitIntoClient
    static var rWBeckett: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1562)
    }

    /// silex technology, inc. (`1563`)
    @_alwaysEmitIntoClient
    static var silexTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1563)
    }

    /// Univations Limited (`1564`)
    @_alwaysEmitIntoClient
    static var univations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1564)
    }

    /// SENS Innovation ApS (`1565`)
    @_alwaysEmitIntoClient
    static var sensInnovation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1565)
    }

    /// Diamond Kinetics, Inc. (`1566`)
    @_alwaysEmitIntoClient
    static var diamondKinetics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1566)
    }

    /// Phrame Inc. (`1567`)
    @_alwaysEmitIntoClient
    static var phrame: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1567)
    }

    /// Forciot Oy (`1568`)
    @_alwaysEmitIntoClient
    static var forciot: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1568)
    }

    /// Noordung d.o.o. (`1569`)
    @_alwaysEmitIntoClient
    static var noordung: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1569)
    }

    /// Beam Labs, LLC (`1570`)
    @_alwaysEmitIntoClient
    static var beamLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1570)
    }

    /// Philadelphia Scientific (U.K.) Limited (`1571`)
    @_alwaysEmitIntoClient
    static var philadelphiaScientificUK: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1571)
    }

    /// Biovotion AG (`1572`)
    @_alwaysEmitIntoClient
    static var biovotion: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1572)
    }

    /// Square Panda, Inc. (`1573`)
    @_alwaysEmitIntoClient
    static var squarePanda: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1573)
    }

    /// Amplifico (`1574`)
    @_alwaysEmitIntoClient
    static var amplifico: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1574)
    }

    /// WEG S.A. (`1575`)
    @_alwaysEmitIntoClient
    static var weg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1575)
    }

    /// Ensto Oy (`1576`)
    @_alwaysEmitIntoClient
    static var ensto: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1576)
    }

    /// PHONEPE PVT LTD (`1577`)
    @_alwaysEmitIntoClient
    static var phonepePvt: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1577)
    }

    /// Lunatico Astronomia SL (`1578`)
    @_alwaysEmitIntoClient
    static var lunaticoAstronomia: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1578)
    }

    /// MinebeaMitsumi Inc. (`1579`)
    @_alwaysEmitIntoClient
    static var minebeamitsumi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1579)
    }

    /// ASPion GmbH (`1580`)
    @_alwaysEmitIntoClient
    static var aspion: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1580)
    }

    /// Vossloh-Schwabe Deutschland GmbH (`1581`)
    @_alwaysEmitIntoClient
    static var vosslohSchwabeDeutschland: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1581)
    }

    /// Procept (`1582`)
    @_alwaysEmitIntoClient
    static var procept: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1582)
    }

    /// ONKYO Corporation (`1583`)
    @_alwaysEmitIntoClient
    static var onkyo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1583)
    }

    /// Asthrea D.O.O. (`1584`)
    @_alwaysEmitIntoClient
    static var asthrea: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1584)
    }

    /// Fortiori Design LLC (`1585`)
    @_alwaysEmitIntoClient
    static var fortioriDesign: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1585)
    }

    /// Hugo Muller GmbH & Co KG (`1586`)
    @_alwaysEmitIntoClient
    static var hugoMuller: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1586)
    }

    /// Wangi Lai PLT (`1587`)
    @_alwaysEmitIntoClient
    static var wangiLaiPlt: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1587)
    }

    /// Fanstel Corp (`1588`)
    @_alwaysEmitIntoClient
    static var fanstel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1588)
    }

    /// Crookwood (`1589`)
    @_alwaysEmitIntoClient
    static var crookwood: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1589)
    }

    /// ELECTRONICA INTEGRAL DE SONIDO S.A. (`1590`)
    @_alwaysEmitIntoClient
    static var electronicaIntegralDeSonido: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1590)
    }

    /// GiP Innovation Tools GmbH (`1591`)
    @_alwaysEmitIntoClient
    static var gipInnovationTools: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1591)
    }

    /// LX SOLUTIONS PTY LIMITED (`1592`)
    @_alwaysEmitIntoClient
    static var lxSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1592)
    }

    /// Shenzhen Minew Technologies Co., Ltd. (`1593`)
    @_alwaysEmitIntoClient
    static var shenzhenMinewTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1593)
    }

    /// Prolojik Limited (`1594`)
    @_alwaysEmitIntoClient
    static var prolojik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1594)
    }

    /// Kromek Group Plc (`1595`)
    @_alwaysEmitIntoClient
    static var kromekGroupPlc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1595)
    }

    /// Contec Medical Systems Co., Ltd. (`1596`)
    @_alwaysEmitIntoClient
    static var contecMedicalSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1596)
    }

    /// Xradio Technology Co.,Ltd. (`1597`)
    @_alwaysEmitIntoClient
    static var xradioTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1597)
    }

    /// The Indoor Lab, LLC (`1598`)
    @_alwaysEmitIntoClient
    static var indoorLab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1598)
    }

    /// LDL TECHNOLOGY (`1599`)
    @_alwaysEmitIntoClient
    static var ldlTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1599)
    }

    /// Dish Network LLC (`1600`)
    @_alwaysEmitIntoClient
    static var dishNetwork: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1600)
    }

    /// Revenue Collection Systems FRANCE SAS (`1601`)
    @_alwaysEmitIntoClient
    static var revenueCollectionSystemsFrances: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1601)
    }

    /// Bluetrum Technology Co.,Ltd (`1602`)
    @_alwaysEmitIntoClient
    static var bluetrumTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1602)
    }

    /// makita corporation (`1603`)
    @_alwaysEmitIntoClient
    static var makita: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1603)
    }

    /// Apogee Instruments (`1604`)
    @_alwaysEmitIntoClient
    static var apogeeInstruments: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1604)
    }

    /// BM3 (`1605`)
    @_alwaysEmitIntoClient
    static var bm3: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1605)
    }

    /// SGV Group Holding GmbH & Co. KG (`1606`)
    @_alwaysEmitIntoClient
    static var sgvGroupHolding: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1606)
    }

    /// MED-EL (`1607`)
    @_alwaysEmitIntoClient
    static var medEl: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1607)
    }

    /// Ultune Technologies (`1608`)
    @_alwaysEmitIntoClient
    static var ultuneTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1608)
    }

    /// Ryeex Technology Co.,Ltd. (`1609`)
    @_alwaysEmitIntoClient
    static var ryeexTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1609)
    }

    /// Open Research Institute, Inc. (`1610`)
    @_alwaysEmitIntoClient
    static var openResearchInstitute: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1610)
    }

    /// Scale-Tec, Ltd (`1611`)
    @_alwaysEmitIntoClient
    static var scaleTec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1611)
    }

    /// Zumtobel Group AG (`1612`)
    @_alwaysEmitIntoClient
    static var zumtobelGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1612)
    }

    /// iLOQ Oy (`1613`)
    @_alwaysEmitIntoClient
    static var iloq: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1613)
    }

    /// KRUXWorks Technologies Private Limited (`1614`)
    @_alwaysEmitIntoClient
    static var kruxworksTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1614)
    }

    /// Digital Matter Pty Ltd (`1615`)
    @_alwaysEmitIntoClient
    static var digitalMatter: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1615)
    }

    /// Coravin, Inc. (`1616`)
    @_alwaysEmitIntoClient
    static var coravin: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1616)
    }

    /// Stasis Labs, Inc. (`1617`)
    @_alwaysEmitIntoClient
    static var stasisLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1617)
    }

    /// ITZ Innovations- und Technologiezentrum GmbH (`1618`)
    @_alwaysEmitIntoClient
    static var itzInnovationsUndTechnologiezentrum: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1618)
    }

    /// Meggitt SA (`1619`)
    @_alwaysEmitIntoClient
    static var meggitt: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1619)
    }

    /// Ledlenser GmbH & Co. KG (`1620`)
    @_alwaysEmitIntoClient
    static var ledlenser: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1620)
    }

    /// Renishaw PLC (`1621`)
    @_alwaysEmitIntoClient
    static var renishawPlc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1621)
    }

    /// ZhuHai AdvanPro Technology Company Limited (`1622`)
    @_alwaysEmitIntoClient
    static var zhuhaiAdvanproTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1622)
    }

    /// Meshtronix Limited (`1623`)
    @_alwaysEmitIntoClient
    static var meshtronix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1623)
    }

    /// Payex Norge AS (`1624`)
    @_alwaysEmitIntoClient
    static var payexNorge: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1624)
    }

    /// UnSeen Technologies Oy (`1625`)
    @_alwaysEmitIntoClient
    static var unseenTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1625)
    }

    /// Zound Industries International AB (`1626`)
    @_alwaysEmitIntoClient
    static var zoundIndustriesInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1626)
    }

    /// Sesam Solutions BV (`1627`)
    @_alwaysEmitIntoClient
    static var sesamSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1627)
    }

    /// PixArt Imaging Inc. (`1628`)
    @_alwaysEmitIntoClient
    static var pixartImaging: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1628)
    }

    /// Panduit Corp. (`1629`)
    @_alwaysEmitIntoClient
    static var panduit: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1629)
    }

    /// Alo AB (`1630`)
    @_alwaysEmitIntoClient
    static var alo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1630)
    }

    /// Ricoh Company Ltd (`1631`)
    @_alwaysEmitIntoClient
    static var ricoh: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1631)
    }

    /// RTC Industries, Inc. (`1632`)
    @_alwaysEmitIntoClient
    static var rtcIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1632)
    }

    /// Mode Lighting Limited (`1633`)
    @_alwaysEmitIntoClient
    static var modeLighting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1633)
    }

    /// Particle Industries, Inc. (`1634`)
    @_alwaysEmitIntoClient
    static var particleIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1634)
    }

    /// Advanced Telemetry Systems, Inc. (`1635`)
    @_alwaysEmitIntoClient
    static var advancedTelemetrySystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1635)
    }

    /// RHA TECHNOLOGIES LTD (`1636`)
    @_alwaysEmitIntoClient
    static var rhaTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1636)
    }

    /// Pure International Limited (`1637`)
    @_alwaysEmitIntoClient
    static var pureInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1637)
    }

    /// WTO Werkzeug-Einrichtungen GmbH (`1638`)
    @_alwaysEmitIntoClient
    static var wtoWerkzeugEinrichtungen: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1638)
    }

    /// Spark Technology Labs Inc. (`1639`)
    @_alwaysEmitIntoClient
    static var sparkTechnologyLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1639)
    }

    /// Bleb Technology srl (`1640`)
    @_alwaysEmitIntoClient
    static var blebTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1640)
    }

    /// Livanova USA, Inc. (`1641`)
    @_alwaysEmitIntoClient
    static var livanova: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1641)
    }

    /// Brady Worldwide Inc. (`1642`)
    @_alwaysEmitIntoClient
    static var bradyWorldwide: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1642)
    }

    /// DewertOkin GmbH (`1643`)
    @_alwaysEmitIntoClient
    static var dewertokin: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1643)
    }

    /// Ztove ApS (`1644`)
    @_alwaysEmitIntoClient
    static var ztove: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1644)
    }

    /// Venso EcoSolutions AB (`1645`)
    @_alwaysEmitIntoClient
    static var vensoEcosolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1645)
    }

    /// Eurotronik Kranj d.o.o. (`1646`)
    @_alwaysEmitIntoClient
    static var eurotronikKranj: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1646)
    }

    /// Hug Technology Ltd (`1647`)
    @_alwaysEmitIntoClient
    static var hugTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1647)
    }

    /// Gema Switzerland GmbH (`1648`)
    @_alwaysEmitIntoClient
    static var gemaSwitzerland: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1648)
    }

    /// Buzz Products Ltd. (`1649`)
    @_alwaysEmitIntoClient
    static var buzzProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1649)
    }

    /// Kopi (`1650`)
    @_alwaysEmitIntoClient
    static var kopi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1650)
    }

    /// Innova Ideas Limited (`1651`)
    @_alwaysEmitIntoClient
    static var innovaIdeas: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1651)
    }

    /// BeSpoon (`1652`)
    @_alwaysEmitIntoClient
    static var bespoon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1652)
    }

    /// Deco Enterprises, Inc. (`1653`)
    @_alwaysEmitIntoClient
    static var decoEnterprises: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1653)
    }

    /// Expai Solutions Private Limited (`1654`)
    @_alwaysEmitIntoClient
    static var expaiSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1654)
    }

    /// Innovation First, Inc. (`1655`)
    @_alwaysEmitIntoClient
    static var innovationFirst: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1655)
    }

    /// SABIK Offshore GmbH (`1656`)
    @_alwaysEmitIntoClient
    static var sabikOffshore: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1656)
    }

    /// 4iiii Innovations Inc. (`1657`)
    @_alwaysEmitIntoClient
    static var company4IiiiInnovations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1657)
    }

    /// The Energy Conservatory, Inc. (`1658`)
    @_alwaysEmitIntoClient
    static var energyConservatory: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1658)
    }

    /// I.FARM, INC. (`1659`)
    @_alwaysEmitIntoClient
    static var iFarm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1659)
    }

    /// Tile, Inc. (`1660`)
    @_alwaysEmitIntoClient
    static var tile: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1660)
    }

    /// Form Athletica Inc. (`1661`)
    @_alwaysEmitIntoClient
    static var formAthletica: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1661)
    }

    /// MbientLab Inc (`1662`)
    @_alwaysEmitIntoClient
    static var mbientlab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1662)
    }

    /// NETGRID S.N.C. DI BISSOLI MATTEO, CAMPOREALE SIMONE, TOGNETTI FEDERICO (`1663`)
    @_alwaysEmitIntoClient
    static var netgridSNCDiBissoliMatteoCamporealeSimoneTognettiFederico: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1663)
    }

    /// Mannkind Corporation (`1664`)
    @_alwaysEmitIntoClient
    static var mannkind: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1664)
    }

    /// Trade FIDES a.s. (`1665`)
    @_alwaysEmitIntoClient
    static var tradeFides: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1665)
    }

    /// Photron Limited (`1666`)
    @_alwaysEmitIntoClient
    static var photron: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1666)
    }

    /// Eltako GmbH (`1667`)
    @_alwaysEmitIntoClient
    static var eltako: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1667)
    }

    /// Dermalapps, LLC (`1668`)
    @_alwaysEmitIntoClient
    static var dermalapps: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1668)
    }

    /// Greenwald Industries (`1669`)
    @_alwaysEmitIntoClient
    static var greenwaldIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1669)
    }

    /// inQs Co., Ltd. (`1670`)
    @_alwaysEmitIntoClient
    static var inqs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1670)
    }

    /// Cherry GmbH (`1671`)
    @_alwaysEmitIntoClient
    static var cherry: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1671)
    }

    /// Amsted Digital Solutions Inc. (`1672`)
    @_alwaysEmitIntoClient
    static var amstedDigitalSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1672)
    }

    /// Tacx b.v. (`1673`)
    @_alwaysEmitIntoClient
    static var tacx: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1673)
    }

    /// Raytac Corporation (`1674`)
    @_alwaysEmitIntoClient
    static var raytac: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1674)
    }

    /// Jiangsu Teranovo Tech Co., Ltd. (`1675`)
    @_alwaysEmitIntoClient
    static var jiangsuTeranovoTech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1675)
    }

    /// Changzhou Sound Dragon Electronics and Acoustics Co., Ltd (`1676`)
    @_alwaysEmitIntoClient
    static var changzhouSoundDragonElectronicsAndAcoustics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1676)
    }

    /// JetBeep Inc. (`1677`)
    @_alwaysEmitIntoClient
    static var jetbeep: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1677)
    }

    /// Razer Inc. (`1678`)
    @_alwaysEmitIntoClient
    static var razer: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1678)
    }

    /// JRM Group Limited (`1679`)
    @_alwaysEmitIntoClient
    static var jrmGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1679)
    }

    /// Eccrine Systems, Inc. (`1680`)
    @_alwaysEmitIntoClient
    static var eccrineSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1680)
    }

    /// Curie Point AB (`1681`)
    @_alwaysEmitIntoClient
    static var curiePoint: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1681)
    }

    /// Georg Fischer AG (`1682`)
    @_alwaysEmitIntoClient
    static var georgFischer: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1682)
    }

    /// Hach - Danaher (`1683`)
    @_alwaysEmitIntoClient
    static var hachDanaher: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1683)
    }

    /// T&A Laboratories LLC (`1684`)
    @_alwaysEmitIntoClient
    static var tALaboratories: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1684)
    }

    /// Koki Holdings Co., Ltd. (`1685`)
    @_alwaysEmitIntoClient
    static var kokiHoldings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1685)
    }

    /// Gunakar Private Limited (`1686`)
    @_alwaysEmitIntoClient
    static var gunakar: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1686)
    }

    /// Stemco Products Inc (`1687`)
    @_alwaysEmitIntoClient
    static var stemcoProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1687)
    }

    /// Wood IT Security, LLC (`1688`)
    @_alwaysEmitIntoClient
    static var woodItSecurity: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1688)
    }

    /// RandomLab SAS (`1689`)
    @_alwaysEmitIntoClient
    static var randomlabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1689)
    }

    /// Adero, Inc. (`1690`)
    @_alwaysEmitIntoClient
    static var adero: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1690)
    }

    /// Dragonchip Limited (`1691`)
    @_alwaysEmitIntoClient
    static var dragonchip: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1691)
    }

    /// Noomi AB (`1692`)
    @_alwaysEmitIntoClient
    static var noomi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1692)
    }

    /// Vakaros LLC (`1693`)
    @_alwaysEmitIntoClient
    static var vakaros: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1693)
    }

    /// Delta Electronics, Inc. (`1694`)
    @_alwaysEmitIntoClient
    static var deltaElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1694)
    }

    /// FlowMotion Technologies AS (`1695`)
    @_alwaysEmitIntoClient
    static var flowmotionTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1695)
    }

    /// OBIQ Location Technology Inc. (`1696`)
    @_alwaysEmitIntoClient
    static var obiqLocationTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1696)
    }

    /// Cardo Systems, Ltd (`1697`)
    @_alwaysEmitIntoClient
    static var cardoSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1697)
    }

    /// Globalworx GmbH (`1698`)
    @_alwaysEmitIntoClient
    static var globalworx: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1698)
    }

    /// Nymbus, LLC (`1699`)
    @_alwaysEmitIntoClient
    static var nymbus: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1699)
    }

    /// LIMNO Co. Ltd. (`1700`)
    @_alwaysEmitIntoClient
    static var limno: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1700)
    }

    /// TEKZITEL PTY LTD (`1701`)
    @_alwaysEmitIntoClient
    static var tekzitel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1701)
    }

    /// Roambee Corporation (`1702`)
    @_alwaysEmitIntoClient
    static var roambee: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1702)
    }

    /// Chipsea Technologies (ShenZhen) Corp. (`1703`)
    @_alwaysEmitIntoClient
    static var chipseaTechnologiesShenzhen: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1703)
    }

    /// GD Midea Air-Conditioning Equipment Co., Ltd. (`1704`)
    @_alwaysEmitIntoClient
    static var gdMideaAirConditioningEquipment: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1704)
    }

    /// Soundmax Electronics Limited (`1705`)
    @_alwaysEmitIntoClient
    static var soundmaxElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1705)
    }

    /// Produal Oy (`1706`)
    @_alwaysEmitIntoClient
    static var produal: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1706)
    }

    /// HMS Industrial Networks AB (`1707`)
    @_alwaysEmitIntoClient
    static var hmsIndustrialNetworks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1707)
    }

    /// Ingchips Technology Co., Ltd. (`1708`)
    @_alwaysEmitIntoClient
    static var ingchipsTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1708)
    }

    /// InnovaSea Systems Inc. (`1709`)
    @_alwaysEmitIntoClient
    static var innovaseaSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1709)
    }

    /// SenseQ Inc. (`1710`)
    @_alwaysEmitIntoClient
    static var senseq: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1710)
    }

    /// Shoof Technologies (`1711`)
    @_alwaysEmitIntoClient
    static var shoofTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1711)
    }

    /// BRK Brands, Inc. (`1712`)
    @_alwaysEmitIntoClient
    static var brkBrands: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1712)
    }

    /// SimpliSafe, Inc. (`1713`)
    @_alwaysEmitIntoClient
    static var simplisafe: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1713)
    }

    /// Tussock Innovation 2013 Limited (`1714`)
    @_alwaysEmitIntoClient
    static var tussockInnovation2013: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1714)
    }

    /// The Hablab ApS (`1715`)
    @_alwaysEmitIntoClient
    static var hablab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1715)
    }

    /// Sencilion Oy (`1716`)
    @_alwaysEmitIntoClient
    static var sencilion: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1716)
    }

    /// Wabilogic Ltd. (`1717`)
    @_alwaysEmitIntoClient
    static var wabilogic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1717)
    }

    /// Sociometric Solutions, Inc. (`1718`)
    @_alwaysEmitIntoClient
    static var sociometricSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1718)
    }

    /// iCOGNIZE GmbH (`1719`)
    @_alwaysEmitIntoClient
    static var icognize: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1719)
    }

    /// ShadeCraft, Inc (`1720`)
    @_alwaysEmitIntoClient
    static var shadecraft: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1720)
    }

    /// Beflex Inc. (`1721`)
    @_alwaysEmitIntoClient
    static var beflex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1721)
    }

    /// Beaconzone Ltd (`1722`)
    @_alwaysEmitIntoClient
    static var beaconzone: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1722)
    }

    /// Leaftronix Analogic Solutions Private Limited (`1723`)
    @_alwaysEmitIntoClient
    static var leaftronixAnalogicSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1723)
    }

    /// TWS Srl (`1724`)
    @_alwaysEmitIntoClient
    static var tws: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1724)
    }

    /// ABB Oy (`1725`)
    @_alwaysEmitIntoClient
    static var abb: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1725)
    }

    /// HitSeed Oy (`1726`)
    @_alwaysEmitIntoClient
    static var hitseed: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1726)
    }

    /// Delcom Products Inc. (`1727`)
    @_alwaysEmitIntoClient
    static var delcomProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1727)
    }

    /// CAME S.p.A. (`1728`)
    @_alwaysEmitIntoClient
    static var came: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1728)
    }

    /// Alarm.com Holdings, Inc (`1729`)
    @_alwaysEmitIntoClient
    static var alarmComHoldings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1729)
    }

    /// Measurlogic Inc. (`1730`)
    @_alwaysEmitIntoClient
    static var measurlogic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1730)
    }

    /// King I Electronics.Co.,Ltd (`1731`)
    @_alwaysEmitIntoClient
    static var kingIElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1731)
    }

    /// Dream Labs GmbH (`1732`)
    @_alwaysEmitIntoClient
    static var dreamLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1732)
    }

    /// Urban Compass, Inc (`1733`)
    @_alwaysEmitIntoClient
    static var urbanCompass: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1733)
    }

    /// Simm Tronic Limited (`1734`)
    @_alwaysEmitIntoClient
    static var simmTronic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1734)
    }

    /// Somatix Inc (`1735`)
    @_alwaysEmitIntoClient
    static var somatix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1735)
    }

    /// Storz & Bickel GmbH & Co. KG (`1736`)
    @_alwaysEmitIntoClient
    static var storzBickel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1736)
    }

    /// MYLAPS B.V. (`1737`)
    @_alwaysEmitIntoClient
    static var mylaps: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1737)
    }

    /// Shenzhen Zhongguang Infotech Technology Development Co., Ltd (`1738`)
    @_alwaysEmitIntoClient
    static var shenzhenZhongguangInfotechTechnologyDevelopment: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1738)
    }

    /// Dyeware, LLC (`1739`)
    @_alwaysEmitIntoClient
    static var dyeware: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1739)
    }

    /// Dongguan SmartAction Technology Co.,Ltd. (`1740`)
    @_alwaysEmitIntoClient
    static var dongguanSmartactionTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1740)
    }

    /// DIG Corporation (`1741`)
    @_alwaysEmitIntoClient
    static var dig: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1741)
    }

    /// FIOR & GENTZ (`1742`)
    @_alwaysEmitIntoClient
    static var fiorGentz: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1742)
    }

    /// Belparts N.V. (`1743`)
    @_alwaysEmitIntoClient
    static var belparts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1743)
    }

    /// Etekcity Corporation (`1744`)
    @_alwaysEmitIntoClient
    static var etekcity: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1744)
    }

    /// Meyer Sound Laboratories, Incorporated (`1745`)
    @_alwaysEmitIntoClient
    static var meyerSoundLaboratories: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1745)
    }

    /// CeoTronics AG (`1746`)
    @_alwaysEmitIntoClient
    static var ceotronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1746)
    }

    /// TriTeq Lock and Security, LLC (`1747`)
    @_alwaysEmitIntoClient
    static var triteqLockAndSecurity: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1747)
    }

    /// DYNAKODE TECHNOLOGY PRIVATE LIMITED (`1748`)
    @_alwaysEmitIntoClient
    static var dynakodeTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1748)
    }

    /// Sensirion AG (`1749`)
    @_alwaysEmitIntoClient
    static var sensirion: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1749)
    }

    /// JCT Healthcare Pty Ltd (`1750`)
    @_alwaysEmitIntoClient
    static var jctHealthcare: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1750)
    }

    /// FUBA Automotive Electronics GmbH (`1751`)
    @_alwaysEmitIntoClient
    static var fubaAutomotiveElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1751)
    }

    /// AW Company (`1752`)
    @_alwaysEmitIntoClient
    static var aw: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1752)
    }

    /// Shanghai Mountain View Silicon Co.,Ltd. (`1753`)
    @_alwaysEmitIntoClient
    static var shanghaiMountainViewSilicon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1753)
    }

    /// Zliide Technologies ApS (`1754`)
    @_alwaysEmitIntoClient
    static var zliideTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1754)
    }

    /// Automatic Labs, Inc. (`1755`)
    @_alwaysEmitIntoClient
    static var automaticLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1755)
    }

    /// Industrial Network Controls, LLC (`1756`)
    @_alwaysEmitIntoClient
    static var industrialNetworkControls: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1756)
    }

    /// Intellithings Ltd. (`1757`)
    @_alwaysEmitIntoClient
    static var intellithings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1757)
    }

    /// Navcast, Inc. (`1758`)
    @_alwaysEmitIntoClient
    static var navcast: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1758)
    }

    /// HLI Solutions Inc. (`1759`)
    @_alwaysEmitIntoClient
    static var hliSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1759)
    }

    /// Avaya Inc. (`1760`)
    @_alwaysEmitIntoClient
    static var avaya: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1760)
    }

    /// Milestone AV Technologies LLC (`1761`)
    @_alwaysEmitIntoClient
    static var milestoneAvTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1761)
    }

    /// Alango Technologies Ltd (`1762`)
    @_alwaysEmitIntoClient
    static var alangoTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1762)
    }

    /// Spinlock Ltd (`1763`)
    @_alwaysEmitIntoClient
    static var spinlock: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1763)
    }

    /// Aluna (`1764`)
    @_alwaysEmitIntoClient
    static var aluna: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1764)
    }

    /// OPTEX CO.,LTD. (`1765`)
    @_alwaysEmitIntoClient
    static var optex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1765)
    }

    /// NIHON DENGYO KOUSAKU (`1766`)
    @_alwaysEmitIntoClient
    static var nihonDengyoKousaku: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1766)
    }

    /// VELUX A/S (`1767`)
    @_alwaysEmitIntoClient
    static var velux: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1767)
    }

    /// Almendo Technologies GmbH (`1768`)
    @_alwaysEmitIntoClient
    static var almendoTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1768)
    }

    /// Zmartfun Electronics, Inc. (`1769`)
    @_alwaysEmitIntoClient
    static var zmartfunElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1769)
    }

    /// SafeLine Sweden AB (`1770`)
    @_alwaysEmitIntoClient
    static var safelineSweden: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1770)
    }

    /// Houston Radar LLC (`1771`)
    @_alwaysEmitIntoClient
    static var houstonRadar: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1771)
    }

    /// Sigur (`1772`)
    @_alwaysEmitIntoClient
    static var sigur: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1772)
    }

    /// J Neades Ltd (`1773`)
    @_alwaysEmitIntoClient
    static var jNeades: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1773)
    }

    /// Avantis Systems Limited (`1774`)
    @_alwaysEmitIntoClient
    static var avantisSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1774)
    }

    /// ALCARE Co., Ltd. (`1775`)
    @_alwaysEmitIntoClient
    static var alcare: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1775)
    }

    /// Chargy Technologies, SL (`1776`)
    @_alwaysEmitIntoClient
    static var chargyTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1776)
    }

    /// Shibutani Co., Ltd. (`1777`)
    @_alwaysEmitIntoClient
    static var shibutani: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1777)
    }

    /// Trapper Data AB (`1778`)
    @_alwaysEmitIntoClient
    static var trapperData: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1778)
    }

    /// Alfred International Inc. (`1779`)
    @_alwaysEmitIntoClient
    static var alfredInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1779)
    }

    /// Touché Technology Ltd (`1780`)
    @_alwaysEmitIntoClient
    static var toucheTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1780)
    }

    /// Vigil Technologies Inc. (`1781`)
    @_alwaysEmitIntoClient
    static var vigilTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1781)
    }

    /// Vitulo Plus BV (`1782`)
    @_alwaysEmitIntoClient
    static var vituloPlus: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1782)
    }

    /// WILKA Schliesstechnik GmbH (`1783`)
    @_alwaysEmitIntoClient
    static var wilkaSchliesstechnik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1783)
    }

    /// BodyPlus Technology Co.,Ltd (`1784`)
    @_alwaysEmitIntoClient
    static var bodyplusTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1784)
    }

    /// happybrush GmbH (`1785`)
    @_alwaysEmitIntoClient
    static var happybrush: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1785)
    }

    /// Enequi AB (`1786`)
    @_alwaysEmitIntoClient
    static var enequi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1786)
    }

    /// Sartorius AG (`1787`)
    @_alwaysEmitIntoClient
    static var sartorius: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1787)
    }

    /// Tom Communication Industrial Co.,Ltd. (`1788`)
    @_alwaysEmitIntoClient
    static var tomCommunicationIndustrial: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1788)
    }

    /// ESS Embedded System Solutions Inc. (`1789`)
    @_alwaysEmitIntoClient
    static var essEmbeddedSystemSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1789)
    }

    /// Mahr GmbH (`1790`)
    @_alwaysEmitIntoClient
    static var mahr: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1790)
    }

    /// Redpine Signals Inc (`1791`)
    @_alwaysEmitIntoClient
    static var redpineSignals: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1791)
    }

    /// TraqFreq LLC (`1792`)
    @_alwaysEmitIntoClient
    static var traqfreq: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1792)
    }

    /// PAFERS TECH (`1793`)
    @_alwaysEmitIntoClient
    static var pafersTech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1793)
    }

    /// Akciju sabiedriba "SAF TEHNIKA" (`1794`)
    @_alwaysEmitIntoClient
    static var akcijuSabiedribafTehnika: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1794)
    }

    /// Beijing Jingdong Century Trading Co., Ltd. (`1795`)
    @_alwaysEmitIntoClient
    static var beijingJingdongCenturyTrading: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1795)
    }

    /// JBX Designs Inc. (`1796`)
    @_alwaysEmitIntoClient
    static var jbxDesigns: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1796)
    }

    /// AB Electrolux (`1797`)
    @_alwaysEmitIntoClient
    static var abElectrolux: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1797)
    }

    /// Wernher von Braun Center for ASdvanced Research (`1798`)
    @_alwaysEmitIntoClient
    static var wernherVonBraunCenterFordvancedResearch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1798)
    }

    /// Essity Hygiene and Health Aktiebolag (`1799`)
    @_alwaysEmitIntoClient
    static var essityHygieneAndHealthAktiebolag: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1799)
    }

    /// Be Interactive Co., Ltd (`1800`)
    @_alwaysEmitIntoClient
    static var beInteractive: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1800)
    }

    /// Carewear Corp. (`1801`)
    @_alwaysEmitIntoClient
    static var carewear: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1801)
    }

    /// Huf Hülsbeck & Fürst GmbH & Co. KG (`1802`)
    @_alwaysEmitIntoClient
    static var hufHulsbeckFurst: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1802)
    }

    /// Element Products, Inc. (`1803`)
    @_alwaysEmitIntoClient
    static var elementProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1803)
    }

    /// Beijing Winner Microelectronics Co.,Ltd (`1804`)
    @_alwaysEmitIntoClient
    static var beijingWinnerMicroelectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1804)
    }

    /// SmartSnugg Pty Ltd (`1805`)
    @_alwaysEmitIntoClient
    static var smartsnugg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1805)
    }

    /// FiveCo Sarl (`1806`)
    @_alwaysEmitIntoClient
    static var fivecoSarl: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1806)
    }

    /// California Things Inc. (`1807`)
    @_alwaysEmitIntoClient
    static var californiaThings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1807)
    }

    /// Audiodo AB (`1808`)
    @_alwaysEmitIntoClient
    static var audiodo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1808)
    }

    /// ABAX AS (`1809`)
    @_alwaysEmitIntoClient
    static var abax: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1809)
    }

    /// Bull Group Company Limited (`1810`)
    @_alwaysEmitIntoClient
    static var bullGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1810)
    }

    /// Respiri Limited (`1811`)
    @_alwaysEmitIntoClient
    static var respiri: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1811)
    }

    /// MindPeace Safety LLC (`1812`)
    @_alwaysEmitIntoClient
    static var mindpeaceSafety: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1812)
    }

    /// MBARC LABS Inc (`1813`)
    @_alwaysEmitIntoClient
    static var mbarcLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1813)
    }

    /// Altonics (`1814`)
    @_alwaysEmitIntoClient
    static var altonics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1814)
    }

    /// iQsquare BV (`1815`)
    @_alwaysEmitIntoClient
    static var iqsquare: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1815)
    }

    /// IDIBAIX enginneering (`1816`)
    @_alwaysEmitIntoClient
    static var idibaixEnginneering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1816)
    }

    /// COREIOT PTY LTD (`1817`)
    @_alwaysEmitIntoClient
    static var coreiot: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1817)
    }

    /// REVSMART WEARABLE HK CO LTD (`1818`)
    @_alwaysEmitIntoClient
    static var revsmartWearableCo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1818)
    }

    /// Precor (`1819`)
    @_alwaysEmitIntoClient
    static var precor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1819)
    }

    /// F5 Sports, Inc (`1820`)
    @_alwaysEmitIntoClient
    static var f5Sports: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1820)
    }

    /// exoTIC Systems (`1821`)
    @_alwaysEmitIntoClient
    static var exoticSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1821)
    }

    /// DONGGUAN HELE ELECTRONICS CO., LTD (`1822`)
    @_alwaysEmitIntoClient
    static var dongguanHeleElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1822)
    }

    /// Dongguan Liesheng Electronic Co.Ltd (`1823`)
    @_alwaysEmitIntoClient
    static var dongguanLieshengElectronic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1823)
    }

    /// Oculeve, Inc. (`1824`)
    @_alwaysEmitIntoClient
    static var oculeve: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1824)
    }

    /// Clover Network, Inc. (`1825`)
    @_alwaysEmitIntoClient
    static var cloverNetwork: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1825)
    }

    /// Xiamen Eholder Electronics Co.Ltd (`1826`)
    @_alwaysEmitIntoClient
    static var xiamenEholderElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1826)
    }

    /// Ford Motor Company (`1827`)
    @_alwaysEmitIntoClient
    static var fordMotor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1827)
    }

    /// Guangzhou SuperSound Information Technology Co.,Ltd (`1828`)
    @_alwaysEmitIntoClient
    static var guangzhouSupersoundInformationTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1828)
    }

    /// Tedee Sp. z o.o. (`1829`)
    @_alwaysEmitIntoClient
    static var tedee: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1829)
    }

    /// PHC Corporation (`1830`)
    @_alwaysEmitIntoClient
    static var phc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1830)
    }

    /// STALKIT AS (`1831`)
    @_alwaysEmitIntoClient
    static var stalkit: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1831)
    }

    /// Eli Lilly and Company (`1832`)
    @_alwaysEmitIntoClient
    static var eliLillyAndcompany: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1832)
    }

    /// SwaraLink Technologies (`1833`)
    @_alwaysEmitIntoClient
    static var swaralinkTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1833)
    }

    /// JMR embedded systems GmbH (`1834`)
    @_alwaysEmitIntoClient
    static var jmrEmbeddedSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1834)
    }

    /// Bitkey Inc. (`1835`)
    @_alwaysEmitIntoClient
    static var bitkey: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1835)
    }

    /// GWA Hygiene GmbH (`1836`)
    @_alwaysEmitIntoClient
    static var gwaHygiene: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1836)
    }

    /// Safera Oy (`1837`)
    @_alwaysEmitIntoClient
    static var safera: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1837)
    }

    /// Open Platform Systems LLC (`1838`)
    @_alwaysEmitIntoClient
    static var openPlatformSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1838)
    }

    /// OnePlus Electronics (Shenzhen) Co., Ltd. (`1839`)
    @_alwaysEmitIntoClient
    static var oneplusElectronicsShenzhen: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1839)
    }

    /// Wildlife Acoustics, Inc. (`1840`)
    @_alwaysEmitIntoClient
    static var wildlifeAcoustics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1840)
    }

    /// ABLIC Inc. (`1841`)
    @_alwaysEmitIntoClient
    static var ablic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1841)
    }

    /// Dairy Tech, LLC (`1842`)
    @_alwaysEmitIntoClient
    static var dairyTech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1842)
    }

    /// Iguanavation, Inc. (`1843`)
    @_alwaysEmitIntoClient
    static var iguanavation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1843)
    }

    /// DiUS Computing Pty Ltd (`1844`)
    @_alwaysEmitIntoClient
    static var diusComputing: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1844)
    }

    /// UpRight Technologies LTD (`1845`)
    @_alwaysEmitIntoClient
    static var uprightTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1845)
    }

    /// Luna XIO, Inc. (`1846`)
    @_alwaysEmitIntoClient
    static var lunaXio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1846)
    }

    /// LLC Navitek (`1847`)
    @_alwaysEmitIntoClient
    static var llcNavitek: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1847)
    }

    /// Glass Security Pte Ltd (`1848`)
    @_alwaysEmitIntoClient
    static var glassSecurityPte: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1848)
    }

    /// Jiangsu Qinheng Co., Ltd. (`1849`)
    @_alwaysEmitIntoClient
    static var jiangsuQinheng: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1849)
    }

    /// Chandler Systems Inc. (`1850`)
    @_alwaysEmitIntoClient
    static var chandlerSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1850)
    }

    /// Fantini Cosmi s.p.a. (`1851`)
    @_alwaysEmitIntoClient
    static var fantiniCosmi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1851)
    }

    /// Acubit ApS (`1852`)
    @_alwaysEmitIntoClient
    static var acubit: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1852)
    }

    /// Beijing Hao Heng Tian Tech Co., Ltd. (`1853`)
    @_alwaysEmitIntoClient
    static var beijingHaoHengTianTech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1853)
    }

    /// Bluepack S.R.L. (`1854`)
    @_alwaysEmitIntoClient
    static var bluepack: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1854)
    }

    /// Beijing Unisoc Technologies Co., Ltd. (`1855`)
    @_alwaysEmitIntoClient
    static var beijingUnisocTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1855)
    }

    /// HITIQ LIMITED (`1856`)
    @_alwaysEmitIntoClient
    static var hitiq: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1856)
    }

    /// MAC SRL (`1857`)
    @_alwaysEmitIntoClient
    static var mac: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1857)
    }

    /// DML LLC (`1858`)
    @_alwaysEmitIntoClient
    static var dml: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1858)
    }

    /// Sanofi (`1859`)
    @_alwaysEmitIntoClient
    static var sanofi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1859)
    }

    /// SOCOMEC (`1860`)
    @_alwaysEmitIntoClient
    static var socomec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1860)
    }

    /// WIZNOVA, Inc. (`1861`)
    @_alwaysEmitIntoClient
    static var wiznova: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1861)
    }

    /// Seitec Elektronik GmbH (`1862`)
    @_alwaysEmitIntoClient
    static var seitecElektronik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1862)
    }

    /// OR Technologies Pty Ltd (`1863`)
    @_alwaysEmitIntoClient
    static var orTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1863)
    }

    /// GuangZhou KuGou Computer Technology Co.Ltd (`1864`)
    @_alwaysEmitIntoClient
    static var guangzhouKugouComputerTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1864)
    }

    /// DIAODIAO (Beijing) Technology Co., Ltd. (`1865`)
    @_alwaysEmitIntoClient
    static var diaodiaoBeijingTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1865)
    }

    /// Illusory Studios LLC (`1866`)
    @_alwaysEmitIntoClient
    static var illusoryStudios: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1866)
    }

    /// Sarvavid Software Solutions LLP (`1867`)
    @_alwaysEmitIntoClient
    static var sarvavidSoftwareSolutionsLlp: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1867)
    }

    /// iopool s.a. (`1868`)
    @_alwaysEmitIntoClient
    static var iopool: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1868)
    }

    /// Amtech Systems, LLC (`1869`)
    @_alwaysEmitIntoClient
    static var amtechSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1869)
    }

    /// EAGLE DETECTION SA (`1870`)
    @_alwaysEmitIntoClient
    static var eagleDetection: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1870)
    }

    /// MEDIATECH S.R.L. (`1871`)
    @_alwaysEmitIntoClient
    static var mediatech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1871)
    }

    /// Hamilton Professional Services of Canada Incorporated (`1872`)
    @_alwaysEmitIntoClient
    static var hamiltonProfessionalServicesOfCanada: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1872)
    }

    /// Changsha JEMO IC Design Co.,Ltd (`1873`)
    @_alwaysEmitIntoClient
    static var changshaJemoIcDesign: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1873)
    }

    /// Elatec GmbH (`1874`)
    @_alwaysEmitIntoClient
    static var elatec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1874)
    }

    /// JLG Industries, Inc. (`1875`)
    @_alwaysEmitIntoClient
    static var jlgIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1875)
    }

    /// Michael Parkin (`1876`)
    @_alwaysEmitIntoClient
    static var michaelParkin: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1876)
    }

    /// Brother Industries, Ltd (`1877`)
    @_alwaysEmitIntoClient
    static var brotherIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1877)
    }

    /// Lumens For Less, Inc (`1878`)
    @_alwaysEmitIntoClient
    static var lumensForLess: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1878)
    }

    /// ELA Innovation (`1879`)
    @_alwaysEmitIntoClient
    static var elaInnovation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1879)
    }

    /// umanSense AB (`1880`)
    @_alwaysEmitIntoClient
    static var umansense: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1880)
    }

    /// Shanghai InGeek Cyber Security Co., Ltd. (`1881`)
    @_alwaysEmitIntoClient
    static var shanghaiIngeekCyberSecurity: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1881)
    }

    /// HARMAN CO.,LTD. (`1882`)
    @_alwaysEmitIntoClient
    static var harman: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1882)
    }

    /// Smart Sensor Devices AB (`1883`)
    @_alwaysEmitIntoClient
    static var smartSensorDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1883)
    }

    /// Antitronics Inc. (`1884`)
    @_alwaysEmitIntoClient
    static var antitronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1884)
    }

    /// RHOMBUS SYSTEMS, INC. (`1885`)
    @_alwaysEmitIntoClient
    static var rhombusSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1885)
    }

    /// Katerra Inc. (`1886`)
    @_alwaysEmitIntoClient
    static var katerra: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1886)
    }

    /// Remote Solution Co., LTD. (`1887`)
    @_alwaysEmitIntoClient
    static var remoteSolution: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1887)
    }

    /// Vimar SpA (`1888`)
    @_alwaysEmitIntoClient
    static var vimarSpa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1888)
    }

    /// Mantis Tech LLC (`1889`)
    @_alwaysEmitIntoClient
    static var mantisTech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1889)
    }

    /// TerOpta Ltd (`1890`)
    @_alwaysEmitIntoClient
    static var teropta: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1890)
    }

    /// PIKOLIN S.L. (`1891`)
    @_alwaysEmitIntoClient
    static var pikolin: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1891)
    }

    /// WWZN Information Technology Company Limited (`1892`)
    @_alwaysEmitIntoClient
    static var wwznInformationTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1892)
    }

    /// Voxx International (`1893`)
    @_alwaysEmitIntoClient
    static var voxxInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1893)
    }

    /// ART AND PROGRAM, INC. (`1894`)
    @_alwaysEmitIntoClient
    static var artAndProgram: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1894)
    }

    /// NITTO DENKO ASIA TECHNICAL CENTRE PTE. LTD. (`1895`)
    @_alwaysEmitIntoClient
    static var nittoDenkoiaTechnicalCentrePte: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1895)
    }

    /// Peloton Interactive Inc. (`1896`)
    @_alwaysEmitIntoClient
    static var pelotonInteractive: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1896)
    }

    /// Force Impact Technologies (`1897`)
    @_alwaysEmitIntoClient
    static var forceImpactTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1897)
    }

    /// Dmac Mobile Developments, LLC (`1898`)
    @_alwaysEmitIntoClient
    static var dmacMobileDevelopments: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1898)
    }

    /// Engineered Medical Technologies (`1899`)
    @_alwaysEmitIntoClient
    static var engineeredMedicalTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1899)
    }

    /// Noodle Technology inc (`1900`)
    @_alwaysEmitIntoClient
    static var noodleTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1900)
    }

    /// Graesslin GmbH (`1901`)
    @_alwaysEmitIntoClient
    static var graesslin: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1901)
    }

    /// WuQi technologies, Inc. (`1902`)
    @_alwaysEmitIntoClient
    static var wuqiTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1902)
    }

    /// Successful Endeavours Pty Ltd (`1903`)
    @_alwaysEmitIntoClient
    static var successfulEndeavours: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1903)
    }

    /// InnoCon Medical ApS (`1904`)
    @_alwaysEmitIntoClient
    static var innoconMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1904)
    }

    /// Corvex Connected Safety (`1905`)
    @_alwaysEmitIntoClient
    static var corvexConnectedSafety: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1905)
    }

    /// Thirdwayv Inc. (`1906`)
    @_alwaysEmitIntoClient
    static var thirdwayv: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1906)
    }

    /// Echoflex Solutions Inc. (`1907`)
    @_alwaysEmitIntoClient
    static var echoflexSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1907)
    }

    /// C-MAX Asia Limited (`1908`)
    @_alwaysEmitIntoClient
    static var cMaxAsia: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1908)
    }

    /// 4eBusiness GmbH (`1909`)
    @_alwaysEmitIntoClient
    static var company4Ebusiness: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1909)
    }

    /// Cyber Transport Control GmbH (`1910`)
    @_alwaysEmitIntoClient
    static var cyberTransportControl: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1910)
    }

    /// Cue (`1911`)
    @_alwaysEmitIntoClient
    static var cue: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1911)
    }

    /// KOAMTAC INC. (`1912`)
    @_alwaysEmitIntoClient
    static var koamtac: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1912)
    }

    /// Loopshore Oy (`1913`)
    @_alwaysEmitIntoClient
    static var loopshore: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1913)
    }

    /// Niruha Systems Private Limited (`1914`)
    @_alwaysEmitIntoClient
    static var niruhaSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1914)
    }

    /// AmaterZ, Inc. (`1915`)
    @_alwaysEmitIntoClient
    static var amaterz: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1915)
    }

    /// radius co., ltd. (`1916`)
    @_alwaysEmitIntoClient
    static var radius: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1916)
    }

    /// Sensority, s.r.o. (`1917`)
    @_alwaysEmitIntoClient
    static var sensority: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1917)
    }

    /// Sparkage Inc. (`1918`)
    @_alwaysEmitIntoClient
    static var sparkage: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1918)
    }

    /// Glenview Software Corporation (`1919`)
    @_alwaysEmitIntoClient
    static var glenviewSoftware: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1919)
    }

    /// Finch Technologies Ltd. (`1920`)
    @_alwaysEmitIntoClient
    static var finchTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1920)
    }

    /// Qingping Technology (Beijing) Co., Ltd. (`1921`)
    @_alwaysEmitIntoClient
    static var qingpingTechnologyBeijing: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1921)
    }

    /// DeviceDrive AS (`1922`)
    @_alwaysEmitIntoClient
    static var devicedrive: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1922)
    }

    /// ESEMBER LIMITED LIABILITY COMPANY (`1923`)
    @_alwaysEmitIntoClient
    static var esemberLiability: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1923)
    }

    /// audifon GmbH & Co. KG (`1924`)
    @_alwaysEmitIntoClient
    static var audifon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1924)
    }

    /// O2 Micro, Inc. (`1925`)
    @_alwaysEmitIntoClient
    static var o2Micro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1925)
    }

    /// HLP Controls Pty Limited (`1926`)
    @_alwaysEmitIntoClient
    static var hlpControls: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1926)
    }

    /// Pangaea Solution (`1927`)
    @_alwaysEmitIntoClient
    static var pangaeaSolution: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1927)
    }

    /// BubblyNet, LLC (`1928`)
    @_alwaysEmitIntoClient
    static var bubblynet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1928)
    }

    /// PCB Piezotronics, Inc. (`1929`)
    @_alwaysEmitIntoClient
    static var pcbPiezotronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1929)
    }

    /// The Wildflower Foundation (`1930`)
    @_alwaysEmitIntoClient
    static var wildflowerFoundation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1930)
    }

    /// Optikam Tech Inc. (`1931`)
    @_alwaysEmitIntoClient
    static var optikamTech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1931)
    }

    /// MINIBREW HOLDING B.V (`1932`)
    @_alwaysEmitIntoClient
    static var minibrewHoldingBV: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1932)
    }

    /// Cybex GmbH (`1933`)
    @_alwaysEmitIntoClient
    static var cybex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1933)
    }

    /// FUJIMIC NIIGATA, INC. (`1934`)
    @_alwaysEmitIntoClient
    static var fujimicNiigata: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1934)
    }

    /// Hanna Instruments, Inc. (`1935`)
    @_alwaysEmitIntoClient
    static var hannaInstruments: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1935)
    }

    /// KOMPAN A/S (`1936`)
    @_alwaysEmitIntoClient
    static var kompan: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1936)
    }

    /// Scosche Industries, Inc. (`1937`)
    @_alwaysEmitIntoClient
    static var scoscheIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1937)
    }

    /// Cricut, Inc. (`1938`)
    @_alwaysEmitIntoClient
    static var cricut: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1938)
    }

    /// AEV spol. s r.o. (`1939`)
    @_alwaysEmitIntoClient
    static var aevSpolSRO: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1939)
    }

    /// The Coca-Cola Company (`1940`)
    @_alwaysEmitIntoClient
    static var cocaCola: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1940)
    }

    /// GASTEC CORPORATION (`1941`)
    @_alwaysEmitIntoClient
    static var gastec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1941)
    }

    /// StarLeaf Ltd (`1942`)
    @_alwaysEmitIntoClient
    static var starleaf: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1942)
    }

    /// Water-i.d. GmbH (`1943`)
    @_alwaysEmitIntoClient
    static var waterID: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1943)
    }

    /// HoloKit, Inc. (`1944`)
    @_alwaysEmitIntoClient
    static var holokit: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1944)
    }

    /// PlantChoir Inc. (`1945`)
    @_alwaysEmitIntoClient
    static var plantchoir: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1945)
    }

    /// GuangDong Oppo Mobile Telecommunications Corp., Ltd. (`1946`)
    @_alwaysEmitIntoClient
    static var guangdongOppoMobileTelecommunications: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1946)
    }

    /// CST ELECTRONICS (PROPRIETARY) LIMITED (`1947`)
    @_alwaysEmitIntoClient
    static var cstElectronicsProprietary: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1947)
    }

    /// Sky UK Limited (`1948`)
    @_alwaysEmitIntoClient
    static var skyUk: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1948)
    }

    /// Digibale Pty Ltd (`1949`)
    @_alwaysEmitIntoClient
    static var digibale: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1949)
    }

    /// Smartloxx GmbH (`1950`)
    @_alwaysEmitIntoClient
    static var smartloxx: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1950)
    }

    /// Pune Scientific LLP (`1951`)
    @_alwaysEmitIntoClient
    static var puneScientificLlp: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1951)
    }

    /// Regent Beleuchtungskorper AG (`1952`)
    @_alwaysEmitIntoClient
    static var regentBeleuchtungskorper: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1952)
    }

    /// Apollo Neuroscience, Inc. (`1953`)
    @_alwaysEmitIntoClient
    static var apolloNeuroscience: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1953)
    }

    /// Roku, Inc. (`1954`)
    @_alwaysEmitIntoClient
    static var roku: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1954)
    }

    /// Comcast Cable (`1955`)
    @_alwaysEmitIntoClient
    static var comcastCable: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1955)
    }

    /// Xiamen Mage Information Technology Co., Ltd. (`1956`)
    @_alwaysEmitIntoClient
    static var xiamenMageInformationTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1956)
    }

    /// RAB Lighting, Inc. (`1957`)
    @_alwaysEmitIntoClient
    static var rabLighting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1957)
    }

    /// Musen Connect, Inc. (`1958`)
    @_alwaysEmitIntoClient
    static var musenConnect: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1958)
    }

    /// Zume, Inc. (`1959`)
    @_alwaysEmitIntoClient
    static var zume: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1959)
    }

    /// conbee GmbH (`1960`)
    @_alwaysEmitIntoClient
    static var conbee: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1960)
    }

    /// Bruel & Kjaer Sound & Vibration (`1961`)
    @_alwaysEmitIntoClient
    static var bruelKjaerSoundVibration: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1961)
    }

    /// The Kroger Co. (`1962`)
    @_alwaysEmitIntoClient
    static var kroger: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1962)
    }

    /// Granite River Solutions, Inc. (`1963`)
    @_alwaysEmitIntoClient
    static var graniteRiverSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1963)
    }

    /// LoupeDeck Oy (`1964`)
    @_alwaysEmitIntoClient
    static var loupedeck: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1964)
    }

    /// New H3C Technologies Co.,Ltd (`1965`)
    @_alwaysEmitIntoClient
    static var newH3CTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1965)
    }

    /// Aurea Solucoes Tecnologicas Ltda. (`1966`)
    @_alwaysEmitIntoClient
    static var aureaSolucoesTecnologicas: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1966)
    }

    /// Hong Kong Bouffalo Lab Limited (`1967`)
    @_alwaysEmitIntoClient
    static var hongKongBouffaloLab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1967)
    }

    /// GV Concepts Inc. (`1968`)
    @_alwaysEmitIntoClient
    static var gvConcepts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1968)
    }

    /// Thomas Dynamics, LLC (`1969`)
    @_alwaysEmitIntoClient
    static var thomasDynamics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1969)
    }

    /// Moeco IOT Inc. (`1970`)
    @_alwaysEmitIntoClient
    static var moecoIot: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1970)
    }

    /// 2N TELEKOMUNIKACE a.s. (`1971`)
    @_alwaysEmitIntoClient
    static var company2NTelekomunikace: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1971)
    }

    /// Hormann KG Antriebstechnik (`1972`)
    @_alwaysEmitIntoClient
    static var hormannKgAntriebstechnik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1972)
    }

    /// CRONO CHIP, S.L. (`1973`)
    @_alwaysEmitIntoClient
    static var cronoChip: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1973)
    }

    /// Soundbrenner Limited (`1974`)
    @_alwaysEmitIntoClient
    static var soundbrenner: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1974)
    }

    /// ETABLISSEMENTS GEORGES RENAULT (`1975`)
    @_alwaysEmitIntoClient
    static var etablissementsGeorgesRenault: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1975)
    }

    /// iSwip (`1976`)
    @_alwaysEmitIntoClient
    static var iswip: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1976)
    }

    /// Epona Biotec Limited (`1977`)
    @_alwaysEmitIntoClient
    static var eponaBiotec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1977)
    }

    /// Battery-Biz Inc. (`1978`)
    @_alwaysEmitIntoClient
    static var batteryBiz: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1978)
    }

    /// EPIC S.R.L. (`1979`)
    @_alwaysEmitIntoClient
    static var epic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1979)
    }

    /// KD CIRCUITS LLC (`1980`)
    @_alwaysEmitIntoClient
    static var kdCircuits: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1980)
    }

    /// Genedrive Diagnostics Ltd (`1981`)
    @_alwaysEmitIntoClient
    static var genedriveDiagnostics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1981)
    }

    /// Axentia Technologies AB (`1982`)
    @_alwaysEmitIntoClient
    static var axentiaTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1982)
    }

    /// REGULA Ltd. (`1983`)
    @_alwaysEmitIntoClient
    static var regula: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1983)
    }

    /// Biral AG (`1984`)
    @_alwaysEmitIntoClient
    static var biral: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1984)
    }

    /// A.W. Chesterton Company (`1985`)
    @_alwaysEmitIntoClient
    static var aWChesterton: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1985)
    }

    /// Radinn AB (`1986`)
    @_alwaysEmitIntoClient
    static var radinn: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1986)
    }

    /// CIMTechniques, Inc. (`1987`)
    @_alwaysEmitIntoClient
    static var cimtechniques: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1987)
    }

    /// Johnson Health Tech NA (`1988`)
    @_alwaysEmitIntoClient
    static var johnsonHealthTechNa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1988)
    }

    /// June Life, Inc. (`1989`)
    @_alwaysEmitIntoClient
    static var juneLife: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1989)
    }

    /// Bluenetics GmbH (`1990`)
    @_alwaysEmitIntoClient
    static var bluenetics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1990)
    }

    /// iaconicDesign Inc. (`1991`)
    @_alwaysEmitIntoClient
    static var iaconicdesign: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1991)
    }

    /// WRLDS Creations AB (`1992`)
    @_alwaysEmitIntoClient
    static var wrldsCreations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1992)
    }

    /// Skullcandy, Inc. (`1993`)
    @_alwaysEmitIntoClient
    static var skullcandy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1993)
    }

    /// Modul-System HH AB (`1994`)
    @_alwaysEmitIntoClient
    static var modulSystemHh: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1994)
    }

    /// West Pharmaceutical Services, Inc. (`1995`)
    @_alwaysEmitIntoClient
    static var westPharmaceuticalServices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1995)
    }

    /// Barnacle Systems Inc. (`1996`)
    @_alwaysEmitIntoClient
    static var barnacleSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1996)
    }

    /// Smart Wave Technologies Canada Inc (`1997`)
    @_alwaysEmitIntoClient
    static var smartWaveTechnologiesCanada: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1997)
    }

    /// Shanghai Top-Chip Microelectronics Tech. Co., LTD (`1998`)
    @_alwaysEmitIntoClient
    static var shanghaiTopChipMicroelectronicsTech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1998)
    }

    /// NeoSensory, Inc. (`1999`)
    @_alwaysEmitIntoClient
    static var neosensory: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 1999)
    }

    /// Hangzhou Tuya Information  Technology Co., Ltd (`2000`)
    @_alwaysEmitIntoClient
    static var hangzhouTuyaInformationTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2000)
    }

    /// Shanghai Panchip Microelectronics Co., Ltd (`2001`)
    @_alwaysEmitIntoClient
    static var shanghaiPanchipMicroelectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2001)
    }

    /// React Accessibility Limited (`2002`)
    @_alwaysEmitIntoClient
    static var reactAccessibility: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2002)
    }

    /// LIVNEX Co.,Ltd. (`2003`)
    @_alwaysEmitIntoClient
    static var livnex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2003)
    }

    /// Kano Computing Limited (`2004`)
    @_alwaysEmitIntoClient
    static var kanoComputing: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2004)
    }

    /// hoots classic GmbH (`2005`)
    @_alwaysEmitIntoClient
    static var hootsClassic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2005)
    }

    /// ecobee Inc. (`2006`)
    @_alwaysEmitIntoClient
    static var ecobee: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2006)
    }

    /// Nanjing Qinheng Microelectronics Co., Ltd (`2007`)
    @_alwaysEmitIntoClient
    static var nanjingQinhengMicroelectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2007)
    }

    /// SOLUTIONS AMBRA INC. (`2008`)
    @_alwaysEmitIntoClient
    static var solutionsAmbra: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2008)
    }

    /// Micro-Design, Inc. (`2009`)
    @_alwaysEmitIntoClient
    static var microDesign: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2009)
    }

    /// STARLITE Co., Ltd. (`2010`)
    @_alwaysEmitIntoClient
    static var starlite: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2010)
    }

    /// Remedee Labs (`2011`)
    @_alwaysEmitIntoClient
    static var remedeeLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2011)
    }

    /// ThingOS GmbH & Co KG (`2012`)
    @_alwaysEmitIntoClient
    static var thingos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2012)
    }

    /// Linear Circuits (`2013`)
    @_alwaysEmitIntoClient
    static var linearCircuits: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2013)
    }

    /// Unlimited Engineering SL (`2014`)
    @_alwaysEmitIntoClient
    static var unlimitedEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2014)
    }

    /// Snap-on Incorporated (`2015`)
    @_alwaysEmitIntoClient
    static var snapOn: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2015)
    }

    /// Edifier International Limited (`2016`)
    @_alwaysEmitIntoClient
    static var edifierInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2016)
    }

    /// Lucie Labs (`2017`)
    @_alwaysEmitIntoClient
    static var lucieLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2017)
    }

    /// Alfred Kaercher SE & Co. KG (`2018`)
    @_alwaysEmitIntoClient
    static var alfredKaercherSeKg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2018)
    }

    /// Airoha Technology Corp. (`2019`)
    @_alwaysEmitIntoClient
    static var airohaTechnology2: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2019)
    }

    /// Geeksme S.L. (`2020`)
    @_alwaysEmitIntoClient
    static var geeksme: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2020)
    }

    /// Minut, Inc. (`2021`)
    @_alwaysEmitIntoClient
    static var minut: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2021)
    }

    /// Waybeyond Limited (`2022`)
    @_alwaysEmitIntoClient
    static var waybeyond: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2022)
    }

    /// Komfort IQ, Inc. (`2023`)
    @_alwaysEmitIntoClient
    static var komfortIq: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2023)
    }

    /// Packetcraft, Inc. (`2024`)
    @_alwaysEmitIntoClient
    static var packetcraft: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2024)
    }

    /// Häfele GmbH & Co KG (`2025`)
    @_alwaysEmitIntoClient
    static var hafele: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2025)
    }

    /// ShapeLog, Inc. (`2026`)
    @_alwaysEmitIntoClient
    static var shapelog: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2026)
    }

    /// NOVABASE S.R.L. (`2027`)
    @_alwaysEmitIntoClient
    static var novabase: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2027)
    }

    /// Frecce LLC (`2028`)
    @_alwaysEmitIntoClient
    static var frecce: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2028)
    }

    /// Joule IQ, INC. (`2029`)
    @_alwaysEmitIntoClient
    static var jouleIq: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2029)
    }

    /// KidzTek LLC (`2030`)
    @_alwaysEmitIntoClient
    static var kidztek: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2030)
    }

    /// Aktiebolaget Sandvik Coromant (`2031`)
    @_alwaysEmitIntoClient
    static var aktiebolagetSandvikCoromant: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2031)
    }

    /// e-moola.com Pty Ltd (`2032`)
    @_alwaysEmitIntoClient
    static var eMoolaCom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2032)
    }

    /// Zimi Innovations Pty Ltd (`2033`)
    @_alwaysEmitIntoClient
    static var zimiInnovations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2033)
    }

    /// SERENE GROUP, INC (`2034`)
    @_alwaysEmitIntoClient
    static var sereneGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2034)
    }

    /// DIGISINE ENERGYTECH CO. LTD. (`2035`)
    @_alwaysEmitIntoClient
    static var digisineEnergytech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2035)
    }

    /// MEDIRLAB Orvosbiologiai Fejleszto Korlatolt Felelossegu Tarsasag (`2036`)
    @_alwaysEmitIntoClient
    static var medirlabOrvosbiologiaiFejlesztoKorlatoltFelelosseguTarsasag: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2036)
    }

    /// Byton North America Corporation (`2037`)
    @_alwaysEmitIntoClient
    static var bytonNorthAmerica: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2037)
    }

    /// Shenzhen TonliScience and Technology Development Co.,Ltd (`2038`)
    @_alwaysEmitIntoClient
    static var shenzhenTonliscienceAndTechnologyDevelopment: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2038)
    }

    /// Cesar Systems Ltd. (`2039`)
    @_alwaysEmitIntoClient
    static var cesarSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2039)
    }

    /// quip NYC Inc. (`2040`)
    @_alwaysEmitIntoClient
    static var quipNyc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2040)
    }

    /// Direct Communication Solutions, Inc. (`2041`)
    @_alwaysEmitIntoClient
    static var directCommunicationSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2041)
    }

    /// Klipsch Group, Inc. (`2042`)
    @_alwaysEmitIntoClient
    static var klipschGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2042)
    }

    /// Access Co., Ltd (`2043`)
    @_alwaysEmitIntoClient
    static var access: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2043)
    }

    /// Renault SA (`2044`)
    @_alwaysEmitIntoClient
    static var renault: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2044)
    }

    /// JSK CO., LTD. (`2045`)
    @_alwaysEmitIntoClient
    static var jsk: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2045)
    }

    /// BIROTA (`2046`)
    @_alwaysEmitIntoClient
    static var birota: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2046)
    }

    /// maxon motor ltd. (`2047`)
    @_alwaysEmitIntoClient
    static var maxonMotor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2047)
    }

    /// Optek (`2048`)
    @_alwaysEmitIntoClient
    static var optek: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2048)
    }

    /// CRONUS ELECTRONICS LTD (`2049`)
    @_alwaysEmitIntoClient
    static var cronusElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2049)
    }

    /// NantSound, Inc. (`2050`)
    @_alwaysEmitIntoClient
    static var nantsound: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2050)
    }

    /// Domintell s.a. (`2051`)
    @_alwaysEmitIntoClient
    static var domintell: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2051)
    }

    /// Andon Health Co.,Ltd (`2052`)
    @_alwaysEmitIntoClient
    static var andonHealth: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2052)
    }

    /// Urbanminded Ltd (`2053`)
    @_alwaysEmitIntoClient
    static var urbanminded: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2053)
    }

    /// TYRI Sweden AB (`2054`)
    @_alwaysEmitIntoClient
    static var tyriSweden: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2054)
    }

    /// ECD Electronic Components GmbH Dresden (`2055`)
    @_alwaysEmitIntoClient
    static var ecdElectronicComponentsDresden: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2055)
    }

    /// SISTEMAS KERN, SOCIEDAD ANÓMINA (`2056`)
    @_alwaysEmitIntoClient
    static var sistemasKernSociedadAnomina: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2056)
    }

    /// Trulli Audio (`2057`)
    @_alwaysEmitIntoClient
    static var trulliAudio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2057)
    }

    /// Altaneos (`2058`)
    @_alwaysEmitIntoClient
    static var altaneos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2058)
    }

    /// Nanoleaf Canada Limited (`2059`)
    @_alwaysEmitIntoClient
    static var nanoleafCanada: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2059)
    }

    /// Ingy B.V. (`2060`)
    @_alwaysEmitIntoClient
    static var ingy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2060)
    }

    /// Azbil Co. (`2061`)
    @_alwaysEmitIntoClient
    static var azbil: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2061)
    }

    /// TATTCOM LLC (`2062`)
    @_alwaysEmitIntoClient
    static var tattcom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2062)
    }

    /// Paradox Engineering SA (`2063`)
    @_alwaysEmitIntoClient
    static var paradoxEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2063)
    }

    /// LECO Corporation (`2064`)
    @_alwaysEmitIntoClient
    static var leco: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2064)
    }

    /// Becker Antriebe GmbH (`2065`)
    @_alwaysEmitIntoClient
    static var beckerAntriebe: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2065)
    }

    /// Mstream Technologies., Inc. (`2066`)
    @_alwaysEmitIntoClient
    static var mstreamTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2066)
    }

    /// Flextronics International USA Inc. (`2067`)
    @_alwaysEmitIntoClient
    static var flextronicsInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2067)
    }

    /// Ossur hf. (`2068`)
    @_alwaysEmitIntoClient
    static var ossurHf: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2068)
    }

    /// SKC Inc (`2069`)
    @_alwaysEmitIntoClient
    static var skc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2069)
    }

    /// SPICA SYSTEMS LLC (`2070`)
    @_alwaysEmitIntoClient
    static var spicaSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2070)
    }

    /// Wangs Alliance Corporation (`2071`)
    @_alwaysEmitIntoClient
    static var wangsAlliance: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2071)
    }

    /// tatwah SA (`2072`)
    @_alwaysEmitIntoClient
    static var tatwah: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2072)
    }

    /// Hunter Douglas Inc (`2073`)
    @_alwaysEmitIntoClient
    static var hunterDouglas: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2073)
    }

    /// Shenzhen Conex (`2074`)
    @_alwaysEmitIntoClient
    static var shenzhenConex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2074)
    }

    /// DIM3 (`2075`)
    @_alwaysEmitIntoClient
    static var dim3: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2075)
    }

    /// Bobrick Washroom Equipment, Inc. (`2076`)
    @_alwaysEmitIntoClient
    static var bobrickWashroomEquipment: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2076)
    }

    /// Potrykus Holdings and Development LLC (`2077`)
    @_alwaysEmitIntoClient
    static var potrykusHoldingsAndDevelopment: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2077)
    }

    /// iNFORM Technology GmbH (`2078`)
    @_alwaysEmitIntoClient
    static var informTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2078)
    }

    /// eSenseLab LTD (`2079`)
    @_alwaysEmitIntoClient
    static var esenselab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2079)
    }

    /// Brilliant Home Technology, Inc. (`2080`)
    @_alwaysEmitIntoClient
    static var brilliantHomeTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2080)
    }

    /// INOVA Geophysical, Inc. (`2081`)
    @_alwaysEmitIntoClient
    static var inovaGeophysical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2081)
    }

    /// adafruit industries (`2082`)
    @_alwaysEmitIntoClient
    static var adafruitIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2082)
    }

    /// Nexite Ltd (`2083`)
    @_alwaysEmitIntoClient
    static var nexite: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2083)
    }

    /// 8Power Limited (`2084`)
    @_alwaysEmitIntoClient
    static var company8Power: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2084)
    }

    /// CME PTE. LTD. (`2085`)
    @_alwaysEmitIntoClient
    static var cmePte: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2085)
    }

    /// Hyundai Motor Company (`2086`)
    @_alwaysEmitIntoClient
    static var hyundaiMotor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2086)
    }

    /// Kickmaker (`2087`)
    @_alwaysEmitIntoClient
    static var kickmaker: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2087)
    }

    /// Shanghai Suisheng Information Technology Co., Ltd. (`2088`)
    @_alwaysEmitIntoClient
    static var shanghaiSuishengInformationTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2088)
    }

    /// HEXAGON METROLOGY DIVISION ROMER (`2089`)
    @_alwaysEmitIntoClient
    static var hexagonMetrologyDivisionRomer: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2089)
    }

    /// Mitutoyo Corporation (`2090`)
    @_alwaysEmitIntoClient
    static var mitutoyo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2090)
    }

    /// shenzhen fitcare electronics Co.,Ltd (`2091`)
    @_alwaysEmitIntoClient
    static var shenzhenFitcareElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2091)
    }

    /// INGICS TECHNOLOGY CO., LTD. (`2092`)
    @_alwaysEmitIntoClient
    static var ingicsTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2092)
    }

    /// INCUS PERFORMANCE LTD. (`2093`)
    @_alwaysEmitIntoClient
    static var incusPerformance: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2093)
    }

    /// ABB S.p.A. (`2094`)
    @_alwaysEmitIntoClient
    static var abb2: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2094)
    }

    /// Blippit AB (`2095`)
    @_alwaysEmitIntoClient
    static var blippit: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2095)
    }

    /// Core Health and Fitness LLC (`2096`)
    @_alwaysEmitIntoClient
    static var coreHealthAndFitness: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2096)
    }

    /// Foxble, LLC (`2097`)
    @_alwaysEmitIntoClient
    static var foxble: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2097)
    }

    /// Intermotive,Inc. (`2098`)
    @_alwaysEmitIntoClient
    static var intermotive: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2098)
    }

    /// Conneqtech B.V. (`2099`)
    @_alwaysEmitIntoClient
    static var conneqtech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2099)
    }

    /// RIKEN KEIKI CO., LTD., (`2100`)
    @_alwaysEmitIntoClient
    static var rikenKeiki: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2100)
    }

    /// Canopy Growth Corporation (`2101`)
    @_alwaysEmitIntoClient
    static var canopyGrowth: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2101)
    }

    /// Bitwards Oy (`2102`)
    @_alwaysEmitIntoClient
    static var bitwards: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2102)
    }

    /// vivo Mobile Communication Co., Ltd. (`2103`)
    @_alwaysEmitIntoClient
    static var vivoMobileCommunication: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2103)
    }

    /// Etymotic Research, Inc. (`2104`)
    @_alwaysEmitIntoClient
    static var etymoticResearch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2104)
    }

    /// A puissance 3 (`2105`)
    @_alwaysEmitIntoClient
    static var aPuissance3: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2105)
    }

    /// BPW Bergische Achsen Kommanditgesellschaft (`2106`)
    @_alwaysEmitIntoClient
    static var bpwBergischeAchsenKommanditgesellschaft: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2106)
    }

    /// Piaggio Fast Forward (`2107`)
    @_alwaysEmitIntoClient
    static var piaggioFastForward: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2107)
    }

    /// BeerTech LTD (`2108`)
    @_alwaysEmitIntoClient
    static var beertech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2108)
    }

    /// Tokenize, Inc. (`2109`)
    @_alwaysEmitIntoClient
    static var tokenize: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2109)
    }

    /// Zorachka LTD (`2110`)
    @_alwaysEmitIntoClient
    static var zorachka: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2110)
    }

    /// D-Link Corp. (`2111`)
    @_alwaysEmitIntoClient
    static var dLink: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2111)
    }

    /// Down Range Systems LLC (`2112`)
    @_alwaysEmitIntoClient
    static var downRangeSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2112)
    }

    /// General Luminaire (Shanghai) Co., Ltd. (`2113`)
    @_alwaysEmitIntoClient
    static var generalLuminaireShanghai: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2113)
    }

    /// Tangshan HongJia electronic technology co., LTD. (`2114`)
    @_alwaysEmitIntoClient
    static var tangshanHongjiaElectronicTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2114)
    }

    /// FRAGRANCE DELIVERY TECHNOLOGIES LTD (`2115`)
    @_alwaysEmitIntoClient
    static var fragranceDeliveryTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2115)
    }

    /// Pepperl + Fuchs GmbH (`2116`)
    @_alwaysEmitIntoClient
    static var pepperlFuchs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2116)
    }

    /// Dometic Corporation (`2117`)
    @_alwaysEmitIntoClient
    static var dometic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2117)
    }

    /// USound GmbH (`2118`)
    @_alwaysEmitIntoClient
    static var usound: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2118)
    }

    /// DNANUDGE LIMITED (`2119`)
    @_alwaysEmitIntoClient
    static var dnanudge: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2119)
    }

    /// JUJU JOINTS CANADA CORP. (`2120`)
    @_alwaysEmitIntoClient
    static var jujuJointsCanada: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2120)
    }

    /// Dopple Technologies B.V. (`2121`)
    @_alwaysEmitIntoClient
    static var doppleTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2121)
    }

    /// ARCOM (`2122`)
    @_alwaysEmitIntoClient
    static var arcom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2122)
    }

    /// Biotechware SRL (`2123`)
    @_alwaysEmitIntoClient
    static var biotechware: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2123)
    }

    /// ORSO Inc. (`2124`)
    @_alwaysEmitIntoClient
    static var orso: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2124)
    }

    /// SafePort (`2125`)
    @_alwaysEmitIntoClient
    static var safeport: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2125)
    }

    /// Carol Cole Company (`2126`)
    @_alwaysEmitIntoClient
    static var carolCole: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2126)
    }

    /// Embedded Fitness B.V. (`2127`)
    @_alwaysEmitIntoClient
    static var embeddedFitness: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2127)
    }

    /// Yealink (Xiamen) Network Technology Co.,LTD (`2128`)
    @_alwaysEmitIntoClient
    static var yealinkXiamenNetworkTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2128)
    }

    /// Subeca, Inc. (`2129`)
    @_alwaysEmitIntoClient
    static var subeca: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2129)
    }

    /// Cognosos, Inc. (`2130`)
    @_alwaysEmitIntoClient
    static var cognosos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2130)
    }

    /// Pektron Group Limited (`2131`)
    @_alwaysEmitIntoClient
    static var pektronGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2131)
    }

    /// Tap Sound System (`2132`)
    @_alwaysEmitIntoClient
    static var tapSoundSystem: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2132)
    }

    /// Helios Sports, Inc. (`2133`)
    @_alwaysEmitIntoClient
    static var heliosSports: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2133)
    }

    /// Canopy Growth Corporation (`2134`)
    @_alwaysEmitIntoClient
    static var canopyGrowth2: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2134)
    }

    /// Parsyl Inc (`2135`)
    @_alwaysEmitIntoClient
    static var parsyl: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2135)
    }

    /// SOUNDBOKS (`2136`)
    @_alwaysEmitIntoClient
    static var soundboks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2136)
    }

    /// BlueUp (`2137`)
    @_alwaysEmitIntoClient
    static var blueup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2137)
    }

    /// DAKATECH (`2138`)
    @_alwaysEmitIntoClient
    static var dakatech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2138)
    }

    /// Nisshinbo Micro Devices Inc. (`2139`)
    @_alwaysEmitIntoClient
    static var nisshinboMicroDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2139)
    }

    /// ACOS CO.,LTD. (`2140`)
    @_alwaysEmitIntoClient
    static var acos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2140)
    }

    /// Guilin Zhishen Information Technology Co.,Ltd. (`2141`)
    @_alwaysEmitIntoClient
    static var guilinZhishenInformationTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2141)
    }

    /// Krog Systems LLC (`2142`)
    @_alwaysEmitIntoClient
    static var krogSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2142)
    }

    /// COMPEGPS TEAM,SOCIEDAD LIMITADA (`2143`)
    @_alwaysEmitIntoClient
    static var compegpsTeamSociedadLimitada: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2143)
    }

    /// Alflex Products B.V. (`2144`)
    @_alwaysEmitIntoClient
    static var alflexProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2144)
    }

    /// SmartSensor Labs Ltd (`2145`)
    @_alwaysEmitIntoClient
    static var smartsensorLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2145)
    }

    /// SmartDrive (`2146`)
    @_alwaysEmitIntoClient
    static var smartdrive: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2146)
    }

    /// Yo-tronics Technology Co., Ltd. (`2147`)
    @_alwaysEmitIntoClient
    static var yoTronicsTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2147)
    }

    /// Rafaelmicro (`2148`)
    @_alwaysEmitIntoClient
    static var rafaelmicro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2148)
    }

    /// Emergency Lighting Products Limited (`2149`)
    @_alwaysEmitIntoClient
    static var emergencyLightingProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2149)
    }

    /// LAONZ Co.,Ltd (`2150`)
    @_alwaysEmitIntoClient
    static var laonz: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2150)
    }

    /// Western Digital Techologies, Inc. (`2151`)
    @_alwaysEmitIntoClient
    static var westernDigitalTechologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2151)
    }

    /// WIOsense GmbH & Co. KG (`2152`)
    @_alwaysEmitIntoClient
    static var wiosense: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2152)
    }

    /// EVVA Sicherheitstechnologie GmbH (`2153`)
    @_alwaysEmitIntoClient
    static var evvaSicherheitstechnologie: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2153)
    }

    /// Odic Incorporated (`2154`)
    @_alwaysEmitIntoClient
    static var odic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2154)
    }

    /// Pacific Track, LLC (`2155`)
    @_alwaysEmitIntoClient
    static var pacificTrack: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2155)
    }

    /// Revvo Technologies, Inc. (`2156`)
    @_alwaysEmitIntoClient
    static var revvoTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2156)
    }

    /// Biometrika d.o.o. (`2157`)
    @_alwaysEmitIntoClient
    static var biometrika: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2157)
    }

    /// Vorwerk Elektrowerke GmbH & Co. KG (`2158`)
    @_alwaysEmitIntoClient
    static var vorwerkElektrowerke: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2158)
    }

    /// Trackunit A/S (`2159`)
    @_alwaysEmitIntoClient
    static var trackunit: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2159)
    }

    /// Wyze Labs, Inc (`2160`)
    @_alwaysEmitIntoClient
    static var wyzeLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2160)
    }

    /// Dension Elektronikai Kft. (`2161`)
    @_alwaysEmitIntoClient
    static var densionElektronikai: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2161)
    }

    /// 11 Health & Technologies Limited (`2162`)
    @_alwaysEmitIntoClient
    static var company11HealthTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2162)
    }

    /// Innophase Incorporated (`2163`)
    @_alwaysEmitIntoClient
    static var innophase: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2163)
    }

    /// Treegreen Limited (`2164`)
    @_alwaysEmitIntoClient
    static var treegreen: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2164)
    }

    /// Berner International LLC (`2165`)
    @_alwaysEmitIntoClient
    static var bernerInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2165)
    }

    /// SmartResQ ApS (`2166`)
    @_alwaysEmitIntoClient
    static var smartresq: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2166)
    }

    /// Tome, Inc. (`2167`)
    @_alwaysEmitIntoClient
    static var tome: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2167)
    }

    /// The Chamberlain Group, Inc. (`2168`)
    @_alwaysEmitIntoClient
    static var chamberlainGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2168)
    }

    /// MIZUNO Corporation (`2169`)
    @_alwaysEmitIntoClient
    static var mizuno: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2169)
    }

    /// ZRF, LLC (`2170`)
    @_alwaysEmitIntoClient
    static var zrf: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2170)
    }

    /// BYSTAMP (`2171`)
    @_alwaysEmitIntoClient
    static var bystamp: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2171)
    }

    /// Crosscan GmbH (`2172`)
    @_alwaysEmitIntoClient
    static var crosscan: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2172)
    }

    /// Konftel AB (`2173`)
    @_alwaysEmitIntoClient
    static var konftel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2173)
    }

    /// 1bar.net Limited (`2174`)
    @_alwaysEmitIntoClient
    static var company1BarNet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2174)
    }

    /// Phillips Connect Technologies LLC (`2175`)
    @_alwaysEmitIntoClient
    static var phillipsConnectTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2175)
    }

    /// imagiLabs AB (`2176`)
    @_alwaysEmitIntoClient
    static var imagilabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2176)
    }

    /// Optalert (`2177`)
    @_alwaysEmitIntoClient
    static var optalert: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2177)
    }

    /// PSYONIC, Inc. (`2178`)
    @_alwaysEmitIntoClient
    static var psyonic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2178)
    }

    /// Wintersteiger AG (`2179`)
    @_alwaysEmitIntoClient
    static var wintersteiger: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2179)
    }

    /// Controlid Industria, Comercio de Hardware e Servicos de Tecnologia Ltda (`2180`)
    @_alwaysEmitIntoClient
    static var controlidIndustriaComercioDeHardwareEServicosDeTecnologia: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2180)
    }

    /// LEVOLOR INC (`2181`)
    @_alwaysEmitIntoClient
    static var levolor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2181)
    }

    /// Movella Technologies B.V. (`2182`)
    @_alwaysEmitIntoClient
    static var movellaTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2182)
    }

    /// Hydro-Gear Limited Partnership (`2183`)
    @_alwaysEmitIntoClient
    static var hydroGearPartnership: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2183)
    }

    /// EnPointe Fencing Pty Ltd (`2184`)
    @_alwaysEmitIntoClient
    static var enpointeFencing: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2184)
    }

    /// XANTHIO (`2185`)
    @_alwaysEmitIntoClient
    static var xanthio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2185)
    }

    /// sclak s.r.l. (`2186`)
    @_alwaysEmitIntoClient
    static var sclak: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2186)
    }

    /// Tricorder Arraay Technologies LLC (`2187`)
    @_alwaysEmitIntoClient
    static var tricorderArraayTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2187)
    }

    /// GB Solution co.,Ltd (`2188`)
    @_alwaysEmitIntoClient
    static var gbSolution: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2188)
    }

    /// Soliton Systems K.K. (`2189`)
    @_alwaysEmitIntoClient
    static var solitonSystemsKK: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2189)
    }

    /// GIGA-TMS INC (`2190`)
    @_alwaysEmitIntoClient
    static var gigaTms: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2190)
    }

    /// Tait International Limited (`2191`)
    @_alwaysEmitIntoClient
    static var taitInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2191)
    }

    /// NICHIEI INTEC CO., LTD. (`2192`)
    @_alwaysEmitIntoClient
    static var nichieiIntec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2192)
    }

    /// SmartWireless GmbH & Co. KG (`2193`)
    @_alwaysEmitIntoClient
    static var smartwireless: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2193)
    }

    /// Ingenieurbuero Birnfeld UG (haftungsbeschraenkt) (`2194`)
    @_alwaysEmitIntoClient
    static var ingenieurbueroBirnfeldUgHaftungsbeschraenkt: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2194)
    }

    /// Maytronics Ltd (`2195`)
    @_alwaysEmitIntoClient
    static var maytronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2195)
    }

    /// EPIFIT (`2196`)
    @_alwaysEmitIntoClient
    static var epifit: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2196)
    }

    /// Gimer medical (`2197`)
    @_alwaysEmitIntoClient
    static var gimerMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2197)
    }

    /// Nokian Renkaat Oyj (`2198`)
    @_alwaysEmitIntoClient
    static var nokianRenkaatj: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2198)
    }

    /// Current Lighting Solutions LLC (`2199`)
    @_alwaysEmitIntoClient
    static var currentLightingSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2199)
    }

    /// Sensibo, Inc. (`2200`)
    @_alwaysEmitIntoClient
    static var sensibo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2200)
    }

    /// SFS unimarket AG (`2201`)
    @_alwaysEmitIntoClient
    static var sfsUnimarket: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2201)
    }

    /// Private limited company "Teltonika" (`2202`)
    @_alwaysEmitIntoClient
    static var teltonika: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2202)
    }

    /// Saucon Technologies (`2203`)
    @_alwaysEmitIntoClient
    static var sauconTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2203)
    }

    /// Embedded Devices Co. Company (`2204`)
    @_alwaysEmitIntoClient
    static var embeddedDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2204)
    }

    /// J-J.A.D.E. Enterprise LLC (`2205`)
    @_alwaysEmitIntoClient
    static var jJADEEnterprise: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2205)
    }

    /// i-SENS, inc. (`2206`)
    @_alwaysEmitIntoClient
    static var iSens: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2206)
    }

    /// Witschi Electronic Ltd (`2207`)
    @_alwaysEmitIntoClient
    static var witschiElectronic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2207)
    }

    /// Aclara Technologies LLC (`2208`)
    @_alwaysEmitIntoClient
    static var aclaraTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2208)
    }

    /// EXEO TECH CORPORATION (`2209`)
    @_alwaysEmitIntoClient
    static var exeoTech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2209)
    }

    /// Epic Systems Co., Ltd. (`2210`)
    @_alwaysEmitIntoClient
    static var epicSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2210)
    }

    /// Hoffmann SE (`2211`)
    @_alwaysEmitIntoClient
    static var hoffmann: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2211)
    }

    /// Realme Chongqing Mobile Telecommunications Corp., Ltd. (`2212`)
    @_alwaysEmitIntoClient
    static var realmeChongqingMobileTelecommunications: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2212)
    }

    /// UMEHEAL Ltd (`2213`)
    @_alwaysEmitIntoClient
    static var umeheal: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2213)
    }

    /// Intelligenceworks Inc. (`2214`)
    @_alwaysEmitIntoClient
    static var intelligenceworks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2214)
    }

    /// TGR 1.618 Limited (`2215`)
    @_alwaysEmitIntoClient
    static var tgr1618: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2215)
    }

    /// Shanghai Kfcube Inc (`2216`)
    @_alwaysEmitIntoClient
    static var shanghaiKfcube: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2216)
    }

    /// Fraunhofer IIS (`2217`)
    @_alwaysEmitIntoClient
    static var fraunhoferIis: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2217)
    }

    /// SZ DJI TECHNOLOGY CO.,LTD (`2218`)
    @_alwaysEmitIntoClient
    static var szDjiTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2218)
    }

    /// Coburn Technology, LLC (`2219`)
    @_alwaysEmitIntoClient
    static var coburnTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2219)
    }

    /// Topre Corporation (`2220`)
    @_alwaysEmitIntoClient
    static var topre: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2220)
    }

    /// Kayamatics Limited (`2221`)
    @_alwaysEmitIntoClient
    static var kayamatics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2221)
    }

    /// Moticon ReGo AG (`2222`)
    @_alwaysEmitIntoClient
    static var moticonRego: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2222)
    }

    /// Polidea Sp. z o.o. (`2223`)
    @_alwaysEmitIntoClient
    static var polidea: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2223)
    }

    /// Trivedi Advanced Technologies LLC (`2224`)
    @_alwaysEmitIntoClient
    static var trivediAdvancedTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2224)
    }

    /// CORE|vision BV (`2225`)
    @_alwaysEmitIntoClient
    static var coreVision: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2225)
    }

    /// PF SCHWEISSTECHNOLOGIE GMBH (`2226`)
    @_alwaysEmitIntoClient
    static var pfSchweisstechnologie: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2226)
    }

    /// IONIQ Skincare GmbH & Co. KG (`2227`)
    @_alwaysEmitIntoClient
    static var ioniqSkincare: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2227)
    }

    /// Sengled Co., Ltd. (`2228`)
    @_alwaysEmitIntoClient
    static var sengled: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2228)
    }

    /// TransferFi (`2229`)
    @_alwaysEmitIntoClient
    static var transferfi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2229)
    }

    /// Boehringer Ingelheim Vetmedica GmbH (`2230`)
    @_alwaysEmitIntoClient
    static var boehringerIngelheimVetmedica: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2230)
    }

    /// ABB Inc (`2231`)
    @_alwaysEmitIntoClient
    static var abb3: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2231)
    }

    /// Check Technology Solutions LLC (`2232`)
    @_alwaysEmitIntoClient
    static var checkTechnologySolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2232)
    }

    /// U-Shin Ltd. (`2233`)
    @_alwaysEmitIntoClient
    static var uShin: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2233)
    }

    /// HYPER ICE, INC. (`2234`)
    @_alwaysEmitIntoClient
    static var hyperIce: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2234)
    }

    /// Tokai-rika co.,ltd. (`2235`)
    @_alwaysEmitIntoClient
    static var tokaiRika: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2235)
    }

    /// Prevayl Limited (`2236`)
    @_alwaysEmitIntoClient
    static var prevayl: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2236)
    }

    /// bf1systems limited (`2237`)
    @_alwaysEmitIntoClient
    static var bf1Systems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2237)
    }

    /// ubisys technologies GmbH (`2238`)
    @_alwaysEmitIntoClient
    static var ubisysTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2238)
    }

    /// SIRC Co., Ltd. (`2239`)
    @_alwaysEmitIntoClient
    static var sirc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2239)
    }

    /// Accent Advanced Systems SLU (`2240`)
    @_alwaysEmitIntoClient
    static var accentAdvancedSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2240)
    }

    /// Rayden.Earth LTD (`2241`)
    @_alwaysEmitIntoClient
    static var raydenEarth: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2241)
    }

    /// Lindinvent AB (`2242`)
    @_alwaysEmitIntoClient
    static var lindinvent: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2242)
    }

    /// CHIPOLO d.o.o. (`2243`)
    @_alwaysEmitIntoClient
    static var chipolo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2243)
    }

    /// CellAssist, LLC (`2244`)
    @_alwaysEmitIntoClient
    static var cellassist: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2244)
    }

    /// J. Wagner GmbH (`2245`)
    @_alwaysEmitIntoClient
    static var jWagner: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2245)
    }

    /// Integra Optics Inc (`2246`)
    @_alwaysEmitIntoClient
    static var integraOptics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2246)
    }

    /// Monadnock Systems Ltd. (`2247`)
    @_alwaysEmitIntoClient
    static var monadnockSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2247)
    }

    /// Liteboxer Technologies Inc. (`2248`)
    @_alwaysEmitIntoClient
    static var liteboxerTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2248)
    }

    /// Noventa AG (`2249`)
    @_alwaysEmitIntoClient
    static var noventa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2249)
    }

    /// Nubia Technology Co.,Ltd. (`2250`)
    @_alwaysEmitIntoClient
    static var nubiaTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2250)
    }

    /// JT INNOVATIONS LIMITED (`2251`)
    @_alwaysEmitIntoClient
    static var jtInnovations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2251)
    }

    /// TGM TECHNOLOGY CO., LTD. (`2252`)
    @_alwaysEmitIntoClient
    static var tgmTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2252)
    }

    /// ifly (`2253`)
    @_alwaysEmitIntoClient
    static var ifly: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2253)
    }

    /// ZIMI CORPORATION (`2254`)
    @_alwaysEmitIntoClient
    static var zimi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2254)
    }

    /// betternotstealmybike UG (with limited liability) (`2255`)
    @_alwaysEmitIntoClient
    static var betternotstealmybikeUgWithLiability: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2255)
    }

    /// ESTOM Infotech Kft. (`2256`)
    @_alwaysEmitIntoClient
    static var estomInfotech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2256)
    }

    /// Sensovium Inc. (`2257`)
    @_alwaysEmitIntoClient
    static var sensovium: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2257)
    }

    /// Virscient Limited (`2258`)
    @_alwaysEmitIntoClient
    static var virscient: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2258)
    }

    /// Novel Bits, LLC (`2259`)
    @_alwaysEmitIntoClient
    static var novelBits: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2259)
    }

    /// ADATA Technology Co., LTD. (`2260`)
    @_alwaysEmitIntoClient
    static var adataTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2260)
    }

    /// KEYes (`2261`)
    @_alwaysEmitIntoClient
    static var keyes: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2261)
    }

    /// Nome Oy (`2262`)
    @_alwaysEmitIntoClient
    static var nome: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2262)
    }

    /// Inovonics Corp (`2263`)
    @_alwaysEmitIntoClient
    static var inovonics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2263)
    }

    /// WARES (`2264`)
    @_alwaysEmitIntoClient
    static var wares: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2264)
    }

    /// Pointr Labs Limited (`2265`)
    @_alwaysEmitIntoClient
    static var pointrLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2265)
    }

    /// Miridia Technology Incorporated (`2266`)
    @_alwaysEmitIntoClient
    static var miridiaTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2266)
    }

    /// Tertium Technology (`2267`)
    @_alwaysEmitIntoClient
    static var tertiumTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2267)
    }

    /// SHENZHEN AUKEY E BUSINESS CO., LTD (`2268`)
    @_alwaysEmitIntoClient
    static var shenzhenAukeyEBusiness: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2268)
    }

    /// code-Q (`2269`)
    @_alwaysEmitIntoClient
    static var codeQ: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2269)
    }

    /// TE Connectivity Corporation (`2270`)
    @_alwaysEmitIntoClient
    static var teConnectivity: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2270)
    }

    /// IRIS OHYAMA CO.,LTD. (`2271`)
    @_alwaysEmitIntoClient
    static var irisOhyama: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2271)
    }

    /// Philia Technology (`2272`)
    @_alwaysEmitIntoClient
    static var philiaTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2272)
    }

    /// KOZO KEIKAKU ENGINEERING Inc. (`2273`)
    @_alwaysEmitIntoClient
    static var kozoKeikakuEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2273)
    }

    /// Shenzhen Simo Technology co. LTD (`2274`)
    @_alwaysEmitIntoClient
    static var shenzhenSimoTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2274)
    }

    /// Republic Wireless, Inc. (`2275`)
    @_alwaysEmitIntoClient
    static var republicWireless: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2275)
    }

    /// Rashidov ltd (`2276`)
    @_alwaysEmitIntoClient
    static var rashidov: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2276)
    }

    /// Crowd Connected Ltd (`2277`)
    @_alwaysEmitIntoClient
    static var crowdConnected: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2277)
    }

    /// Eneso Tecnologia de Adaptacion S.L. (`2278`)
    @_alwaysEmitIntoClient
    static var enesoTecnologiaDeAdaptacion: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2278)
    }

    /// Barrot Technology Co.,Ltd. (`2279`)
    @_alwaysEmitIntoClient
    static var barrotTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2279)
    }

    /// Naonext (`2280`)
    @_alwaysEmitIntoClient
    static var naonext: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2280)
    }

    /// Taiwan Intelligent Home Corp. (`2281`)
    @_alwaysEmitIntoClient
    static var taiwanIntelligentHome: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2281)
    }

    /// COWBELL ENGINEERING CO.,LTD. (`2282`)
    @_alwaysEmitIntoClient
    static var cowbellEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2282)
    }

    /// Beijing Big Moment Technology Co., Ltd. (`2283`)
    @_alwaysEmitIntoClient
    static var beijingBigMomentTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2283)
    }

    /// Denso Corporation (`2284`)
    @_alwaysEmitIntoClient
    static var denso: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2284)
    }

    /// IMI Hydronic Engineering International SA (`2285`)
    @_alwaysEmitIntoClient
    static var imiHydronicEngineeringInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2285)
    }

    /// Askey Computer Corp. (`2286`)
    @_alwaysEmitIntoClient
    static var askeyComputer: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2286)
    }

    /// Cumulus Digital Systems, Inc (`2287`)
    @_alwaysEmitIntoClient
    static var cumulusDigitalSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2287)
    }

    /// Joovv, Inc. (`2288`)
    @_alwaysEmitIntoClient
    static var joovv: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2288)
    }

    /// The L.S. Starrett Company (`2289`)
    @_alwaysEmitIntoClient
    static var lSStarrett: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2289)
    }

    /// Microoled (`2290`)
    @_alwaysEmitIntoClient
    static var microoled: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2290)
    }

    /// PSP - Pauli Services & Products GmbH (`2291`)
    @_alwaysEmitIntoClient
    static var pspPauliServicesProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2291)
    }

    /// Kodimo Technologies Company Limited (`2292`)
    @_alwaysEmitIntoClient
    static var kodimoTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2292)
    }

    /// Tymtix Technologies Private Limited (`2293`)
    @_alwaysEmitIntoClient
    static var tymtixTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2293)
    }

    /// Dermal Photonics Corporation (`2294`)
    @_alwaysEmitIntoClient
    static var dermalPhotonics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2294)
    }

    /// MTD Products Inc & Affiliates (`2295`)
    @_alwaysEmitIntoClient
    static var mtdProductsAffiliates: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2295)
    }

    /// instagrid GmbH (`2296`)
    @_alwaysEmitIntoClient
    static var instagrid: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2296)
    }

    /// Spacelabs Medical Inc. (`2297`)
    @_alwaysEmitIntoClient
    static var spacelabsMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2297)
    }

    /// Troo Corporation (`2298`)
    @_alwaysEmitIntoClient
    static var troo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2298)
    }

    /// Darkglass Electronics Oy (`2299`)
    @_alwaysEmitIntoClient
    static var darkglassElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2299)
    }

    /// Hill-Rom (`2300`)
    @_alwaysEmitIntoClient
    static var hillRom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2300)
    }

    /// BioIntelliSense, Inc. (`2301`)
    @_alwaysEmitIntoClient
    static var biointellisense: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2301)
    }

    /// Ketronixs Sdn Bhd (`2302`)
    @_alwaysEmitIntoClient
    static var ketronixs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2302)
    }

    /// Plastimold Products, Inc (`2303`)
    @_alwaysEmitIntoClient
    static var plastimoldProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2303)
    }

    /// Beijing Zizai Technology Co., LTD. (`2304`)
    @_alwaysEmitIntoClient
    static var beijingZizaiTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2304)
    }

    /// Lucimed (`2305`)
    @_alwaysEmitIntoClient
    static var lucimed: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2305)
    }

    /// TSC Auto-ID Technology Co., Ltd. (`2306`)
    @_alwaysEmitIntoClient
    static var tscAutoIdTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2306)
    }

    /// DATAMARS, Inc. (`2307`)
    @_alwaysEmitIntoClient
    static var datamars: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2307)
    }

    /// SUNCORPORATION (`2308`)
    @_alwaysEmitIntoClient
    static var suncorporation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2308)
    }

    /// Yandex Services AG (`2309`)
    @_alwaysEmitIntoClient
    static var yandexServices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2309)
    }

    /// Scope Logistical Solutions (`2310`)
    @_alwaysEmitIntoClient
    static var scopeLogisticalSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2310)
    }

    /// User Hello, LLC (`2311`)
    @_alwaysEmitIntoClient
    static var userHello: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2311)
    }

    /// Pinpoint Innovations Limited (`2312`)
    @_alwaysEmitIntoClient
    static var pinpointInnovations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2312)
    }

    /// 70mai Co.,Ltd. (`2313`)
    @_alwaysEmitIntoClient
    static var company70Mai: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2313)
    }

    /// Zhuhai Hoksi Technology CO.,LTD (`2314`)
    @_alwaysEmitIntoClient
    static var zhuhaiHoksiTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2314)
    }

    /// EMBR labs, INC (`2315`)
    @_alwaysEmitIntoClient
    static var embrLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2315)
    }

    /// Radiawave Technologies Co.,Ltd. (`2316`)
    @_alwaysEmitIntoClient
    static var radiawaveTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2316)
    }

    /// IOT Invent GmbH (`2317`)
    @_alwaysEmitIntoClient
    static var iotInvent: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2317)
    }

    /// OPTIMUSIOT TECH LLP (`2318`)
    @_alwaysEmitIntoClient
    static var optimusiotTechLlp: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2318)
    }

    /// VC Inc. (`2319`)
    @_alwaysEmitIntoClient
    static var vc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2319)
    }

    /// ASR Microelectronics (Shanghai) Co., Ltd. (`2320`)
    @_alwaysEmitIntoClient
    static var asrMicroelectronicsShanghai: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2320)
    }

    /// Douglas Lighting Controls Inc. (`2321`)
    @_alwaysEmitIntoClient
    static var douglasLightingControls: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2321)
    }

    /// Nerbio Medical Software Platforms Inc (`2322`)
    @_alwaysEmitIntoClient
    static var nerbioMedicalSoftwarePlatforms: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2322)
    }

    /// Braveheart Wireless, Inc. (`2323`)
    @_alwaysEmitIntoClient
    static var braveheartWireless: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2323)
    }

    /// INEO-SENSE (`2324`)
    @_alwaysEmitIntoClient
    static var ineoSense: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2324)
    }

    /// Honda Motor Co., Ltd. (`2325`)
    @_alwaysEmitIntoClient
    static var hondaMotor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2325)
    }

    /// Ambient Sensors LLC (`2326`)
    @_alwaysEmitIntoClient
    static var ambientSensors: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2326)
    }

    /// ASR Microelectronics(ShenZhen)Co., Ltd. (`2327`)
    @_alwaysEmitIntoClient
    static var asrMicroelectronicsShenzhen: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2327)
    }

    /// Technosphere Labs Pvt. Ltd. (`2328`)
    @_alwaysEmitIntoClient
    static var technosphereLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2328)
    }

    /// NO SMD LIMITED (`2329`)
    @_alwaysEmitIntoClient
    static var noSmd: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2329)
    }

    /// Albertronic BV (`2330`)
    @_alwaysEmitIntoClient
    static var albertronic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2330)
    }

    /// Luminostics, Inc. (`2331`)
    @_alwaysEmitIntoClient
    static var luminostics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2331)
    }

    /// Oblamatik AG (`2332`)
    @_alwaysEmitIntoClient
    static var oblamatik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2332)
    }

    /// Innokind, Inc. (`2333`)
    @_alwaysEmitIntoClient
    static var innokind: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2333)
    }

    /// Melbot Studios, Sociedad Limitada (`2334`)
    @_alwaysEmitIntoClient
    static var melbotStudiosSociedadLimitada: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2334)
    }

    /// Myzee Technology (`2335`)
    @_alwaysEmitIntoClient
    static var myzeeTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2335)
    }

    /// Omnisense Limited (`2336`)
    @_alwaysEmitIntoClient
    static var omnisense: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2336)
    }

    /// KAHA PTE. LTD. (`2337`)
    @_alwaysEmitIntoClient
    static var kahaPte: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2337)
    }

    /// Shanghai MXCHIP Information Technology Co., Ltd. (`2338`)
    @_alwaysEmitIntoClient
    static var shanghaiMxchipInformationTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2338)
    }

    /// JSB TECH PTE LTD (`2339`)
    @_alwaysEmitIntoClient
    static var jsbTechPte: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2339)
    }

    /// Fundacion Tecnalia Research and Innovation (`2340`)
    @_alwaysEmitIntoClient
    static var fundacionTecnaliaResearchAndInnovation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2340)
    }

    /// Yukai Engineering Inc. (`2341`)
    @_alwaysEmitIntoClient
    static var yukaiEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2341)
    }

    /// Gooligum Technologies Pty Ltd (`2342`)
    @_alwaysEmitIntoClient
    static var gooligumTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2342)
    }

    /// ROOQ GmbH (`2343`)
    @_alwaysEmitIntoClient
    static var rooq: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2343)
    }

    /// AiRISTA (`2344`)
    @_alwaysEmitIntoClient
    static var airista: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2344)
    }

    /// Qingdao Haier Technology Co., Ltd. (`2345`)
    @_alwaysEmitIntoClient
    static var qingdaoHaierTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2345)
    }

    /// Sappl Verwaltungs- und Betriebs GmbH (`2346`)
    @_alwaysEmitIntoClient
    static var sapplVerwaltungsUndBetriebs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2346)
    }

    /// TekHome (`2347`)
    @_alwaysEmitIntoClient
    static var tekhome: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2347)
    }

    /// PCI Private Limited (`2348`)
    @_alwaysEmitIntoClient
    static var pci: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2348)
    }

    /// Leggett & Platt, Incorporated (`2349`)
    @_alwaysEmitIntoClient
    static var leggettPlatt: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2349)
    }

    /// PS GmbH (`2350`)
    @_alwaysEmitIntoClient
    static var ps: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2350)
    }

    /// C.O.B.O. SpA (`2351`)
    @_alwaysEmitIntoClient
    static var cOBOSpa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2351)
    }

    /// James Walker RotaBolt Limited (`2352`)
    @_alwaysEmitIntoClient
    static var jamesWalkerRotabolt: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2352)
    }

    /// BREATHINGS Co., Ltd. (`2353`)
    @_alwaysEmitIntoClient
    static var breathings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2353)
    }

    /// BarVision, LLC (`2354`)
    @_alwaysEmitIntoClient
    static var barvision: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2354)
    }

    /// SRAM (`2355`)
    @_alwaysEmitIntoClient
    static var sram: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2355)
    }

    /// KiteSpring Inc. (`2356`)
    @_alwaysEmitIntoClient
    static var kitespring: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2356)
    }

    /// Reconnect, Inc. (`2357`)
    @_alwaysEmitIntoClient
    static var reconnect: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2357)
    }

    /// Elekon AG (`2358`)
    @_alwaysEmitIntoClient
    static var elekon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2358)
    }

    /// RealThingks GmbH (`2359`)
    @_alwaysEmitIntoClient
    static var realthingks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2359)
    }

    /// Henway Technologies, LTD. (`2360`)
    @_alwaysEmitIntoClient
    static var henwayTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2360)
    }

    /// ASTEM Co.,Ltd. (`2361`)
    @_alwaysEmitIntoClient
    static var astem: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2361)
    }

    /// LinkedSemi Microelectronics (Xiamen) Co., Ltd (`2362`)
    @_alwaysEmitIntoClient
    static var linkedsemiMicroelectronicsXiamen: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2362)
    }

    /// ENSESO LLC (`2363`)
    @_alwaysEmitIntoClient
    static var enseso: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2363)
    }

    /// Xenoma Inc. (`2364`)
    @_alwaysEmitIntoClient
    static var xenoma: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2364)
    }

    /// Adolf Wuerth GmbH & Co KG (`2365`)
    @_alwaysEmitIntoClient
    static var adolfWuerth: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2365)
    }

    /// Catalyft Labs, Inc. (`2366`)
    @_alwaysEmitIntoClient
    static var catalyftLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2366)
    }

    /// JEPICO Corporation (`2367`)
    @_alwaysEmitIntoClient
    static var jepico: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2367)
    }

    /// Hero Workout GmbH (`2368`)
    @_alwaysEmitIntoClient
    static var heroWorkout: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2368)
    }

    /// Rivian Automotive, LLC (`2369`)
    @_alwaysEmitIntoClient
    static var rivianAutomotive: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2369)
    }

    /// TRANSSION HOLDINGS LIMITED (`2370`)
    @_alwaysEmitIntoClient
    static var transsionHoldings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2370)
    }

    /// Agitron d.o.o. (`2372`)
    @_alwaysEmitIntoClient
    static var agitron: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2372)
    }

    /// Globe (Jiangsu) Co., Ltd (`2373`)
    @_alwaysEmitIntoClient
    static var globeJiangsu: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2373)
    }

    /// AMC International Alfa Metalcraft Corporation AG (`2374`)
    @_alwaysEmitIntoClient
    static var amcInternationalAlfaMetalcraft: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2374)
    }

    /// First Light Technologies Ltd. (`2375`)
    @_alwaysEmitIntoClient
    static var firstLightTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2375)
    }

    /// Wearable Link Limited (`2376`)
    @_alwaysEmitIntoClient
    static var wearableLink: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2376)
    }

    /// Metronom Health Europe (`2377`)
    @_alwaysEmitIntoClient
    static var metronomHealthEurope: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2377)
    }

    /// Zwift, Inc. (`2378`)
    @_alwaysEmitIntoClient
    static var zwift: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2378)
    }

    /// Kindeva Drug Delivery L.P. (`2379`)
    @_alwaysEmitIntoClient
    static var kindevaDrugDeliveryLP: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2379)
    }

    /// GimmiSys GmbH (`2380`)
    @_alwaysEmitIntoClient
    static var gimmisys: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2380)
    }

    /// tkLABS INC. (`2381`)
    @_alwaysEmitIntoClient
    static var tklabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2381)
    }

    /// PassiveBolt, Inc. (`2382`)
    @_alwaysEmitIntoClient
    static var passivebolt: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2382)
    }

    /// Limited Liability Company "Mikrotikls" (`2383`)
    @_alwaysEmitIntoClient
    static var mikrotikls: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2383)
    }

    /// Capetech (`2384`)
    @_alwaysEmitIntoClient
    static var capetech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2384)
    }

    /// PPRS (`2385`)
    @_alwaysEmitIntoClient
    static var pprs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2385)
    }

    /// Apptricity Corporation (`2386`)
    @_alwaysEmitIntoClient
    static var apptricity: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2386)
    }

    /// LogiLube, LLC (`2387`)
    @_alwaysEmitIntoClient
    static var logilube: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2387)
    }

    /// Julbo (`2388`)
    @_alwaysEmitIntoClient
    static var julbo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2388)
    }

    /// Breville Group (`2389`)
    @_alwaysEmitIntoClient
    static var brevilleGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2389)
    }

    /// Kerlink (`2390`)
    @_alwaysEmitIntoClient
    static var kerlink: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2390)
    }

    /// Ohsung Electronics (`2391`)
    @_alwaysEmitIntoClient
    static var ohsungElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2391)
    }

    /// ZTE Corporation (`2392`)
    @_alwaysEmitIntoClient
    static var zte: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2392)
    }

    /// HerdDogg, Inc (`2393`)
    @_alwaysEmitIntoClient
    static var herddogg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2393)
    }

    /// Selekt Bilgisayar, lletisim Urunleri lnsaat Sanayi ve Ticaret Limited Sirketi (`2394`)
    @_alwaysEmitIntoClient
    static var selektBilgisayarLletisimUrunleriLnsaatSanayiVeTicaretSirketi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2394)
    }

    /// Lismore Instruments Limited (`2395`)
    @_alwaysEmitIntoClient
    static var lismoreInstruments: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2395)
    }

    /// LogiLube, LLC (`2396`)
    @_alwaysEmitIntoClient
    static var logilube2: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2396)
    }

    /// Electronic Theatre Controls (`2397`)
    @_alwaysEmitIntoClient
    static var electronicTheatreControls: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2397)
    }

    /// BioEchoNet inc. (`2398`)
    @_alwaysEmitIntoClient
    static var bioechonet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2398)
    }

    /// NUANCE HEARING LTD (`2399`)
    @_alwaysEmitIntoClient
    static var nuanceHearing: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2399)
    }

    /// Sena Technologies Inc. (`2400`)
    @_alwaysEmitIntoClient
    static var senaTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2400)
    }

    /// Linkura AB (`2401`)
    @_alwaysEmitIntoClient
    static var linkura: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2401)
    }

    /// GL Solutions K.K. (`2402`)
    @_alwaysEmitIntoClient
    static var glSolutionsKK: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2402)
    }

    /// Moonbird BV (`2403`)
    @_alwaysEmitIntoClient
    static var moonbird: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2403)
    }

    /// Countrymate Technology Limited (`2404`)
    @_alwaysEmitIntoClient
    static var countrymateTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2404)
    }

    /// Asahi Kasei Corporation (`2405`)
    @_alwaysEmitIntoClient
    static var asahiKasei: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2405)
    }

    /// PointGuard, LLC (`2406`)
    @_alwaysEmitIntoClient
    static var pointguard: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2406)
    }

    /// Neo Materials and Consulting Inc. (`2407`)
    @_alwaysEmitIntoClient
    static var neoMaterialsAndConsulting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2407)
    }

    /// Actev Motors, Inc. (`2408`)
    @_alwaysEmitIntoClient
    static var actevMotors: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2408)
    }

    /// Woan Technology (Shenzhen) Co., Ltd. (`2409`)
    @_alwaysEmitIntoClient
    static var woanTechnologyShenzhen: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2409)
    }

    /// dricos, Inc. (`2410`)
    @_alwaysEmitIntoClient
    static var dricos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2410)
    }

    /// Guide ID B.V. (`2411`)
    @_alwaysEmitIntoClient
    static var guideId: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2411)
    }

    /// 9374-7319 Quebec inc (`2412`)
    @_alwaysEmitIntoClient
    static var company93747319Quebec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2412)
    }

    /// Gunwerks, LLC (`2413`)
    @_alwaysEmitIntoClient
    static var gunwerks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2413)
    }

    /// Band Industries, inc. (`2414`)
    @_alwaysEmitIntoClient
    static var bandIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2414)
    }

    /// Lund Motion Products, Inc. (`2415`)
    @_alwaysEmitIntoClient
    static var lundMotionProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2415)
    }

    /// IBA Dosimetry GmbH (`2416`)
    @_alwaysEmitIntoClient
    static var ibaDosimetry: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2416)
    }

    /// GA (`2417`)
    @_alwaysEmitIntoClient
    static var ga: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2417)
    }

    /// Closed Joint Stock Company "Zavod Flometr" ("Zavod Flometr" CJSC) (`2418`)
    @_alwaysEmitIntoClient
    static var zavodFlometrZavodFlometrCjsc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2418)
    }

    /// Popit Oy (`2419`)
    @_alwaysEmitIntoClient
    static var popit: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2419)
    }

    /// ABEYE (`2420`)
    @_alwaysEmitIntoClient
    static var abeye: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2420)
    }

    /// BlueIOT(Beijing) Technology Co.,Ltd (`2421`)
    @_alwaysEmitIntoClient
    static var blueiotBeijingTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2421)
    }

    /// Fauna Audio GmbH (`2422`)
    @_alwaysEmitIntoClient
    static var faunaAudio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2422)
    }

    /// TOYOTA motor corporation (`2423`)
    @_alwaysEmitIntoClient
    static var toyotaMotor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2423)
    }

    /// ZifferEins GmbH & Co. KG (`2424`)
    @_alwaysEmitIntoClient
    static var ziffereins: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2424)
    }

    /// BIOTRONIK SE & Co. KG (`2425`)
    @_alwaysEmitIntoClient
    static var biotronikSeKg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2425)
    }

    /// CORE CORPORATION (`2426`)
    @_alwaysEmitIntoClient
    static var core: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2426)
    }

    /// CTEK Sweden AB (`2427`)
    @_alwaysEmitIntoClient
    static var ctekSweden: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2427)
    }

    /// Thorley Industries, LLC (`2428`)
    @_alwaysEmitIntoClient
    static var thorleyIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2428)
    }

    /// CLB B.V. (`2429`)
    @_alwaysEmitIntoClient
    static var clb: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2429)
    }

    /// SonicSensory Inc (`2430`)
    @_alwaysEmitIntoClient
    static var sonicsensory: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2430)
    }

    /// ISEMAR S.R.L. (`2431`)
    @_alwaysEmitIntoClient
    static var isemar: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2431)
    }

    /// DEKRA TESTING AND CERTIFICATION, S.A.U. (`2432`)
    @_alwaysEmitIntoClient
    static var dekraTestingAndCertificationU: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2432)
    }

    /// Bernard Krone Holding SE & Co.KG (`2433`)
    @_alwaysEmitIntoClient
    static var bernardKroneHoldingSeKg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2433)
    }

    /// ELPRO-BUCHS AG (`2434`)
    @_alwaysEmitIntoClient
    static var elproBuchs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2434)
    }

    /// Feedback Sports LLC (`2435`)
    @_alwaysEmitIntoClient
    static var feedbackSports: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2435)
    }

    /// TeraTron GmbH (`2436`)
    @_alwaysEmitIntoClient
    static var teratron: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2436)
    }

    /// Lumos Health Inc. (`2437`)
    @_alwaysEmitIntoClient
    static var lumosHealth: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2437)
    }

    /// Cello Hill, LLC (`2438`)
    @_alwaysEmitIntoClient
    static var celloHill: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2438)
    }

    /// TSE BRAKES, INC. (`2439`)
    @_alwaysEmitIntoClient
    static var tseBrakes: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2439)
    }

    /// BHM-Tech Produktionsgesellschaft m.b.H (`2440`)
    @_alwaysEmitIntoClient
    static var bhmTechProduktionsgesellschaftMBH: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2440)
    }

    /// WIKA Alexander Wiegand SE & Co.KG (`2441`)
    @_alwaysEmitIntoClient
    static var wikaAlexanderWiegandSeKg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2441)
    }

    /// Biovigil (`2442`)
    @_alwaysEmitIntoClient
    static var biovigil: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2442)
    }

    /// Mequonic Engineering, S.L. (`2443`)
    @_alwaysEmitIntoClient
    static var mequonicEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2443)
    }

    /// bGrid B.V. (`2444`)
    @_alwaysEmitIntoClient
    static var bgrid: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2444)
    }

    /// C3-WIRELESS, LLC (`2445`)
    @_alwaysEmitIntoClient
    static var c3Wireless: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2445)
    }

    /// ADVEEZ (`2446`)
    @_alwaysEmitIntoClient
    static var adveez: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2446)
    }

    /// Aktiebolaget Regin (`2447`)
    @_alwaysEmitIntoClient
    static var aktiebolagetRegin: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2447)
    }

    /// Anton Paar GmbH (`2448`)
    @_alwaysEmitIntoClient
    static var antonPaar: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2448)
    }

    /// Telenor ASA (`2449`)
    @_alwaysEmitIntoClient
    static var telenor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2449)
    }

    /// Big Kaiser Precision Tooling Ltd (`2450`)
    @_alwaysEmitIntoClient
    static var bigKaiserPrecisionTooling: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2450)
    }

    /// Absolute Audio Labs B.V. (`2451`)
    @_alwaysEmitIntoClient
    static var absoluteAudioLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2451)
    }

    /// VT42 Pty Ltd (`2452`)
    @_alwaysEmitIntoClient
    static var vt42: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2452)
    }

    /// Bronkhorst High-Tech B.V. (`2453`)
    @_alwaysEmitIntoClient
    static var bronkhorstHighTech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2453)
    }

    /// C. & E. Fein GmbH (`2454`)
    @_alwaysEmitIntoClient
    static var cEFein: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2454)
    }

    /// NextMind (`2455`)
    @_alwaysEmitIntoClient
    static var nextmind: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2455)
    }

    /// Pixie Dust Technologies, Inc. (`2456`)
    @_alwaysEmitIntoClient
    static var pixieDustTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2456)
    }

    /// eTactica ehf (`2457`)
    @_alwaysEmitIntoClient
    static var etacticaEhf: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2457)
    }

    /// New Audio LLC (`2458`)
    @_alwaysEmitIntoClient
    static var newAudio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2458)
    }

    /// Sendum Wireless Corporation (`2459`)
    @_alwaysEmitIntoClient
    static var sendumWireless: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2459)
    }

    /// deister electronic GmbH (`2460`)
    @_alwaysEmitIntoClient
    static var deisterElectronic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2460)
    }

    /// YKK AP Inc. (`2461`)
    @_alwaysEmitIntoClient
    static var ykkAp: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2461)
    }

    /// Step One Limited (`2462`)
    @_alwaysEmitIntoClient
    static var stepOne: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2462)
    }

    /// Koya Medical, Inc. (`2463`)
    @_alwaysEmitIntoClient
    static var koyaMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2463)
    }

    /// Proof Diagnostics, Inc. (`2464`)
    @_alwaysEmitIntoClient
    static var proofDiagnostics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2464)
    }

    /// VOS Systems, LLC (`2465`)
    @_alwaysEmitIntoClient
    static var vosSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2465)
    }

    /// ENGAGENOW DATA SCIENCES PRIVATE LIMITED (`2466`)
    @_alwaysEmitIntoClient
    static var engagenowDataSciences: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2466)
    }

    /// ARDUINO SA (`2467`)
    @_alwaysEmitIntoClient
    static var arduino: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2467)
    }

    /// KUMHO ELECTRICS, INC (`2468`)
    @_alwaysEmitIntoClient
    static var kumhoElectrics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2468)
    }

    /// Security Enhancement Systems, LLC (`2469`)
    @_alwaysEmitIntoClient
    static var securityEnhancementSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2469)
    }

    /// BEIJING ELECTRIC VEHICLE CO.,LTD (`2470`)
    @_alwaysEmitIntoClient
    static var beijingElectricVehicle: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2470)
    }

    /// Paybuddy ApS (`2471`)
    @_alwaysEmitIntoClient
    static var paybuddy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2471)
    }

    /// KHN Solutions LLC (`2472`)
    @_alwaysEmitIntoClient
    static var khnSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2472)
    }

    /// Nippon Ceramic Co.,Ltd. (`2473`)
    @_alwaysEmitIntoClient
    static var nipponCeramic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2473)
    }

    /// PHOTODYNAMIC INCORPORATED (`2474`)
    @_alwaysEmitIntoClient
    static var photodynamic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2474)
    }

    /// DashLogic, Inc. (`2475`)
    @_alwaysEmitIntoClient
    static var dashlogic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2475)
    }

    /// Ambiq (`2476`)
    @_alwaysEmitIntoClient
    static var ambiq: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2476)
    }

    /// Narhwall Inc. (`2477`)
    @_alwaysEmitIntoClient
    static var narhwall: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2477)
    }

    /// Pozyx NV (`2478`)
    @_alwaysEmitIntoClient
    static var pozyx: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2478)
    }

    /// ifLink Open Community (`2479`)
    @_alwaysEmitIntoClient
    static var iflinkOpenCommunity: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2479)
    }

    /// Deublin Company, LLC (`2480`)
    @_alwaysEmitIntoClient
    static var deublin: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2480)
    }

    /// BLINQY (`2481`)
    @_alwaysEmitIntoClient
    static var blinqy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2481)
    }

    /// DYPHI (`2482`)
    @_alwaysEmitIntoClient
    static var dyphi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2482)
    }

    /// BlueX Microelectronics Corp Ltd. (`2483`)
    @_alwaysEmitIntoClient
    static var bluexMicroelectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2483)
    }

    /// PentaLock Aps. (`2484`)
    @_alwaysEmitIntoClient
    static var pentalock: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2484)
    }

    /// AUTEC Gesellschaft fuer Automationstechnik mbH (`2485`)
    @_alwaysEmitIntoClient
    static var autecGesellschaftFuerAutomationstechnik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2485)
    }

    /// Pegasus Technologies, Inc. (`2486`)
    @_alwaysEmitIntoClient
    static var pegasusTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2486)
    }

    /// Bout Labs, LLC (`2487`)
    @_alwaysEmitIntoClient
    static var boutLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2487)
    }

    /// PlayerData Limited (`2488`)
    @_alwaysEmitIntoClient
    static var playerdata: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2488)
    }

    /// SAVOY ELECTRONIC LIGHTING (`2489`)
    @_alwaysEmitIntoClient
    static var savoyElectronicLighting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2489)
    }

    /// Elimo Engineering Ltd (`2490`)
    @_alwaysEmitIntoClient
    static var elimoEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2490)
    }

    /// SkyStream Corporation (`2491`)
    @_alwaysEmitIntoClient
    static var skystream: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2491)
    }

    /// Aerosens LLC (`2492`)
    @_alwaysEmitIntoClient
    static var aerosens: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2492)
    }

    /// Centre Suisse d'Electronique et de Microtechnique SA (`2493`)
    @_alwaysEmitIntoClient
    static var centreSuisseDElectroniqueEtDeMicrotechnique: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2493)
    }

    /// Vessel Ltd. (`2494`)
    @_alwaysEmitIntoClient
    static var vessel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2494)
    }

    /// Span.IO, Inc. (`2495`)
    @_alwaysEmitIntoClient
    static var spanIo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2495)
    }

    /// AnotherBrain inc. (`2496`)
    @_alwaysEmitIntoClient
    static var anotherbrain: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2496)
    }

    /// Rosewill (`2497`)
    @_alwaysEmitIntoClient
    static var rosewill: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2497)
    }

    /// Universal Audio, Inc. (`2498`)
    @_alwaysEmitIntoClient
    static var universalAudio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2498)
    }

    /// JAPAN TOBACCO INC. (`2499`)
    @_alwaysEmitIntoClient
    static var japanTobacco: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2499)
    }

    /// UVISIO (`2500`)
    @_alwaysEmitIntoClient
    static var uvisio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2500)
    }

    /// HungYi Microelectronics Co.,Ltd. (`2501`)
    @_alwaysEmitIntoClient
    static var hungyiMicroelectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2501)
    }

    /// Honor Device Co., Ltd. (`2502`)
    @_alwaysEmitIntoClient
    static var honorDevice: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2502)
    }

    /// Combustion, LLC (`2503`)
    @_alwaysEmitIntoClient
    static var combustion: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2503)
    }

    /// XUNTONG (`2504`)
    @_alwaysEmitIntoClient
    static var xuntong: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2504)
    }

    /// CrowdGlow Ltd (`2505`)
    @_alwaysEmitIntoClient
    static var crowdglow: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2505)
    }

    /// Mobitrace (`2506`)
    @_alwaysEmitIntoClient
    static var mobitrace: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2506)
    }

    /// Hx Engineering, LLC (`2507`)
    @_alwaysEmitIntoClient
    static var hxEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2507)
    }

    /// Senso4s d.o.o. (`2508`)
    @_alwaysEmitIntoClient
    static var senso4S: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2508)
    }

    /// Blyott (`2509`)
    @_alwaysEmitIntoClient
    static var blyott: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2509)
    }

    /// Julius Blum GmbH (`2510`)
    @_alwaysEmitIntoClient
    static var juliusBlum: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2510)
    }

    /// BlueStreak IoT, LLC (`2511`)
    @_alwaysEmitIntoClient
    static var bluestreakIot: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2511)
    }

    /// Chess Wise B.V. (`2512`)
    @_alwaysEmitIntoClient
    static var chessWise: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2512)
    }

    /// ABLEPAY TECHNOLOGIES AS (`2513`)
    @_alwaysEmitIntoClient
    static var ablepayTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2513)
    }

    /// Temperature Sensitive Solutions Systems Sweden AB (`2514`)
    @_alwaysEmitIntoClient
    static var temperatureSensitiveSolutionsSystemsSweden: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2514)
    }

    /// HeartHero, inc. (`2515`)
    @_alwaysEmitIntoClient
    static var hearthero: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2515)
    }

    /// ORBIS Inc. (`2516`)
    @_alwaysEmitIntoClient
    static var orbis: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2516)
    }

    /// GEAR RADIO ELECTRONICS CORP. (`2517`)
    @_alwaysEmitIntoClient
    static var gearRadioElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2517)
    }

    /// EAR TEKNIK ISITME VE ODIOMETRI CIHAZLARI SANAYI VE TICARET ANONIM SIRKETI (`2518`)
    @_alwaysEmitIntoClient
    static var earTeknikIsitmeVeOdiometriCihazlarinayiVeTicaretAnonimSirketi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2518)
    }

    /// Coyotta (`2519`)
    @_alwaysEmitIntoClient
    static var coyotta: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2519)
    }

    /// Synergy Tecnologia em Sistemas Ltda (`2520`)
    @_alwaysEmitIntoClient
    static var synergyTecnologiaEmSistemas: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2520)
    }

    /// VivoSensMedical GmbH (`2521`)
    @_alwaysEmitIntoClient
    static var vivosensmedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2521)
    }

    /// Nagravision SA (`2522`)
    @_alwaysEmitIntoClient
    static var nagravision: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2522)
    }

    /// Bionic Avionics Inc. (`2523`)
    @_alwaysEmitIntoClient
    static var bionicAvionics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2523)
    }

    /// AON2 Ltd. (`2524`)
    @_alwaysEmitIntoClient
    static var aon2: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2524)
    }

    /// Innoware Development AB (`2525`)
    @_alwaysEmitIntoClient
    static var innowareDevelopment: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2525)
    }

    /// JLD Technology Solutions, LLC (`2526`)
    @_alwaysEmitIntoClient
    static var jldTechnologySolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2526)
    }

    /// Magnus Technology Sdn Bhd (`2527`)
    @_alwaysEmitIntoClient
    static var magnusTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2527)
    }

    /// Preddio Technologies Inc. (`2528`)
    @_alwaysEmitIntoClient
    static var preddioTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2528)
    }

    /// Tag-N-Trac Inc (`2529`)
    @_alwaysEmitIntoClient
    static var tagNTrac: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2529)
    }

    /// Wuhan Linptech Co.,Ltd. (`2530`)
    @_alwaysEmitIntoClient
    static var wuhanLinptech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2530)
    }

    /// Friday Home Aps (`2531`)
    @_alwaysEmitIntoClient
    static var fridayHome: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2531)
    }

    /// CPS AS (`2532`)
    @_alwaysEmitIntoClient
    static var cps: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2532)
    }

    /// Mobilogix (`2533`)
    @_alwaysEmitIntoClient
    static var mobilogix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2533)
    }

    /// Masonite Corporation (`2534`)
    @_alwaysEmitIntoClient
    static var masonite: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2534)
    }

    /// Kabushikigaisha HANERON (`2535`)
    @_alwaysEmitIntoClient
    static var kabushikigaishaHaneron: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2535)
    }

    /// Melange Systems Pvt. Ltd. (`2536`)
    @_alwaysEmitIntoClient
    static var melangeSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2536)
    }

    /// LumenRadio AB (`2537`)
    @_alwaysEmitIntoClient
    static var lumenradio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2537)
    }

    /// Athlos Oy (`2538`)
    @_alwaysEmitIntoClient
    static var athlos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2538)
    }

    /// KEAN ELECTRONICS PTY LTD (`2539`)
    @_alwaysEmitIntoClient
    static var keanElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2539)
    }

    /// Yukon advanced optics worldwide, UAB (`2540`)
    @_alwaysEmitIntoClient
    static var yukonAdvancedOpticsWorldwideUab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2540)
    }

    /// Sibel Inc. (`2541`)
    @_alwaysEmitIntoClient
    static var sibel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2541)
    }

    /// OJMAR SA (`2542`)
    @_alwaysEmitIntoClient
    static var ojmar: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2542)
    }

    /// Steinel Solutions AG (`2543`)
    @_alwaysEmitIntoClient
    static var steinelSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2543)
    }

    /// WatchGas B.V. (`2544`)
    @_alwaysEmitIntoClient
    static var watchgas: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2544)
    }

    /// OM Digital Solutions Corporation (`2545`)
    @_alwaysEmitIntoClient
    static var omDigitalSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2545)
    }

    /// Audeara Pty Ltd (`2546`)
    @_alwaysEmitIntoClient
    static var audeara: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2546)
    }

    /// Beijing Zero Zero Infinity Technology Co.,Ltd. (`2547`)
    @_alwaysEmitIntoClient
    static var beijingZeroZeroInfinityTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2547)
    }

    /// Spectrum Technologies, Inc. (`2548`)
    @_alwaysEmitIntoClient
    static var spectrumTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2548)
    }

    /// OKI Electric Industry Co., Ltd (`2549`)
    @_alwaysEmitIntoClient
    static var okiElectricIndustry: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2549)
    }

    /// Mobile Action Technology Inc. (`2550`)
    @_alwaysEmitIntoClient
    static var mobileActionTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2550)
    }

    /// SENSATEC Co., Ltd. (`2551`)
    @_alwaysEmitIntoClient
    static var sensatec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2551)
    }

    /// R.O. S.R.L. (`2552`)
    @_alwaysEmitIntoClient
    static var rO: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2552)
    }

    /// Hangzhou Yaguan Technology Co. LTD (`2553`)
    @_alwaysEmitIntoClient
    static var hangzhouYaguanTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2553)
    }

    /// Listen Technologies Corporation (`2554`)
    @_alwaysEmitIntoClient
    static var listenTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2554)
    }

    /// TOITU CO., LTD. (`2555`)
    @_alwaysEmitIntoClient
    static var toitu: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2555)
    }

    /// Confidex (`2556`)
    @_alwaysEmitIntoClient
    static var confidex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2556)
    }

    /// Keep Technologies, Inc. (`2557`)
    @_alwaysEmitIntoClient
    static var keepTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2557)
    }

    /// Lichtvision Engineering GmbH (`2558`)
    @_alwaysEmitIntoClient
    static var lichtvisionEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2558)
    }

    /// AIRSTAR (`2559`)
    @_alwaysEmitIntoClient
    static var airstar: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2559)
    }

    /// Ampler Bikes OU (`2560`)
    @_alwaysEmitIntoClient
    static var amplerBikesOu: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2560)
    }

    /// Cleveron AS (`2561`)
    @_alwaysEmitIntoClient
    static var cleveron: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2561)
    }

    /// Ayxon-Dynamics GmbH (`2562`)
    @_alwaysEmitIntoClient
    static var ayxonDynamics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2562)
    }

    /// donutrobotics Co., Ltd. (`2563`)
    @_alwaysEmitIntoClient
    static var donutrobotics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2563)
    }

    /// Flosonics Medical (`2564`)
    @_alwaysEmitIntoClient
    static var flosonicsMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2564)
    }

    /// Southwire Company, LLC (`2565`)
    @_alwaysEmitIntoClient
    static var southwire: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2565)
    }

    /// Shanghai wuqi microelectronics Co.,Ltd (`2566`)
    @_alwaysEmitIntoClient
    static var shanghaiWuqiMicroelectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2566)
    }

    /// Reflow Pty Ltd (`2567`)
    @_alwaysEmitIntoClient
    static var reflow: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2567)
    }

    /// Oras Oy (`2568`)
    @_alwaysEmitIntoClient
    static var oras: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2568)
    }

    /// ECCT (`2569`)
    @_alwaysEmitIntoClient
    static var ecct: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2569)
    }

    /// Volan Technology Inc. (`2570`)
    @_alwaysEmitIntoClient
    static var volanTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2570)
    }

    /// SIANA Systems (`2571`)
    @_alwaysEmitIntoClient
    static var sianaSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2571)
    }

    /// Shanghai Yidian Intelligent Technology Co., Ltd. (`2572`)
    @_alwaysEmitIntoClient
    static var shanghaiYidianIntelligentTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2572)
    }

    /// Blue Peacock GmbH (`2573`)
    @_alwaysEmitIntoClient
    static var bluePeacock: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2573)
    }

    /// Roland Corporation (`2574`)
    @_alwaysEmitIntoClient
    static var roland: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2574)
    }

    /// LIXIL Corporation (`2575`)
    @_alwaysEmitIntoClient
    static var lixil: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2575)
    }

    /// SUBARU Corporation (`2576`)
    @_alwaysEmitIntoClient
    static var subaru: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2576)
    }

    /// Sensolus (`2577`)
    @_alwaysEmitIntoClient
    static var sensolus: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2577)
    }

    /// Dyson Technology Limited (`2578`)
    @_alwaysEmitIntoClient
    static var dysonTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2578)
    }

    /// Tec4med LifeScience GmbH (`2579`)
    @_alwaysEmitIntoClient
    static var tec4MedLifescience: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2579)
    }

    /// CROXEL, INC. (`2580`)
    @_alwaysEmitIntoClient
    static var croxel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2580)
    }

    /// Syng Inc (`2581`)
    @_alwaysEmitIntoClient
    static var syng: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2581)
    }

    /// RIDE VISION LTD (`2582`)
    @_alwaysEmitIntoClient
    static var rideVision: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2582)
    }

    /// Plume Design Inc (`2583`)
    @_alwaysEmitIntoClient
    static var plumeDesign: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2583)
    }

    /// Cambridge Animal Technologies Ltd (`2584`)
    @_alwaysEmitIntoClient
    static var cambridgeAnimalTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2584)
    }

    /// Maxell, Ltd. (`2585`)
    @_alwaysEmitIntoClient
    static var maxell: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2585)
    }

    /// Link Labs, Inc. (`2586`)
    @_alwaysEmitIntoClient
    static var linkLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2586)
    }

    /// Embrava Pty Ltd (`2587`)
    @_alwaysEmitIntoClient
    static var embrava: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2587)
    }

    /// INPEAK S.C. (`2588`)
    @_alwaysEmitIntoClient
    static var inpeakSC: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2588)
    }

    /// API-K (`2589`)
    @_alwaysEmitIntoClient
    static var apiK: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2589)
    }

    /// CombiQ AB (`2590`)
    @_alwaysEmitIntoClient
    static var combiq: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2590)
    }

    /// DeVilbiss Healthcare LLC (`2591`)
    @_alwaysEmitIntoClient
    static var devilbissHealthcare: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2591)
    }

    /// Jiangxi Innotech Technology Co., Ltd (`2592`)
    @_alwaysEmitIntoClient
    static var jiangxiInnotechTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2592)
    }

    /// Apollogic Sp. z o.o. (`2593`)
    @_alwaysEmitIntoClient
    static var apollogic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2593)
    }

    /// DAIICHIKOSHO CO., LTD. (`2594`)
    @_alwaysEmitIntoClient
    static var daiichikosho: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2594)
    }

    /// BIXOLON CO.,LTD (`2595`)
    @_alwaysEmitIntoClient
    static var bixolon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2595)
    }

    /// Atmosic Technologies, Inc. (`2596`)
    @_alwaysEmitIntoClient
    static var atmosicTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2596)
    }

    /// Eran Financial Services LLC (`2597`)
    @_alwaysEmitIntoClient
    static var eranFinancialServices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2597)
    }

    /// Louis Vuitton (`2598`)
    @_alwaysEmitIntoClient
    static var louisVuitton: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2598)
    }

    /// AYU DEVICES PRIVATE LIMITED (`2599`)
    @_alwaysEmitIntoClient
    static var ayuDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2599)
    }

    /// NanoFlex Power Corporation (`2600`)
    @_alwaysEmitIntoClient
    static var nanoflexPower: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2600)
    }

    /// Worthcloud Technology Co.,Ltd (`2601`)
    @_alwaysEmitIntoClient
    static var worthcloudTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2601)
    }

    /// Yamaha Corporation (`2602`)
    @_alwaysEmitIntoClient
    static var yamaha: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2602)
    }

    /// PaceBait IVS (`2603`)
    @_alwaysEmitIntoClient
    static var pacebait: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2603)
    }

    /// Shenzhen H&T Intelligent Control Co., Ltd (`2604`)
    @_alwaysEmitIntoClient
    static var shenzhenHTIntelligentControl: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2604)
    }

    /// Shenzhen Feasycom Technology Co., Ltd. (`2605`)
    @_alwaysEmitIntoClient
    static var shenzhenFeasycomTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2605)
    }

    /// Zuma Array Limited (`2606`)
    @_alwaysEmitIntoClient
    static var zumaArray: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2606)
    }

    /// Instamic, Inc. (`2607`)
    @_alwaysEmitIntoClient
    static var instamic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2607)
    }

    /// Air-Weigh (`2608`)
    @_alwaysEmitIntoClient
    static var airWeigh: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2608)
    }

    /// Nevro Corp. (`2609`)
    @_alwaysEmitIntoClient
    static var nevro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2609)
    }

    /// Pinnacle Technology, Inc. (`2610`)
    @_alwaysEmitIntoClient
    static var pinnacleTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2610)
    }

    /// WMF AG (`2611`)
    @_alwaysEmitIntoClient
    static var wmf: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2611)
    }

    /// Luxer Corporation (`2612`)
    @_alwaysEmitIntoClient
    static var luxer: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2612)
    }

    /// safectory GmbH (`2613`)
    @_alwaysEmitIntoClient
    static var safectory: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2613)
    }

    /// NGK SPARK PLUG CO., LTD. (`2614`)
    @_alwaysEmitIntoClient
    static var ngkSparkPlug: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2614)
    }

    /// 2587702 Ontario Inc. (`2615`)
    @_alwaysEmitIntoClient
    static var company2587702Ontario: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2615)
    }

    /// Bouffalo Lab (Nanjing)., Ltd. (`2616`)
    @_alwaysEmitIntoClient
    static var bouffaloLabNanjing: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2616)
    }

    /// BLUETICKETING SRL (`2617`)
    @_alwaysEmitIntoClient
    static var blueticketing: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2617)
    }

    /// Incotex Co. Ltd. (`2618`)
    @_alwaysEmitIntoClient
    static var incotex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2618)
    }

    /// Galileo Technology Limited (`2619`)
    @_alwaysEmitIntoClient
    static var galileoTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2619)
    }

    /// Siteco GmbH (`2620`)
    @_alwaysEmitIntoClient
    static var siteco: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2620)
    }

    /// DELABIE (`2621`)
    @_alwaysEmitIntoClient
    static var delabie: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2621)
    }

    /// Hefei Yunlian Semiconductor Co., Ltd (`2622`)
    @_alwaysEmitIntoClient
    static var hefeiYunlianSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2622)
    }

    /// Shenzhen Yopeak Optoelectronics Technology Co., Ltd. (`2623`)
    @_alwaysEmitIntoClient
    static var shenzhenYopeakOptoelectronicsTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2623)
    }

    /// GEWISS S.p.A. (`2624`)
    @_alwaysEmitIntoClient
    static var gewiss: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2624)
    }

    /// OPEX Corporation (`2625`)
    @_alwaysEmitIntoClient
    static var opex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2625)
    }

    /// Motionalysis, Inc. (`2626`)
    @_alwaysEmitIntoClient
    static var motionalysis: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2626)
    }

    /// Busch Systems International Inc. (`2627`)
    @_alwaysEmitIntoClient
    static var buschSystemsInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2627)
    }

    /// Novidan, Inc. (`2628`)
    @_alwaysEmitIntoClient
    static var novidan: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2628)
    }

    /// 3SI Security Systems, Inc (`2629`)
    @_alwaysEmitIntoClient
    static var company3SiSecuritySystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2629)
    }

    /// Beijing HC-Infinite Technology Limited (`2630`)
    @_alwaysEmitIntoClient
    static var beijingHcInfiniteTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2630)
    }

    /// The Wand Company Ltd (`2631`)
    @_alwaysEmitIntoClient
    static var wandcompany: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2631)
    }

    /// JRC Mobility Inc. (`2632`)
    @_alwaysEmitIntoClient
    static var jrcMobility: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2632)
    }

    /// Venture Research Inc. (`2633`)
    @_alwaysEmitIntoClient
    static var ventureResearch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2633)
    }

    /// Map Large, Inc. (`2634`)
    @_alwaysEmitIntoClient
    static var mapLarge: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2634)
    }

    /// MistyWest Energy and Transport Ltd. (`2635`)
    @_alwaysEmitIntoClient
    static var mistywestEnergyAndTransport: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2635)
    }

    /// SiFli Technologies (shanghai) Inc. (`2636`)
    @_alwaysEmitIntoClient
    static var sifliTechnologiesShanghai: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2636)
    }

    /// Lockn Technologies Private Limited (`2637`)
    @_alwaysEmitIntoClient
    static var locknTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2637)
    }

    /// Toytec Corporation (`2638`)
    @_alwaysEmitIntoClient
    static var toytec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2638)
    }

    /// VANMOOF Global Holding B.V. (`2639`)
    @_alwaysEmitIntoClient
    static var vanmoofGlobalHolding: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2639)
    }

    /// Nextscape Inc. (`2640`)
    @_alwaysEmitIntoClient
    static var nextscape: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2640)
    }

    /// CSIRO (`2641`)
    @_alwaysEmitIntoClient
    static var csiro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2641)
    }

    /// Follow Sense Europe B.V. (`2642`)
    @_alwaysEmitIntoClient
    static var followSenseEurope: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2642)
    }

    /// KKM COMPANY LIMITED (`2643`)
    @_alwaysEmitIntoClient
    static var kkm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2643)
    }

    /// SQL Technologies Corp. (`2644`)
    @_alwaysEmitIntoClient
    static var sqlTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2644)
    }

    /// Inugo Systems Limited (`2645`)
    @_alwaysEmitIntoClient
    static var inugoSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2645)
    }

    /// ambie (`2646`)
    @_alwaysEmitIntoClient
    static var ambie: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2646)
    }

    /// Meizhou Guo Wei Electronics Co., Ltd (`2647`)
    @_alwaysEmitIntoClient
    static var meizhouGuoWeiElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2647)
    }

    /// Indigo Diabetes (`2648`)
    @_alwaysEmitIntoClient
    static var indigoDiabetes: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2648)
    }

    /// TourBuilt, LLC (`2649`)
    @_alwaysEmitIntoClient
    static var tourbuilt: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2649)
    }

    /// Sontheim Industrie Elektronik GmbH (`2650`)
    @_alwaysEmitIntoClient
    static var sontheimIndustrieElektronik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2650)
    }

    /// LEGIC Identsystems AG (`2651`)
    @_alwaysEmitIntoClient
    static var legicIdentsystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2651)
    }

    /// Innovative Design Labs Inc. (`2652`)
    @_alwaysEmitIntoClient
    static var innovativeDesignLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2652)
    }

    /// MG Energy Systems B.V. (`2653`)
    @_alwaysEmitIntoClient
    static var mgEnergySystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2653)
    }

    /// LaceClips llc (`2654`)
    @_alwaysEmitIntoClient
    static var laceclips: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2654)
    }

    /// stryker (`2655`)
    @_alwaysEmitIntoClient
    static var stryker: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2655)
    }

    /// DATANG SEMICONDUCTOR TECHNOLOGY CO.,LTD (`2656`)
    @_alwaysEmitIntoClient
    static var datangSemiconductorTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2656)
    }

    /// Smart Parks B.V. (`2657`)
    @_alwaysEmitIntoClient
    static var smartParks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2657)
    }

    /// MOKO TECHNOLOGY Ltd (`2658`)
    @_alwaysEmitIntoClient
    static var mokoTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2658)
    }

    /// Gremsy JSC (`2659`)
    @_alwaysEmitIntoClient
    static var gremsyJsc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2659)
    }

    /// Geopal system A/S (`2660`)
    @_alwaysEmitIntoClient
    static var geopalSystem: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2660)
    }

    /// Lytx, INC. (`2661`)
    @_alwaysEmitIntoClient
    static var lytx: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2661)
    }

    /// JUSTMORPH PTE. LTD. (`2662`)
    @_alwaysEmitIntoClient
    static var justmorphPte: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2662)
    }

    /// Beijing SuperHexa Century Technology CO. Ltd (`2663`)
    @_alwaysEmitIntoClient
    static var beijingSuperhexaCenturyTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2663)
    }

    /// Focus Ingenieria SRL (`2664`)
    @_alwaysEmitIntoClient
    static var focusIngenieria: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2664)
    }

    /// HAPPIEST BABY, INC. (`2665`)
    @_alwaysEmitIntoClient
    static var happiestBaby: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2665)
    }

    /// Scribble Design Inc. (`2666`)
    @_alwaysEmitIntoClient
    static var scribbleDesign: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2666)
    }

    /// Olympic Ophthalmics, Inc. (`2667`)
    @_alwaysEmitIntoClient
    static var olympicOphthalmics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2667)
    }

    /// Pokkels (`2668`)
    @_alwaysEmitIntoClient
    static var pokkels: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2668)
    }

    /// KUUKANJYOKIN Co.,Ltd. (`2669`)
    @_alwaysEmitIntoClient
    static var kuukanjyokin: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2669)
    }

    /// Pac Sane Limited (`2670`)
    @_alwaysEmitIntoClient
    static var pacSane: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2670)
    }

    /// Warner Bros. (`2671`)
    @_alwaysEmitIntoClient
    static var warnerBros: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2671)
    }

    /// Ooma (`2672`)
    @_alwaysEmitIntoClient
    static var ooma: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2672)
    }

    /// Senquip Pty Ltd (`2673`)
    @_alwaysEmitIntoClient
    static var senquip: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2673)
    }

    /// Jumo GmbH & Co. KG (`2674`)
    @_alwaysEmitIntoClient
    static var jumo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2674)
    }

    /// Innohome Oy (`2675`)
    @_alwaysEmitIntoClient
    static var innohome: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2675)
    }

    /// MICROSON S.A. (`2676`)
    @_alwaysEmitIntoClient
    static var microson: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2676)
    }

    /// Delta Cycle Corporation (`2677`)
    @_alwaysEmitIntoClient
    static var deltaCycle: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2677)
    }

    /// Synaptics Incorporated (`2678`)
    @_alwaysEmitIntoClient
    static var synaptics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2678)
    }

    /// AXTRO PTE. LTD. (`2679`)
    @_alwaysEmitIntoClient
    static var axtroPte: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2679)
    }

    /// Shenzhen Sunricher Technology Limited (`2680`)
    @_alwaysEmitIntoClient
    static var shenzhenSunricherTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2680)
    }

    /// Webasto SE (`2681`)
    @_alwaysEmitIntoClient
    static var webasto: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2681)
    }

    /// Emlid Limited (`2682`)
    @_alwaysEmitIntoClient
    static var emlid: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2682)
    }

    /// UniqAir Oy (`2683`)
    @_alwaysEmitIntoClient
    static var uniqair: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2683)
    }

    /// WAFERLOCK (`2684`)
    @_alwaysEmitIntoClient
    static var waferlock: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2684)
    }

    /// Freedman Electronics Pty Ltd (`2685`)
    @_alwaysEmitIntoClient
    static var freedmanElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2685)
    }

    /// KEBA Handover Automation GmbH (`2686`)
    @_alwaysEmitIntoClient
    static var kebaHandoverAutomation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2686)
    }

    /// Intuity Medical (`2687`)
    @_alwaysEmitIntoClient
    static var intuityMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2687)
    }

    /// Cleer Limited (`2688`)
    @_alwaysEmitIntoClient
    static var cleer: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2688)
    }

    /// Universal Biosensors Pty Ltd (`2689`)
    @_alwaysEmitIntoClient
    static var universalBiosensors: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2689)
    }

    /// Corsair (`2690`)
    @_alwaysEmitIntoClient
    static var corsair: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2690)
    }

    /// Rivata, Inc. (`2691`)
    @_alwaysEmitIntoClient
    static var rivata: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2691)
    }

    /// Greennote Inc, (`2692`)
    @_alwaysEmitIntoClient
    static var greennote: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2692)
    }

    /// Snowball Technology Co., Ltd. (`2693`)
    @_alwaysEmitIntoClient
    static var snowballTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2693)
    }

    /// ALIZENT International (`2694`)
    @_alwaysEmitIntoClient
    static var alizentInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2694)
    }

    /// Shanghai Smart System Technology Co., Ltd (`2695`)
    @_alwaysEmitIntoClient
    static var shanghaiSmartSystemTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2695)
    }

    /// PSA Peugeot Citroen (`2696`)
    @_alwaysEmitIntoClient
    static var psaPeugeotCitroen: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2696)
    }

    /// SES-Imagotag (`2697`)
    @_alwaysEmitIntoClient
    static var sesImagotag: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2697)
    }

    /// HAINBUCH GMBH SPANNENDE TECHNIK (`2698`)
    @_alwaysEmitIntoClient
    static var hainbuchSpannendeTechnik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2698)
    }

    /// SANlight GmbH (`2699`)
    @_alwaysEmitIntoClient
    static var sanlight: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2699)
    }

    /// DelpSys, s.r.o. (`2700`)
    @_alwaysEmitIntoClient
    static var delpsys: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2700)
    }

    /// JCM TECHNOLOGIES S.A. (`2701`)
    @_alwaysEmitIntoClient
    static var jcmTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2701)
    }

    /// Perfect Company (`2702`)
    @_alwaysEmitIntoClient
    static var perfect: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2702)
    }

    /// TOTO LTD. (`2703`)
    @_alwaysEmitIntoClient
    static var toto: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2703)
    }

    /// Shenzhen Grandsun Electronic Co.,Ltd. (`2704`)
    @_alwaysEmitIntoClient
    static var shenzhenGrandsunElectronic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2704)
    }

    /// Monarch International Inc. (`2705`)
    @_alwaysEmitIntoClient
    static var monarchInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2705)
    }

    /// Carestream Dental LLC (`2706`)
    @_alwaysEmitIntoClient
    static var carestreamDental: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2706)
    }

    /// GiPStech S.r.l. (`2707`)
    @_alwaysEmitIntoClient
    static var gipstech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2707)
    }

    /// OOBIK Inc. (`2708`)
    @_alwaysEmitIntoClient
    static var oobik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2708)
    }

    /// Pamex Inc. (`2709`)
    @_alwaysEmitIntoClient
    static var pamex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2709)
    }

    /// Lightricity Ltd (`2710`)
    @_alwaysEmitIntoClient
    static var lightricity: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2710)
    }

    /// SensTek (`2711`)
    @_alwaysEmitIntoClient
    static var senstek: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2711)
    }

    /// Foil, Inc. (`2712`)
    @_alwaysEmitIntoClient
    static var foil: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2712)
    }

    /// Shanghai high-flying electronics technology Co.,Ltd (`2713`)
    @_alwaysEmitIntoClient
    static var shanghaiHighFlyingElectronicsTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2713)
    }

    /// TEMKIN ASSOCIATES, LLC (`2714`)
    @_alwaysEmitIntoClient
    static var temkinsociates: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2714)
    }

    /// Eello LLC (`2715`)
    @_alwaysEmitIntoClient
    static var eello: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2715)
    }

    /// Xi'an Fengyu Information Technology Co., Ltd. (`2716`)
    @_alwaysEmitIntoClient
    static var xiAnFengyuInformationTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2716)
    }

    /// Canon Finetech Nisca Inc. (`2717`)
    @_alwaysEmitIntoClient
    static var canonFinetechNisca: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2717)
    }

    /// LifePlus, Inc. (`2718`)
    @_alwaysEmitIntoClient
    static var lifeplus: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2718)
    }

    /// ista International GmbH (`2719`)
    @_alwaysEmitIntoClient
    static var istaInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2719)
    }

    /// Loy Tec electronics GmbH (`2720`)
    @_alwaysEmitIntoClient
    static var loyTecElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2720)
    }

    /// LINCOGN TECHNOLOGY CO. LIMITED (`2721`)
    @_alwaysEmitIntoClient
    static var lincognTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2721)
    }

    /// Care Bloom, LLC (`2722`)
    @_alwaysEmitIntoClient
    static var careBloom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2722)
    }

    /// DIC Corporation (`2723`)
    @_alwaysEmitIntoClient
    static var dic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2723)
    }

    /// FAZEPRO LLC (`2724`)
    @_alwaysEmitIntoClient
    static var fazepro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2724)
    }

    /// Shenzhen Uascent Technology Co., Ltd (`2725`)
    @_alwaysEmitIntoClient
    static var shenzhenUascentTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2725)
    }

    /// Realityworks, inc. (`2726`)
    @_alwaysEmitIntoClient
    static var realityworks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2726)
    }

    /// Urbanista AB (`2727`)
    @_alwaysEmitIntoClient
    static var urbanista: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2727)
    }

    /// Zencontrol Pty Ltd (`2728`)
    @_alwaysEmitIntoClient
    static var zencontrol: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2728)
    }

    /// Spintly, Inc. (`2729`)
    @_alwaysEmitIntoClient
    static var spintly: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2729)
    }

    /// Computime International Ltd (`2730`)
    @_alwaysEmitIntoClient
    static var computimeInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2730)
    }

    /// Anhui Listenai Co (`2731`)
    @_alwaysEmitIntoClient
    static var anhuiListenaiCo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2731)
    }

    /// OSM HK Limited (`2732`)
    @_alwaysEmitIntoClient
    static var osm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2732)
    }

    /// Adevo Consulting AB (`2733`)
    @_alwaysEmitIntoClient
    static var adevoConsulting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2733)
    }

    /// PS Engineering, Inc. (`2734`)
    @_alwaysEmitIntoClient
    static var psEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2734)
    }

    /// AIAIAI ApS (`2735`)
    @_alwaysEmitIntoClient
    static var aiaiai: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2735)
    }

    /// Visiontronic s.r.o. (`2736`)
    @_alwaysEmitIntoClient
    static var visiontronic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2736)
    }

    /// InVue Security Products Inc (`2737`)
    @_alwaysEmitIntoClient
    static var invueSecurityProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2737)
    }

    /// TouchTronics, Inc. (`2738`)
    @_alwaysEmitIntoClient
    static var touchtronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2738)
    }

    /// INNER RANGE PTY. LTD. (`2739`)
    @_alwaysEmitIntoClient
    static var innerRange: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2739)
    }

    /// Ellenby Technologies, Inc. (`2740`)
    @_alwaysEmitIntoClient
    static var ellenbyTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2740)
    }

    /// Elstat Electronics Ltd. (`2741`)
    @_alwaysEmitIntoClient
    static var elstatElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2741)
    }

    /// Xenter, Inc. (`2742`)
    @_alwaysEmitIntoClient
    static var xenter: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2742)
    }

    /// LogTag North America Inc. (`2743`)
    @_alwaysEmitIntoClient
    static var logtagNorthAmerica: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2743)
    }

    /// Sens.ai Incorporated (`2744`)
    @_alwaysEmitIntoClient
    static var sensAi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2744)
    }

    /// STL (`2745`)
    @_alwaysEmitIntoClient
    static var stl: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2745)
    }

    /// Open Bionics Ltd. (`2746`)
    @_alwaysEmitIntoClient
    static var openBionics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2746)
    }

    /// R-DAS, s.r.o. (`2747`)
    @_alwaysEmitIntoClient
    static var rDas: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2747)
    }

    /// KCCS Mobile Engineering Co., Ltd. (`2748`)
    @_alwaysEmitIntoClient
    static var kccsMobileEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2748)
    }

    /// Inventas AS (`2749`)
    @_alwaysEmitIntoClient
    static var inventas: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2749)
    }

    /// Robkoo Information & Technologies Co., Ltd. (`2750`)
    @_alwaysEmitIntoClient
    static var robkooInformationTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2750)
    }

    /// PAUL HARTMANN AG (`2751`)
    @_alwaysEmitIntoClient
    static var paulHartmann: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2751)
    }

    /// Omni-ID USA, INC. (`2752`)
    @_alwaysEmitIntoClient
    static var omniId: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2752)
    }

    /// Shenzhen Jingxun Technology Co., Ltd. (`2753`)
    @_alwaysEmitIntoClient
    static var shenzhenJingxunTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2753)
    }

    /// RealMega Microelectronics technology (Shanghai) Co. Ltd. (`2754`)
    @_alwaysEmitIntoClient
    static var realmegaMicroelectronicsTechnologyShanghai: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2754)
    }

    /// Kenzen, Inc. (`2755`)
    @_alwaysEmitIntoClient
    static var kenzen: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2755)
    }

    /// CODIUM (`2756`)
    @_alwaysEmitIntoClient
    static var codium: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2756)
    }

    /// Flexoptix GmbH (`2757`)
    @_alwaysEmitIntoClient
    static var flexoptix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2757)
    }

    /// Barnes Group Inc. (`2758`)
    @_alwaysEmitIntoClient
    static var barnesGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2758)
    }

    /// Chengdu Aich Technology Co.,Ltd (`2759`)
    @_alwaysEmitIntoClient
    static var chengduAichTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2759)
    }

    /// Keepin Co., Ltd. (`2760`)
    @_alwaysEmitIntoClient
    static var keepin: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2760)
    }

    /// Swedlock AB (`2761`)
    @_alwaysEmitIntoClient
    static var swedlock: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2761)
    }

    /// Shenzhen CoolKit Technology Co., Ltd (`2762`)
    @_alwaysEmitIntoClient
    static var shenzhenCoolkitTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2762)
    }

    /// ise Individuelle Software und Elektronik GmbH (`2763`)
    @_alwaysEmitIntoClient
    static var iseIndividuelleSoftwareUndElektronik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2763)
    }

    /// Nuvoton (`2764`)
    @_alwaysEmitIntoClient
    static var nuvoton: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2764)
    }

    /// Visuallex Sport International Limited (`2765`)
    @_alwaysEmitIntoClient
    static var visuallexSportInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2765)
    }

    /// KOBATA GAUGE MFG. CO., LTD. (`2766`)
    @_alwaysEmitIntoClient
    static var kobataGaugeMfg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2766)
    }

    /// CACI Technologies (`2767`)
    @_alwaysEmitIntoClient
    static var caciTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2767)
    }

    /// Nordic Strong ApS (`2768`)
    @_alwaysEmitIntoClient
    static var nordicStrong: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2768)
    }

    /// EAGLE KINGDOM TECHNOLOGIES LIMITED (`2769`)
    @_alwaysEmitIntoClient
    static var eagleKingdomTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2769)
    }

    /// Lautsprecher Teufel GmbH (`2770`)
    @_alwaysEmitIntoClient
    static var lautsprecherTeufel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2770)
    }

    /// SSV Software Systems GmbH (`2771`)
    @_alwaysEmitIntoClient
    static var ssvSoftwareSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2771)
    }

    /// Zhuhai Pantum Electronisc Co., Ltd (`2772`)
    @_alwaysEmitIntoClient
    static var zhuhaiPantumElectronisc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2772)
    }

    /// Streamit B.V. (`2773`)
    @_alwaysEmitIntoClient
    static var streamit: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2773)
    }

    /// nymea GmbH (`2774`)
    @_alwaysEmitIntoClient
    static var nymea: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2774)
    }

    /// AL-KO Geraete GmbH (`2775`)
    @_alwaysEmitIntoClient
    static var alKoGeraete: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2775)
    }

    /// Franz Kaldewei GmbH&Co KG (`2776`)
    @_alwaysEmitIntoClient
    static var franzKaldeweiCoKg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2776)
    }

    /// Shenzhen Aimore. Co.,Ltd (`2777`)
    @_alwaysEmitIntoClient
    static var shenzhenAimore: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2777)
    }

    /// Codefabrik GmbH (`2778`)
    @_alwaysEmitIntoClient
    static var codefabrik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2778)
    }

    /// Reelables, Inc. (`2779`)
    @_alwaysEmitIntoClient
    static var reelables: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2779)
    }

    /// Duravit AG (`2780`)
    @_alwaysEmitIntoClient
    static var duravit: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2780)
    }

    /// Boss Audio (`2781`)
    @_alwaysEmitIntoClient
    static var bossAudio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2781)
    }

    /// Vocera Communications, Inc. (`2782`)
    @_alwaysEmitIntoClient
    static var voceraCommunications: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2782)
    }

    /// Douglas Dynamics L.L.C. (`2783`)
    @_alwaysEmitIntoClient
    static var douglasDynamicsLLC: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2783)
    }

    /// Viceroy Devices Corporation (`2784`)
    @_alwaysEmitIntoClient
    static var viceroyDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2784)
    }

    /// ChengDu ForThink Technology Co., Ltd. (`2785`)
    @_alwaysEmitIntoClient
    static var chengduForthinkTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2785)
    }

    /// IMATRIX SYSTEMS, INC. (`2786`)
    @_alwaysEmitIntoClient
    static var imatrixSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2786)
    }

    /// GlobalMed (`2787`)
    @_alwaysEmitIntoClient
    static var globalmed: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2787)
    }

    /// DALI Alliance (`2788`)
    @_alwaysEmitIntoClient
    static var daliAlliance: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2788)
    }

    /// unu GmbH (`2789`)
    @_alwaysEmitIntoClient
    static var unu: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2789)
    }

    /// Hexology (`2790`)
    @_alwaysEmitIntoClient
    static var hexology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2790)
    }

    /// Sunplus Technology Co., Ltd. (`2791`)
    @_alwaysEmitIntoClient
    static var sunplusTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2791)
    }

    /// LEVEL, s.r.o. (`2792`)
    @_alwaysEmitIntoClient
    static var level: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2792)
    }

    /// FLIR Systems AB (`2793`)
    @_alwaysEmitIntoClient
    static var flirSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2793)
    }

    /// Borda Technology (`2794`)
    @_alwaysEmitIntoClient
    static var bordaTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2794)
    }

    /// Square, Inc. (`2795`)
    @_alwaysEmitIntoClient
    static var square: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2795)
    }

    /// FUTEK ADVANCED SENSOR TECHNOLOGY, INC (`2796`)
    @_alwaysEmitIntoClient
    static var futekAdvancedSensorTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2796)
    }

    /// Saxonar GmbH (`2797`)
    @_alwaysEmitIntoClient
    static var saxonar: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2797)
    }

    /// Velentium, LLC (`2798`)
    @_alwaysEmitIntoClient
    static var velentium: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2798)
    }

    /// GLP German Light Products GmbH (`2799`)
    @_alwaysEmitIntoClient
    static var glpGermanLightProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2799)
    }

    /// Leupold & Stevens, Inc. (`2800`)
    @_alwaysEmitIntoClient
    static var leupoldStevens: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2800)
    }

    /// CRADERS,CO.,LTD (`2801`)
    @_alwaysEmitIntoClient
    static var craders: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2801)
    }

    /// Shanghai All Link Microelectronics Co.,Ltd (`2802`)
    @_alwaysEmitIntoClient
    static var shanghaiAllLinkMicroelectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2802)
    }

    /// 701x Inc. (`2803`)
    @_alwaysEmitIntoClient
    static var company701X: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2803)
    }

    /// Radioworks Microelectronics PTY LTD (`2804`)
    @_alwaysEmitIntoClient
    static var radioworksMicroelectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2804)
    }

    /// Unitech Electronic Inc. (`2805`)
    @_alwaysEmitIntoClient
    static var unitechElectronic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2805)
    }

    /// AMETEK, Inc. (`2806`)
    @_alwaysEmitIntoClient
    static var ametek: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2806)
    }

    /// Irdeto (`2807`)
    @_alwaysEmitIntoClient
    static var irdeto: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2807)
    }

    /// First Design System Inc. (`2808`)
    @_alwaysEmitIntoClient
    static var firstDesignSystem: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2808)
    }

    /// Unisto AG (`2809`)
    @_alwaysEmitIntoClient
    static var unisto: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2809)
    }

    /// Chengdu Ambit Technology Co., Ltd. (`2810`)
    @_alwaysEmitIntoClient
    static var chengduAmbitTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2810)
    }

    /// SMT ELEKTRONIK GmbH (`2811`)
    @_alwaysEmitIntoClient
    static var smtElektronik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2811)
    }

    /// Cerebrum Sensor Technologies Inc. (`2812`)
    @_alwaysEmitIntoClient
    static var cerebrumSensorTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2812)
    }

    /// Weber Sensors, LLC (`2813`)
    @_alwaysEmitIntoClient
    static var weberSensors: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2813)
    }

    /// Earda Technologies Co.,Ltd (`2814`)
    @_alwaysEmitIntoClient
    static var eardaTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2814)
    }

    /// FUSEAWARE LIMITED (`2815`)
    @_alwaysEmitIntoClient
    static var fuseaware: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2815)
    }

    /// Flaircomm Microelectronics Inc. (`2816`)
    @_alwaysEmitIntoClient
    static var flaircommMicroelectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2816)
    }

    /// RESIDEO TECHNOLOGIES, INC. (`2817`)
    @_alwaysEmitIntoClient
    static var resideoTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2817)
    }

    /// IORA Technology Development Ltd. Sti. (`2818`)
    @_alwaysEmitIntoClient
    static var ioraTechnologyDevelopmentSti: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2818)
    }

    /// Precision Triathlon Systems Limited (`2819`)
    @_alwaysEmitIntoClient
    static var precisionTriathlonSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2819)
    }

    /// I-PERCUT (`2820`)
    @_alwaysEmitIntoClient
    static var iPercut: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2820)
    }

    /// Marquardt GmbH (`2821`)
    @_alwaysEmitIntoClient
    static var marquardt: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2821)
    }

    /// FAZUA GmbH (`2822`)
    @_alwaysEmitIntoClient
    static var fazua: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2822)
    }

    /// Workaround Gmbh (`2823`)
    @_alwaysEmitIntoClient
    static var workaround: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2823)
    }

    /// Shenzhen Qianfenyi Intelligent Technology Co., LTD (`2824`)
    @_alwaysEmitIntoClient
    static var shenzhenQianfenyiIntelligentTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2824)
    }

    /// soonisys (`2825`)
    @_alwaysEmitIntoClient
    static var soonisys: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2825)
    }

    /// Belun Technology Company Limited (`2826`)
    @_alwaysEmitIntoClient
    static var belunTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2826)
    }

    /// Sanistaal A/S (`2827`)
    @_alwaysEmitIntoClient
    static var sanistaal: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2827)
    }

    /// BluPeak (`2828`)
    @_alwaysEmitIntoClient
    static var blupeak: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2828)
    }

    /// SANYO DENKO Co.,Ltd. (`2829`)
    @_alwaysEmitIntoClient
    static var sanyoDenko: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2829)
    }

    /// Honda Lock Mfg. Co.,Ltd. (`2830`)
    @_alwaysEmitIntoClient
    static var hondaLockMfg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2830)
    }

    /// B.E.A. S.A. (`2831`)
    @_alwaysEmitIntoClient
    static var bEA: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2831)
    }

    /// Alfa Laval Corporate AB (`2832`)
    @_alwaysEmitIntoClient
    static var alfaLavalorate: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2832)
    }

    /// ThermoWorks, Inc. (`2833`)
    @_alwaysEmitIntoClient
    static var thermoworks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2833)
    }

    /// ToughBuilt Industries LLC (`2834`)
    @_alwaysEmitIntoClient
    static var toughbuiltIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2834)
    }

    /// IOTOOLS (`2835`)
    @_alwaysEmitIntoClient
    static var iotools: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2835)
    }

    /// Olumee (`2836`)
    @_alwaysEmitIntoClient
    static var olumee: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2836)
    }

    /// NAOS JAPAN K.K. (`2837`)
    @_alwaysEmitIntoClient
    static var naosJapanKK: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2837)
    }

    /// Guard RFID Solutions Inc. (`2838`)
    @_alwaysEmitIntoClient
    static var guardRfidSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2838)
    }

    /// SIG SAUER, INC. (`2839`)
    @_alwaysEmitIntoClient
    static var siguer: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2839)
    }

    /// DECATHLON SE (`2840`)
    @_alwaysEmitIntoClient
    static var decathlon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2840)
    }

    /// WBS PROJECT H PTY LTD (`2841`)
    @_alwaysEmitIntoClient
    static var wbsProjectH: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2841)
    }

    /// Roca Sanitario, S.A. (`2842`)
    @_alwaysEmitIntoClient
    static var rocaSanitario: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2842)
    }

    /// Enerpac Tool Group Corp. (`2843`)
    @_alwaysEmitIntoClient
    static var enerpacToolGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2843)
    }

    /// Nanoleq AG (`2844`)
    @_alwaysEmitIntoClient
    static var nanoleq: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2844)
    }

    /// Accelerated Systems (`2845`)
    @_alwaysEmitIntoClient
    static var acceleratedSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2845)
    }

    /// PB INC. (`2846`)
    @_alwaysEmitIntoClient
    static var pb: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2846)
    }

    /// Beijing ESWIN Computing Technology Co., Ltd. (`2847`)
    @_alwaysEmitIntoClient
    static var beijingEswinComputingTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2847)
    }

    /// TKH Security B.V. (`2848`)
    @_alwaysEmitIntoClient
    static var tkhSecurity: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2848)
    }

    /// ams AG (`2849`)
    @_alwaysEmitIntoClient
    static var ams: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2849)
    }

    /// Hygiene IQ, LLC. (`2850`)
    @_alwaysEmitIntoClient
    static var hygieneIq: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2850)
    }

    /// iRhythm Technologies, Inc. (`2851`)
    @_alwaysEmitIntoClient
    static var irhythmTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2851)
    }

    /// BeiJing ZiJie TiaoDong KeJi Co.,Ltd. (`2852`)
    @_alwaysEmitIntoClient
    static var beijingZijieTiaodongKeji: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2852)
    }

    /// NIBROTECH LTD (`2853`)
    @_alwaysEmitIntoClient
    static var nibrotech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2853)
    }

    /// Baracoda Daily Healthtech. (`2854`)
    @_alwaysEmitIntoClient
    static var baracodaDailyHealthtech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2854)
    }

    /// Lumi United Technology Co., Ltd (`2855`)
    @_alwaysEmitIntoClient
    static var lumiUnitedTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2855)
    }

    /// CHACON (`2856`)
    @_alwaysEmitIntoClient
    static var chacon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2856)
    }

    /// Tech-Venom Entertainment Private Limited (`2857`)
    @_alwaysEmitIntoClient
    static var techVenomEntertainment: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2857)
    }

    /// ACL Airshop B.V. (`2858`)
    @_alwaysEmitIntoClient
    static var aclAirshop: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2858)
    }

    /// MAINBOT (`2859`)
    @_alwaysEmitIntoClient
    static var mainbot: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2859)
    }

    /// ILLUMAGEAR, Inc. (`2860`)
    @_alwaysEmitIntoClient
    static var illumagear: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2860)
    }

    /// REDARC ELECTRONICS PTY LTD (`2861`)
    @_alwaysEmitIntoClient
    static var redarcElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2861)
    }

    /// MOCA System Inc. (`2862`)
    @_alwaysEmitIntoClient
    static var mocaSystem: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2862)
    }

    /// Duke Manufacturing Co (`2863`)
    @_alwaysEmitIntoClient
    static var dukeManufacturingCo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2863)
    }

    /// ART SPA (`2864`)
    @_alwaysEmitIntoClient
    static var artSpa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2864)
    }

    /// Silver Wolf Vehicles Inc. (`2865`)
    @_alwaysEmitIntoClient
    static var silverWolfVehicles: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2865)
    }

    /// Hala Systems, Inc. (`2866`)
    @_alwaysEmitIntoClient
    static var halaSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2866)
    }

    /// ARMATURA LLC (`2867`)
    @_alwaysEmitIntoClient
    static var armatura: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2867)
    }

    /// CONZUMEX INDUSTRIES PRIVATE LIMITED (`2868`)
    @_alwaysEmitIntoClient
    static var conzumexIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2868)
    }

    /// BH SENS (`2869`)
    @_alwaysEmitIntoClient
    static var bhSens: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2869)
    }

    /// SINTEF (`2870`)
    @_alwaysEmitIntoClient
    static var sintef: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2870)
    }

    /// Omnivoltaic Energy Solutions Limited Company (`2871`)
    @_alwaysEmitIntoClient
    static var omnivoltaicEnergySolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2871)
    }

    /// WISYCOM S.R.L. (`2872`)
    @_alwaysEmitIntoClient
    static var wisycom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2872)
    }

    /// Red 100 Lighting Co., ltd. (`2873`)
    @_alwaysEmitIntoClient
    static var red100Lighting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2873)
    }

    /// Impact Biosystems, Inc. (`2874`)
    @_alwaysEmitIntoClient
    static var impactBiosystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2874)
    }

    /// AIC semiconductor (Shanghai) Co., Ltd. (`2875`)
    @_alwaysEmitIntoClient
    static var aicSemiconductorShanghai: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2875)
    }

    /// Dodge Industrial, Inc. (`2876`)
    @_alwaysEmitIntoClient
    static var dodgeIndustrial: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2876)
    }

    /// REALTIMEID AS (`2877`)
    @_alwaysEmitIntoClient
    static var realtimeid: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2877)
    }

    /// ISEO Serrature S.p.a. (`2878`)
    @_alwaysEmitIntoClient
    static var iseoSerrature: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2878)
    }

    /// MindRhythm, Inc. (`2879`)
    @_alwaysEmitIntoClient
    static var mindrhythm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2879)
    }

    /// Havells India Limited (`2880`)
    @_alwaysEmitIntoClient
    static var havellsIndia: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2880)
    }

    /// Sentrax GmbH (`2881`)
    @_alwaysEmitIntoClient
    static var sentrax: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2881)
    }

    /// TSI (`2882`)
    @_alwaysEmitIntoClient
    static var tsi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2882)
    }

    /// INCITAT ENVIRONNEMENT (`2883`)
    @_alwaysEmitIntoClient
    static var incitatEnvironnement: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2883)
    }

    /// nFore Technology Co., Ltd. (`2884`)
    @_alwaysEmitIntoClient
    static var nforeTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2884)
    }

    /// Electronic Sensors, Inc. (`2885`)
    @_alwaysEmitIntoClient
    static var electronicSensors: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2885)
    }

    /// Bird Rides, Inc. (`2886`)
    @_alwaysEmitIntoClient
    static var birdRides: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2886)
    }

    /// Gentex Corporation (`2887`)
    @_alwaysEmitIntoClient
    static var gentex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2887)
    }

    /// NIO USA, Inc. (`2888`)
    @_alwaysEmitIntoClient
    static var nio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2888)
    }

    /// SkyHawke Technologies (`2889`)
    @_alwaysEmitIntoClient
    static var skyhawkeTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2889)
    }

    /// Nomono AS (`2890`)
    @_alwaysEmitIntoClient
    static var nomono: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2890)
    }

    /// EMS Integrators, LLC (`2891`)
    @_alwaysEmitIntoClient
    static var emsIntegrators: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2891)
    }

    /// BiosBob.Biz (`2892`)
    @_alwaysEmitIntoClient
    static var biosbobBiz: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2892)
    }

    /// Adam Hall GmbH (`2893`)
    @_alwaysEmitIntoClient
    static var adamHall: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2893)
    }

    /// ICP Systems B.V. (`2894`)
    @_alwaysEmitIntoClient
    static var icpSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2894)
    }

    /// Breezi.io, Inc. (`2895`)
    @_alwaysEmitIntoClient
    static var breeziIo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2895)
    }

    /// Mesh Systems LLC (`2896`)
    @_alwaysEmitIntoClient
    static var meshSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2896)
    }

    /// FUN FACTORY GmbH (`2897`)
    @_alwaysEmitIntoClient
    static var funFactory: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2897)
    }

    /// ZIIP Inc (`2898`)
    @_alwaysEmitIntoClient
    static var ziip: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2898)
    }

    /// SHENZHEN KAADAS INTELLIGENT TECHNOLOGY CO.,Ltd (`2899`)
    @_alwaysEmitIntoClient
    static var shenzhenKaadasIntelligentTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2899)
    }

    /// Emotion Fitness GmbH & Co. KG (`2900`)
    @_alwaysEmitIntoClient
    static var emotionFitness: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2900)
    }

    /// H G M Automotive Electronics, Inc. (`2901`)
    @_alwaysEmitIntoClient
    static var hGMAutomotiveElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2901)
    }

    /// BORA - Vertriebs GmbH & Co KG (`2902`)
    @_alwaysEmitIntoClient
    static var boraVertriebs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2902)
    }

    /// CONVERTRONIX TECHNOLOGIES AND SERVICES LLP (`2903`)
    @_alwaysEmitIntoClient
    static var convertronixTechnologiesAndServicesLlp: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2903)
    }

    /// TOKAI-DENSHI INC (`2904`)
    @_alwaysEmitIntoClient
    static var tokaiDenshi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2904)
    }

    /// Versa Group B.V. (`2905`)
    @_alwaysEmitIntoClient
    static var versaGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2905)
    }

    /// H.P. Shelby Manufacturing, LLC. (`2906`)
    @_alwaysEmitIntoClient
    static var hPShelbyManufacturing: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2906)
    }

    /// Shenzhen ImagineVision Technology Limited (`2907`)
    @_alwaysEmitIntoClient
    static var shenzhenImaginevisionTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2907)
    }

    /// Exponential Power, Inc. (`2908`)
    @_alwaysEmitIntoClient
    static var exponentialPower: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2908)
    }

    /// Fujian Newland Auto-ID Tech. Co., Ltd. (`2909`)
    @_alwaysEmitIntoClient
    static var fujianNewlandAutoIdTech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2909)
    }

    /// CELLCONTROL, INC. (`2910`)
    @_alwaysEmitIntoClient
    static var cellcontrol: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2910)
    }

    /// Rivieh, Inc. (`2911`)
    @_alwaysEmitIntoClient
    static var rivieh: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2911)
    }

    /// RATOC Systems, Inc. (`2912`)
    @_alwaysEmitIntoClient
    static var ratocSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2912)
    }

    /// Sentek Pty Ltd (`2913`)
    @_alwaysEmitIntoClient
    static var sentek: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2913)
    }

    /// NOVEA ENERGIES (`2914`)
    @_alwaysEmitIntoClient
    static var noveaEnergies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2914)
    }

    /// Innolux Corporation (`2915`)
    @_alwaysEmitIntoClient
    static var innolux: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2915)
    }

    /// NingBo klite Electric Manufacture Co.,LTD (`2916`)
    @_alwaysEmitIntoClient
    static var ningboKliteElectricManufacture: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2916)
    }

    /// The Apache Software Foundation (`2917`)
    @_alwaysEmitIntoClient
    static var apacheSoftwareFoundation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2917)
    }

    /// MITSUBISHI ELECTRIC AUTOMATION (THAILAND) COMPANY LIMITED (`2918`)
    @_alwaysEmitIntoClient
    static var mitsubishiElectricAutomationThailand: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2918)
    }

    /// CleanSpace Technology Pty Ltd (`2919`)
    @_alwaysEmitIntoClient
    static var cleanspaceTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2919)
    }

    /// Quha oy (`2920`)
    @_alwaysEmitIntoClient
    static var quha: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2920)
    }

    /// Addaday (`2921`)
    @_alwaysEmitIntoClient
    static var addaday: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2921)
    }

    /// Dymo (`2922`)
    @_alwaysEmitIntoClient
    static var dymo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2922)
    }

    /// Samsara Networks, Inc (`2923`)
    @_alwaysEmitIntoClient
    static var samsaraNetworks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2923)
    }

    /// Sensitech, Inc. (`2924`)
    @_alwaysEmitIntoClient
    static var sensitech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2924)
    }

    /// SOLUM CO., LTD (`2925`)
    @_alwaysEmitIntoClient
    static var solum: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2925)
    }

    /// React Mobile (`2926`)
    @_alwaysEmitIntoClient
    static var reactMobile: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2926)
    }

    /// Shenzhen Malide Technology Co.,Ltd (`2927`)
    @_alwaysEmitIntoClient
    static var shenzhenMalideTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2927)
    }

    /// JDRF Electromag Engineering Inc (`2928`)
    @_alwaysEmitIntoClient
    static var jdrfElectromagEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2928)
    }

    /// lilbit ODM AS (`2929`)
    @_alwaysEmitIntoClient
    static var lilbitOdm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2929)
    }

    /// Geeknet, Inc. (`2930`)
    @_alwaysEmitIntoClient
    static var geeknet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2930)
    }

    /// HARADA INDUSTRY CO., LTD. (`2931`)
    @_alwaysEmitIntoClient
    static var haradaIndustry: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2931)
    }

    /// BQN (`2932`)
    @_alwaysEmitIntoClient
    static var bqn: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2932)
    }

    /// Triple W Japan Inc. (`2933`)
    @_alwaysEmitIntoClient
    static var tripleWJapan: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2933)
    }

    /// MAX-co., ltd (`2934`)
    @_alwaysEmitIntoClient
    static var max: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2934)
    }

    /// Aixlink(Chengdu) Co., Ltd. (`2935`)
    @_alwaysEmitIntoClient
    static var aixlinkChengdu: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2935)
    }

    /// FIELD DESIGN INC. (`2936`)
    @_alwaysEmitIntoClient
    static var fieldDesign: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2936)
    }

    /// Sankyo Air Tech Co.,Ltd. (`2937`)
    @_alwaysEmitIntoClient
    static var sankyoAirTech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2937)
    }

    /// Shenzhen KTC Technology Co.,Ltd. (`2938`)
    @_alwaysEmitIntoClient
    static var shenzhenKtcTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2938)
    }

    /// Hardcoder Oy (`2939`)
    @_alwaysEmitIntoClient
    static var hardcoder: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2939)
    }

    /// Scangrip A/S (`2940`)
    @_alwaysEmitIntoClient
    static var scangrip: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2940)
    }

    /// FoundersLane GmbH (`2941`)
    @_alwaysEmitIntoClient
    static var founderslane: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2941)
    }

    /// Offcode Oy (`2942`)
    @_alwaysEmitIntoClient
    static var offcode: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2942)
    }

    /// ICU tech GmbH (`2943`)
    @_alwaysEmitIntoClient
    static var icuTech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2943)
    }

    /// AXELIFE (`2944`)
    @_alwaysEmitIntoClient
    static var axelife: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2944)
    }

    /// SCM Group (`2945`)
    @_alwaysEmitIntoClient
    static var scmGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2945)
    }

    /// Mammut Sports Group AG (`2946`)
    @_alwaysEmitIntoClient
    static var mammutSportsGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2946)
    }

    /// Taiga Motors Inc. (`2947`)
    @_alwaysEmitIntoClient
    static var taigaMotors: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2947)
    }

    /// Presidio Medical, Inc. (`2948`)
    @_alwaysEmitIntoClient
    static var presidioMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2948)
    }

    /// VIMANA TECH PTY LTD (`2949`)
    @_alwaysEmitIntoClient
    static var vimanaTech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2949)
    }

    /// Trek Bicycle (`2950`)
    @_alwaysEmitIntoClient
    static var trekBicycle: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2950)
    }

    /// Ampetronic Ltd (`2951`)
    @_alwaysEmitIntoClient
    static var ampetronic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2951)
    }

    /// Muguang (Guangdong) Intelligent Lighting Technology Co., Ltd (`2952`)
    @_alwaysEmitIntoClient
    static var muguangGuangdongIntelligentLightingTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2952)
    }

    /// Rotronic AG (`2953`)
    @_alwaysEmitIntoClient
    static var rotronic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2953)
    }

    /// Seiko Instruments Inc. (`2954`)
    @_alwaysEmitIntoClient
    static var seikoInstruments: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2954)
    }

    /// American Technology Components, Incorporated (`2955`)
    @_alwaysEmitIntoClient
    static var americanTechnologyComponents: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2955)
    }

    /// MOTREX (`2956`)
    @_alwaysEmitIntoClient
    static var motrex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2956)
    }

    /// Pertech Industries Inc (`2957`)
    @_alwaysEmitIntoClient
    static var pertechIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2957)
    }

    /// Gentle Energy Corp. (`2958`)
    @_alwaysEmitIntoClient
    static var gentleEnergy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2958)
    }

    /// Senscomm Semiconductor Co., Ltd. (`2959`)
    @_alwaysEmitIntoClient
    static var senscommSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2959)
    }

    /// Ineos Automotive Limited (`2960`)
    @_alwaysEmitIntoClient
    static var ineosAutomotive: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2960)
    }

    /// Alfen ICU B.V. (`2961`)
    @_alwaysEmitIntoClient
    static var alfenIcu: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2961)
    }

    /// Citisend Solutions, SL (`2962`)
    @_alwaysEmitIntoClient
    static var citisendSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2962)
    }

    /// Hangzhou BroadLink Technology Co., Ltd. (`2963`)
    @_alwaysEmitIntoClient
    static var hangzhouBroadlinkTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2963)
    }

    /// Dreem SAS (`2964`)
    @_alwaysEmitIntoClient
    static var dreems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2964)
    }

    /// Netwake GmbH (`2965`)
    @_alwaysEmitIntoClient
    static var netwake: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2965)
    }

    /// Telecom Design (`2966`)
    @_alwaysEmitIntoClient
    static var telecomDesign: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2966)
    }

    /// SILVER TREE LABS, INC. (`2967`)
    @_alwaysEmitIntoClient
    static var silverTreeLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2967)
    }

    /// Gymstory B.V. (`2968`)
    @_alwaysEmitIntoClient
    static var gymstory: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2968)
    }

    /// The Goodyear Tire & Rubber Company (`2969`)
    @_alwaysEmitIntoClient
    static var goodyearTireRubber: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2969)
    }

    /// Beijing Wisepool Infinite Intelligence Technology Co.,Ltd (`2970`)
    @_alwaysEmitIntoClient
    static var beijingWisepoolInfiniteIntelligenceTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2970)
    }

    /// GISMAN (`2971`)
    @_alwaysEmitIntoClient
    static var gisman: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2971)
    }

    /// Komatsu Ltd. (`2972`)
    @_alwaysEmitIntoClient
    static var komatsu: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2972)
    }

    /// Sensoria Holdings LTD (`2973`)
    @_alwaysEmitIntoClient
    static var sensoriaHoldings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2973)
    }

    /// Audio Partnership Plc (`2974`)
    @_alwaysEmitIntoClient
    static var audioPartnershipPlc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2974)
    }

    /// Group Lotus Limited (`2975`)
    @_alwaysEmitIntoClient
    static var groupLotus: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2975)
    }

    /// Data Sciences International (`2976`)
    @_alwaysEmitIntoClient
    static var dataSciencesInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2976)
    }

    /// Bunn-O-Matic Corporation (`2977`)
    @_alwaysEmitIntoClient
    static var bunnOMatic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2977)
    }

    /// TireCheck GmbH (`2978`)
    @_alwaysEmitIntoClient
    static var tirecheck: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2978)
    }

    /// Sonova Consumer Hearing GmbH (`2979`)
    @_alwaysEmitIntoClient
    static var sonovaConsumerHearing: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2979)
    }

    /// Vervent Audio Group (`2980`)
    @_alwaysEmitIntoClient
    static var verventAudioGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2980)
    }

    /// SONICOS ENTERPRISES, LLC (`2981`)
    @_alwaysEmitIntoClient
    static var sonicosEnterprises: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2981)
    }

    /// Nissan Motor Co., Ltd. (`2982`)
    @_alwaysEmitIntoClient
    static var nissanMotor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2982)
    }

    /// hearX Group (Pty) Ltd (`2983`)
    @_alwaysEmitIntoClient
    static var hearxGroupPty: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2983)
    }

    /// GLOWFORGE INC. (`2984`)
    @_alwaysEmitIntoClient
    static var glowforge: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2984)
    }

    /// Allterco Robotics ltd (`2985`)
    @_alwaysEmitIntoClient
    static var alltercoRobotics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2985)
    }

    /// Infinitegra, Inc. (`2986`)
    @_alwaysEmitIntoClient
    static var infinitegra: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2986)
    }

    /// Grandex International Corporation (`2987`)
    @_alwaysEmitIntoClient
    static var grandexInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2987)
    }

    /// Machfu Inc. (`2988`)
    @_alwaysEmitIntoClient
    static var machfu: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2988)
    }

    /// Roambotics, Inc. (`2989`)
    @_alwaysEmitIntoClient
    static var roambotics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2989)
    }

    /// Soma Labs LLC (`2990`)
    @_alwaysEmitIntoClient
    static var somaLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2990)
    }

    /// NITTO KOGYO CORPORATION (`2991`)
    @_alwaysEmitIntoClient
    static var nittoKogyo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2991)
    }

    /// Ecolab Inc. (`2992`)
    @_alwaysEmitIntoClient
    static var ecolab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2992)
    }

    /// Beijing ranxin intelligence technology Co.,LTD (`2993`)
    @_alwaysEmitIntoClient
    static var beijingRanxinIntelligenceTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2993)
    }

    /// Fjorden Electra AS (`2994`)
    @_alwaysEmitIntoClient
    static var fjordenElectra: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2994)
    }

    /// Flender GmbH (`2995`)
    @_alwaysEmitIntoClient
    static var flender: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2995)
    }

    /// New Cosmos USA, Inc. (`2996`)
    @_alwaysEmitIntoClient
    static var newCosmos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2996)
    }

    /// Xirgo Technologies, LLC (`2997`)
    @_alwaysEmitIntoClient
    static var xirgoTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2997)
    }

    /// Build With Robots Inc. (`2998`)
    @_alwaysEmitIntoClient
    static var buildWithRobots: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2998)
    }

    /// IONA Tech LLC (`2999`)
    @_alwaysEmitIntoClient
    static var ionaTech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 2999)
    }

    /// INNOVAG PTY. LTD. (`3000`)
    @_alwaysEmitIntoClient
    static var innovag: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3000)
    }

    /// SaluStim Group Oy (`3001`)
    @_alwaysEmitIntoClient
    static var salustimGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3001)
    }

    /// Huso, INC (`3002`)
    @_alwaysEmitIntoClient
    static var huso: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3002)
    }

    /// SWISSINNO SOLUTIONS AG (`3003`)
    @_alwaysEmitIntoClient
    static var swissinnoSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3003)
    }

    /// T2REALITY SOLUTIONS PRIVATE LIMITED (`3004`)
    @_alwaysEmitIntoClient
    static var t2RealitySolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3004)
    }

    /// ETHEORY PTY LTD (`3005`)
    @_alwaysEmitIntoClient
    static var etheory: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3005)
    }

    /// SAAB Aktiebolag (`3006`)
    @_alwaysEmitIntoClient
    static var saabAktiebolag: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3006)
    }

    /// HIMSA II K/S (`3007`)
    @_alwaysEmitIntoClient
    static var himsaIiKS: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3007)
    }

    /// READY FOR SKY LLP (`3008`)
    @_alwaysEmitIntoClient
    static var readyForSkyLlp: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3008)
    }

    /// Miele & Cie. KG (`3009`)
    @_alwaysEmitIntoClient
    static var mieleCieKg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3009)
    }

    /// EntWick Co. (`3010`)
    @_alwaysEmitIntoClient
    static var entwick: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3010)
    }

    /// MCOT INC. (`3011`)
    @_alwaysEmitIntoClient
    static var mcot: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3011)
    }

    /// TECHTICS ENGINEERING B.V. (`3012`)
    @_alwaysEmitIntoClient
    static var techticsEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3012)
    }

    /// Aperia Technologies, Inc. (`3013`)
    @_alwaysEmitIntoClient
    static var aperiaTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3013)
    }

    /// TCL COMMUNICATION EQUIPMENT CO.,LTD. (`3014`)
    @_alwaysEmitIntoClient
    static var tclCommunicationEquipment: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3014)
    }

    /// Signtle Inc. (`3015`)
    @_alwaysEmitIntoClient
    static var signtle: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3015)
    }

    /// OTF Distribution, LLC (`3016`)
    @_alwaysEmitIntoClient
    static var otfDistribution: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3016)
    }

    /// Neuvatek Inc. (`3017`)
    @_alwaysEmitIntoClient
    static var neuvatek: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3017)
    }

    /// Perimeter Technologies, Inc. (`3018`)
    @_alwaysEmitIntoClient
    static var perimeterTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3018)
    }

    /// Divesoft s.r.o. (`3019`)
    @_alwaysEmitIntoClient
    static var divesoft: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3019)
    }

    /// Sylvac sa (`3020`)
    @_alwaysEmitIntoClient
    static var sylvacSa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3020)
    }

    /// Amiko srl (`3021`)
    @_alwaysEmitIntoClient
    static var amiko: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3021)
    }

    /// Neurosity, Inc. (`3022`)
    @_alwaysEmitIntoClient
    static var neurosity: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3022)
    }

    /// LL Tec Group LLC (`3023`)
    @_alwaysEmitIntoClient
    static var llTecGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3023)
    }

    /// Durag GmbH (`3024`)
    @_alwaysEmitIntoClient
    static var durag: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3024)
    }

    /// Hubei Yuan Times Technology Co., Ltd. (`3025`)
    @_alwaysEmitIntoClient
    static var hubeiYuanTimesTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3025)
    }

    /// IDEC (`3026`)
    @_alwaysEmitIntoClient
    static var idec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3026)
    }

    /// Procon Analytics, LLC (`3027`)
    @_alwaysEmitIntoClient
    static var proconAnalytics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3027)
    }

    /// ndd Medizintechnik AG (`3028`)
    @_alwaysEmitIntoClient
    static var nddMedizintechnik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3028)
    }

    /// Super B Lithium Power B.V. (`3029`)
    @_alwaysEmitIntoClient
    static var superBLithiumPower: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3029)
    }

    /// Shenzhen Injoinic Technology Co., Ltd. (`3030`)
    @_alwaysEmitIntoClient
    static var shenzhenInjoinicTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3030)
    }

    /// VINFAST TRADING AND PRODUCTION JOINT STOCK COMPANY (`3031`)
    @_alwaysEmitIntoClient
    static var vinfastTradingAndProduction: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3031)
    }

    /// PURA SCENTS, INC. (`3032`)
    @_alwaysEmitIntoClient
    static var puraScents: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3032)
    }

    /// Elics Basis Ltd. (`3033`)
    @_alwaysEmitIntoClient
    static var elicsBasis: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3033)
    }

    /// Aardex Ltd. (`3034`)
    @_alwaysEmitIntoClient
    static var aardex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3034)
    }

    /// CHAR-BROIL, LLC (`3035`)
    @_alwaysEmitIntoClient
    static var charBroil: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3035)
    }

    /// Ledworks S.r.l. (`3036`)
    @_alwaysEmitIntoClient
    static var ledworks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3036)
    }

    /// Coroflo Limited (`3037`)
    @_alwaysEmitIntoClient
    static var coroflo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3037)
    }

    /// Yale (`3038`)
    @_alwaysEmitIntoClient
    static var yale: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3038)
    }

    /// WINKEY ENTERPRISE (HONG KONG) LIMITED (`3039`)
    @_alwaysEmitIntoClient
    static var winkeyEnterpriseHongKong: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3039)
    }

    /// Koizumi Lighting Technology corp. (`3040`)
    @_alwaysEmitIntoClient
    static var koizumiLightingTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3040)
    }

    /// Back40 Precision (`3041`)
    @_alwaysEmitIntoClient
    static var back40Precision: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3041)
    }

    /// OTC engineering (`3042`)
    @_alwaysEmitIntoClient
    static var otcEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3042)
    }

    /// Comtel Systems Ltd. (`3043`)
    @_alwaysEmitIntoClient
    static var comtelSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3043)
    }

    /// Deepfield Connect GmbH (`3044`)
    @_alwaysEmitIntoClient
    static var deepfieldConnect: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3044)
    }

    /// ZWILLING J.A. Henckels Aktiengesellschaft (`3045`)
    @_alwaysEmitIntoClient
    static var zwillingJAHenckelsAktiengesellschaft: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3045)
    }

    /// Puratap Pty Ltd (`3046`)
    @_alwaysEmitIntoClient
    static var puratap: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3046)
    }

    /// Fresnel Technologies, Inc. (`3047`)
    @_alwaysEmitIntoClient
    static var fresnelTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3047)
    }

    /// Sensormate AG (`3048`)
    @_alwaysEmitIntoClient
    static var sensormate: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3048)
    }

    /// Shindengen Electric Manufacturing Co., Ltd. (`3049`)
    @_alwaysEmitIntoClient
    static var shindengenElectricManufacturing: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3049)
    }

    /// Twenty Five Seven, prodaja in storitve, d.o.o. (`3050`)
    @_alwaysEmitIntoClient
    static var twentyFiveSevenProdajaInStoritve: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3050)
    }

    /// Luna Health, Inc. (`3051`)
    @_alwaysEmitIntoClient
    static var lunaHealth: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3051)
    }

    /// Miracle-Ear, Inc. (`3052`)
    @_alwaysEmitIntoClient
    static var miracleEar: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3052)
    }

    /// CORAL-TAIYI Co. Ltd. (`3053`)
    @_alwaysEmitIntoClient
    static var coralTaiyi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3053)
    }

    /// LINKSYS USA, INC. (`3054`)
    @_alwaysEmitIntoClient
    static var linksys: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3054)
    }

    /// Safetytest GmbH (`3055`)
    @_alwaysEmitIntoClient
    static var safetytest: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3055)
    }

    /// KIDO SPORTS CO., LTD. (`3056`)
    @_alwaysEmitIntoClient
    static var kidoSports: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3056)
    }

    /// Site IQ LLC (`3057`)
    @_alwaysEmitIntoClient
    static var siteIq: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3057)
    }

    /// Angel Medical Systems, Inc. (`3058`)
    @_alwaysEmitIntoClient
    static var angelMedicalSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3058)
    }

    /// PONE BIOMETRICS AS (`3059`)
    @_alwaysEmitIntoClient
    static var poneBiometrics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3059)
    }

    /// ER Lab LLC (`3060`)
    @_alwaysEmitIntoClient
    static var erLab: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3060)
    }

    /// T5 tek, Inc. (`3061`)
    @_alwaysEmitIntoClient
    static var t5Tek: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3061)
    }

    /// greenTEG AG (`3062`)
    @_alwaysEmitIntoClient
    static var greenteg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3062)
    }

    /// Wacker Neuson SE (`3063`)
    @_alwaysEmitIntoClient
    static var wackerNeuson: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3063)
    }

    /// Innovacionnye Resheniya (`3064`)
    @_alwaysEmitIntoClient
    static var innovacionnyeResheniya: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3064)
    }

    /// Alio, Inc (`3065`)
    @_alwaysEmitIntoClient
    static var alio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3065)
    }

    /// CleanBands Systems Ltd. (`3066`)
    @_alwaysEmitIntoClient
    static var cleanbandsSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3066)
    }

    /// Dodam Enersys Co., Ltd (`3067`)
    @_alwaysEmitIntoClient
    static var dodamEnersys: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3067)
    }

    /// T+A elektroakustik GmbH & Co.KG (`3068`)
    @_alwaysEmitIntoClient
    static var tAElektroakustikKg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3068)
    }

    /// Esmé Solutions (`3069`)
    @_alwaysEmitIntoClient
    static var esmeSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3069)
    }

    /// Media-Cartec GmbH (`3070`)
    @_alwaysEmitIntoClient
    static var mediaCartec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3070)
    }

    /// Ratio Electric BV (`3071`)
    @_alwaysEmitIntoClient
    static var ratioElectric: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3071)
    }

    /// MQA Limited (`3072`)
    @_alwaysEmitIntoClient
    static var mqa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3072)
    }

    /// NEOWRK SISTEMAS INTELIGENTES S.A. (`3073`)
    @_alwaysEmitIntoClient
    static var neowrkSistemasInteligentes: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3073)
    }

    /// Loomanet, Inc. (`3074`)
    @_alwaysEmitIntoClient
    static var loomanet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3074)
    }

    /// Puff Corp (`3075`)
    @_alwaysEmitIntoClient
    static var puff: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3075)
    }

    /// Happy Health, Inc. (`3076`)
    @_alwaysEmitIntoClient
    static var happyHealth: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3076)
    }

    /// Montage Connect, Inc. (`3077`)
    @_alwaysEmitIntoClient
    static var montageConnect: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3077)
    }

    /// LED Smart Inc. (`3078`)
    @_alwaysEmitIntoClient
    static var ledSmart: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3078)
    }

    /// CONSTRUKTS, INC. (`3079`)
    @_alwaysEmitIntoClient
    static var construkts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3079)
    }

    /// limited liability company "Red" (`3080`)
    @_alwaysEmitIntoClient
    static var red: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3080)
    }

    /// Senic Inc. (`3081`)
    @_alwaysEmitIntoClient
    static var senic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3081)
    }

    /// Automated Pet Care Products, LLC (`3082`)
    @_alwaysEmitIntoClient
    static var automatedPetCareProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3082)
    }

    /// aconno GmbH (`3083`)
    @_alwaysEmitIntoClient
    static var aconno: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3083)
    }

    /// Mendeltron, Inc. (`3084`)
    @_alwaysEmitIntoClient
    static var mendeltron: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3084)
    }

    /// Mereltron bv (`3085`)
    @_alwaysEmitIntoClient
    static var mereltronBv: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3085)
    }

    /// ALEX DENKO CO.,LTD. (`3086`)
    @_alwaysEmitIntoClient
    static var alexDenko: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3086)
    }

    /// AETERLINK (`3087`)
    @_alwaysEmitIntoClient
    static var aeterlink: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3087)
    }

    /// Cosmed s.r.l. (`3088`)
    @_alwaysEmitIntoClient
    static var cosmed: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3088)
    }

    /// Gordon Murray Design Limited (`3089`)
    @_alwaysEmitIntoClient
    static var gordonMurrayDesign: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3089)
    }

    /// IoSA (`3090`)
    @_alwaysEmitIntoClient
    static var iosa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3090)
    }

    /// Scandinavian Health Limited (`3091`)
    @_alwaysEmitIntoClient
    static var scandinavianHealth: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3091)
    }

    /// Fasetto, Inc. (`3092`)
    @_alwaysEmitIntoClient
    static var fasetto: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3092)
    }

    /// Geva Sol B.V. (`3093`)
    @_alwaysEmitIntoClient
    static var gevaSol: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3093)
    }

    /// TYKEE PTY. LTD. (`3094`)
    @_alwaysEmitIntoClient
    static var tykee: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3094)
    }

    /// SomnoMed Limited (`3095`)
    @_alwaysEmitIntoClient
    static var somnomed: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3095)
    }

    /// CORROHM (`3096`)
    @_alwaysEmitIntoClient
    static var corrohm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3096)
    }

    /// Arlo Technologies, Inc. (`3097`)
    @_alwaysEmitIntoClient
    static var arloTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3097)
    }

    /// Catapult Group International Ltd (`3098`)
    @_alwaysEmitIntoClient
    static var catapultGroupInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3098)
    }

    /// Rockchip Electronics Co., Ltd. (`3099`)
    @_alwaysEmitIntoClient
    static var rockchipElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3099)
    }

    /// GEMU (`3100`)
    @_alwaysEmitIntoClient
    static var gemu: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3100)
    }

    /// OFF Line Japan Co., Ltd. (`3101`)
    @_alwaysEmitIntoClient
    static var offLineJapan: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3101)
    }

    /// EC sense co., Ltd (`3102`)
    @_alwaysEmitIntoClient
    static var ecSense: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3102)
    }

    /// LVI Co. (`3103`)
    @_alwaysEmitIntoClient
    static var lvi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3103)
    }

    /// COMELIT GROUP S.P.A. (`3104`)
    @_alwaysEmitIntoClient
    static var comelitGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3104)
    }

    /// Foshan Viomi Electrical Technology Co., Ltd (`3105`)
    @_alwaysEmitIntoClient
    static var foshanViomiElectricalTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3105)
    }

    /// Glamo Inc. (`3106`)
    @_alwaysEmitIntoClient
    static var glamo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3106)
    }

    /// KEYTEC,Inc. (`3107`)
    @_alwaysEmitIntoClient
    static var keytec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3107)
    }

    /// SMARTD TECHNOLOGIES INC. (`3108`)
    @_alwaysEmitIntoClient
    static var smartdTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3108)
    }

    /// JURA Elektroapparate AG (`3109`)
    @_alwaysEmitIntoClient
    static var juraElektroapparate: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3109)
    }

    /// Performance Electronics, Ltd. (`3110`)
    @_alwaysEmitIntoClient
    static var performanceElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3110)
    }

    /// Pal Electronics (`3111`)
    @_alwaysEmitIntoClient
    static var palElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3111)
    }

    /// Embecta Corp. (`3112`)
    @_alwaysEmitIntoClient
    static var embecta: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3112)
    }

    /// DENSO AIRCOOL CORPORATION (`3113`)
    @_alwaysEmitIntoClient
    static var densoAircool: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3113)
    }

    /// Caresix Inc. (`3114`)
    @_alwaysEmitIntoClient
    static var caresix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3114)
    }

    /// GigaDevice Semiconductor Inc. (`3115`)
    @_alwaysEmitIntoClient
    static var gigadeviceSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3115)
    }

    /// Zeku Technology (Shanghai) Corp., Ltd. (`3116`)
    @_alwaysEmitIntoClient
    static var zekuTechnologyShanghai: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3116)
    }

    /// OTF Product Sourcing, LLC (`3117`)
    @_alwaysEmitIntoClient
    static var otfProductSourcing: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3117)
    }

    /// Easee AS (`3118`)
    @_alwaysEmitIntoClient
    static var easee: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3118)
    }

    /// BEEHERO, INC. (`3119`)
    @_alwaysEmitIntoClient
    static var beehero: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3119)
    }

    /// McIntosh Group Inc (`3120`)
    @_alwaysEmitIntoClient
    static var mcintoshGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3120)
    }

    /// KINDOO LLP (`3121`)
    @_alwaysEmitIntoClient
    static var kindooLlp: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3121)
    }

    /// Xian Yisuobao Electronic Technology Co., Ltd. (`3122`)
    @_alwaysEmitIntoClient
    static var xianYisuobaoElectronicTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3122)
    }

    /// Exeger Operations AB (`3123`)
    @_alwaysEmitIntoClient
    static var exegerOperations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3123)
    }

    /// BYD Company Limited (`3124`)
    @_alwaysEmitIntoClient
    static var byd: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3124)
    }

    /// Thermokon-Sensortechnik GmbH (`3125`)
    @_alwaysEmitIntoClient
    static var thermokonSensortechnik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3125)
    }

    /// Cosmicnode BV (`3126`)
    @_alwaysEmitIntoClient
    static var cosmicnode: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3126)
    }

    /// SignalQuest, LLC (`3127`)
    @_alwaysEmitIntoClient
    static var signalquest: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3127)
    }

    /// Noritz Corporation. (`3128`)
    @_alwaysEmitIntoClient
    static var noritz: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3128)
    }

    /// TIGER CORPORATION (`3129`)
    @_alwaysEmitIntoClient
    static var tiger: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3129)
    }

    /// Equinosis, LLC (`3130`)
    @_alwaysEmitIntoClient
    static var equinosis: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3130)
    }

    /// ORB Innovations Ltd (`3131`)
    @_alwaysEmitIntoClient
    static var orbInnovations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3131)
    }

    /// Classified Cycling (`3132`)
    @_alwaysEmitIntoClient
    static var classifiedCycling: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3132)
    }

    /// Wrmth Corp. (`3133`)
    @_alwaysEmitIntoClient
    static var wrmth: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3133)
    }

    /// BELLDESIGN Inc. (`3134`)
    @_alwaysEmitIntoClient
    static var belldesign: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3134)
    }

    /// Stinger Equipment, Inc. (`3135`)
    @_alwaysEmitIntoClient
    static var stingerEquipment: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3135)
    }

    /// HORIBA, Ltd. (`3136`)
    @_alwaysEmitIntoClient
    static var horiba: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3136)
    }

    /// Control Solutions LLC (`3137`)
    @_alwaysEmitIntoClient
    static var controlSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3137)
    }

    /// Heath Consultants Inc. (`3138`)
    @_alwaysEmitIntoClient
    static var heathConsultants: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3138)
    }

    /// Berlinger & Co. AG (`3139`)
    @_alwaysEmitIntoClient
    static var berlinger: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3139)
    }

    /// ONCELABS LLC (`3140`)
    @_alwaysEmitIntoClient
    static var oncelabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3140)
    }

    /// Brose Verwaltung SE, Bamberg (`3141`)
    @_alwaysEmitIntoClient
    static var broseVerwaltungSeBamberg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3141)
    }

    /// Granwin IoT Technology (Guangzhou) Co.,Ltd (`3142`)
    @_alwaysEmitIntoClient
    static var granwinIotTechnologyGuangzhou: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3142)
    }

    /// Epsilon Electronics,lnc (`3143`)
    @_alwaysEmitIntoClient
    static var epsilonElectronicsLnc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3143)
    }

    /// VALEO MANAGEMENT SERVICES (`3144`)
    @_alwaysEmitIntoClient
    static var valeoManagementServices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3144)
    }

    /// twopounds gmbh (`3145`)
    @_alwaysEmitIntoClient
    static var twopounds: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3145)
    }

    /// atSpiro ApS (`3146`)
    @_alwaysEmitIntoClient
    static var atspiro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3146)
    }

    /// ADTRAN, Inc. (`3147`)
    @_alwaysEmitIntoClient
    static var adtran: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3147)
    }

    /// Orpyx Medical Technologies Inc. (`3148`)
    @_alwaysEmitIntoClient
    static var orpyxMedicalTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3148)
    }

    /// Seekwave Technology Co.,ltd. (`3149`)
    @_alwaysEmitIntoClient
    static var seekwaveTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3149)
    }

    /// Tactile Engineering, Inc. (`3150`)
    @_alwaysEmitIntoClient
    static var tactileEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3150)
    }

    /// SharkNinja Operating LLC (`3151`)
    @_alwaysEmitIntoClient
    static var sharkninjaOperating: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3151)
    }

    /// Imostar Technologies Inc. (`3152`)
    @_alwaysEmitIntoClient
    static var imostarTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3152)
    }

    /// INNOVA S.R.L. (`3153`)
    @_alwaysEmitIntoClient
    static var innova: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3153)
    }

    /// ESCEA LIMITED (`3154`)
    @_alwaysEmitIntoClient
    static var escea: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3154)
    }

    /// Taco, Inc. (`3155`)
    @_alwaysEmitIntoClient
    static var taco: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3155)
    }

    /// HiViz Lighting, Inc. (`3156`)
    @_alwaysEmitIntoClient
    static var hivizLighting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3156)
    }

    /// Zintouch B.V. (`3157`)
    @_alwaysEmitIntoClient
    static var zintouch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3157)
    }

    /// Rheem Sales Company, Inc. (`3158`)
    @_alwaysEmitIntoClient
    static var rheemSales: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3158)
    }

    /// UNEEG medical A/S (`3159`)
    @_alwaysEmitIntoClient
    static var uneegMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3159)
    }

    /// Hykso Inc. (`3160`)
    @_alwaysEmitIntoClient
    static var hykso: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3160)
    }

    /// CYBERDYNE Inc. (`3161`)
    @_alwaysEmitIntoClient
    static var cyberdyne: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3161)
    }

    /// Lockswitch Sdn Bhd (`3162`)
    @_alwaysEmitIntoClient
    static var lockswitch: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3162)
    }

    /// Alban Giacomo S.P.A. (`3163`)
    @_alwaysEmitIntoClient
    static var albanGiacomo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3163)
    }

    /// MGM WIRELESSS HOLDINGS PTY LTD (`3164`)
    @_alwaysEmitIntoClient
    static var mgmWirelesssHoldings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3164)
    }

    /// StepUp Solutions ApS (`3165`)
    @_alwaysEmitIntoClient
    static var stepupSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3165)
    }

    /// BlueID GmbH (`3166`)
    @_alwaysEmitIntoClient
    static var blueid: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3166)
    }

    /// Wuxi Linkpower Microelectronics Co.,Ltd (`3167`)
    @_alwaysEmitIntoClient
    static var wuxiLinkpowerMicroelectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3167)
    }

    /// KEBA Energy Automation GmbH (`3168`)
    @_alwaysEmitIntoClient
    static var kebaEnergyAutomation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3168)
    }

    /// NNOXX, Inc (`3169`)
    @_alwaysEmitIntoClient
    static var nnoxx: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3169)
    }

    /// Phiaton Corporation (`3170`)
    @_alwaysEmitIntoClient
    static var phiaton: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3170)
    }

    /// phg Peter Hengstler GmbH + Co. KG (`3171`)
    @_alwaysEmitIntoClient
    static var phgPeterHengstlerKg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3171)
    }

    /// dormakaba Holding AG (`3172`)
    @_alwaysEmitIntoClient
    static var dormakabaHolding: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3172)
    }

    /// WAKO CO,.LTD (`3173`)
    @_alwaysEmitIntoClient
    static var wakoCoLtd: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3173)
    }

    /// DEN Smart Home B.V. (`3174`)
    @_alwaysEmitIntoClient
    static var denSmartHome: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3174)
    }

    /// TRACKTING S.R.L. (`3175`)
    @_alwaysEmitIntoClient
    static var trackting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3175)
    }

    /// Emerja Corporation (`3176`)
    @_alwaysEmitIntoClient
    static var emerja: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3176)
    }

    /// BLITZ electric motors. LTD (`3177`)
    @_alwaysEmitIntoClient
    static var blitzElectricMotors: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3177)
    }

    /// CONSORCIO TRUST CONTROL - NETTEL (`3178`)
    @_alwaysEmitIntoClient
    static var consorcioTrustControlNettel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3178)
    }

    /// GILSON SAS (`3179`)
    @_alwaysEmitIntoClient
    static var gilsons: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3179)
    }

    /// SNIFF LOGIC LTD (`3180`)
    @_alwaysEmitIntoClient
    static var sniffLogic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3180)
    }

    /// Fidure Corp. (`3181`)
    @_alwaysEmitIntoClient
    static var fidure: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3181)
    }

    /// Sensa LLC (`3182`)
    @_alwaysEmitIntoClient
    static var sensa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3182)
    }

    /// Parakey AB (`3183`)
    @_alwaysEmitIntoClient
    static var parakey: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3183)
    }

    /// SCARAB SOLUTIONS LTD (`3184`)
    @_alwaysEmitIntoClient
    static var scarabSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3184)
    }

    /// BitGreen Technolabz (OPC) Private Limited (`3185`)
    @_alwaysEmitIntoClient
    static var bitgreenTechnolabzOpc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3185)
    }

    /// StreetCar ORV, LLC (`3186`)
    @_alwaysEmitIntoClient
    static var streetcarOrv: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3186)
    }

    /// Truma Gerätetechnik GmbH & Co. KG (`3187`)
    @_alwaysEmitIntoClient
    static var trumaGeratetechnik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3187)
    }

    /// yupiteru (`3188`)
    @_alwaysEmitIntoClient
    static var yupiteru: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3188)
    }

    /// Embedded Engineering Solutions LLC (`3189`)
    @_alwaysEmitIntoClient
    static var embeddedEngineeringSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3189)
    }

    /// Shenzhen Gwell Times Technology Co. , Ltd (`3190`)
    @_alwaysEmitIntoClient
    static var shenzhenGwellTimesTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3190)
    }

    /// TEAC Corporation (`3191`)
    @_alwaysEmitIntoClient
    static var teac: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3191)
    }

    /// CHARGTRON IOT PRIVATE LIMITED (`3192`)
    @_alwaysEmitIntoClient
    static var chargtronIot: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3192)
    }

    /// Zhuhai Smartlink Technology Co., Ltd (`3193`)
    @_alwaysEmitIntoClient
    static var zhuhaiSmartlinkTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3193)
    }

    /// Triductor Technology (Suzhou), Inc. (`3194`)
    @_alwaysEmitIntoClient
    static var triductorTechnologySuzhou: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3194)
    }

    /// PT SADAMAYA GRAHA TEKNOLOGI (`3195`)
    @_alwaysEmitIntoClient
    static var ptdamayaGrahaTeknologi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3195)
    }

    /// Mopeka Products LLC (`3196`)
    @_alwaysEmitIntoClient
    static var mopekaProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3196)
    }

    /// 3ALogics, Inc. (`3197`)
    @_alwaysEmitIntoClient
    static var company3Alogics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3197)
    }

    /// BOOMING OF THINGS (`3198`)
    @_alwaysEmitIntoClient
    static var boomingOfThings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3198)
    }

    /// Rochester Sensors, LLC (`3199`)
    @_alwaysEmitIntoClient
    static var rochesterSensors: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3199)
    }

    /// CARDIOID - TECHNOLOGIES, LDA (`3200`)
    @_alwaysEmitIntoClient
    static var cardioidTechnologiesLda: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3200)
    }

    /// Carrier Corporation (`3201`)
    @_alwaysEmitIntoClient
    static var carrier: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3201)
    }

    /// NACON (`3202`)
    @_alwaysEmitIntoClient
    static var nacon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3202)
    }

    /// Watchdog Systems LLC (`3203`)
    @_alwaysEmitIntoClient
    static var watchdogSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3203)
    }

    /// MAXON INDUSTRIES, INC. (`3204`)
    @_alwaysEmitIntoClient
    static var maxonIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3204)
    }

    /// Amlogic, Inc. (`3205`)
    @_alwaysEmitIntoClient
    static var amlogic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3205)
    }

    /// Qingdao Eastsoft Communication Technology Co.,Ltd (`3206`)
    @_alwaysEmitIntoClient
    static var qingdaoEastsoftCommunicationTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3206)
    }

    /// Weltek Technologies Company Limited (`3207`)
    @_alwaysEmitIntoClient
    static var weltekTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3207)
    }

    /// Nextivity Inc. (`3208`)
    @_alwaysEmitIntoClient
    static var nextivity: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3208)
    }

    /// AGZZX OPTOELECTRONICS TECHNOLOGY CO., LTD (`3209`)
    @_alwaysEmitIntoClient
    static var agzzxOptoelectronicsTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3209)
    }

    /// A.GLOBAL co.,Ltd. (`3210`)
    @_alwaysEmitIntoClient
    static var aGlobal: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3210)
    }

    /// Heavys Inc (`3211`)
    @_alwaysEmitIntoClient
    static var heavys: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3211)
    }

    /// T-Mobile USA (`3212`)
    @_alwaysEmitIntoClient
    static var tMobileUsa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3212)
    }

    /// tonies GmbH (`3213`)
    @_alwaysEmitIntoClient
    static var tonies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3213)
    }

    /// Technocon Engineering Ltd. (`3214`)
    @_alwaysEmitIntoClient
    static var technoconEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3214)
    }

    /// Radar Automobile Sales(Shandong)Co.,Ltd. (`3215`)
    @_alwaysEmitIntoClient
    static var radarAutomobileSalesShandong: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3215)
    }

    /// WESCO AG (`3216`)
    @_alwaysEmitIntoClient
    static var wesco: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3216)
    }

    /// Yashu Systems (`3217`)
    @_alwaysEmitIntoClient
    static var yashuSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3217)
    }

    /// Kesseböhmer Ergonomietechnik GmbH (`3218`)
    @_alwaysEmitIntoClient
    static var kessebohmerErgonomietechnik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3218)
    }

    /// Movesense Oy (`3219`)
    @_alwaysEmitIntoClient
    static var movesense: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3219)
    }

    /// Baxter Healthcare Corporation (`3220`)
    @_alwaysEmitIntoClient
    static var baxterHealthcare: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3220)
    }

    /// Gemstone Lights Canada Ltd. (`3221`)
    @_alwaysEmitIntoClient
    static var gemstoneLightsCanada: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3221)
    }

    /// H+B Hightech GmbH (`3222`)
    @_alwaysEmitIntoClient
    static var hBHightech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3222)
    }

    /// Deako (`3223`)
    @_alwaysEmitIntoClient
    static var deako: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3223)
    }

    /// MiX Telematics International (PTY) LTD (`3224`)
    @_alwaysEmitIntoClient
    static var mixTelematicsInternationalPty: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3224)
    }

    /// Vire Health Oy (`3225`)
    @_alwaysEmitIntoClient
    static var vireHealth: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3225)
    }

    /// ALF Inc. (`3226`)
    @_alwaysEmitIntoClient
    static var alf: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3226)
    }

    /// NTT sonority, Inc. (`3227`)
    @_alwaysEmitIntoClient
    static var nttSonority: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3227)
    }

    /// Sunstone-RTLS Ipari Szolgaltato Korlatolt Felelossegu Tarsasag (`3228`)
    @_alwaysEmitIntoClient
    static var sunstoneRtlsIpariSzolgaltatoKorlatoltFelelosseguTarsasag: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3228)
    }

    /// Ribbiot, INC. (`3229`)
    @_alwaysEmitIntoClient
    static var ribbiot: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3229)
    }

    /// ECCEL CORPORATION SAS (`3230`)
    @_alwaysEmitIntoClient
    static var eccels: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3230)
    }

    /// Dragonfly Energy Corp. (`3231`)
    @_alwaysEmitIntoClient
    static var dragonflyEnergy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3231)
    }

    /// BIGBEN (`3232`)
    @_alwaysEmitIntoClient
    static var bigben: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3232)
    }

    /// YAMAHA MOTOR CO.,LTD. (`3233`)
    @_alwaysEmitIntoClient
    static var yamahaMotor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3233)
    }

    /// XSENSE LTD (`3234`)
    @_alwaysEmitIntoClient
    static var xsense: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3234)
    }

    /// MAQUET GmbH (`3235`)
    @_alwaysEmitIntoClient
    static var maquet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3235)
    }

    /// MITSUBISHI ELECTRIC LIGHTING CO, LTD (`3236`)
    @_alwaysEmitIntoClient
    static var mitsubishiElectricLighting: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3236)
    }

    /// Princess Cruise Lines, Ltd. (`3237`)
    @_alwaysEmitIntoClient
    static var princessCruiseLines: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3237)
    }

    /// Megger Ltd (`3238`)
    @_alwaysEmitIntoClient
    static var megger: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3238)
    }

    /// Verve InfoTec Pty Ltd (`3239`)
    @_alwaysEmitIntoClient
    static var verveInfotec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3239)
    }

    /// Sonas, Inc. (`3240`)
    @_alwaysEmitIntoClient
    static var sonas: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3240)
    }

    /// Mievo Technologies Private Limited (`3241`)
    @_alwaysEmitIntoClient
    static var mievoTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3241)
    }

    /// Shenzhen Poseidon Network Technology Co., Ltd (`3242`)
    @_alwaysEmitIntoClient
    static var shenzhenPoseidonNetworkTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3242)
    }

    /// HERUTU ELECTRONICS CORPORATION (`3243`)
    @_alwaysEmitIntoClient
    static var herutuElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3243)
    }

    /// Shenzhen Shokz Co.,Ltd. (`3244`)
    @_alwaysEmitIntoClient
    static var shenzhenShokz: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3244)
    }

    /// Shenzhen Openhearing Tech CO., LTD . (`3245`)
    @_alwaysEmitIntoClient
    static var shenzhenOpenhearingTech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3245)
    }

    /// Evident Corporation (`3246`)
    @_alwaysEmitIntoClient
    static var evident: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3246)
    }

    /// NEURINNOV (`3247`)
    @_alwaysEmitIntoClient
    static var neurinnov: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3247)
    }

    /// SwipeSense, Inc. (`3248`)
    @_alwaysEmitIntoClient
    static var swipesense: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3248)
    }

    /// RF Creations (`3249`)
    @_alwaysEmitIntoClient
    static var rfCreations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3249)
    }

    /// SHINKAWA Sensor Technology, Inc. (`3250`)
    @_alwaysEmitIntoClient
    static var shinkawaSensorTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3250)
    }

    /// janova GmbH (`3251`)
    @_alwaysEmitIntoClient
    static var janova: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3251)
    }

    /// Eberspaecher Climate Control Systems GmbH (`3252`)
    @_alwaysEmitIntoClient
    static var eberspaecherClimateControlSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3252)
    }

    /// Racketry, d. o. o. (`3253`)
    @_alwaysEmitIntoClient
    static var racketryDOO: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3253)
    }

    /// THE EELECTRIC MACARON LLC (`3254`)
    @_alwaysEmitIntoClient
    static var eelectricMacaron: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3254)
    }

    /// Cucumber Lighting Controls Limited (`3255`)
    @_alwaysEmitIntoClient
    static var cucumberLightingControls: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3255)
    }

    /// Shanghai Proxy Network Technology Co., Ltd. (`3256`)
    @_alwaysEmitIntoClient
    static var shanghaiProxyNetworkTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3256)
    }

    /// seca GmbH & Co. KG (`3257`)
    @_alwaysEmitIntoClient
    static var seca: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3257)
    }

    /// Ameso Tech (OPC) Private Limited (`3258`)
    @_alwaysEmitIntoClient
    static var amesoTechOpc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3258)
    }

    /// Emlid Tech Kft. (`3259`)
    @_alwaysEmitIntoClient
    static var emlidTech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3259)
    }

    /// TROX GmbH (`3260`)
    @_alwaysEmitIntoClient
    static var trox: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3260)
    }

    /// Pricer AB (`3261`)
    @_alwaysEmitIntoClient
    static var pricer: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3261)
    }

    /// Forward Thinking Systems LLC. (`3263`)
    @_alwaysEmitIntoClient
    static var forwardThinkingSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3263)
    }

    /// Garnet Instruments Ltd. (`3264`)
    @_alwaysEmitIntoClient
    static var garnetInstruments: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3264)
    }

    /// CLEIO Inc. (`3265`)
    @_alwaysEmitIntoClient
    static var cleio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3265)
    }

    /// Anker Innovations Limited (`3266`)
    @_alwaysEmitIntoClient
    static var ankerInnovations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3266)
    }

    /// HMD Global Oy (`3267`)
    @_alwaysEmitIntoClient
    static var hmdGlobal: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3267)
    }

    /// ABUS August Bremicker Soehne Kommanditgesellschaft (`3268`)
    @_alwaysEmitIntoClient
    static var abusAugustBremickerSoehneKommanditgesellschaft: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3268)
    }

    /// Open Road Solutions, Inc. (`3269`)
    @_alwaysEmitIntoClient
    static var openRoadSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3269)
    }

    /// Serial Technology Corporation (`3270`)
    @_alwaysEmitIntoClient
    static var serialTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3270)
    }

    /// SB C&S Corp. (`3271`)
    @_alwaysEmitIntoClient
    static var sbCS: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3271)
    }

    /// TrikThom (`3272`)
    @_alwaysEmitIntoClient
    static var trikthom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3272)
    }

    /// Innocent Technology Co., Ltd. (`3273`)
    @_alwaysEmitIntoClient
    static var innocentTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3273)
    }

    /// Cyclops Marine Ltd (`3274`)
    @_alwaysEmitIntoClient
    static var cyclopsMarine: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3274)
    }

    /// NOTHING TECHNOLOGY LIMITED (`3275`)
    @_alwaysEmitIntoClient
    static var nothingTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3275)
    }

    /// Kord Defence Pty Ltd (`3276`)
    @_alwaysEmitIntoClient
    static var kordDefence: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3276)
    }

    /// YanFeng Visteon(Chongqing) Automotive Electronic Co.,Ltd (`3277`)
    @_alwaysEmitIntoClient
    static var yanfengVisteonChongqingAutomotiveElectronic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3277)
    }

    /// SENOSPACE LLC (`3278`)
    @_alwaysEmitIntoClient
    static var senospace: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3278)
    }

    /// Shenzhen CESI Information Technology Co., Ltd. (`3279`)
    @_alwaysEmitIntoClient
    static var shenzhenCesiInformationTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3279)
    }

    /// MooreSilicon Semiconductor Technology (Shanghai) Co., LTD. (`3280`)
    @_alwaysEmitIntoClient
    static var mooresiliconSemiconductorTechnologyShanghai: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3280)
    }

    /// Imagine Marketing Limited (`3281`)
    @_alwaysEmitIntoClient
    static var imagineMarketing: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3281)
    }

    /// EQOM SSC B.V. (`3282`)
    @_alwaysEmitIntoClient
    static var eqomSsc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3282)
    }

    /// TechSwipe (`3283`)
    @_alwaysEmitIntoClient
    static var techswipe: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3283)
    }

    /// Reoqoo IoT Technology Co., Ltd. (`3284`)
    @_alwaysEmitIntoClient
    static var reoqooIotTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3284)
    }

    /// Numa Products, LLC (`3285`)
    @_alwaysEmitIntoClient
    static var numaProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3285)
    }

    /// HHO (Hangzhou) Digital Technology Co., Ltd. (`3286`)
    @_alwaysEmitIntoClient
    static var hhoHangzhouDigitalTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3286)
    }

    /// Maztech Industries, LLC (`3287`)
    @_alwaysEmitIntoClient
    static var maztechIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3287)
    }

    /// SIA Mesh Group (`3288`)
    @_alwaysEmitIntoClient
    static var siaMeshGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3288)
    }

    /// Minami acoustics Limited (`3289`)
    @_alwaysEmitIntoClient
    static var minamiAcoustics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3289)
    }

    /// Wolf Steel ltd (`3290`)
    @_alwaysEmitIntoClient
    static var wolfSteel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3290)
    }

    /// Circus World Displays Limited (`3291`)
    @_alwaysEmitIntoClient
    static var circusWorldDisplays: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3291)
    }

    /// Ypsomed AG (`3292`)
    @_alwaysEmitIntoClient
    static var ypsomed: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3292)
    }

    /// Alif Semiconductor, Inc. (`3293`)
    @_alwaysEmitIntoClient
    static var alifSemiconductor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3293)
    }

    /// RESPONSE TECHNOLOGIES, LTD. (`3294`)
    @_alwaysEmitIntoClient
    static var responseTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3294)
    }

    /// SHENZHEN CHENYUN ELECTRONICS  CO., LTD (`3295`)
    @_alwaysEmitIntoClient
    static var shenzhenChenyunElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3295)
    }

    /// VODALOGIC PTY LTD (`3296`)
    @_alwaysEmitIntoClient
    static var vodalogic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3296)
    }

    /// Regal Beloit America, Inc. (`3297`)
    @_alwaysEmitIntoClient
    static var regalBeloitAmerica: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3297)
    }

    /// CORVENT MEDICAL, INC. (`3298`)
    @_alwaysEmitIntoClient
    static var corventMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3298)
    }

    /// Taiwan Fuhsing (`3299`)
    @_alwaysEmitIntoClient
    static var taiwanFuhsing: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3299)
    }

    /// Off-Highway Powertrain Services Germany GmbH (`3300`)
    @_alwaysEmitIntoClient
    static var offHighwayPowertrainServicesGermany: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3300)
    }

    /// Amina Distribution AS (`3301`)
    @_alwaysEmitIntoClient
    static var aminaDistribution: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3301)
    }

    /// McWong International, Inc. (`3302`)
    @_alwaysEmitIntoClient
    static var mcwongInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3302)
    }

    /// TAG HEUER SA (`3303`)
    @_alwaysEmitIntoClient
    static var tagHeuer: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3303)
    }

    /// Dongguan Yougo Electronics Co.,Ltd. (`3304`)
    @_alwaysEmitIntoClient
    static var dongguanYougoElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3304)
    }

    /// PEAG, LLC dba JLab Audio (`3305`)
    @_alwaysEmitIntoClient
    static var peagDbaJlabAudio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3305)
    }

    /// HAYWARD INDUSTRIES, INC. (`3306`)
    @_alwaysEmitIntoClient
    static var haywardIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3306)
    }

    /// Shenzhen Tingting Technology Co. LTD (`3307`)
    @_alwaysEmitIntoClient
    static var shenzhenTingtingTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3307)
    }

    /// Pacific Coast Fishery Services (2003) Inc. (`3308`)
    @_alwaysEmitIntoClient
    static var pacificCoastFisheryServices2003: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3308)
    }

    /// CV. NURI TEKNIK (`3309`)
    @_alwaysEmitIntoClient
    static var cvNuriTeknik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3309)
    }

    /// MadgeTech, Inc (`3310`)
    @_alwaysEmitIntoClient
    static var madgetech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3310)
    }

    /// POGS B.V. (`3311`)
    @_alwaysEmitIntoClient
    static var pogs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3311)
    }

    /// THOTAKA TEKHNOLOGIES INDIA PRIVATE LIMITED (`3312`)
    @_alwaysEmitIntoClient
    static var thotakaTekhnologiesIndia: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3312)
    }

    /// Midmark (`3313`)
    @_alwaysEmitIntoClient
    static var midmark: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3313)
    }

    /// BestSens AG (`3314`)
    @_alwaysEmitIntoClient
    static var bestsens: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3314)
    }

    /// Radio Sound (`3315`)
    @_alwaysEmitIntoClient
    static var radioSound: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3315)
    }

    /// SOLUX PTY LTD (`3316`)
    @_alwaysEmitIntoClient
    static var solux: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3316)
    }

    /// BOS Balance of Storage Systems AG (`3317`)
    @_alwaysEmitIntoClient
    static var bosBalanceOfStorageSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3317)
    }

    /// OJ Electronics A/S (`3318`)
    @_alwaysEmitIntoClient
    static var ojElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3318)
    }

    /// TVS Motor Company Ltd. (`3319`)
    @_alwaysEmitIntoClient
    static var tvsMotor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3319)
    }

    /// core sensing GmbH (`3320`)
    @_alwaysEmitIntoClient
    static var coreSensing: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3320)
    }

    /// Tamblue Oy (`3321`)
    @_alwaysEmitIntoClient
    static var tamblue: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3321)
    }

    /// Protect Animals With Satellites LLC (`3322`)
    @_alwaysEmitIntoClient
    static var protectAnimalsWithSatellites: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3322)
    }

    /// Tyromotion GmbH (`3323`)
    @_alwaysEmitIntoClient
    static var tyromotion: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3323)
    }

    /// ElectronX design (`3324`)
    @_alwaysEmitIntoClient
    static var electronxDesign: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3324)
    }

    /// Wuhan Woncan Construction Technologies Co., Ltd. (`3325`)
    @_alwaysEmitIntoClient
    static var wuhanWoncanConstructionTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3325)
    }

    /// Thule Group AB (`3326`)
    @_alwaysEmitIntoClient
    static var thuleGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3326)
    }

    /// Ergodriven Inc (`3327`)
    @_alwaysEmitIntoClient
    static var ergodriven: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3327)
    }

    /// Sparkpark AS (`3328`)
    @_alwaysEmitIntoClient
    static var sparkpark: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3328)
    }

    /// KEEPEN (`3329`)
    @_alwaysEmitIntoClient
    static var keepen: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3329)
    }

    /// Rocky Mountain ATV/MC Jake Wilson (`3330`)
    @_alwaysEmitIntoClient
    static var rockyMountainAtvMcJakeWilson: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3330)
    }

    /// MakuSafe Corp (`3331`)
    @_alwaysEmitIntoClient
    static var makusafe: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3331)
    }

    /// Bartec Auto Id Ltd (`3332`)
    @_alwaysEmitIntoClient
    static var bartecAutoId: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3332)
    }

    /// Energy Technology and Control Limited (`3333`)
    @_alwaysEmitIntoClient
    static var energyTechnologyAndControl: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3333)
    }

    /// doubleO Co., Ltd. (`3334`)
    @_alwaysEmitIntoClient
    static var doubleo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3334)
    }

    /// Datalogic S.r.l. (`3335`)
    @_alwaysEmitIntoClient
    static var datalogic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3335)
    }

    /// Datalogic USA, Inc. (`3336`)
    @_alwaysEmitIntoClient
    static var datalogic2: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3336)
    }

    /// Leica Geosystems AG (`3337`)
    @_alwaysEmitIntoClient
    static var leicaGeosystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3337)
    }

    /// CATEYE Co., Ltd. (`3338`)
    @_alwaysEmitIntoClient
    static var cateye: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3338)
    }

    /// Research Products Corporation (`3339`)
    @_alwaysEmitIntoClient
    static var researchProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3339)
    }

    /// Planmeca Oy (`3340`)
    @_alwaysEmitIntoClient
    static var planmeca: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3340)
    }

    /// C.Ed. Schulte GmbH Zylinderschlossfabrik (`3341`)
    @_alwaysEmitIntoClient
    static var cEdSchulteZylinderschlossfabrik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3341)
    }

    /// PetVoice Co., Ltd. (`3342`)
    @_alwaysEmitIntoClient
    static var petvoice: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3342)
    }

    /// Timebirds Australia Pty Ltd (`3343`)
    @_alwaysEmitIntoClient
    static var timebirdsAustralia: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3343)
    }

    /// JVC KENWOOD Corporation (`3344`)
    @_alwaysEmitIntoClient
    static var jvcKenwood: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3344)
    }

    /// Great Dane LLC (`3345`)
    @_alwaysEmitIntoClient
    static var greatDane: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3345)
    }

    /// Spartek Systems Inc. (`3346`)
    @_alwaysEmitIntoClient
    static var spartekSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3346)
    }

    /// MERRY ELECTRONICS CO., LTD. (`3347`)
    @_alwaysEmitIntoClient
    static var merryElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3347)
    }

    /// Merry Electronics (S) Pte Ltd (`3348`)
    @_alwaysEmitIntoClient
    static var merryElectronicsSPte: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3348)
    }

    /// Spark (`3349`)
    @_alwaysEmitIntoClient
    static var spark: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3349)
    }

    /// Nations Technologies Inc. (`3350`)
    @_alwaysEmitIntoClient
    static var nationsTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3350)
    }

    /// Akix S.r.l. (`3351`)
    @_alwaysEmitIntoClient
    static var akix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3351)
    }

    /// Bioliberty Ltd (`3352`)
    @_alwaysEmitIntoClient
    static var bioliberty: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3352)
    }

    /// C.G. Air Systemes Inc. (`3353`)
    @_alwaysEmitIntoClient
    static var cGAirSystemes: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3353)
    }

    /// Maturix ApS (`3354`)
    @_alwaysEmitIntoClient
    static var maturix: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3354)
    }

    /// RACHIO, INC. (`3355`)
    @_alwaysEmitIntoClient
    static var rachio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3355)
    }

    /// LIMBOID LLC (`3356`)
    @_alwaysEmitIntoClient
    static var limboid: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3356)
    }

    /// Electronics4All Inc. (`3357`)
    @_alwaysEmitIntoClient
    static var electronics4All: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3357)
    }

    /// FESTINA LOTUS SA (`3358`)
    @_alwaysEmitIntoClient
    static var festinaLotus: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3358)
    }

    /// Synkopi, Inc. (`3359`)
    @_alwaysEmitIntoClient
    static var synkopi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3359)
    }

    /// SCIENTERRA LIMITED (`3360`)
    @_alwaysEmitIntoClient
    static var scienterra: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3360)
    }

    /// Cennox Group Limited (`3361`)
    @_alwaysEmitIntoClient
    static var cennoxGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3361)
    }

    /// Cedarware, Corp. (`3362`)
    @_alwaysEmitIntoClient
    static var cedarware: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3362)
    }

    /// GREE Electric Appliances, Inc. of Zhuhai (`3363`)
    @_alwaysEmitIntoClient
    static var greeElectricAppliancesOfZhuhai: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3363)
    }

    /// Japan Display Inc. (`3364`)
    @_alwaysEmitIntoClient
    static var japanDisplay: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3364)
    }

    /// System Elite Holdings Group Limited (`3365`)
    @_alwaysEmitIntoClient
    static var systemEliteHoldingsGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3365)
    }

    /// Burkert Werke GmbH & Co. KG (`3366`)
    @_alwaysEmitIntoClient
    static var burkertWerke: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3366)
    }

    /// velocitux (`3367`)
    @_alwaysEmitIntoClient
    static var velocitux: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3367)
    }

    /// FUJITSU COMPONENT LIMITED (`3368`)
    @_alwaysEmitIntoClient
    static var fujitsuComponent: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3368)
    }

    /// MIYAKAWA ELECTRIC WORKS LTD. (`3369`)
    @_alwaysEmitIntoClient
    static var miyakawaElectricWorks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3369)
    }

    /// PhysioLogic Devices, Inc. (`3370`)
    @_alwaysEmitIntoClient
    static var physiologicDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3370)
    }

    /// Sensoryx AG (`3371`)
    @_alwaysEmitIntoClient
    static var sensoryx: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3371)
    }

    /// SIL System Integration Laboratory GmbH (`3372`)
    @_alwaysEmitIntoClient
    static var silSystemIntegrationLaboratory: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3372)
    }

    /// Cooler Pro, LLC (`3373`)
    @_alwaysEmitIntoClient
    static var coolerPro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3373)
    }

    /// Advanced Electronic Applications, Inc (`3374`)
    @_alwaysEmitIntoClient
    static var advancedElectronicApplications: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3374)
    }

    /// Delta Development Team, Inc (`3375`)
    @_alwaysEmitIntoClient
    static var deltaDevelopmentTeam: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3375)
    }

    /// Laxmi Therapeutic Devices, Inc. (`3376`)
    @_alwaysEmitIntoClient
    static var laxmiTherapeuticDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3376)
    }

    /// SYNCHRON, INC. (`3377`)
    @_alwaysEmitIntoClient
    static var synchron: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3377)
    }

    /// Badger Meter (`3378`)
    @_alwaysEmitIntoClient
    static var badgerMeter: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3378)
    }

    /// Micropower Group AB (`3379`)
    @_alwaysEmitIntoClient
    static var micropowerGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3379)
    }

    /// ZILLIOT TECHNOLOGIES PRIVATE LIMITED (`3380`)
    @_alwaysEmitIntoClient
    static var zilliotTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3380)
    }

    /// Universidad Politecnica de Madrid (`3381`)
    @_alwaysEmitIntoClient
    static var universidadPolitecnicaDeMadrid: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3381)
    }

    /// XIHAO INTELLIGENGT TECHNOLOGY CO., LTD (`3382`)
    @_alwaysEmitIntoClient
    static var xihaoIntelligengtTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3382)
    }

    /// Zerene Inc. (`3383`)
    @_alwaysEmitIntoClient
    static var zerene: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3383)
    }

    /// CycLock (`3384`)
    @_alwaysEmitIntoClient
    static var cyclock: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3384)
    }

    /// Systemic Games, LLC (`3385`)
    @_alwaysEmitIntoClient
    static var systemicGames: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3385)
    }

    /// Frost Solutions, LLC (`3386`)
    @_alwaysEmitIntoClient
    static var frostSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3386)
    }

    /// Lone Star Marine Pty Ltd (`3387`)
    @_alwaysEmitIntoClient
    static var loneStarMarine: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3387)
    }

    /// SIRONA Dental Systems GmbH (`3388`)
    @_alwaysEmitIntoClient
    static var sironaDentalSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3388)
    }

    /// bHaptics Inc. (`3389`)
    @_alwaysEmitIntoClient
    static var bhaptics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3389)
    }

    /// LUMINOAH, INC. (`3390`)
    @_alwaysEmitIntoClient
    static var luminoah: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3390)
    }

    /// Vogels Products B.V. (`3391`)
    @_alwaysEmitIntoClient
    static var vogelsProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3391)
    }

    /// SignalFire Telemetry, Inc. (`3392`)
    @_alwaysEmitIntoClient
    static var signalfireTelemetry: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3392)
    }

    /// CPAC Systems AB (`3393`)
    @_alwaysEmitIntoClient
    static var cpacSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3393)
    }

    /// TEKTRO TECHNOLOGY CORPORATION (`3394`)
    @_alwaysEmitIntoClient
    static var tektroTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3394)
    }

    /// Gosuncn Technology Group Co., Ltd. (`3395`)
    @_alwaysEmitIntoClient
    static var gosuncnTechnologyGroup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3395)
    }

    /// Ex Makhina Inc. (`3396`)
    @_alwaysEmitIntoClient
    static var exMakhina: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3396)
    }

    /// Odeon, Inc. (`3397`)
    @_alwaysEmitIntoClient
    static var odeon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3397)
    }

    /// Thales Simulation & Training AG (`3398`)
    @_alwaysEmitIntoClient
    static var thalesSimulationTraining: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3398)
    }

    /// Shenzhen DOKE Electronic Co., Ltd (`3399`)
    @_alwaysEmitIntoClient
    static var shenzhenDokeElectronic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3399)
    }

    /// Vemcon GmbH (`3400`)
    @_alwaysEmitIntoClient
    static var vemcon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3400)
    }

    /// Refrigerated Transport Electronics, Inc. (`3401`)
    @_alwaysEmitIntoClient
    static var refrigeratedTransportElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3401)
    }

    /// Rockpile Solutions, LLC (`3402`)
    @_alwaysEmitIntoClient
    static var rockpileSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3402)
    }

    /// Soundwave Hearing, LLC (`3403`)
    @_alwaysEmitIntoClient
    static var soundwaveHearing: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3403)
    }

    /// IotGizmo Corporation (`3404`)
    @_alwaysEmitIntoClient
    static var iotgizmo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3404)
    }

    /// Optec, LLC (`3405`)
    @_alwaysEmitIntoClient
    static var optec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3405)
    }

    /// NIKAT SOLUTIONS PRIVATE LIMITED (`3406`)
    @_alwaysEmitIntoClient
    static var nikatSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3406)
    }

    /// Movano Inc. (`3407`)
    @_alwaysEmitIntoClient
    static var movano: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3407)
    }

    /// NINGBO FOTILE KITCHENWARE CO., LTD. (`3408`)
    @_alwaysEmitIntoClient
    static var ningboFotileKitchenware: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3408)
    }

    /// Genetus inc. (`3409`)
    @_alwaysEmitIntoClient
    static var genetus: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3409)
    }

    /// DIVAN TRADING CO., LTD. (`3410`)
    @_alwaysEmitIntoClient
    static var divanTrading: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3410)
    }

    /// Luxottica Group S.p.A (`3411`)
    @_alwaysEmitIntoClient
    static var luxotticaGroupSPA: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3411)
    }

    /// ISEKI FRANCE S.A.S (`3412`)
    @_alwaysEmitIntoClient
    static var isekiFrance: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3412)
    }

    /// NO CLIMB PRODUCTS LTD (`3413`)
    @_alwaysEmitIntoClient
    static var noClimbProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3413)
    }

    /// Wellang.Co,.Ltd (`3414`)
    @_alwaysEmitIntoClient
    static var wellangCoLtd: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3414)
    }

    /// Nanjing Xinxiangyuan Microelectronics Co., Ltd. (`3415`)
    @_alwaysEmitIntoClient
    static var nanjingXinxiangyuanMicroelectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3415)
    }

    /// ifm electronic gmbh (`3416`)
    @_alwaysEmitIntoClient
    static var ifmElectronic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3416)
    }

    /// HYUPSUNG MACHINERY ELECTRIC CO., LTD. (`3417`)
    @_alwaysEmitIntoClient
    static var hyupsungMachineryElectric: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3417)
    }

    /// Gunnebo Aktiebolag (`3418`)
    @_alwaysEmitIntoClient
    static var gunneboAktiebolag: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3418)
    }

    /// Axis Communications AB (`3419`)
    @_alwaysEmitIntoClient
    static var axisCommunications: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3419)
    }

    /// Pison Technology, Inc. (`3420`)
    @_alwaysEmitIntoClient
    static var pisonTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3420)
    }

    /// Stogger B.V. (`3421`)
    @_alwaysEmitIntoClient
    static var stogger: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3421)
    }

    /// Pella Corp (`3422`)
    @_alwaysEmitIntoClient
    static var pella: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3422)
    }

    /// SiChuan Homme Intelligent Technology co.,Ltd. (`3423`)
    @_alwaysEmitIntoClient
    static var sichuanHommeIntelligentTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3423)
    }

    /// Smart Products Connection, S.A. (`3424`)
    @_alwaysEmitIntoClient
    static var smartProductsConnection: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3424)
    }

    /// F.I.P. FORMATURA INIEZIONE POLIMERI - S.P.A. (`3425`)
    @_alwaysEmitIntoClient
    static var fIPFormaturaIniezionePolimeri: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3425)
    }

    /// MEBSTER s.r.o. (`3426`)
    @_alwaysEmitIntoClient
    static var mebster: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3426)
    }

    /// SKF France (`3427`)
    @_alwaysEmitIntoClient
    static var skfFrance: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3427)
    }

    /// Southco (`3428`)
    @_alwaysEmitIntoClient
    static var southco: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3428)
    }

    /// Molnlycke Health Care AB (`3429`)
    @_alwaysEmitIntoClient
    static var molnlyckeHealthCare: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3429)
    }

    /// Hendrickson USA , L.L.C (`3430`)
    @_alwaysEmitIntoClient
    static var hendricksonUsaLLC: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3430)
    }

    /// BLACK BOX NETWORK SERVICES INDIA PRIVATE LIMITED (`3431`)
    @_alwaysEmitIntoClient
    static var blackBoxNetworkServicesIndia: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3431)
    }

    /// Status Audio LLC (`3432`)
    @_alwaysEmitIntoClient
    static var statusAudio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3432)
    }

    /// AIR AROMA INTERNATIONAL PTY LTD (`3433`)
    @_alwaysEmitIntoClient
    static var airAromaInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3433)
    }

    /// Helge Kaiser GmbH (`3434`)
    @_alwaysEmitIntoClient
    static var helgeKaiser: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3434)
    }

    /// Crane Payment Innovations, Inc. (`3435`)
    @_alwaysEmitIntoClient
    static var cranePaymentInnovations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3435)
    }

    /// Ambient IoT Pty Ltd (`3436`)
    @_alwaysEmitIntoClient
    static var ambientIot: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3436)
    }

    /// DYNAMOX S/A (`3437`)
    @_alwaysEmitIntoClient
    static var dynamoxSA: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3437)
    }

    /// Look Cycle International (`3438`)
    @_alwaysEmitIntoClient
    static var lookCycleInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3438)
    }

    /// Closed Joint Stock Company NVP BOLID (`3439`)
    @_alwaysEmitIntoClient
    static var nvpBolid: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3439)
    }

    /// Kindhome (`3440`)
    @_alwaysEmitIntoClient
    static var kindhome: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3440)
    }

    /// Kiteras Inc. (`3441`)
    @_alwaysEmitIntoClient
    static var kiteras: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3441)
    }

    /// Earfun Technology (HK) Limited (`3442`)
    @_alwaysEmitIntoClient
    static var earfunTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3442)
    }

    /// iota Biosciences, Inc. (`3443`)
    @_alwaysEmitIntoClient
    static var iotaBiosciences: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3443)
    }

    /// ANUME s.r.o. (`3444`)
    @_alwaysEmitIntoClient
    static var anume: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3444)
    }

    /// Indistinguishable From Magic, Inc. (`3445`)
    @_alwaysEmitIntoClient
    static var indistinguishableFromMagic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3445)
    }

    /// i-focus Co.,Ltd (`3446`)
    @_alwaysEmitIntoClient
    static var iFocus: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3446)
    }

    /// DualNetworks SA (`3447`)
    @_alwaysEmitIntoClient
    static var dualnetworks: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3447)
    }

    /// MITACHI CO.,LTD. (`3448`)
    @_alwaysEmitIntoClient
    static var mitachi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3448)
    }

    /// VIVIWARE JAPAN, Inc. (`3449`)
    @_alwaysEmitIntoClient
    static var viviwareJapan: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3449)
    }

    /// Xiamen Intretech Inc. (`3450`)
    @_alwaysEmitIntoClient
    static var xiamenIntretech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3450)
    }

    /// MindMaze SA (`3451`)
    @_alwaysEmitIntoClient
    static var mindmaze: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3451)
    }

    /// BeiJing SmartChip Microelectronics Technology Co.,Ltd (`3452`)
    @_alwaysEmitIntoClient
    static var beijingSmartchipMicroelectronicsTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3452)
    }

    /// Taiko Audio B.V. (`3453`)
    @_alwaysEmitIntoClient
    static var taikoAudio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3453)
    }

    /// Daihatsu Motor Co., Ltd. (`3454`)
    @_alwaysEmitIntoClient
    static var daihatsuMotor: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3454)
    }

    /// Konova (`3455`)
    @_alwaysEmitIntoClient
    static var konova: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3455)
    }

    /// Gravaa B.V. (`3456`)
    @_alwaysEmitIntoClient
    static var gravaa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3456)
    }

    /// Beyerdynamic GmbH & Co. KG (`3457`)
    @_alwaysEmitIntoClient
    static var beyerdynamic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3457)
    }

    /// VELCO (`3458`)
    @_alwaysEmitIntoClient
    static var velco: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3458)
    }

    /// ATLANTIC SOCIETE FRANCAISE DE DEVELOPPEMENT THERMIQUE (`3459`)
    @_alwaysEmitIntoClient
    static var atlanticSocieteFrancaiseDeDeveloppementThermique: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3459)
    }

    /// Testo SE & Co. KGaA (`3460`)
    @_alwaysEmitIntoClient
    static var testoSeKgaa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3460)
    }

    /// SEW-EURODRIVE GmbH & Co KG (`3461`)
    @_alwaysEmitIntoClient
    static var sewEurodrive: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3461)
    }

    /// ROCKWELL AUTOMATION, INC. (`3462`)
    @_alwaysEmitIntoClient
    static var rockwellAutomation: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3462)
    }

    /// Quectel Wireless Solutions Co., Ltd. (`3463`)
    @_alwaysEmitIntoClient
    static var quectelWirelessSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3463)
    }

    /// Geocene Inc. (`3464`)
    @_alwaysEmitIntoClient
    static var geocene: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3464)
    }

    /// Nanohex Corp (`3465`)
    @_alwaysEmitIntoClient
    static var nanohex: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3465)
    }

    /// Simply Embedded Inc. (`3466`)
    @_alwaysEmitIntoClient
    static var simplyEmbedded: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3466)
    }

    /// Software Development, LLC (`3467`)
    @_alwaysEmitIntoClient
    static var softwareDevelopment: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3467)
    }

    /// Ultimea Technology (Shenzhen) Limited (`3468`)
    @_alwaysEmitIntoClient
    static var ultimeaTechnologyShenzhen: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3468)
    }

    /// RF Electronics Limited (`3469`)
    @_alwaysEmitIntoClient
    static var rfElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3469)
    }

    /// Optivolt Labs, Inc. (`3470`)
    @_alwaysEmitIntoClient
    static var optivoltLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3470)
    }

    /// Canon Electronics Inc. (`3471`)
    @_alwaysEmitIntoClient
    static var canonElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3471)
    }

    /// LAAS ApS (`3472`)
    @_alwaysEmitIntoClient
    static var laas: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3472)
    }

    /// Beamex Oy Ab (`3473`)
    @_alwaysEmitIntoClient
    static var beamexAb: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3473)
    }

    /// TACHIKAWA CORPORATION (`3474`)
    @_alwaysEmitIntoClient
    static var tachikawa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3474)
    }

    /// HagerEnergy GmbH (`3475`)
    @_alwaysEmitIntoClient
    static var hagerenergy: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3475)
    }

    /// Shrooly Inc (`3476`)
    @_alwaysEmitIntoClient
    static var shrooly: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3476)
    }

    /// Hunter Industries Incorporated (`3477`)
    @_alwaysEmitIntoClient
    static var hunterIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3477)
    }

    /// NEOKOHM SISTEMAS ELETRONICOS LTDA (`3478`)
    @_alwaysEmitIntoClient
    static var neokohmSistemasEletronicos: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3478)
    }

    /// Zhejiang Huanfu Technology Co., LTD (`3479`)
    @_alwaysEmitIntoClient
    static var zhejiangHuanfuTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3479)
    }

    /// E.F. Johnson Company (`3480`)
    @_alwaysEmitIntoClient
    static var eFJohnson: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3480)
    }

    /// Caire Inc. (`3481`)
    @_alwaysEmitIntoClient
    static var caire: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3481)
    }

    /// Yeasound (Xiamen) Hearing Technology Co., Ltd (`3482`)
    @_alwaysEmitIntoClient
    static var yeasoundXiamenHearingTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3482)
    }

    /// Boxyz, Inc. (`3483`)
    @_alwaysEmitIntoClient
    static var boxyz: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3483)
    }

    /// Skytech Creations Limited (`3484`)
    @_alwaysEmitIntoClient
    static var skytechCreations: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3484)
    }

    /// Cear, Inc. (`3485`)
    @_alwaysEmitIntoClient
    static var cear: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3485)
    }

    /// Impulse Wellness LLC (`3486`)
    @_alwaysEmitIntoClient
    static var impulseWellness: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3486)
    }

    /// MML US, Inc (`3487`)
    @_alwaysEmitIntoClient
    static var mmlUs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3487)
    }

    /// SICK AG (`3488`)
    @_alwaysEmitIntoClient
    static var sick: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3488)
    }

    /// Fen Systems Ltd. (`3489`)
    @_alwaysEmitIntoClient
    static var fenSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3489)
    }

    /// KIWI.KI GmbH (`3490`)
    @_alwaysEmitIntoClient
    static var kiwiKi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3490)
    }

    /// Airgraft Inc. (`3491`)
    @_alwaysEmitIntoClient
    static var airgraft: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3491)
    }

    /// HP Tuners (`3492`)
    @_alwaysEmitIntoClient
    static var hpTuners: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3492)
    }

    /// PIXELA CORPORATION (`3493`)
    @_alwaysEmitIntoClient
    static var pixela: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3493)
    }

    /// Generac Corporation (`3494`)
    @_alwaysEmitIntoClient
    static var generac: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3494)
    }

    /// Novoferm tormatic GmbH (`3495`)
    @_alwaysEmitIntoClient
    static var novofermTormatic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3495)
    }

    /// Airwallet ApS (`3496`)
    @_alwaysEmitIntoClient
    static var airwallet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3496)
    }

    /// Inventronics GmbH (`3497`)
    @_alwaysEmitIntoClient
    static var inventronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3497)
    }

    /// Shenzhen EBELONG Technology Co., Ltd. (`3498`)
    @_alwaysEmitIntoClient
    static var shenzhenEbelongTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3498)
    }

    /// Efento (`3499`)
    @_alwaysEmitIntoClient
    static var efento: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3499)
    }

    /// ITALTRACTOR ITM S.P.A. (`3500`)
    @_alwaysEmitIntoClient
    static var italtractorItm: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3500)
    }

    /// linktop (`3501`)
    @_alwaysEmitIntoClient
    static var linktop: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3501)
    }

    /// TITUM AUDIO, INC. (`3502`)
    @_alwaysEmitIntoClient
    static var titumAudio: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3502)
    }

    /// Hexagon Aura Reality AG (`3503`)
    @_alwaysEmitIntoClient
    static var hexagonAuraReality: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3503)
    }

    /// Invisalert Solutions, Inc. (`3504`)
    @_alwaysEmitIntoClient
    static var invisalertSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3504)
    }

    /// TELE System Communications Pte. Ltd. (`3505`)
    @_alwaysEmitIntoClient
    static var teleSystemCommunicationsPte: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3505)
    }

    /// Whirlpool (`3506`)
    @_alwaysEmitIntoClient
    static var whirlpool: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3506)
    }

    /// SHENZHEN REFLYING ELECTRONIC CO., LTD (`3507`)
    @_alwaysEmitIntoClient
    static var shenzhenReflyingElectronic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3507)
    }

    /// Franklin Control Systems (`3508`)
    @_alwaysEmitIntoClient
    static var franklinControlSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3508)
    }

    /// Djup AB (`3509`)
    @_alwaysEmitIntoClient
    static var djup: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3509)
    }

    /// SAFEGUARD EQUIPMENT, INC. (`3510`)
    @_alwaysEmitIntoClient
    static var safeguardEquipment: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3510)
    }

    /// Morningstar Corporation (`3511`)
    @_alwaysEmitIntoClient
    static var morningstar: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3511)
    }

    /// Shenzhen Chuangyuan Digital Technology Co., Ltd (`3512`)
    @_alwaysEmitIntoClient
    static var shenzhenChuangyuanDigitalTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3512)
    }

    /// CompanyDeep Ltd (`3513`)
    @_alwaysEmitIntoClient
    static var companydeep: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3513)
    }

    /// Veo Technologies ApS (`3514`)
    @_alwaysEmitIntoClient
    static var veoTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3514)
    }

    /// Nexis Link Technology Co., Ltd. (`3515`)
    @_alwaysEmitIntoClient
    static var nexisLinkTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3515)
    }

    /// Felion Technologies Company Limited (`3516`)
    @_alwaysEmitIntoClient
    static var felionTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3516)
    }

    /// MAATEL (`3517`)
    @_alwaysEmitIntoClient
    static var maatel: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3517)
    }

    /// HELLA GmbH & Co. KGaA (`3518`)
    @_alwaysEmitIntoClient
    static var hellaAa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3518)
    }

    /// HWM-Water Limited (`3519`)
    @_alwaysEmitIntoClient
    static var hwmWater: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3519)
    }

    /// Shenzhen Jahport Electronic Technology Co., Ltd. (`3520`)
    @_alwaysEmitIntoClient
    static var shenzhenJahportElectronicTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3520)
    }

    /// NACHI-FUJIKOSHI CORP. (`3521`)
    @_alwaysEmitIntoClient
    static var nachiFujikoshi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3521)
    }

    /// Cirrus Research plc (`3522`)
    @_alwaysEmitIntoClient
    static var cirrusResearchPlc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3522)
    }

    /// GEARBAC TECHNOLOGIES INC. (`3523`)
    @_alwaysEmitIntoClient
    static var gearbacTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3523)
    }

    /// Hangzhou NationalChip Science & Technology Co.,Ltd (`3524`)
    @_alwaysEmitIntoClient
    static var hangzhouNationalchipScienceTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3524)
    }

    /// DHL (`3525`)
    @_alwaysEmitIntoClient
    static var dhl: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3525)
    }

    /// Levita (`3526`)
    @_alwaysEmitIntoClient
    static var levita: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3526)
    }

    /// MORNINGSTAR FX PTE. LTD. (`3527`)
    @_alwaysEmitIntoClient
    static var morningstarFxPte: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3527)
    }

    /// ETO GRUPPE TECHNOLOGIES GmbH (`3528`)
    @_alwaysEmitIntoClient
    static var etoGruppeTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3528)
    }

    /// farmunited GmbH (`3529`)
    @_alwaysEmitIntoClient
    static var farmunited: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3529)
    }

    /// Aptener Mechatronics Private Limited (`3530`)
    @_alwaysEmitIntoClient
    static var aptenerMechatronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3530)
    }

    /// GEOPH, LLC (`3531`)
    @_alwaysEmitIntoClient
    static var geoph: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3531)
    }

    /// Trotec GmbH (`3532`)
    @_alwaysEmitIntoClient
    static var trotec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3532)
    }

    /// Astra LED AG (`3533`)
    @_alwaysEmitIntoClient
    static var astraLed: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3533)
    }

    /// NOVAFON - Electromedical devices limited liability company (`3534`)
    @_alwaysEmitIntoClient
    static var novafonElectromedicalDevicesLiability: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3534)
    }

    /// KUBU SMART LIMITED (`3535`)
    @_alwaysEmitIntoClient
    static var kubuSmart: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3535)
    }

    /// ESNAH (`3536`)
    @_alwaysEmitIntoClient
    static var esnah: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3536)
    }

    /// OrangeMicro Limited (`3537`)
    @_alwaysEmitIntoClient
    static var orangemicro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3537)
    }

    /// Sitecom Europe B.V. (`3538`)
    @_alwaysEmitIntoClient
    static var sitecomEurope: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3538)
    }

    /// Global Satellite Engineering (`3539`)
    @_alwaysEmitIntoClient
    static var globalSatelliteEngineering: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3539)
    }

    /// KOQOON GmbH & Co.KG (`3540`)
    @_alwaysEmitIntoClient
    static var koqoonKg: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3540)
    }

    /// BEEPINGS (`3541`)
    @_alwaysEmitIntoClient
    static var beepings: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3541)
    }

    /// MODULAR MEDICAL, INC. (`3542`)
    @_alwaysEmitIntoClient
    static var modularMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3542)
    }

    /// Xiant Technologies, Inc. (`3543`)
    @_alwaysEmitIntoClient
    static var xiantTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3543)
    }

    /// Granchip IoT Technology (Guangzhou) Co.,Ltd (`3544`)
    @_alwaysEmitIntoClient
    static var granchipIotTechnologyGuangzhou: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3544)
    }

    /// SCHELL GmbH & Co. KG (`3545`)
    @_alwaysEmitIntoClient
    static var schell: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3545)
    }

    /// Minebea Intec GmbH (`3546`)
    @_alwaysEmitIntoClient
    static var minebeaIntec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3546)
    }

    /// KAGA FEI Co., Ltd. (`3547`)
    @_alwaysEmitIntoClient
    static var kagaFei: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3547)
    }

    /// AUTHOR-ALARM, razvoj in prodaja avtomobilskih sistemov proti kraji, d.o.o. (`3548`)
    @_alwaysEmitIntoClient
    static var authorAlarmRazvojInProdajaAvtomobilskihSistemovProtiKraji: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3548)
    }

    /// Tozoa LLC (`3549`)
    @_alwaysEmitIntoClient
    static var tozoa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3549)
    }

    /// SHENZHEN DNS INDUSTRIES CO., LTD. (`3550`)
    @_alwaysEmitIntoClient
    static var shenzhenDnsIndustries: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3550)
    }

    /// Shenzhen Lunci Technology Co., Ltd (`3551`)
    @_alwaysEmitIntoClient
    static var shenzhenLunciTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3551)
    }

    /// KNOG PTY. LTD. (`3552`)
    @_alwaysEmitIntoClient
    static var knog: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3552)
    }

    /// Outshiny India Private Limited (`3553`)
    @_alwaysEmitIntoClient
    static var outshinyIndia: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3553)
    }

    /// TAMADIC Co., Ltd. (`3554`)
    @_alwaysEmitIntoClient
    static var tamadic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3554)
    }

    /// Shenzhen MODSEMI Co., Ltd (`3555`)
    @_alwaysEmitIntoClient
    static var shenzhenModsemi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3555)
    }

    /// EMBEINT INC (`3556`)
    @_alwaysEmitIntoClient
    static var embeint: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3556)
    }

    /// Ehong Technology Co.,Ltd (`3557`)
    @_alwaysEmitIntoClient
    static var ehongTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3557)
    }

    /// DEXATEK Technology LTD (`3558`)
    @_alwaysEmitIntoClient
    static var dexatekTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3558)
    }

    /// Dendro Technologies, Inc. (`3559`)
    @_alwaysEmitIntoClient
    static var dendroTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3559)
    }

    /// Vivint, Inc. (`3560`)
    @_alwaysEmitIntoClient
    static var vivint: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3560)
    }

    /// General Laser GmbH (`3561`)
    @_alwaysEmitIntoClient
    static var generalLaser: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3561)
    }

    /// Kathrein Solutions GmbH (`3562`)
    @_alwaysEmitIntoClient
    static var kathreinSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3562)
    }

    /// Fitz Inc. (`3563`)
    @_alwaysEmitIntoClient
    static var fitz: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3563)
    }

    /// ATEGENOS PHARMACEUTICALS INC (`3564`)
    @_alwaysEmitIntoClient
    static var ategenosPharmaceuticals: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3564)
    }

    /// Flextronic GmbH (`3565`)
    @_alwaysEmitIntoClient
    static var flextronic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3565)
    }

    /// Safety Swim LLC (`3566`)
    @_alwaysEmitIntoClient
    static var safetySwim: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3566)
    }

    /// SING SUN TECHNOLOGY (INTERNATIONAL) LIMITED (`3567`)
    @_alwaysEmitIntoClient
    static var singSunTechnologyInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3567)
    }

    /// Woncan (Hong Kong) Limited (`3568`)
    @_alwaysEmitIntoClient
    static var woncanHongKong: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3568)
    }

    /// iFLYTEK (Suzhou) Technology Co., Ltd. (`3569`)
    @_alwaysEmitIntoClient
    static var iflytekSuzhouTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3569)
    }

    /// Weber-Stephen Products LLC (`3570`)
    @_alwaysEmitIntoClient
    static var weberStephenProducts: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3570)
    }

    /// hDrop Technologies Inc. (`3571`)
    @_alwaysEmitIntoClient
    static var hdropTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3571)
    }

    /// REEKON TOOLS INC. (`3572`)
    @_alwaysEmitIntoClient
    static var reekonTools: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3572)
    }

    /// Delta Faucet Company (`3573`)
    @_alwaysEmitIntoClient
    static var deltaFaucet: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3573)
    }

    /// Mutrack Co., Ltd (`3574`)
    @_alwaysEmitIntoClient
    static var mutrack: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3574)
    }

    /// Hangzhou Zhaotong Microelectronics Co., Ltd. (`3575`)
    @_alwaysEmitIntoClient
    static var hangzhouZhaotongMicroelectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3575)
    }

    /// Chengdu CSCT Microelectronics Co., Ltd. (`3576`)
    @_alwaysEmitIntoClient
    static var chengduCsctMicroelectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3576)
    }

    /// Belusun Technology Ltd. (`3577`)
    @_alwaysEmitIntoClient
    static var belusunTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3577)
    }

    /// Shenzhen Matches IoT Technology Co., Ltd. (`3578`)
    @_alwaysEmitIntoClient
    static var shenzhenMatchesIotTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3578)
    }

    /// Beidou Intelligent Connected Vehicle Technology Co., Ltd. (`3579`)
    @_alwaysEmitIntoClient
    static var beidouIntelligentConnectedVehicleTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3579)
    }

    /// SOJI ELECTRONICS JOINT STOCK COMPANY (`3580`)
    @_alwaysEmitIntoClient
    static var sojiElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3580)
    }

    /// BH Technologies (`3581`)
    @_alwaysEmitIntoClient
    static var bhTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3581)
    }

    /// Haptech, Inc. (`3582`)
    @_alwaysEmitIntoClient
    static var haptech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3582)
    }

    /// WaveRF, Corp. (`3583`)
    @_alwaysEmitIntoClient
    static var waverf: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3583)
    }

    /// SHENZHEN SOUNDSOUL INFORMATION TECHNOLOGY CO.,LTD (`3584`)
    @_alwaysEmitIntoClient
    static var shenzhenSoundsoulInformationTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3584)
    }

    /// Wuhu Mengbo Technology Co., Ltd. (`3585`)
    @_alwaysEmitIntoClient
    static var wuhuMengboTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3585)
    }

    /// PROSYS DEV LIMITED (`3586`)
    @_alwaysEmitIntoClient
    static var prosysDev: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3586)
    }

    /// Shenzhen eMeet technology Co.,Ltd (`3587`)
    @_alwaysEmitIntoClient
    static var shenzhenEmeetTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3587)
    }

    /// Doro AB (`3588`)
    @_alwaysEmitIntoClient
    static var doro: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3588)
    }

    /// SUREPULSE MEDICAL LIMITED (`3589`)
    @_alwaysEmitIntoClient
    static var surepulseMedical: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3589)
    }

    /// iodyne, LLC (`3590`)
    @_alwaysEmitIntoClient
    static var iodyne: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3590)
    }

    /// Pinpoint GmbH (`3591`)
    @_alwaysEmitIntoClient
    static var pinpoint: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3591)
    }

    /// Heinrich Kopp GmbH (`3592`)
    @_alwaysEmitIntoClient
    static var heinrichKopp: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3592)
    }

    /// Evolutive Systems SL (`3593`)
    @_alwaysEmitIntoClient
    static var evolutiveSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3593)
    }

    /// PRINT INTERNATIONAL LIMITED (`3594`)
    @_alwaysEmitIntoClient
    static var printInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3594)
    }

    /// Sounding Audio Industrial Ltd. (`3595`)
    @_alwaysEmitIntoClient
    static var soundingAudioIndustrial: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3595)
    }

    /// Yuanfeng Technology Co., Ltd. (`3596`)
    @_alwaysEmitIntoClient
    static var yuanfengTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3596)
    }

    /// FrontAct Co., Ltd. (`3597`)
    @_alwaysEmitIntoClient
    static var frontact: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3597)
    }

    /// ALOGIC CORPORATION PTY LTD (`3598`)
    @_alwaysEmitIntoClient
    static var alogic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3598)
    }

    /// SenseWorks Tecnologia Ltda. (`3599`)
    @_alwaysEmitIntoClient
    static var senseworksTecnologia: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3599)
    }

    /// Eko Health, Inc. (`3600`)
    @_alwaysEmitIntoClient
    static var ekoHealth: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3600)
    }

    /// Wanzl GmbH & Co. KGaA (`3601`)
    @_alwaysEmitIntoClient
    static var wanzlAa: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3601)
    }

    /// CLEVER LOGGER TECHNOLOGIES PTY LIMITED (`3602`)
    @_alwaysEmitIntoClient
    static var cleverLoggerTechnologies: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3602)
    }

    /// ASYSTOM (`3603`)
    @_alwaysEmitIntoClient
    static var asystom: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3603)
    }

    /// Heilongjiang Tianyouwei Electronics Co.,Ltd. (`3604`)
    @_alwaysEmitIntoClient
    static var heilongjiangTianyouweiElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3604)
    }

    /// Eastern Partner Limited (`3605`)
    @_alwaysEmitIntoClient
    static var easternPartner: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3605)
    }

    /// Xiamen RUI YI Da Electronic Technology Co.,Ltd (`3606`)
    @_alwaysEmitIntoClient
    static var xiamenRuiYiDaElectronicTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3606)
    }

    /// Ad Hoc Electronics, llc. (`3607`)
    @_alwaysEmitIntoClient
    static var adHocElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3607)
    }

    /// Hangzhou Microimage Software Co.,Ltd. (`3608`)
    @_alwaysEmitIntoClient
    static var hangzhouMicroimageSoftware: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3608)
    }

    /// Hive-Zox International SA (`3609`)
    @_alwaysEmitIntoClient
    static var hiveZoxInternational: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3609)
    }

    /// Sensovo GmbH (`3610`)
    @_alwaysEmitIntoClient
    static var sensovo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3610)
    }

    /// Time Location Systems AS (`3611`)
    @_alwaysEmitIntoClient
    static var timeLocationSystems: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3611)
    }

    /// SHENZHEN DIGITECH CO., LTD (`3612`)
    @_alwaysEmitIntoClient
    static var shenzhenDigitech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3612)
    }

    /// Capte B.V. (`3613`)
    @_alwaysEmitIntoClient
    static var capte: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3613)
    }

    /// 9512-5837 QUEBEC INC. (`3614`)
    @_alwaysEmitIntoClient
    static var company95125837Quebec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3614)
    }

    /// Blecon Ltd (`3615`)
    @_alwaysEmitIntoClient
    static var blecon: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3615)
    }

    /// CFLAB TEKNOLOJI TICARET LIMITED SIRKETI (`3616`)
    @_alwaysEmitIntoClient
    static var cflabTeknolojiTicaretSirketi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3616)
    }

    /// FOGO (`3617`)
    @_alwaysEmitIntoClient
    static var fogo: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3617)
    }

    /// HITO INC (`3618`)
    @_alwaysEmitIntoClient
    static var hito: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3618)
    }

    /// MS kajak7 UG (limited liability) (`3620`)
    @_alwaysEmitIntoClient
    static var msKajak7UgLimitedLiability: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3620)
    }

    /// Hangzhou Hikvision Digital Technology Co., Ltd. (`3621`)
    @_alwaysEmitIntoClient
    static var hangzhouHikvisionDigitalTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3621)
    }

    /// LIHJOEN SPEED METER CO., LTD. (`3622`)
    @_alwaysEmitIntoClient
    static var lihjoenSpeedMeter: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3622)
    }

    /// NextSense, Inc. (`3623`)
    @_alwaysEmitIntoClient
    static var nextsense: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3623)
    }

    /// PatchRx, Inc. (`3624`)
    @_alwaysEmitIntoClient
    static var patchrx: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3624)
    }

    /// Flipper Devices Inc. (`3625`)
    @_alwaysEmitIntoClient
    static var flipperDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3625)
    }

    /// Huizhou Foryou General Electronics Co., Ltd. (`3626`)
    @_alwaysEmitIntoClient
    static var huizhouForyouGeneralElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3626)
    }

    /// JE electronic a/s (`3627`)
    @_alwaysEmitIntoClient
    static var jeElectronic: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3627)
    }

    /// 9313-7263 Quebec inc. (`3628`)
    @_alwaysEmitIntoClient
    static var company93137263Quebec: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3628)
    }

    /// ECARX (Hubei) Tech Co.,Ltd. (`3629`)
    @_alwaysEmitIntoClient
    static var ecarxHubeiTech: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3629)
    }

    /// NIHON KOHDEN CORPORATION (`3630`)
    @_alwaysEmitIntoClient
    static var nihonKohden: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3630)
    }

    /// ONWI (`3631`)
    @_alwaysEmitIntoClient
    static var onwi: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3631)
    }

    /// Primax Electronics Ltd. (`3632`)
    @_alwaysEmitIntoClient
    static var primaxElectronics: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3632)
    }

    /// AlphaTheta Corporation (`3633`)
    @_alwaysEmitIntoClient
    static var alphatheta: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3633)
    }

    /// PACIFIC INDUSTRIAL CO., LTD. (`3634`)
    @_alwaysEmitIntoClient
    static var pacificIndustrial: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3634)
    }

    /// Crescent NV (`3635`)
    @_alwaysEmitIntoClient
    static var crescent: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3635)
    }

    /// Vermis, software solutions llc (`3636`)
    @_alwaysEmitIntoClient
    static var vermisSoftwareSolutions: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3636)
    }

    /// SNAPPWISH LLC (`3637`)
    @_alwaysEmitIntoClient
    static var snappwish: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3637)
    }

    /// Cousins and Sears LLC (`3638`)
    @_alwaysEmitIntoClient
    static var cousinsAndSears: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3638)
    }

    /// CESYS Gesellschaft für angewandte Mikroelektronik mbH (`3639`)
    @_alwaysEmitIntoClient
    static var cesysGesellschaftFurAngewandteMikroelektronik: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3639)
    }

    /// SLOC GmbH (`3640`)
    @_alwaysEmitIntoClient
    static var sloc: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3640)
    }

    /// IRES Infrarot Energie Systeme GmbH (`3641`)
    @_alwaysEmitIntoClient
    static var iresInfrarotEnergieSysteme: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3641)
    }

    /// OFIVE LIMITED (`3642`)
    @_alwaysEmitIntoClient
    static var ofive: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3642)
    }

    /// Swift IOT Tech (Shenzhen) Co., LTD. (`3643`)
    @_alwaysEmitIntoClient
    static var swiftIotTechShenzhen: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3643)
    }

    /// Viselabs (`3644`)
    @_alwaysEmitIntoClient
    static var viselabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3644)
    }

    /// Walmart Inc. (`3645`)
    @_alwaysEmitIntoClient
    static var walmart: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3645)
    }

    /// VANBOX (`3646`)
    @_alwaysEmitIntoClient
    static var vanbox: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3646)
    }

    /// Wiser Devices, LLC (`3647`)
    @_alwaysEmitIntoClient
    static var wiserDevices: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3647)
    }

    /// WKD Labs Ltd (`3648`)
    @_alwaysEmitIntoClient
    static var wkdLabs: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3648)
    }

    /// Asustek Computer Inc. (`3649`)
    @_alwaysEmitIntoClient
    static var asustekComputer: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3649)
    }

    /// Z-ONE Technology Co., Ltd. (`3650`)
    @_alwaysEmitIntoClient
    static var zOneTechnology: CompanyIdentifier {
        return CompanyIdentifier(rawValue: 3650)
    }

}
#endif