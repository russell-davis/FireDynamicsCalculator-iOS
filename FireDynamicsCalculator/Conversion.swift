//
//  Conversion.swift
//  FireDynamicsCalculator
//
//  Created by App Center on 1/28/18.
//  Copyright © 2018 Luke Davis Development. All rights reserved.
//

import Foundation

class Conversion {
    
    static let unitString = UnitString()
    static let length = Length()
    static let density = Density()
    static let energy = Energy()
    static let energyDensity = EnergyDensity()
    static let area = Area()
    static let volume = Volume()
    static let time = Time()
    static let pressure = Pressure()
    static let flow = Flow()
    static let temperature = Temperature()
    static let units = Units()
    static let materials = Materials()
    static let mass = Mass()
    
    struct UnitString {
        let gases = ["Please select an option", "Propane", "Methane", "User Specified"]
        let area = ["Please select an option", "ft²", "in²", "m²"]
        let length = ["Please select an option", "cm", "ft", "in", "m", "mm"]
        let volume = ["Please select an option", "ft³", "gallon", "in³", "liter", "m³"]
        let mass = ["Please select an option", "g", "kg", "lb"]
        let time = ["Please Select an Option", "Hr", "Min", "Sec"]
        let energy = ["Please Select an Option", "kW", "Btu / sec"]
        let temperature = ["Please Select an Option", "°C","°F","K","R"]
    }
    
    struct Length {
        enum Length {
            case cm
            case feet
            case inches
            case meters
            case mm
        }
        
        func getLengthUnits(from: String) -> Length {
            switch from {
            case "cm":
                return .cm
            case "ft":
                return .feet
            case "in":
                return .inches
            case "m":
                return .meters
            case "mm":
                return .mm
            default:
                return .meters
            }
        }
        
        func convertLength(value: Double, from unit: Length) -> Double {
            switch unit {
            case .cm:
                return value * 0.01
            case .feet:
                return value * 0.304878049
            case .inches:
                return value * 0.025406504
            case .meters:
                return value * 1.0
            case .mm:
                return value * 0.001
            }
        }
    }
    
    struct Density {
        enum Density {
            case kg_m³
            case lbs_ft³
        }
        
        func getDensityUnits(from string: String) -> Density {
            switch string {
            case "kg/m³":
                return .kg_m³
            case "lb/ft³":
                return .lbs_ft³
            default:
                return .kg_m³
            }
        }
        
        func convertDensity(value: Double, from units: Density) -> Double {
            switch units {
            case .kg_m³:
                return value * 1
            case .lbs_ft³:
                return value * 0.062427818
            }
        }
    }
    
    struct Energy {
        func energy(value: Double, from unit: Units.Energy) -> Double {
            switch unit {
            case .BtuSec:
                return value * 1.055055852
            case .kW:
                return value * 1.0
            }
        }
        func getEnergyUnits(from: String) -> Units.Energy {
            switch from {
            case "Btu / Sec":
                return .BtuSec
            case "kW":
                return .kW
            default:
                return .kW
            }
        }
    }
    
    struct EnergyDensity {
        enum EnergyDensity {
            case Btu_Sec_ft²
            case kW_m²
        }
        
        func getEnergyDensityUnits(from: String) -> EnergyDensity {
            switch from {
            case "Btu/sec/ft²":
                return .Btu_Sec_ft²
            case "kW/m²":
                return .kW_m²
            default:
                return .kW_m²
            }
        }
        
        func convertEnergyDensity(value: Double, to unit: EnergyDensity) -> Double {
            switch unit {
            case .Btu_Sec_ft²:
                return value * 1/11.3565267
            case .kW_m²:
                return value * 1.0
            }
        }
    }
    
    struct Area {
        enum Area {
            case FtSq
            case inchesSq
            case mSq
        }
        
        func area(value: Double, from unit: Area) -> Double {
            switch unit {
            case .FtSq:
                return value * 0.092950625
            case .inchesSq:
                return value * 0.00064549
            case .mSq:
                return value * 1.0
            }
        }
        
        func getAreaUnits(from: String) -> Area {
            switch from {
            case "ft²":
                return .FtSq
            case "in²":
                return .inchesSq
            case "m²":
                return .mSq
            default:
                return .mSq
            }
        }
    }
    
    struct Volume {
        enum Volume {
            case ft³
            case gallon
            case in³
            case liter
            case m³
        }
        
        func convertVolume(value: Double, from Unit: Volume) -> Double {
            switch Unit {
            case .ft³:
                return value * 0.0283168
            case .gallon:
                return value * 0.00378541
            case .in³:
                return value * 0.0000163870562770569
            case .liter:
                return value * 0.001
            case .m³:
                return value * 1.0
            }
        }
        
        func convertToCubM(value: Double, from unit: Volume) -> Double {
            switch unit {
            case .ft³:
                return value / 0.0283168
            case .gallon:
                return value / 0.00378541
            case .in³:
                return value / 0.0000163870562770569
            case .liter:
                return value / 0.001
            case .m³:
                return value / 1.0
            }
        }
        
        func getUnits(string: String) -> Volume {
            switch string {
            case "ft³":
                return .ft³
            case "gallon":
                return .gallon
            case "in³":
                return .in³
            case "liter":
                return .liter
            case "m³":
                return .m³
            default:
                return .m³
            }
        }
    }
    
    struct Time {
        enum Time {
            case Hour
            case Min
            case Sec
        }
        
        func time(value: Double, from unit: Time) -> Double {
            switch unit {
            case .Hour:
                return value * 0.000277778
            case .Min:
                return value * 0.016666667
            case .Sec:
                return value * 1
            }
        }
        
        func getTimeUnits(string: String) -> Time {
            switch string {
            case "Hr":
                return .Hour
            case "Min":
                return .Min
            case "Sec":
                return .Sec
            default:
                return .Sec
            }
        }
    }
    
    struct Pressure {
        enum Pressure {
            case inchesH2O
            case kPa
            case mbar
            case psi
        }
        
        func pressure(value: Double, from unit: Pressure) -> Double {
            switch unit {
            case .inchesH2O:
                return value * 2.490889083
            case .kPa:
                return value * 10
            case .mbar:
                return value * 1
            case .psi:
                return value * 68.9475728
            }
        }
        
        func getPressureUnits(string: String) -> Pressure {
            switch string {
            case "in H₂O":
                return .inchesH2O
            case "kPa":
                return .kPa
            case "mbar":
                return .mbar
            case "psi":
                return .psi
            default:
                return .inchesH2O
            }
            
            
        }
    }
    
    struct Flow {
        enum Flow {
            case cfm
            case ft³_Sec
            case m³_Hr
            case m³_Sec
        }
        
        func flow(value: Double, from unit: Flow) -> Double {
            switch unit {
            case .cfm:
                return value * 0.588125867
            case .ft³_Sec:
                return value * 0.009802098
            case .m³_Hr:
                return value * 1
            case .m³_Sec:
                return value * 0.000277778
            }
        }
        
        func toCubMHour(value: Double, from unit: Flow) -> Double {
            switch unit {
            case .cfm:
                return value / 0.588125867
            case .ft³_Sec:
                return value / 0.009802098
            case .m³_Hr:
                return value / 1
            case .m³_Sec:
                return value / 0.000277778
            }
        }
        
        func getFlowUnits(string: String) -> Flow {
            switch string {
            case "m³ / Hr":
                return .m³_Hr
            case "m³ / Sec":
                return .m³_Sec
            case "ft³ / Sec":
                return .ft³_Sec
            case "ft³ / Min":
                return .cfm
            default:
                return .cfm
            }
        }
    }
    
    struct Temperature {
        enum Temperature {
            case C
            case F
            case K
            case R
        }
        
        func getTemperatureUnits(string: String) -> Temperature {
            switch string {
            case "°C":
                return .C
            case "°F":
                return .F
            case "K":
                return .K
            case "R":
                return .R
            default:
                return .C
            }
        }
        
        func convertTemperature(value: String, from units: Temperature) -> Double {
            if let value = Double(value) {
                if units == .F {
                    let result = (value - 32) * ( 5  / 9)
                    return result
                } else if units == .C {
                    return value
                } else if units == .K {
                    let result = value - 273.15
                    return result
                } else {
                    let result = (value - 459.67 - 32 ) * (5 / 9)
                    return result
                }
            } else {
                return 0.0
            }
        }
        
        func TGasConv(value: String, from units: Temperature) -> Double {
            if let value = Double(value) {
                if units == .F {
                    let result = (value - 32) * ( 5  / 9) + 273.15
                    return result
                } else if units == .C {
                    return value + 273.15
                } else if units == .K {
                    let result = 273.15
                    return result
                } else {
                    let result = (value - 459.67 - 32 ) * (5 / 9) + 273.15
                    return result
                }
            } else {
                return 0.0
            }
        }
    }
    
    struct Units {
        
        enum List {
            case Length
            case Volume
            case Density
            case Energy
            case Area
            case Mass
            case Time
            case EneregyDensity
            case Pressure
            case Flow
            case Temperature
            case Materials
        }
        
        enum Length {
            case cm
            case feet
            case inches
            case meters
            case mm
        }
        
        func length(value: String) -> Length {
            switch value {
            case "cm":
                return .cm
            case "feet":
                return .feet
            case "inches":
                return .inches
            case "meters":
                return .meters
            case "mm":
                return .mm
            default:
                return .feet
            }
        }
        
        enum Volume {
            case ftCub
            case gallon
            case inchesCub
            case liter
            case metersCub
        }
        
        enum Density {
            case kgCubM
            case lbCubFt
        }
        
        enum Energy {
            case kW
            case BtuSec
        }
        
        enum Area {
            case FtSq
            case inchesSq
            case mSq
        }
        
        enum Mass {
            case g
            case kg
            case lb
        }
        
        enum Time {
            case Hour
            case Min
            case Sec
        }
        
        enum Pressure {
            case inchesH2O
            case kPa
            case mbar
            case psi
        }
        
        enum EnergyDensity {
            case Btu_Sec_ft²
            case kW_m²
        }
        
        enum Flow {
            case cfm
            case ft³_Sec
            case m³_Hr
            case m³_Sec
        }
        
        enum Temperature {
            case C
            case F
            case K
            case R
        }
        
    }
    
    struct Materials {
        func getMaterialValue(material: material) -> Double {
            switch material {
            case .AeratedConcrete:
                return 0.00026
            case .AluminaSilicateBlock:
                return 0.00014
            case .Aluminum:
                return 0.206
            case .Brick:
                return 0.0008
            case .BrickConcreteBlock:
                return 0.00073
            case .CalciumSilicateBoard:
                return 0.00013
            case .Chipboard:
                return 0.00015
            case .Concrete:
                return 0.0016
            case .ExpendedPolystyrene:
                return 0.000034
                
            case .FiberInsulationBoard:
                return 0.00053
            case .GlassFiberInsulation:
                return 0.000037
            case .GlassPlate:
                return 0.00076
                
            case .GypsumBoard:
                return 0.00017
            case .Plasterboard:
                return 0.00016
            case .Plywood:
                return 0.00012
                
            case .Steel:
                return 0.054
            }
        }
        
        func getMaterial(material: String) -> Conversion.Materials.material {
            switch material {
            case "Aerated Concrete":
                return .AeratedConcrete
            case "Alumina Silicate Block":
                return .AluminaSilicateBlock
            case "Aluminum":
                return .Aluminum
            case "Brick":
                return .Brick
            case "Brick/Concrete Block":
                return .BrickConcreteBlock
            case "Calcium Silicate Board ":
                return .CalciumSilicateBoard
            case "Chipboard":
                return .Chipboard
            case "Concrete":
                return .Concrete
            case "Expended Polystyrene":
                return .ExpendedPolystyrene
            case "Fiber Insulation Board":
                return .FiberInsulationBoard
            case "Glass Fiber Insulation":
                return .GlassFiberInsulation
            case "Glass Plate":
                return .GlassPlate
            case "Gypsum Board":
                return .GypsumBoard
            case "Plasterboard":
                return .Plasterboard
            case "Plywood":
                return .Plywood
            case "Steel":
                return .Steel
            default:
                return .GypsumBoard
            }
        }
        
        enum material {
            case AeratedConcrete
            case AluminaSilicateBlock
            case Aluminum
            case Brick
            case BrickConcreteBlock
            case CalciumSilicateBoard
            case Chipboard
            case Concrete
            case ExpendedPolystyrene
            
            case FiberInsulationBoard
            case GlassFiberInsulation
            case GlassPlate
            
            case GypsumBoard
            case Plasterboard
            case Plywood
            
            case Steel
        }
    }
    
    struct Mass {
        enum Mass {
            case g
            case kg
            case lb
        }
        
        func convertMass(value: Double, from unit: Mass) -> Double {
            switch unit {
            case .g:
                return value * 0.001
            case .kg:
                return value * 1
            case .lb:
                return value * 0.453592
            }
        }
        
        func convertToKg(value: Double, from unit: Mass) -> Double {
            switch unit {
            case .g:
                return value / 0.001
            case .kg:
                return value / 1
            case .lb:
                return value / 0.453592
            }
        }
        
        func getUnits(string: String) -> Mass {
            switch string {
            case "g":
                return .g
            case "kg":
                return .kg
            case "lb":
                return .lb
            default:
                return .g
            }
        }
        
    }
    

}


extension Double {
    /// Rounds the double to decimal places value
    /// - Parameter places: Number of places to round to
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
        
    }
}












