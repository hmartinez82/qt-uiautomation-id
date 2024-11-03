param(
    [Parameter(Mandatory)]
    [version]$version
)

Write-Host "Deleting existing .\Sources directory"
If (Test-Path .\Sources) {
    Remove-Item .\Sources -Recurse -Force
}

Write-Host "Running: git clone --branch v$version https://github.com/qt/qt5.git Sources"
git clone --branch v$version https://github.com/qt/qt5.git Sources

# Initialize the repository with submodules
$repo_init_arguments = @(
    "--module-subset="
    @(
        "default,"
        "-qt3d,"
        "-qt5compat,"
        "-qtcharts,"
        "-qtcoap,"
        "-qtconnectivity,"
        "-qtdatavis3d,"
        "-qtdoc,"
        "-qtgrpc,"
        "-qthttpserver,"
        "-qtlanguageserver,"
        "-qtlocation,"
        "-qtlottie,"
        "-qtmqtt,"
        "-qtnetworkauth,"
        "-qtopcua,"
        "-qtpositioning,"
        "-qtquick3d,"
        "-qtquick3dphysics,"
        "-qtquickeffectmaker,"
        "-qtquicktimeline,"
        "-qtremoteobjects,"
        "-qtscxml,"
        "-qtsensors,"
        "-qtspeech,"
        "-qtcoap,"
        "-qtconnectivity,"
        "-qtdatavis3d,"
        "-qtlottie,"
        "-qtmqtt,"
        "-qtnetworkauth,"
        "-qtopcua,"
        "-qtpositioning,"
        "-qtquick3d,"
        "-qtquicktimeline,"
        "-qtremoteobjects,"
        "-qtscxml,"
        "-qtsensors,"
        "-qtserialbus,"
        "-qtserialport,"
        "-qtvirtualkeyboard,"
        "-qtwayland,"
        "-qtwebchannel,"
        "-qtwebengine,"
        "-qtwebsockets,"
        "-qtwebview,"
        "-qtsvg,"
        "-qtimageformats,"
        "-qtmultimedia,"
        "-qttranslations"
    ) -join ''
) -join ''
Write-Host "perl init-repository $repo_init_arguments"

Set-Location .\Sources
perl init-repository $repo_init_arguments

Set-Location ..