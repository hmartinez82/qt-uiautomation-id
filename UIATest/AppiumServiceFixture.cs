using System;
using OpenQA.Selenium.Appium.Service;
using Xunit;

namespace UIATest;
public class AppiumServiceFixture : IDisposable
{
    private readonly AppiumLocalService _appiumLocalService;
    public AppiumServiceFixture()
    {
        var testPath = Environment.GetEnvironmentVariable("UIATEST_PATH");
        Assert.False(string.IsNullOrEmpty(testPath), "UIATEST_PATH is not set.");

        var builder = new AppiumServiceBuilder();
        _appiumLocalService = builder.Build();
        _appiumLocalService.Start();
    }

    public void Dispose()
    {
        _appiumLocalService?.Dispose();
    } 

}
