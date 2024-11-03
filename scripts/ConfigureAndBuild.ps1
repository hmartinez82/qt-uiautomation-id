# Configure the build
$prefix = "$PWD\Build" -replace '\\', '/'

Write-Host "Deleting existing .\Build directory"
If (Test-Path .\Build) {
    Remove-Item .\Build -Recurse -Force
}

$arguments = "-debug -shared -nomake examples -nomake tests -no-feature-designer -no-feature-assistant -no-feature-linguist -schannel -direct2d -skip qtcharts,qtcoap,qtconnectivity,qtdatavis3d,qtlottie,qtmqtt,qtnetworkauth,qtopcua,qtpositioning,qtquick3d,qtquicktimeline,qtremoteobjects,qtscxml,qtsensors,qtcoap,qtconnectivity,qtdatavis3d,qtlottie,qtmqtt,qtnetworkauth,qtopcua,qtpositioning,qtquick3d,qtquicktimeline,qtremoteobjects,qtscxml,qtsensors,qtserialbus,qtserialport,qtvirtualkeyboard,qtwayland,qtwebchannel,qtwebengine,qtwebsockets,qtwebview,qtsvg,qtimageformats,qtmultimedia,qttranslations"
$arguments += " -prefix ""$prefix"""

Set-Location .\Sources

# Clean the repository recursively
Write-Host "Running: git submodule foreach --recursive "git clean -dfx" && git clean -dfx"
git submodule foreach --recursive "git clean -dfx" && git clean -dfx

# Configure the build
Write-Host "Running: .\configure.bat $arguments"
Start-Process .\configure.bat -ArgumentList $arguments -NoNewWindow -Wait

Set-Location ..