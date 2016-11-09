//
//    Copyright (c) 2016 Mikhail Motylev https://twitter.com/mikhail_motylev
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy of
//    this software and associated documentation files (the "Software"), to deal in
//    the Software without restriction, including without limitation the rights to
//    use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//    the Software, and to permit persons to whom the Software is furnished to do so,
//    subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//    FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//    COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//    IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

open class SKView: UIView {
    
    // MARK: - Init/Deinit
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        registerStyleKitObserver()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        registerStyleKitObserver()
    }
    
    deinit {
        unregisterStyleKitObserver()
    }
    
    // MARK: - StyleKit Observer
    func registerStyleKitObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(onStylesDidLoad), name: .SKStyleKitDidLoadStyles, object: nil)
    }
    
    func unregisterStyleKitObserver() {
        NotificationCenter.default.removeObserver(self, name: .SKStyleKitDidLoadStyles, object: nil)
    }

    func onStylesDidLoad() {
        
    }

    // MARK: - Style properties
    @IBInspectable open var styleName: String? {
        
        get {
            return style?.name
        }
        
        set {
            style = StyleKit.style(withName: newValue)
        }
    }
    
    open var style: SKStyle? {
        
        didSet {
            
            if oldValue != style {
                style?.apply(view: self)
            }
        }
    }
}
