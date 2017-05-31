//
//  Country.swift
//  XoomAssignment
//
//  Created by Chris Kong on 5/27/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//
//  https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2

import Foundation

public enum Country: Int {
    case Argentina = 0
    case Australia
    case Austria
    case Bangladesh
    case Belgium
    case Bolivia
    case Brazil
    case Bulgaria
    case Canada
    case Chile
    case China
    case Colombia
    case CostaRica
    case Croatia
    case Cyprus
    case CzechRepublic
    case Denmark
    case DominicanRepublic
    case Ecuador
    case ElSalvador
    case Estonia
    case Finland
    case France
    case Germany
    case Greece
    case Guatemala
    case Guyana
    case Haiti
    case Honduras
    case HongKong
    case Hungary
    case India
    case Ireland
    case Italy
    case Jamaica
    case Japan
    case Latvia
    case Lithuania
    case Luxembourg
    case Malta
    case Mexico
    case Monaco
    case Nepal
    case Netherlands
    case Nicaragua
    case Nigeria
    case Norway
    case Pakistan
    case Peru
    case Philippines
    case Poland
    case Portugal
    case SanMarino
    case Singapore
    case Slovakia
    case Slovenia
    case SouthAfrica
    case Spain
    case SriLanka
    case Sweden
    case UnitedKingdom
    case Uruguay
    case Vietnam
    
    // MARK: Properties
    
    static var count: Int { return Country.Vietnam.rawValue + 1 }
    
    var name: String {
        get { return String(describing: self) }
    }
    
    var description: String? {
        get {
            switch self {
                case .Argentina: return "🇦🇷 Argentina"
                case .Australia: return "🇦🇺 Australia"
                case .Austria: return "🇦🇹 Austria"
                case .Bangladesh: return "🇧🇩 Bangladesh"
                case .Belgium: return "🇧🇪 Belgium"
                case .Bolivia: return "🇧🇴 Bolivia"
                case .Brazil: return "🇧🇷 Brazil"
                case .Bulgaria: return "🇧🇬 Bulgaria"
                case .Canada: return "🇨🇦 Canada"
                case .Chile: return "🇨🇱 Chile"
                case .China: return "🇨🇳 China"
                case .Colombia: return "🇨🇴 Colombia"
                case .CostaRica: return "🇨🇷 Costa Rica"
                case .Croatia: return "🇭🇷 Croatia"
                case .Cyprus: return "🇨🇾 Cyprus"
                case .CzechRepublic: return "🇨🇿 Czechia"
                case .Denmark: return "🇩🇰 Denmark"
                case .DominicanRepublic: return "🇩🇴 Dominican Republic"
                case .Ecuador: return "🇪🇨 Ecuador"
                case .ElSalvador: return "🇸🇻 El Salvador"
                case .Estonia: return "🇪🇪 Estonia"
                case .Finland: return "🇫🇮 Finland"
                case .France: return "🇫🇷 France"
                case .Germany: return "🇩🇪 Germany"
                case .Greece: return "🇬🇷 Greece"
                case .Guatemala: return "🇬🇹 Guatemala"
                case .Guyana: return "🇬🇾 Guyana"
                case .Haiti: return "🇭🇹 Haiti"
                case .Honduras: return "🇭🇳 Honduras"
                case .HongKong: return "🇭🇰 Hong Kong"
                case .Hungary: return "🇭🇺 Hungary"
                case .India: return "🇮🇳 India"
                case .Ireland: return "🇮🇪 Ireland"
                case .Italy: return "🇮🇹 Italy"
                case .Jamaica: return "🇯🇲 Jamaica"
                case .Japan: return "🇯🇵 Japan"
                case .Latvia: return "🇱🇻 Latvia"
                case .Lithuania: return "🇱🇹 Lithuania"
                case .Luxembourg: return "🇱🇺 Luxembourg"
                case .Malta: return "🇲🇹 Malta"
                case .Mexico: return "🇲🇽 Mexico"
                case .Monaco: return "🇲🇨 Monaco"
                case .Nepal: return "🇳🇵 Nepal"
                case .Netherlands: return "🇳🇱 Netherlands"
                case .Nicaragua: return "🇳🇮 Nicaragua"
                case .Nigeria: return "🇳🇬 Nigeria"
                case .Norway: return "🇳🇴 Norway"
                case .Pakistan: return "🇵🇰 Pakistan"
                case .Peru: return "🇵🇪 Peru"
                case .Philippines: return "🇵🇭 Philippines"
                case .Poland: return "🇵🇱 Poland"
                case .Portugal: return "🇵🇹 Portugal"
                case .SanMarino: return "🇸🇲 San Marino"
                case .Singapore: return "🇸🇬 Singapore"
                case .Slovakia: return "🇸🇰 Slovakia"
                case .Slovenia: return "🇸🇮 Slovenia"
                case .SouthAfrica: return "🇿🇦 South Africa"
                case .Spain: return "🇪🇸 Spain"
                case .SriLanka: return "🇱🇰 Sri Lanka"
                case .Sweden: return "🇸🇪 Sweden"
                case .UnitedKingdom: return "🇬🇧 United Kingdom"
                case .Uruguay: return "🇺🇾 Uruguay"
                case .Vietnam: return "🇻🇳 Vietnam"
            }
        }
    }
    
    var code: String {
        get {
            switch self {
                case .Argentina: return "AR"
                case .Australia: return "AU"
                case .Austria: return "AT"
                case .Bangladesh: return "BD"
                case .Belgium: return "BE"
                case .Bolivia: return "BO"
                case .Brazil: return "BR"
                case .Bulgaria: return "BG"
                case .Canada: return "CA"
                case .Chile: return "CL"
                case .China: return "CN"
                case .Colombia: return "CO"
                case .CostaRica: return "CR"
                case .Croatia: return "HR"
                case .Cyprus: return "CY"
                case .CzechRepublic: return "CZ"
                case .Denmark: return "DK"
                case .DominicanRepublic: return "DO"
                case .Ecuador: return "EC"
                case .ElSalvador: return "SV"
                case .Estonia: return "EE"
                case .Finland: return "FI"
                case .France: return "FR"
                case .Germany: return "DE"
                case .Greece: return "GR"
                case .Guatemala: return "GT"
                case .Guyana: return "GY"
                case .Haiti: return "HT"
                case .Honduras: return "HN"
                case .HongKong: return "HK"
                case .Hungary: return "HU"
                case .India: return "IN"
                case .Ireland: return "IE"
                case .Italy: return "IT"
                case .Jamaica: return "JM"
                case .Japan: return "JP"
                case .Latvia: return "LV"
                case .Lithuania: return "LT"
                case .Luxembourg: return "LU"
                case .Malta: return "MT"
                case .Mexico: return "MX"
                case .Monaco: return "MC"
                case .Nepal: return "NP"
                case .Netherlands: return "NL"
                case .Nicaragua: return "NI"
                case .Nigeria: return "NG"
                case .Norway: return "NO"
                case .Pakistan: return "PK"
                case .Peru: return "PE"
                case .Philippines: return "PH"
                case .Poland: return "PL"
                case .Portugal: return "PT"
                case .SanMarino: return "SM"
                case .Singapore: return "SG"
                case .Slovakia: return "SK"
                case .Slovenia: return "SI"
                case .SouthAfrica: return "ZA"
                case .Spain: return "ES"
                case .SriLanka: return "LK"
                case .Sweden: return "SE"
                case .UnitedKingdom: return "GB"
                case .Uruguay: return "UY"
                case .Vietnam: return "VN"
            }
        }
    }
}
