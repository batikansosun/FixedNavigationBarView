# FixedNavigationBarView
A fast, lightweight and flexible Navigation Bar View created with Pure Swift. compatible with Obj-C 


### Navigation Bar Purpose:
 
 Tell people where they are in the app, provide navigation, and may contain buttons and title for initiating actions and communicating information.
 
 
### Navigation Bar Usage:
 
 This Navigation Bar has 3 convenience initializer method, you can use one these for your requirement.
 
### Parameters:
 - Left Button: known as the most back button, the default action pop the current view controller if this button action method is not called.
 
 - Right Button: known as the most Side Menu button, the default action show side menu from right if this button action method is not called.
 
 - Title: Provide information about current view controller
 
 
Let's create some examples.

:rabbit: If you want use navigation bar in a view container you need create a view and pass that reference as parameter as containerView value.

``` Swift
 _ = FixedNavigationBar(title: title, containerView: self.fixedNavigationBar)
```


:bee: If you need instance of that you can assign 
 
 ``` Swift
 let navigationBar = FixedNavigationBar(title: title, containerView: self.fixedNavigationBar)
```

:bulb: If you want hiding right menu.

 ``` Swift
_ = FixedNavigationBarView(title: "Title", containerView: self.fixedNavigationBarView, hideRightMenu: true)
```

:bell: Now that navigation bar have a badge count - that's may be push notification count or others. You can set this label value.
 ``` Swift
    func refreshBadgeCount() {
        // refresh badge manager
        labelBadge.text = kBadgeCount
    }
```

:imp: And last  big convenience initial method. If you want set some custom action in back button pressed closure 
or right button closure you can.

 ``` Swift
_ = FixedNavigationBarView(title: "Title", containerView: self.fixedNavigationBarView, 
       backButtonCompletion: {
            // some custom actions
        }, homeButtonCompletion: {
            // some custom actions
        })
```

:camera: ScreenShot
![custom navigation bar](https://github.com/batikansosun/FixedNavigationBarView/blob/master/example-ss-modify.jpeg)




## License
`FixedNavigationBarView` is released under the MIT license. See [LICENSE](https://github.com/batikansosun/FixedNavigationBarView/blob/master/LICENSE) for details.
