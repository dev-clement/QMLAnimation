import QtQuick
import QtQuick.Controls.Material

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Animation")
    color: "#202020"

    Button {
        id: myRect

        property int radiusNb: 5
        width: 250
        height: 60

        anchors.centerIn: parent
        padding: 0
        leftPadding: 0
        rightPadding: 0

        background: Rectangle {
            anchors.fill: parent
            border {
                width: 2
                color: "#ffd100"
            }
            color: "transparent"
            radius: myRect.radiusNb
        }

        contentItem: Text {
            leftPadding: 0
            rightPadding: 0
            text: qsTr("Hello World !")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "#fafafa"
            font {
                pointSize: 20
                weight: Font.Medium
            }
        }

        Rectangle {
            id: slideRect
            anchors.left: parent.left
            height: parent.height
            width: 0
            radius: myRect.radiusNb
            color: "#fdb833"
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            onEntered: slidingAnimation.start()
            onExited: {
                if (slideRect.width === myRect.width) {
                    slidingAnimation.to = 0
                }
                slidingAnimation.start()
                slidingAnimation.to = myRect.width
            }
        }

        NumberAnimation {
            id: slidingAnimation
            target: slideRect
            property: "width"
            to: myRect.width
            duration: 600
        }
    }
}
