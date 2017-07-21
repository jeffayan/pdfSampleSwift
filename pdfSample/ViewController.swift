//
//  ViewController.swift
//  pdfSample
//
//  Created by Developer on 21/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var webView : UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        
        let url = URL(string: "https://stackoverflow.com/questions/26883816/open-pdf-file-using-swift")
        
      /*  let data = try! Data(contentsOf: url!)
        
        let html = String(data: data, encoding: .utf8)
        
    /*    let fmt = UIMarkupTextPrintFormatter(markupText: html!)
        
        let render = UIPrintPageRenderer()
        
        render.addPrintFormatter(fmt, startingAtPageAt: 0)
        
        let page  = CGRect(x: 0, y: 0, width: 500, height: 800)
        
        let printable = UIEdgeInsetsInsetRect(page , UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
        render.setValue(page, forKey: "paperRect")
        render.setValue(printable, forKey: "printableRect")
        
        let pdfData = NSMutableData()
        
        UIGraphicsBeginPDFContextToData(pdfData, CGRect.zero, nil)
        
     
            UIGraphicsBeginPDFPage()
            
            render.drawPage(at: 0, in: UIGraphicsGetPDFContextBounds())
     

        
        UIGraphicsEndPDFContext()
        
        
        
        let path = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("file.pdf")
        
        
       try! pdfData.write(to: path)
        
        print(path)
        
        print("open \(path)")
        
        let printPageRenderer = UIPrintPageRenderer()
        
        let printFormatter = UIMarkupTextPrintFormatter(markupText: html!)
        printPageRenderer.addPrintFormatter(printFormatter, startingAtPageAt: 0)
        
        let pdfData = drawPDFUsingPrintPageRenderer(printPageRenderer: printPageRenderer)
        
        let pdfFilename = NSTemporaryDirectory()+"/file.pdf"
            
        pdfData?.write(toFile: pdfFilename, atomically: true)
        
        print(pdfFilename)*/
        
        let pdfData = NSMutableData()
        
        UIGraphicsBeginPDFContextToData(pdfData, self.view.bounds, nil)
        
        
        
        let fmt = UIMarkupTextPrintFormatter(markupText: html!)
        
        let render = UIPrintPageRenderer()
        
        render.addPrintFormatter(fmt, startingAtPageAt: 0)
        
        let page  = CGRect(x: 0, y: 0, width: 500, height: 800)
        
        let printable = UIEdgeInsetsInsetRect(page , UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
        render.setValue(page, forKey: "paperRect")
        render.setValue(printable, forKey: "printableRect")
        
        
        UIGraphicsBeginPDFPage()
        
        let context = UIGraphicsGetCurrentContext()
        
        self.view.layer.render(in: context!)
        
        UIGraphicsEndPDFContext()
        
        
        
        let path = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("file.pdf")
        
        
        try! pdfData.write(to: path)
        
        print(path)
        
        print("open \(path)")*/
        
        
        
        webView.loadRequest(URLRequest(url: url!))
        
        
    }

    
    @IBAction func getPdf(_ sender: Any) {
        
        let render = UIPrintPageRenderer()
        
        let page  = CGRect(x: 0, y: 0, width: 500, height: 800)
        
        let printable = UIEdgeInsetsInsetRect(page , UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
        render.setValue(page, forKey: "paperRect")
        render.setValue(printable, forKey: "printableRect")
        
        let pdfData = NSMutableData()
        
        UIGraphicsBeginPDFContextToData(pdfData, self.view.bounds, nil)
        
        
        UIGraphicsBeginPDFPage()
        
        let context = UIGraphicsGetCurrentContext()
        
        self.webView.layer.render(in: context!)
        
        UIGraphicsEndPDFContext()

        let path = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("file.pdf")
        
       
        pdfData.write(to: path, atomically: true)
        
        
        webView.loadRequest(URLRequest(url: path))
        
    }
    
    
    

}

