//
//  Extention.swift
//  Glamera
//
//  Created by Ahlam on 7/6/20.
//  Copyright © 2020 Ahlam. All rights reserved.
//

import Foundation
import NVActivityIndicatorView
import UIKit
import Kingfisher

@IBDesignable
extension UIButton {
    @IBInspectable   var ButtonSpacing: CGFloat {
        set{
            self.titleEdgeInsets = UIEdgeInsets(top: 0, left: newValue, bottom: 0, right: newValue)
        }
        get{
            self.titleEdgeInsets = UIEdgeInsets(top: 0, left: self.ButtonSpacing, bottom: 0, right: self.ButtonSpacing)
            
            return self.ButtonSpacing
            
        }
        
        
    }
    
    
    func setSpecialTitle(part1:String,part2:String,part1Color:UIColor,part2Color:UIColor){
        let att = NSMutableAttributedString(string: "\(part1) \(part2)");
        att.addAttribute(NSAttributedString.Key.foregroundColor, value: part1Color, range: NSRange(location: 0, length: part1.count))
        att.addAttribute(NSAttributedString.Key.foregroundColor, value: part2Color, range: NSRange(location: part2.count, length: part2.count))
        self.setAttributedTitle(att, for: .normal)
    }
    
//    func underlineTitleButton(title:String,titleColor:UIColor){
//        underlineTitleButtonWithFont(title: title, titleColor: titleColor, font: Constants.englishFontMedium)
//
//
//    }
//    func underlineTitleButtonWithFont(title:String,titleColor:UIColor,font:String = Constants.englishFontRegular,fontSize:CGFloat = 12.0){
//        let yourAttributes: [NSAttributedString.Key: Any] = [
//            .font: UIFont(name: font, size: fontSize)!,
//            .foregroundColor: titleColor,
//            .underlineStyle: NSUnderlineStyle.thick.rawValue]
//
//        let attributeString = NSMutableAttributedString(string: title,
//                                                        attributes: yourAttributes)
//        self.setAttributedTitle(attributeString, for: .normal)
//
//
//    }
    
}

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}
extension UIView {
    public func viewController()-> UIViewController? {
        
        var nextResponder: UIResponder? = self
        
        repeat {
            nextResponder = nextResponder?.next
            
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
            
        } while nextResponder != nil
        
        return nil
    }
    
    func anchorSize(to view:UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
    }
    
    func anchor (top:NSLayoutYAxisAnchor?,leading:NSLayoutXAxisAnchor?,bottom:NSLayoutYAxisAnchor?,
                 trailling:NSLayoutXAxisAnchor?,padding:UIEdgeInsets = .zero,size:CGSize = .zero){
        
        
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top,constant:padding.top).isActive = true
        }
        
        if let leading = leading {
            
            leadingAnchor.constraint(equalTo: leading,constant:padding.left).isActive = true
        }
        if let bottom = bottom {
            
            bottomAnchor.constraint(equalTo: bottom,constant: -padding.bottom).isActive = true
        }
        if let trailling = trailling {
            
            trailingAnchor.constraint(equalTo: trailling,constant: -padding.right).isActive = true
        }
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
            
        }
    }
    func fillSuperView (){
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailling: superview?.trailingAnchor)
    }
    func popupConstraints (padding:UIEdgeInsets = .zero){
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailling: superview?.trailingAnchor)
        
        topAnchor.constraint(equalTo: (superview?.topAnchor)!,constant:padding.top).isActive = true
        bottomAnchor.constraint(equalTo: (superview?.bottomAnchor)!,constant: -padding.bottom).isActive = true
    }
    
    /** Round specific corners of UIView */
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    class func instanceFromNib(nibName:String) -> UIView {
        return UINib(nibName: nibName, bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
    }
    
}

extension UIImageView {
    @IBInspectable
    var tint: UIColor? {
        get {
            return self.tintColor
        }
        set {
            self.image = self.image!.withRenderingMode(.alwaysTemplate)
            self.tintColor = newValue
            
        }
    }
    
    func setImageUrl(url:String?){
        let imageUrl = URL(string: url?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
        let processor = DownsamplingImageProcessor(size: self.bounds.size)
        self.kf.setImage(
            with: imageUrl,
            placeholder: UIImage(named:"bg_no_image"),
            options: [.processor(processor),
                      .scaleFactor(UIScreen.main.scale),
                      .transition(.fade(1)),
                      .cacheOriginalImage])
    }
    
}



extension Date
{
    func toMillis() -> Int64! {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
    init?(dateString:String) {
        //        let dateStringFormatter = DateFormatter()
        //        dateStringFormatter.dateFormat = "yyyy/MM/dd"
        //        dateStringFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        let persianCalendar = Calendar(identifier: .gregorian)
        
        let testFotmatter = DateFormatter()
        testFotmatter.dateFormat = "yyyy/MM/dd"
        testFotmatter.timeZone = persianCalendar.timeZone
        testFotmatter.locale = persianCalendar.locale
        
        let date = testFotmatter.date(from:dateString)
        if date == nil {
            return nil
        }else{
            self.init(timeInterval: 0, since: date!)
        }
        
    }
    
    
    init?(dateString:String,formate:String){
        //        let dateStringFormatter = DateFormatter()
        //        dateStringFormatter.dateFormat = "yyyy/MM/dd"
        //        dateStringFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        let persianCalendar = Calendar(identifier: .gregorian)
        
        let testFotmatter = DateFormatter()
        testFotmatter.dateFormat = formate
        testFotmatter.timeZone = persianCalendar.timeZone
        testFotmatter.locale = persianCalendar.locale
        
        let date = testFotmatter.date(from:dateString)
        
        
        
        if date == nil {
            return nil
        }else{
            self.init(timeInterval: 0, since: date!)
        }
        
    }
    
//    func formatTo(toFormat:String,localized:Bool = false) ->String{
//        let formatter3 = DateFormatter()
//        formatter3.dateFormat = toFormat
//        if(localized){
//        if Language.language == .arabic{
//             formatter3.locale = Locale(identifier: "ar")
//        }else{
//             formatter3.locale = Locale(identifier: "en")
//        }
//        }
//
//        return  formatter3.string(from: self)
//    }
    
    
    func timeAgoSinceDate() -> String {
        
        // From Time
        let fromDate = self
        
        // To Time
        let toDate = Date()
        
        // Estimation
        // Year
        if let interval = Calendar.current.dateComponents([.year], from: fromDate, to: toDate).year, interval > 0  {
            
            return interval == 1 ? "\(interval)" + " " + "year ago" : "\(interval)" + " " + "years ago"
        }
        
        // Month
        if let interval = Calendar.current.dateComponents([.month], from: fromDate, to: toDate).month, interval > 0  {
            
            return interval == 1 ? "\(interval)" + " " + "month ago" : "\(interval)" + " " + "months ago"
        }
        
        // Day
        if let interval = Calendar.current.dateComponents([.day], from: fromDate, to: toDate).day, interval > 0  {
            
            return interval == 1 ? "\(interval)" + " " + "day ago" : "\(interval)" + " " + "days ago"
        }
        
        // Hours
        if let interval = Calendar.current.dateComponents([.hour], from: fromDate, to: toDate).hour, interval > 0 {
            
            return interval == 1 ? "\(interval)" + " " + "hour ago" : "\(interval)" + " " + "hours ago"
        }
        
        // Minute
        if let interval = Calendar.current.dateComponents([.minute], from: fromDate, to: toDate).minute, interval > 0 {
            
            return interval == 1 ? "\(interval)" + " " + "minute ago" : "\(interval)" + " " + "minutes ago"
        }
        
        return "a moment ago"
    }
    func isBetween(_ date1: Date, and date2: Date) -> Bool {
        let monthsToAdd = 0
        let daysToAdd = 1
        let yearsToAdd = 0
        var dateComponent = DateComponents()
        
        let monthsToAdd1 = 0
        let daysToAdd1 = -1
        let yearsToAdd1 = 0
        var dateComponent1 = DateComponents()
        
        dateComponent.month = monthsToAdd
        dateComponent.day = daysToAdd
        dateComponent.year = yearsToAdd
        
        dateComponent1.month = monthsToAdd1
        dateComponent1.day = daysToAdd1
        dateComponent1.year = yearsToAdd1
        
        let pastDate = Calendar.current.date(byAdding: dateComponent1, to: date1)
        let futureDate = Calendar.current.date(byAdding: dateComponent, to: date2)
        return (min(pastDate!, futureDate!) ... max(pastDate!, futureDate!)).contains(self)
    }
}
@IBDesignable
extension UITextField {
    
    /// set bottem line border
    func setBottomLine(borderColor: UIColor) {
        
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = borderColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

extension String {
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var URLEncoded:String {
        let unreservedChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~"
        let unreservedCharsSet: CharacterSet = CharacterSet(charactersIn: unreservedChars)
        let encodedString = self.addingPercentEncoding(withAllowedCharacters: unreservedCharsSet )
        return encodedString ?? self
    }
    
    func timeAgoSinceDate(formate:String) -> String {
        let date = try?  Date(dateString: self,formate: formate)
        return date?.timeAgoSinceDate() ?? self
    }
    
//    func formatDate(fromFormat:String,toFormat:String,localized:Bool = false) -> String{
//        return Date(dateString: self,formate: fromFormat)?.formatTo(toFormat: toFormat,localized: localized) ?? self
//    }
}

extension UIImageView {
    public func maskCircle() {
        
        //        print("the flag is >>> \(fla g)")
        self.borderWidth = 2
        //        self.borderColor = Constants.colorBlue
        self.cornerRadius = self.frame.height / 2
    }
}
@IBDesignable
extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    
    
//    @IBInspectable var paddingLeftCustom: CGFloat {
//        get {
//            return leftView!.frame.size.width
//        }
//        set {
//
//            if Language.language == .arabic{
//                self.textAlignment = .right
//                self.semanticContentAttribute = .forceRightToLeft
//            }else{
//                self.textAlignment = .left
//                self.semanticContentAttribute = .forceLeftToRight
//            }
//
//            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
//
//            rightView = paddingView
//            rightViewMode = .always
//            leftView = paddingView
//            leftViewMode = .always
//
//
//
//        }
//    }
    
    //    @IBInspectable var paddingRightCustom: CGFloat {
    //        get {
    //            return rightView!.frame.size.width
    //        }
    //        set {
    //            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
    //            rightView = paddingView
    //            rightViewMode = .always
    //        }
    //    }
}
extension UIColor {
    var redValue: CGFloat{ return CIColor(color: self).red * 255}
    var greenValue: CGFloat{ return CIColor(color: self).green * 255 }
    var blueValue: CGFloat{ return CIColor(color: self).blue * 255}
    var alphaValue: CGFloat{ return CIColor(color: self).alpha * 255 }
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"#%06x", rgb)
    }
}

public extension UIWindow {
    
    /** @return Returns the current Top Most ViewController in hierarchy.   */
    func topMostWindowController()->UIViewController? {
        
        var topController = rootViewController
        
        while let presentedController = topController?.presentedViewController {
            topController = presentedController
        }
        
        return topController
    }
    
    
    /** @return Returns the topViewController in stack of topMostWindowController.    */
    func currentViewController()->UIViewController? {
        
        var currentViewController = topMostWindowController()
        
        while currentViewController != nil && currentViewController is UINavigationController && (currentViewController as! UINavigationController).topViewController != nil {
            currentViewController = (currentViewController as! UINavigationController).topViewController
        }
        
        return currentViewController
    }
}

extension UIImage {
    func resizeImage(targetSize: CGSize) -> UIImage {
        let size = self.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    
    
    func fixedOrientation() -> UIImage {
        if imageOrientation == .up { return self }
        var transform:CGAffineTransform = .identity
        switch imageOrientation {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: size.height).rotated(by: .pi)
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: size.width, y: 0).rotated(by: .pi/2)
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: size.height).rotated(by: -.pi/2)
        default: break
        }
        switch imageOrientation {
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: 0).scaledBy(x: -1, y: 1)
        case .leftMirrored, .rightMirrored:
            transform = transform.translatedBy(x: size.height, y: 0).scaledBy(x: -1, y: 1)
        default: break
        }
        let ctx = CGContext(data: nil, width: Int(size.width), height: Int(size.height),
                            bitsPerComponent: cgImage!.bitsPerComponent, bytesPerRow: 0,
                            space: cgImage!.colorSpace!, bitmapInfo: cgImage!.bitmapInfo.rawValue)!
        ctx.concatenate(transform)
        switch imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            ctx.draw(cgImage!, in: CGRect(x: 0, y: 0, width: size.height,height: size.width))
        default:
            ctx.draw(cgImage!, in: CGRect(x: 0, y: 0, width: size.width,height: size.height))
        }
        return UIImage(cgImage: ctx.makeImage()!)
    }
}

extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}
extension String: Error {}

public extension String {
    
    var replacedArabicDigitsWithEnglish: String {
        var str = self
        let map = ["٠": "0",
                   "١": "1",
                   "٢": "2",
                   "٣": "3",
                   "٤": "4",
                   "٥": "5",
                   "٦": "6",
                   "٧": "7",
                   "٨": "8",
                   "٩": "9"]
        map.forEach { str = str.replacingOccurrences(of: $0, with: $1) }
        return str
    }
    
    //    func replaceArabicToEng() -> NSNumber {
    //        let numberFormatter = NumberFormatter()
    //        numberFormatter.locale = Locale(identifier: "EN")
    //        return numberFormatter.number(from: self)
    //    }
}


public extension UIDevice {
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPhone3,1", "iPhone3,2", "iPhone3,3", "iPhone4,1":
            return "iPhone 4"
            
        case "iPhone5,1", "iPhone5,2", "iPhone5,3", "iPhone5,4", "iPhone6,1", "iPhone6,2", "iPhone8,4":
            return "iPhone 5"
            
        case "iPhone7,2", "iPhone8,1", "iPhone9,1", "iPhone9,3", "iPhone10,1", "iPhone10,4":
            return "iPhone 6,7,8"
            
        case "iPhone7,1", "iPhone8,2", "iPhone9,2", "iPhone9,4", "iPhone10,2", "iPhone10,5":
            return "iPhone Plus"
            
        case "iPhone10,3", "iPhone10,6",  "iPhone11,2",  "iPhone11,4" , "iPhone11,6", "iPhone11,8":
            return "iPhone X"
            
        case "i386", "x86_64":
            return "Simulator"
        default:
            return identifier
        }
    }
}


//protocol Refreshable where Self: UIViewController {
//}
//extension Refreshable {
//    func Loading(){
//        NVActivityIndicatorPresenter.sharedInstance.startAnimating(Constants.activityData)
//    }
//    func stopLoading() {
//        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
//    }
//}
//extension UIViewController:Refreshable{
//    
//    func add(asChildViewController viewController: UIViewController, containerView:UIView) {
//        // Add Child View Controller
//        addChild(viewController)
//        
//        // Add Child View as Subview
//        containerView.addSubview(viewController.view)
//        
//        // Configure Child View
//        viewController.view.frame = containerView.bounds
//        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        
//        // Notify Child View Controller
//        viewController.didMove(toParent: self)
//    }
//    
//    func remove(asChildViewController viewController: UIViewController) {
//        // Notify Child View Controller
//        viewController.willMove(toParent: nil)
//        
//        // Remove Child View From Superview
//        viewController.view.removeFromSuperview()
//        
//        // Notify Child View Controller
//        viewController.removeFromParent()
//    }
//}

extension UITableView {
    
    override open func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.tableFooterView = UIView()
        
    }
}

extension UISegmentedControl {
    func removeBorders() {
        setBackgroundImage(imageWithColor(color: backgroundColor!), for: .normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: tintColor!), for: .selected, barMetrics: .default)
        setDividerImage(imageWithColor(color: UIColor.clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }
    
    // create a 1x1 image with this color
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}


extension UIImage {
    //MARK:- Base64 // "data:image/jpeg;base64," +
    func convertImageToStingBase64(completion:@escaping ((_ imgString:String)->())){
        DispatchQueue.global(qos: .background).async  {
            var strBase64 = ""
            let fixOrientationImage = self.fixedOrientation()
            if let imageData = fixOrientationImage.jpeg(.low){
                print("low : " ,imageData.count)
                strBase64 = imageData.base64EncodedString(options: .endLineWithLineFeed)
                DispatchQueue.main.sync {
                    completion(strBase64)
                }
            }
        }
    }
    
    func convertImageToBase64()->String{
        //        DispatchQueue.global(qos: .background).async
        //            {
        
        let imageData:NSData = self.jpeg(.lowest)! as NSData
        let imageStr = imageData.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        print(imageStr)
        return imageStr
        //        }
        
    }
    
    //    func convertImageToStingBase64(completion:@escaping ((_ imgString:String)->())){
    //        DispatchQueue.global(qos: .background).async  {
    //            var strBase64 = ""
    //            let fixOrientationImage = self.fixedOrientation()
    //            if let imageData = fixOrientationImage.jpeg(.low){
    //                print("low : " ,imageData.count)
    //                strBase64 = imageData.base64EncodedString()
    //                DispatchQueue.main.sync {
    //                    completion(Constants.BASE64_IMAGE_HEADER + strBase64)
    //                }
    //            }
    //        }
    //    }
    //
    //    func toBase64(completion:@escaping ((_ imgString:String)->()))  {
    //
    //
    //        DispatchQueue.global(qos: .background).async  {
    //            guard let imageData = self.pngData() else { return  }
    //            let base64 = imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
    //            DispatchQueue.main.sync {
    //                completion(base64)
    //            }
    //        }
    //    }
    //
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    /// Returns the data for the specified image in JPEG format.
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    func jpeg(_ jpegQuality: JPEGQuality) -> Data? {
        return jpegData(compressionQuality: jpegQuality.rawValue)
    }
    
    
}

extension UINavigationController {
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        if let topViewController = presentedViewController{
            return topViewController.preferredStatusBarStyle
        }
        if let topViewController = viewControllers.last {
            return topViewController.preferredStatusBarStyle
        }
        
        return .lightContent
    }
    
}
//extension UILabel{
//    func setFont(title:String,details:String){
//        let titleFont = UIFont(name: "SFCompactDisplay-bold", size: 16)
//        let detailsFont = UIFont(name: "SFCompactDisplay-regular", size: 16)
//
////        let attrs1 = [NSAttributedString.Key.font : titleFont, NSAttributedString.Key.foregroundColor : Constants.colorDarkGray]
//
////        let attrs2 = [NSAttributedString.Key.font : detailsFont, NSAttributedString.Key.foregroundColor : Constants.colorDarkGray]
//
//        let attributedString1 = NSMutableAttributedString(string:title, attributes:attrs1)
//
//        let attributedString2 = NSMutableAttributedString(string:details, attributes:attrs2)
//
//        attributedString1.append(attributedString2)
//        self.attributedText = attributedString1
//
//    }
//}
extension UILabel {
    
    // Pass value for any one of both parameters and see result
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {
        
        guard let labelText = self.text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        
        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        
        // Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        self.attributedText = attributedString
    }
}
extension Bool {
    var intValue: Int {
        return self ? 1 : 0
    }
}
extension Int {
    var boolValue: Bool {
        return self != 0
    }
}
