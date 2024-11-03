using System;
using System.Collections.Generic;
using OpenQA.Selenium.Appium.Service;
using UIATest;

namespace UIATest
{
    public class AppiumServiceFixture : IDisposable
    {
        private readonly AppiumLocalService _appiumLocalService;
        public AppiumServiceFixture()
        {
            var builder = new AppiumServiceBuilder();
            builder.WithEnvironment(new Dictionary<string, string>
            {
                { "PATH", Environment.GetEnvironmentVariable("PATH") + @";X:\Github\qt-uiautomation-id\Build\bin" }
            });
            _appiumLocalService = builder.Build();
            _appiumLocalService.Start();
        }

        public void Dispose()
        {
            _appiumLocalService?.Dispose();
        } 

    }
}
