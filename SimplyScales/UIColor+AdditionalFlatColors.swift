//
//  UIColor+FlatColorLibrary.swift
//  SimplyScales
//
//  Created by Joseph Herkness on 10/19/14.
//  Copyright (c) 2014 Joseph Herkness. All rights reserved.
//

import UIKit
//Flat Colors - Random Color Shorthand
let RandomFlatColor : UIColor = UIColor.randomFlatColor()

//Flat Colors - Light Shades Shorthand
let FlatBlack : UIColor = UIColor.flatBlackColor()
let FlatBlue : UIColor = UIColor.flatBlueColor()
let FlatBrown : UIColor = UIColor.flatBrownColor()
let FlatCoffee : UIColor = UIColor.flatCoffeeColor()
let FlatForestGreen : UIColor = UIColor.flatForestGreenColor()
let FlatGray : UIColor = UIColor.flatGrayColor()
let FlatGreen : UIColor = UIColor.flatGreenColor()
let FlatLime : UIColor = UIColor.flatLimeColor()
let FlatMagenta : UIColor = UIColor.flatMagentaColor()
let FlatMaroon : UIColor = UIColor.flatMaroonColor()
let FlatMint : UIColor = UIColor.flatMintColor()
let FlatNavyBlue : UIColor = UIColor.flatNavyBlueColor()
let FlatOrange : UIColor = UIColor.flatOrangeColor()
let FlatPink : UIColor = UIColor.flatPinkColor()
let FlatPlum : UIColor = UIColor.flatPlumColor()
let FlatPowderBlue : UIColor = UIColor.flatPowderBlueColor()
let FlatPurple : UIColor = UIColor.flatPurpleColor()
let FlatRed : UIColor = UIColor.flatRedColor()
let FlatSand : UIColor = UIColor.flatSandColor()
let FlatSkyBlue : UIColor = UIColor.flatSkyBlueColor()
let FlatTeal : UIColor = UIColor.flatTealColor()
let FlatWatermelon : UIColor = UIColor.flatWatermelonColor()
let FlatWhite : UIColor = UIColor.flatWhiteColor()
let FlatYellow : UIColor = UIColor.flatYellowColor()

//Flat Colors - Dark Shades Shorthand
let FlatBlackDark : UIColor = UIColor.flatBlackColorDark()
let FlatBlueDark : UIColor = UIColor.flatBlueColorDark()
let FlatBrownDark : UIColor = UIColor.flatBrownColorDark()
let FlatCoffeeDark : UIColor = UIColor.flatCoffeeColorDark()
let FlatForestGreenDark : UIColor = UIColor.flatForestGreenColorDark()
let FlatGrayDark : UIColor = UIColor.flatGrayColorDark()
let FlatGreenDark : UIColor = UIColor.flatGreenColorDark()
let FlatLimeDark : UIColor = UIColor.flatLimeColorDark()
let FlatMagentaDark : UIColor = UIColor.flatMagentaColorDark()
let FlatMaroonDark : UIColor = UIColor.flatMaroonColorDark()
let FlatMintDark : UIColor = UIColor.flatMintColorDark()
let FlatNavyBlueDark : UIColor = UIColor.flatNavyBlueColorDark()
let FlatOrangeDark : UIColor = UIColor.flatOrangeColorDark()
let FlatPinkDark : UIColor = UIColor.flatPinkColorDark()
let FlatPlumDark : UIColor = UIColor.flatPlumColorDark()
let FlatPowderBlueDark : UIColor = UIColor.flatPowderBlueColorDark()
let FlatPurpleDark : UIColor = UIColor.flatPurpleColorDark()
let FlatRedDark : UIColor = UIColor.flatRedColorDark()
let FlatSandDark : UIColor = UIColor.flatSandColorDark()
let FlatSkyBlueDark : UIColor = UIColor.flatSkyBlueColorDark()
let FlatTealDark : UIColor = UIColor.flatTealColorDark()
let FlatWatermelonDark : UIColor = UIColor.flatWatermelonColorDark()
let FlatWhiteDark : UIColor = UIColor.flatWhiteColorDark()
let FlatYellowDark : UIColor = UIColor.flatYellowColorDark()

extension UIColor {
    
    //Light Shades
    class func flatBlackColor() -> UIColor{
        return UIColor(hue: 0/360, saturation: 0/100, brightness: 17/100, alpha: 1.0)
    }
    
    class func flatBlueColor() -> UIColor {
        return UIColor(hue: 224/360, saturation: 50/100, brightness: 63/100, alpha: 1.0)
    }
    
    class func flatBrownColor() -> UIColor {
        return UIColor(hue: 24/360, saturation: 45/100, brightness: 37/100, alpha: 1.0)
    }
    
    class func flatCoffeeColor() -> UIColor {
        return UIColor(hue: 25/360, saturation: 31/100, brightness: 64/100, alpha: 1.0)
    }
    
    class func flatForestGreenColor() -> UIColor {
        return UIColor(hue: 138/360, saturation: 45/100, brightness: 37/100, alpha: 1.0)
    }
    
    class func flatGrayColor() -> UIColor {
        return UIColor(hue: 184/360, saturation: 10/100, brightness: 65/100, alpha: 1.0)
    }
    
    class func flatGreenColor() -> UIColor {
        return UIColor(hue: 145/360, saturation: 77/100, brightness: 80/100, alpha: 1.0)
    }
    
    class func flatLimeColor() -> UIColor {
        return UIColor(hue: 74/360, saturation: 70/100, brightness: 78/100, alpha: 1.0)
    }
    
    class func flatMagentaColor() -> UIColor {
        return UIColor(hue: 283/360, saturation: 51/100, brightness: 71/100, alpha: 1.0)
    }
    
    class func flatMaroonColor() -> UIColor {
        return UIColor(hue: 5/360, saturation: 65/100, brightness: 47/100, alpha: 1.0)
    }
    
    class func flatMintColor() -> UIColor {
        return UIColor(hue: 168/360, saturation: 86/100, brightness: 74/100, alpha: 1.0)
    }
    
    class func flatNavyBlueColor() -> UIColor {
        return UIColor(hue: 210/360, saturation: 45/100, brightness: 37/100, alpha: 1.0)
    }
    
    class func flatOrangeColor() -> UIColor {
        return UIColor(hue: 28/360, saturation: 85/100, brightness: 90/100, alpha: 1.0)
    }
    
    class func flatPinkColor() -> UIColor {
        return UIColor(hue: 324/360, saturation: 49/100, brightness: 96/100, alpha: 1.0)
    }
    
    class func flatPlumColor() -> UIColor {
        return UIColor(hue: 300/360, saturation: 45/100, brightness: 37/100, alpha: 1.0)
    }
    
    class func flatPowderBlueColor() -> UIColor {
        return UIColor(hue: 222/360, saturation: 24/100, brightness: 95/100, alpha: 1.0)
    }
    
    class func flatPurpleColor() -> UIColor {
        return UIColor(hue: 253/360, saturation: 52/100, brightness: 77/100, alpha: 1.0)
    }
    
    class func flatRedColor() -> UIColor {
        return UIColor(hue: 6/360, saturation: 74/100, brightness: 91/100, alpha: 1.0)
    }
    
    class func flatSandColor() -> UIColor {
        return UIColor(hue: 42/360, saturation: 25/100, brightness: 94/100, alpha: 1.0)
    }
    
    class func flatSkyBlueColor() -> UIColor {
        return UIColor(hue: 204/360, saturation: 76/100, brightness: 86/100, alpha: 1.0)
    }
    
    class func flatTealColor() -> UIColor {
        return UIColor(hue: 195/360, saturation: 55/100, brightness: 51/100, alpha: 1.0)
    }
    
    class func flatWatermelonColor() -> UIColor {
        return UIColor(hue: 356/360, saturation: 53/100, brightness: 94/100, alpha: 1.0)
    }
    
    class func flatWhiteColor() -> UIColor {
        return UIColor(hue: 192/360, saturation: 2/100, brightness: 95/100, alpha: 1.0)
    }
    
    class func flatYellowColor() -> UIColor {
        return UIColor(hue: 48/360, saturation: 99/100, brightness: 100/100, alpha: 1.0)
    }
    
    // Dark Shades
    
    class func flatBlackColorDark() -> UIColor {
        return UIColor(hue: 0/360, saturation: 0/100, brightness: 15/100, alpha: 1.0)
    }
    
    class func flatBlueColorDark() -> UIColor {
        return UIColor(hue: 224/360, saturation: 56/100, brightness: 51/100, alpha: 1.0)
    }
    
    class func flatBrownColorDark() -> UIColor {
        return UIColor(hue: 25/360, saturation: 45/100, brightness: 31/100, alpha: 1.0)
    }
    
    class func flatCoffeeColorDark() -> UIColor {
        return UIColor(hue: 25/360, saturation: 34/100, brightness: 56/100, alpha: 1.0)
    }
    
    class func flatForestGreenColorDark() -> UIColor {
        return UIColor(hue: 135/360, saturation: 44/100, brightness: 31/100, alpha: 1.0)
    }
    
    class func flatGrayColorDark() -> UIColor {
        return UIColor(hue: 184/360, saturation: 10/100, brightness: 55/100, alpha: 1.0)
    }
    
    class func flatGreenColorDark() -> UIColor {
        return UIColor(hue: 145/360, saturation: 78/100, brightness: 68/100, alpha: 1.0)
    }
    
    class func flatLimeColorDark() -> UIColor {
        return UIColor(hue: 74/360, saturation: 81/100, brightness: 69/100, alpha: 1.0)
    }
    
    class func flatMagentaColorDark() -> UIColor {
        return UIColor(hue: 282/360, saturation: 61/100, brightness: 68/100, alpha: 1.0)
    }
    
    class func flatMaroonColorDark() -> UIColor {
        return UIColor(hue: 4/360, saturation: 68/100, brightness: 40/100, alpha: 1.0)
    }
    
    class func flatMintColorDark() -> UIColor {
        return UIColor(hue: 168/360, saturation: 86/100, brightness: 63/100, alpha: 1.0)
    }
    
    class func flatNavyBlueColorDark() -> UIColor {
        return UIColor(hue: 210/360, saturation: 45/100, brightness: 31/100, alpha: 1.0)
    }
    
    class func flatOrangeColorDark() -> UIColor {
        return UIColor(hue: 24/360, saturation: 100/100, brightness: 83/100, alpha: 1.0)
    }
    
    class func flatPinkColorDark() -> UIColor {
        return UIColor(hue: 327/360, saturation: 57/100, brightness: 83/100, alpha: 1.0)
    }
    
    class func flatPlumColorDark() -> UIColor {
        return UIColor(hue: 300/360, saturation: 46/100, brightness: 31/100, alpha: 1.0)
    }
    
    class func flatPowderBlueColorDark() -> UIColor {
        return UIColor(hue: 222/360, saturation: 28/100, brightness: 84/100, alpha: 1.0)
    }
    
    class func flatPurpleColorDark() -> UIColor {
        return UIColor(hue: 253/360, saturation: 56/100, brightness: 64/100, alpha: 1.0)
    }
    
    class func flatRedColorDark() -> UIColor {
        return UIColor(hue: 6/360, saturation: 78/100, brightness: 75/100, alpha: 1.0)
    }
    
    class func flatSandColorDark() -> UIColor {
        return UIColor(hue: 42/360, saturation: 30/100, brightness: 84/100, alpha: 1.0)
    }
    
    class func flatSkyBlueColorDark() -> UIColor {
        return UIColor(hue: 204/360, saturation: 78/100, brightness: 73/100, alpha: 1.0)
    }
    
    class func flatTealColorDark() -> UIColor {
        return UIColor(hue: 196/360, saturation: 54/100, brightness: 45/100, alpha: 1.0)
    }
    
    class func flatWatermelonColorDark() -> UIColor {
        return UIColor(hue: 358/360, saturation: 61/100, brightness: 85/100, alpha: 1.0)
    }
    
    class func flatWhiteColorDark() -> UIColor {
        return UIColor(hue: 204/360, saturation: 5/100, brightness: 78/100, alpha: 1.0)
    }
    
    class func flatYellowColorDark() -> UIColor {
        return UIColor(hue: 40/360, saturation: 100/100, brightness: 100/100, alpha: 1.0)
    }
    
    func colorWithBrightnessModifier(modifier: CGFloat) -> UIColor {
        var hue : CGFloat = 0
        var saturation : CGFloat = 0
        var brightness : CGFloat = 0
        var alpha : CGFloat = 0
        
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            return UIColor(hue: hue, saturation: saturation, brightness: brightness * modifier, alpha: alpha)
        } else {
            return self;
        }
    }
    
    class func randomFlatColor() -> UIColor {
        return UIColor.flatColors()[Int(arc4random_uniform(UInt32(UIColor.flatColors().count)))]
    }
    
    class func flatColors() -> [UIColor]{
        //return [FlatBlack, FlatBlue, FlatBrown, FlatCoffee, FlatForestGreen, FlatGray, FlatGreen, FlatLime, FlatMagenta, FlatMaroon, FlatMint,FlatNavyBlue, FlatOrange, FlatPink, FlatPlum, FlatPowderBlue, FlatPurple, FlatRed, FlatSand, FlatSkyBlue, FlatTeal, FlatWatermelon, FlatWhite, FlatYellow, FlatBlackDark, FlatBlueDark, FlatBrownDark, FlatCoffeeDark, FlatForestGreenDark,  FlatGrayDark, FlatGreenDark,FlatLimeDark, FlatMagentaDark, FlatMaroonDark, FlatMintDark, FlatNavyBlueDark, FlatOrangeDark, FlatPinkDark, FlatPlumDark, FlatPowderBlueDark, FlatPurpleDark, FlatRedDark, FlatSandDark, FlatSkyBlueDark, FlatTealDark, FlatWatermelonDark, FlatWhiteDark, FlatYellowDark]
        return [FlatMint, FlatMintDark, FlatGreen, FlatGreenDark, FlatSkyBlue, FlatSkyBlueDark, FlatMagenta, FlatMagentaDark, FlatNavyBlue, FlatNavyBlueDark, FlatYellow, FlatYellowDark, FlatOrange, FlatOrangeDark, FlatRed, FlatRedDark]
    }
    
    class func sortedFlatColors() -> [UIColor]{
        func hue(color1: UIColor, color2: UIColor) -> Bool {
            var hue1 : CGFloat = 0
            var saturation1 : CGFloat = 0
            var brightness1 : CGFloat = 0
            var alpha1 : CGFloat = 0
            color1.getHue(&hue1, saturation: &saturation1, brightness: &brightness1, alpha: &alpha1)

            var hue2 : CGFloat = 0
            var saturation2 : CGFloat = 0
            var brightness2 : CGFloat = 0
            var alpha2 : CGFloat = 0
            color2.getHue(&hue2, saturation: &saturation2, brightness: &brightness2, alpha: &alpha2)
            
            return hue1 > hue2
        }
        return sorted(flatColors(), hue)
    }
    
    func getHexStringForColor() -> NSString{
        var components = CGColorGetComponents(self.CGColor)
        var r = components[0]
        var g = components[1]
        var b = components[2]
        
        return NSString(format:"%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
    }
}
