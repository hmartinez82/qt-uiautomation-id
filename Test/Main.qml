import QtQuick 6.8
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

            Accessible.role: Accessible.Button
            Accessible.name: "OK"

            Layout.preferredWidth: 100

			onClicked: {
				switch1.Accessible.id = "New Switch" //Works as expected
			}
        }

        Switch {
			id: switch1
            text: "Bluetooth"

            Accessible.role: Accessible.CheckBox
            Accessible.name: "Bluetooth"
            Accessible.id: "Switch" // Uncomment to see issue
        }
    }
}
