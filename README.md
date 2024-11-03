<div align="center">
 <img alt="ollama" height="200px" src="https://github.com/hmartinez82/qt-uiautomation-id/blob/main/Assets/uia.png">
</div>

# UI Automation Id for Qt

Qt patches that add support for defining the [AutomationId](https://learn.microsoft.com/en-us/dotnet/framework/ui-automation/using-ui-automation-for-automated-testing#automationid) property in Qt Widget and Qt Quick controls on Windows for Automated Testing.

* [Introduction](#introduction)
* [Applying the patches](#applying-the-patches)
* [Usage](#usage)
* [FAQ](#faq)

## Introduction

Qt has built-in support for accessiblity, but unfortunately it's not a pluggable architecture. The accessbility feature is baked into the QWidget and QQuickItem classes. Thus, source code level pacthing is needed to expose this new property.

Two patches are provided:
- *QtBase* module patch to add the AutomationId property for QWidgets and to add the platform backend support.
- *QtDeclarative* module patch to add the AutomationId property for QQuickItems via the `Accessible` attached property.

The QtDeclarative patch is optional, but it requires the patch for QtBase since that patch adds the platform backend support.

## Applying the patches

You'll need the `git` command line tool or the `patch` command line tool.
Obtain the available patch that is equal or lower than your minor version of Qt in the [Releases](../releases). For instance, if patching Qt 6.2.5 then the patches for Qt 6.2.4 (or a lower 6.2.x) can be used if 6.2.5 is not available.

Obtain the Qt source code and then apply one or both patches.

With `git`:
```
C:\Qt\Sources> git apply qt-ui-automation-id-qtbase.patch
C:\Qt\Sources> git apply qt-ui-automation-id-qtdeclarative.patch
```
With `patch`:
```
C:\Qt\Sources> patch -Np1 -i qt-ui-automation-id-qtbase.patch
C:\Qt\Sources> patch -Np1 -i qt-ui-automation-id-qtdeclarative.patch
```
Then build Qt.

## Usage

QWidgets and derived classes will now have the `automationId` property.
```
    QPushButton button1;
    button1.setAutomationId("MyButton");
```
Getting or setting the `automationId` property via Qt Meta Object is also supported.

QQuickItem objects also support setting the `automationId` property via the `Accessible` attached property.
```
    Button {
        text: "Press me"
        Accessible.automationId: "MyButton"
    }
```

## FAQ
