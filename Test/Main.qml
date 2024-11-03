import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    width: 640
    height: 480
    visible: true
    title: "QtQuickWindow"

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 10

        Button {
            text: "OK"
            objectName: "buttonOK"

            Accessible.role: Accessible.Button
            Accessible.name: "OK"
            Accessible.automationId: "Button"

            Layout.preferredWidth: 100

			onClicked: {
				switch1.Accessible.automationId = "New Switch"
			}
        }

        Switch {
			id: switch1
            text: "Bluetooth"
            objectName: "buttonBluetooth"

            Accessible.role: Accessible.CheckBox
            Accessible.name: "Bluetooth"
            Accessible.automationId: "Switch"
        }
    }
}
