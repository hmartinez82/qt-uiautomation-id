using OpenQA.Selenium.Appium.Windows;
using OpenQA.Selenium.Appium;
using System;
using Xunit;

namespace UIATest;

public class QtWidgetTestsFixture : IDisposable
{
    private readonly string TestApp = Environment.GetEnvironmentVariable("UIATEST_PATH");

    public WindowsDriver Driver;

    public QtWidgetTestsFixture()
    {
        var serverUri = new Uri(Environment.GetEnvironmentVariable("APPIUM_HOST") ?? "http://127.0.0.1:4723");
        var driverOptions = new AppiumOptions()
        {
            PlatformName = "windows",
            AutomationName = "windows",
            App = TestApp,
        };
        driverOptions.AddAdditionalAppiumOption("appArguments", "widget");
        Driver = new WindowsDriver(serverUri, driverOptions, TimeSpan.FromSeconds(50));
    }

    public void Dispose()
    {
        Driver?.Dispose();
    }
}

[Collection("Sequential")]
public class QtWidgetTests : IClassFixture<QtWidgetTestsFixture>, IAssemblyFixture<AppiumServiceFixture>
{
    private readonly QtWidgetTestsFixture _fixture;

    public QtWidgetTests(QtWidgetTestsFixture fixture)
    {
        _fixture = fixture;
    }

    [Fact]
    public void ButtonId()
    {
        _fixture.Driver.FindElement("accessibility id", "Button");
    }

    [Fact]
    public void ProgressBarId()
    {
        _fixture.Driver.FindElement("accessibility id", "ProgressBar");
    }
}
