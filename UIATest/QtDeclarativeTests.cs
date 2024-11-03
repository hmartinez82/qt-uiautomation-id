using System;
using Xunit;
using OpenQA.Selenium.Appium.Enums;
using OpenQA.Selenium.Appium;
using OpenQA.Selenium.Appium.Windows;
using OpenQA.Selenium.Remote;
using System.Threading;
using OpenQA.Selenium;

namespace UIATest;

public class QtDeclarativeTestsFixture : IDisposable
{
    private readonly string TestApp = Environment.GetEnvironmentVariable("UIATEST_PATH");

    public WindowsDriver Driver;

    public QtDeclarativeTestsFixture()
    {
        var serverUri = new Uri(Environment.GetEnvironmentVariable("APPIUM_HOST"));
        var driverOptions = new AppiumOptions()
        {
            PlatformName = "windows",
            AutomationName = "windows",
            App = TestApp,
        };
        driverOptions.AddAdditionalAppiumOption("appArguments", "quick");
        Driver = new WindowsDriver(serverUri, driverOptions, TimeSpan.FromSeconds(50));
    }

    public void Dispose()
    {
        Driver?.Dispose();
    }
}

[Collection("Sequential")]
public class QtDeclarativeTests : IClassFixture<QtDeclarativeTestsFixture>, IAssemblyFixture<AppiumServiceFixture>
{
    private readonly QtDeclarativeTestsFixture _fixture;

    public QtDeclarativeTests(QtDeclarativeTestsFixture fixture)
    {
        _fixture = fixture;
    }

    [Fact]
    public void ButtonId()
    {
        _fixture.Driver.FindElement("accessibility id", "Button");
    }

    [Fact]
    public void SwitchId()
    {
        _fixture.Driver.FindElement("accessibility id", "Switch");
    }
}