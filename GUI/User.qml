import QtQuick 2.15
import QtQuick.Controls 2.15

import "JS/EmployeeRequests.js" as EmployeeRequests
import "JS/UserRequests.js" as UserRequests
import "JS/AttendanceRequests.js" as AttendanceRequests
import "JS/DepartmentRequests.js" as DepartmentRequests


Page{
    id: user
    signal buttonReturnClicked()
    signal buttonAdduserClicked()
    signal buttonShowuserClicked()
    signal buttonEdituserClicked()
    signal buttonDeleteuserClicked()


    background: Rectangle {
        color: "white"
    }

    Rectangle {
        id: rectangle_user
        width: parent.width
        height: parent.height * 0.15
        color: "darkblue"
        Label {
            text: "User"
            color : "white"
            anchors.centerIn: parent
            font.pixelSize: 30
        }
        Button{
            id: button_return
            text: "<-"
            font.pixelSize: 20
            icon.color: "#df391422"
            height: parent.height
            width: parent.width * 0.15
            onClicked:
                user.buttonReturnClicked();
        }
    }

    Rectangle {
        id: rectangle_adduser
        width: parent.width * 0.19
        height: parent.height * 0.19
        color: "brown"
        anchors.top: rectangle_user.bottom
        anchors.topMargin: parent.height * 0.15
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.08
        Button {
            text: "Add user"
            anchors.fill: parent
            font.pixelSize: 30
            background : color = "trasnparent"
            onClicked:
                user.buttonAdduserClicked();
        }
    }

    Rectangle {
        id: rectangle_edituser
        width: parent.width * 0.19
        height: parent.height * 0.19
        color: "deepskyblue"
        anchors.top: rectangle_user.bottom
        anchors.topMargin: parent.height * 0.15
        anchors.left: rectangle_adduser.right
        anchors.leftMargin: parent.width * 0.08
        Button {
            text: "Edit user"
            anchors.fill: parent
            font.pixelSize: 30
            background : color = "trasnparent"
            onClicked:
                buttonEdituserClicked();
        }
    }

    Rectangle {
        id: rectangle_deleteuser
        width: parent.width * 0.19
        height: parent.height * 0.19
        color: "indianred"
        anchors.top: rectangle_adduser.bottom
        anchors.topMargin: parent.height * 0.15
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.08
        Button {
            text: "Delete user"
            anchors.fill: parent
            font.pixelSize: 30
            background : color = "trasnparent"
            onClicked:
                buttonDeleteuserClicked();
        }
    }

    Rectangle {
        id: rectangle_Showuser
        width: parent.width * 0.19
        height: parent.height * 0.19
        color: "midnightblue"
        anchors.top: rectangle_edituser.bottom
        anchors.topMargin: parent.height * 0.15
        anchors.left: rectangle_deleteuser.right
        anchors.leftMargin: parent.width * 0.08
        Button {
            text: "Show users"
            anchors.fill: parent
            font.pixelSize: 30
            background : color = "trasnparent"
            onClicked:
                buttonShowuserClicked();
        }
    }

    Image {
        id: image
        width: parent.width * 0.35
        height: parent.height * 0.5
        source: "qrc:/img/user.png"
        anchors.leftMargin: parent.width * 0.08
        anchors.topMargin: parent.height * 0.18
        anchors.left: rectangle_Showuser.right
        anchors.top: rectangle_user.bottom
    }
}
