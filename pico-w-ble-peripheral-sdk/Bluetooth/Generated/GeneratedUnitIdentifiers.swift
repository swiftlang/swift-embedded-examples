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
public extension UnitIdentifier {

    /// unitless (`0x2700`)
    @_alwaysEmitIntoClient
    static var unitless: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2700)
    }

    /// length (metre) (`0x2701`)
    @_alwaysEmitIntoClient
    static var metre: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2701)
    }

    /// mass (kilogram) (`0x2702`)
    @_alwaysEmitIntoClient
    static var kilogram: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2702)
    }

    /// time (second) (`0x2703`)
    @_alwaysEmitIntoClient
    static var second: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2703)
    }

    /// electric current (ampere) (`0x2704`)
    @_alwaysEmitIntoClient
    static var ampere: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2704)
    }

    /// thermodynamic temperature (kelvin) (`0x2705`)
    @_alwaysEmitIntoClient
    static var kelvin: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2705)
    }

    /// amount of substance (mole) (`0x2706`)
    @_alwaysEmitIntoClient
    static var mole: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2706)
    }

    /// luminous intensity (candela) (`0x2707`)
    @_alwaysEmitIntoClient
    static var candela: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2707)
    }

    /// area (square metres) (`0x2710`)
    @_alwaysEmitIntoClient
    static var area: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2710)
    }

    /// volume (cubic metres) (`0x2711`)
    @_alwaysEmitIntoClient
    static var volume: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2711)
    }

    /// velocity (metres per second) (`0x2712`)
    @_alwaysEmitIntoClient
    static var velocity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2712)
    }

    /// acceleration (metres per second squared) (`0x2713`)
    @_alwaysEmitIntoClient
    static var acceleration: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2713)
    }

    /// wavenumber (reciprocal metre) (`0x2714`)
    @_alwaysEmitIntoClient
    static var wavenumber: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2714)
    }

    /// density (kilogram per cubic metre) (`0x2715`)
    @_alwaysEmitIntoClient
    static var density: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2715)
    }

    /// surface density (kilogram per square metre) (`0x2716`)
    @_alwaysEmitIntoClient
    static var surfaceDensity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2716)
    }

    /// specific volume (cubic metre per kilogram) (`0x2717`)
    @_alwaysEmitIntoClient
    static var specificVolume: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2717)
    }

    /// current density (ampere per square metre) (`0x2718`)
    @_alwaysEmitIntoClient
    static var currentDensity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2718)
    }

    /// magnetic field strength (ampere per metre) (`0x2719`)
    @_alwaysEmitIntoClient
    static var magneticFieldStrengh: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2719)
    }

    /// amount concentration (mole per cubic metre) (`0x271A`)
    @_alwaysEmitIntoClient
    static var amountConcentration: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x271A)
    }

    /// mass concentration (kilogram per cubic metre) (`0x271B`)
    @_alwaysEmitIntoClient
    static var massConcentration: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x271B)
    }

    /// luminance (candela per square metre) (`0x271C`)
    @_alwaysEmitIntoClient
    static var luminance: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x271C)
    }

    /// refractive index (`0x271D`)
    @_alwaysEmitIntoClient
    static var refractiveIndex: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x271D)
    }

    /// relative permeability (`0x271E`)
    @_alwaysEmitIntoClient
    static var relativePermeability: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x271E)
    }

    /// plane angle (radian) (`0x2720`)
    @_alwaysEmitIntoClient
    static var planeAngle: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2720)
    }

    /// solid angle (steradian) (`0x2721`)
    @_alwaysEmitIntoClient
    static var solidAngle: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2721)
    }

    /// frequency (hertz) (`0x2722`)
    @_alwaysEmitIntoClient
    static var frequency: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2722)
    }

    /// force (newton) (`0x2723`)
    @_alwaysEmitIntoClient
    static var force: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2723)
    }

    /// pressure (pascal) (`0x2724`)
    @_alwaysEmitIntoClient
    static var pascalPressure: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2724)
    }

    /// energy (joule) (`0x2725`)
    @_alwaysEmitIntoClient
    static var energy: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2725)
    }

    /// power (watt) (`0x2726`)
    @_alwaysEmitIntoClient
    static var power: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2726)
    }

    /// electric charge (coulomb) (`0x2727`)
    @_alwaysEmitIntoClient
    static var coulomb: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2727)
    }

    /// electric potential difference (volt) (`0x2728`)
    @_alwaysEmitIntoClient
    static var electricPotential: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2728)
    }

    /// capacitance (farad) (`0x2729`)
    @_alwaysEmitIntoClient
    static var capitance: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2729)
    }

    /// electric resistance (ohm) (`0x272A`)
    @_alwaysEmitIntoClient
    static var electricResistance: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x272A)
    }

    /// electric conductance (siemens) (`0x272B`)
    @_alwaysEmitIntoClient
    static var electricConductance: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x272B)
    }

    /// magnetic flux (weber) (`0x272C`)
    @_alwaysEmitIntoClient
    static var magneticFlux: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x272C)
    }

    /// magnetic flux density (tesla) (`0x272D`)
    @_alwaysEmitIntoClient
    static var magneticFluxDensity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x272D)
    }

    /// inductance (henry) (`0x272E`)
    @_alwaysEmitIntoClient
    static var inductance: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x272E)
    }

    /// Celsius temperature (degree Celsius) (`0x272F`)
    @_alwaysEmitIntoClient
    static var celsius: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x272F)
    }

    /// luminous flux (lumen) (`0x2730`)
    @_alwaysEmitIntoClient
    static var luminousFlux: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2730)
    }

    /// illuminance (lux) (`0x2731`)
    @_alwaysEmitIntoClient
    static var illuminance: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2731)
    }

    /// activity referred to a radionuclide (becquerel) (`0x2732`)
    @_alwaysEmitIntoClient
    static var becquerel: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2732)
    }

    /// absorbed dose (gray) (`0x2733`)
    @_alwaysEmitIntoClient
    static var absorbedDose: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2733)
    }

    /// dose equivalent (sievert) (`0x2734`)
    @_alwaysEmitIntoClient
    static var sievert: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2734)
    }

    /// catalytic activity (katal) (`0x2735`)
    @_alwaysEmitIntoClient
    static var katal: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2735)
    }

    /// dynamic viscosity (pascal second) (`0x2740`)
    @_alwaysEmitIntoClient
    static var pascalSecond: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2740)
    }

    /// moment of force (newton metre) (`0x2741`)
    @_alwaysEmitIntoClient
    static var newtonMetre: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2741)
    }

    /// surface tension (newton per metre) (`0x2742`)
    @_alwaysEmitIntoClient
    static var surfaceTension: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2742)
    }

    /// angular velocity (radian per second) (`0x2743`)
    @_alwaysEmitIntoClient
    static var angularVelocity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2743)
    }

    /// angular acceleration (radian per second squared) (`0x2744`)
    @_alwaysEmitIntoClient
    static var angularAcceleration: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2744)
    }

    /// heat flux density (watt per square metre) (`0x2745`)
    @_alwaysEmitIntoClient
    static var heatFluxDensity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2745)
    }

    /// heat capacity (joule per kelvin) (`0x2746`)
    @_alwaysEmitIntoClient
    static var heatCapacity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2746)
    }

    /// specific heat capacity (joule per kilogram kelvin) (`0x2747`)
    @_alwaysEmitIntoClient
    static var specificHeatCapacity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2747)
    }

    /// specific energy (joule per kilogram) (`0x2748`)
    @_alwaysEmitIntoClient
    static var specificEnergy: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2748)
    }

    /// thermal conductivity (watt per metre kelvin) (`0x2749`)
    @_alwaysEmitIntoClient
    static var thermalConductivity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2749)
    }

    /// energy density (joule per cubic metre) (`0x274A`)
    @_alwaysEmitIntoClient
    static var energyDensity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x274A)
    }

    /// electric field strength (volt per metre) (`0x274B`)
    @_alwaysEmitIntoClient
    static var electricFieldStrength: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x274B)
    }

    /// electric charge density (coulomb per cubic metre) (`0x274C`)
    @_alwaysEmitIntoClient
    static var electricChargeDensity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x274C)
    }

    /// surface charge density (coulomb per square metre) (`0x274D`)
    @_alwaysEmitIntoClient
    static var surfaceChargeDensity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x274D)
    }

    /// electric flux density (coulomb per square metre) (`0x274E`)
    @_alwaysEmitIntoClient
    static var electricFluxDensity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x274E)
    }

    /// permittivity (farad per metre) (`0x274F`)
    @_alwaysEmitIntoClient
    static var permittivity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x274F)
    }

    /// permeability (henry per metre) (`0x2750`)
    @_alwaysEmitIntoClient
    static var permeability: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2750)
    }

    /// molar energy (joule per mole) (`0x2751`)
    @_alwaysEmitIntoClient
    static var molarEnergy: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2751)
    }

    /// molar entropy (joule per mole kelvin) (`0x2752`)
    @_alwaysEmitIntoClient
    static var molarEntropy: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2752)
    }

    /// exposure (coulomb per kilogram) (`0x2753`)
    @_alwaysEmitIntoClient
    static var exposure: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2753)
    }

    /// absorbed dose rate (gray per second) (`0x2754`)
    @_alwaysEmitIntoClient
    static var absorbedDoseRate: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2754)
    }

    /// radiant intensity (watt per steradian) (`0x2755`)
    @_alwaysEmitIntoClient
    static var radradiantIntensityiance: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2755)
    }

    /// radiance (watt per square metre steradian) (`0x2756`)
    @_alwaysEmitIntoClient
    static var radiance: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2756)
    }

    /// catalytic activity concentration (katal per cubic metre) (`0x2757`)
    @_alwaysEmitIntoClient
    static var catalyticActivity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2757)
    }

    /// time (minute) (`0x2760`)
    @_alwaysEmitIntoClient
    static var minute: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2760)
    }

    /// time (hour) (`0x2761`)
    @_alwaysEmitIntoClient
    static var hour: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2761)
    }

    /// time (day) (`0x2762`)
    @_alwaysEmitIntoClient
    static var day: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2762)
    }

    /// plane angle (degree) (`0x2763`)
    @_alwaysEmitIntoClient
    static var degree: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2763)
    }

    /// plane angle (minute) (`0x2764`)
    @_alwaysEmitIntoClient
    static var planeAngleMinute: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2764)
    }

    /// plane angle (second) (`0x2765`)
    @_alwaysEmitIntoClient
    static var planeAngleSecond: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2765)
    }

    /// area (hectare) (`0x2766`)
    @_alwaysEmitIntoClient
    static var hectare: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2766)
    }

    /// volume (litre) (`0x2767`)
    @_alwaysEmitIntoClient
    static var litre: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2767)
    }

    /// mass (tonne) (`0x2768`)
    @_alwaysEmitIntoClient
    static var tonne: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2768)
    }

    /// pressure (bar) (`0x2780`)
    @_alwaysEmitIntoClient
    static var bar: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2780)
    }

    /// pressure (millimetre of mercury) (`0x2781`)
    @_alwaysEmitIntoClient
    static var millimetreOfMercury: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2781)
    }

    /// length (ångström) (`0x2782`)
    @_alwaysEmitIntoClient
    static var ngstrm: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2782)
    }

    /// length (nautical mile) (`0x2783`)
    @_alwaysEmitIntoClient
    static var nauticalMile: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2783)
    }

    /// area (barn) (`0x2784`)
    @_alwaysEmitIntoClient
    static var barn: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2784)
    }

    /// velocity (knot) (`0x2785`)
    @_alwaysEmitIntoClient
    static var velocityKnot: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2785)
    }

    /// logarithmic radio quantity (neper) (`0x2786`)
    @_alwaysEmitIntoClient
    static var neper: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2786)
    }

    /// logarithmic radio quantity (bel) (`0x2787`)
    @_alwaysEmitIntoClient
    static var bel: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2787)
    }

    /// length (yard) (`0x27A0`)
    @_alwaysEmitIntoClient
    static var yard: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27A0)
    }

    /// length (parsec) (`0x27A1`)
    @_alwaysEmitIntoClient
    static var parsec: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27A1)
    }

    /// length (inch) (`0x27A2`)
    @_alwaysEmitIntoClient
    static var inch: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27A2)
    }

    /// length (foot) (`0x27A3`)
    @_alwaysEmitIntoClient
    static var foot: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27A3)
    }

    /// length (mile) (`0x27A4`)
    @_alwaysEmitIntoClient
    static var mile: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27A4)
    }

    /// pressure (pound-force per square inch) (`0x27A5`)
    @_alwaysEmitIntoClient
    static var pressurePoundForce: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27A5)
    }

    /// velocity (kilometre per hour) (`0x27A6`)
    @_alwaysEmitIntoClient
    static var kilometrePerHour: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27A6)
    }

    /// velocity (mile per hour) (`0x27A7`)
    @_alwaysEmitIntoClient
    static var milePerHour: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27A7)
    }

    /// angular velocity (revolution per minute) (`0x27A8`)
    @_alwaysEmitIntoClient
    static var revolutionPerMinute: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27A8)
    }

    /// energy (gram calorie) (`0x27A9`)
    @_alwaysEmitIntoClient
    static var gramCalorie: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27A9)
    }

    /// energy (kilogram calorie) (`0x27AA`)
    @_alwaysEmitIntoClient
    static var kilogramCalorie: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27AA)
    }

    /// energy (kilowatt hour) (`0x27AB`)
    @_alwaysEmitIntoClient
    static var kilowattHour: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27AB)
    }

    /// thermodynamic temperature (degree Fahrenheit) (`0x27AC`)
    @_alwaysEmitIntoClient
    static var degreeFahrenheit: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27AC)
    }

    /// percentage (`0x27AD`)
    @_alwaysEmitIntoClient
    static var percentage: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27AD)
    }

    /// per mille (`0x27AE`)
    @_alwaysEmitIntoClient
    static var perMille: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27AE)
    }

    /// period (beats per minute) (`0x27AF`)
    @_alwaysEmitIntoClient
    static var beatsPerMinute: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27AF)
    }

    /// electric charge (ampere hours) (`0x27B0`)
    @_alwaysEmitIntoClient
    static var ampereHours: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27B0)
    }

    /// mass density (milligram per decilitre) (`0x27B1`)
    @_alwaysEmitIntoClient
    static var milligramPerDecilitre: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27B1)
    }

    /// mass density (millimole per litre) (`0x27B2`)
    @_alwaysEmitIntoClient
    static var millimolePerLitre: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27B2)
    }

    /// time (year) (`0x27B3`)
    @_alwaysEmitIntoClient
    static var year: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27B3)
    }

    /// time (month) (`0x27B4`)
    @_alwaysEmitIntoClient
    static var month: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27B4)
    }

    /// concentration (count per cubic metre) (`0x27B5`)
    @_alwaysEmitIntoClient
    static var concentration: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27B5)
    }

    /// irradiance (watt per square metre) (`0x27B6`)
    @_alwaysEmitIntoClient
    static var irrandiance: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27B6)
    }

    /// milliliter (per kilogram per minute) (`0x27B7`)
    @_alwaysEmitIntoClient
    static var millilitre: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27B7)
    }

    /// mass (pound) (`0x27B8`)
    @_alwaysEmitIntoClient
    static var pound: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27B8)
    }

    /// metabolic equivalent (`0x27B9`)
    @_alwaysEmitIntoClient
    static var metabolicEquivalent: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27B9)
    }

    /// step (per minute) (`0x27BA`)
    @_alwaysEmitIntoClient
    static var step: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27BA)
    }

    /// stroke (per minute) (`0x27BC`)
    @_alwaysEmitIntoClient
    static var stroke: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27BC)
    }

    /// pace (kilometre per minute) (`0x27BD`)
    @_alwaysEmitIntoClient
    static var pace: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27BD)
    }

    /// luminous efficacy (lumen per watt) (`0x27BE`)
    @_alwaysEmitIntoClient
    static var luminousEfficacy: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27BE)
    }

    /// luminous energy (lumen hour) (`0x27BF`)
    @_alwaysEmitIntoClient
    static var luminousEnergy: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27BF)
    }

    /// luminous exposure (lux hour) (`0x27C0`)
    @_alwaysEmitIntoClient
    static var luminousExposure: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27C0)
    }

    /// mass flow (gram per second) (`0x27C1`)
    @_alwaysEmitIntoClient
    static var massFlow: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27C1)
    }

    /// volume flow (litre per second) (`0x27C2`)
    @_alwaysEmitIntoClient
    static var volumeFlow: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27C2)
    }

    /// sound pressure (decibel) (`0x27C3`)
    @_alwaysEmitIntoClient
    static var soundPressure: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27C3)
    }

    /// parts per million (`0x27C4`)
    @_alwaysEmitIntoClient
    static var partsPerMillion: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27C4)
    }

    /// parts per billion (`0x27C5`)
    @_alwaysEmitIntoClient
    static var partsPerBillion: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27C5)
    }

    /// mass density rate ((milligram per decilitre) per minute) (`0x27C6`)
    @_alwaysEmitIntoClient
    static var massDensityRate: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27C6)
    }

    /// Electrical Apparent Energy (kilovolt ampere hour) (`0x27C7`)
    @_alwaysEmitIntoClient
    static var kilovoltAmpereHour: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27C7)
    }

    /// Electrical Apparent Power (volt ampere) (`0x27C8`)
    @_alwaysEmitIntoClient
    static var voltAmpere: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27C8)
    }

}
#endif