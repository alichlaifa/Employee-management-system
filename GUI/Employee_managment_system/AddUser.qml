import QtQuick 2.15
import QtQuick.Controls 2.15

import "JS/EmployeeRequests.js" as EmployeeRequests
import "JS/UserRequests.js" as UserRequests
import "JS/AttendanceRequests.js" as AttendanceRequests
import "JS/DepartmentRequests.js" as DepartmentRequests


Page{
    signal buttonReturnClicked()

    background: Rectangle {
        color: "white"
    }

    Rectangle {
        id: rectangle_adduser
        width: parent.width
        height: parent.height * 0.15
        color: "darkblue"
        Label {
            text: "Add user"
            color : "white"
            anchors.centerIn: parent
            font.pixelSize: 30
        }
    }

    Rectangle {
        id: rectangle_userName
        width: parent.width * 0.5
        height: parent.height * 0.15
        anchors.top: rectangle_adduser.bottom
        anchors.topMargin: parent.height * 0.09
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.12
        Label {
            id: userName_label
            text: "Username"
            color : "black"
            anchors.left: parent.left
            font.pixelSize: 30
            width: parent.width * 0.4
            height: parent.height * 0.15
        }

        Rectangle {
            width: parent.width * 0.35
            height: parent.parent.height * 0.07
            color: "white"
            anchors.left: userName_label.right
            anchors.leftMargin: parent.width * 0.08
            anchors.top: rectangle_adduser.bottom
            border {
                   color: "black"
                   width: 1
               }
               radius: 10

            TextInput {
                id: userName_input
                anchors.fill: parent
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.05
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.2
                font.pixelSize: 18
                maximumLength: 20
            }
        }
    }

    Rectangle {
        id: rectangle_role
        width: parent.width * 0.5
        height: parent.height * 0.15
        anchors.top: rectangle_userName.bottom
        anchors.topMargin: parent.height * 0.05
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.12
        Label {
            id: role_label
            text: "Role"
            color : "black"
            anchors.left: parent.left
            font.pixelSize: 30
            width: parent.width * 0.4
            height: parent.height * 0.15
        }

        Rectangle {
            width: parent.width * 0.35
            height: parent.parent.height * 0.07
            color: "white"
            anchors.left: role_label.right
            anchors.leftMargin: parent.width * 0.08
            anchors.top: rectangle_userName.bottom
            anchors.topMargin: parent.height * 0.05
            border {
                   color: "black"
                   width: 1
               }
               radius: 10

            TextInput {
                id: role_input
                anchors.fill: parent
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.05
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.1
                font.pixelSize: 18
                maximumLength: 20
            }
        }
    }

    Rectangle {
        id: rectangle_password
        width: parent.width * 0.5
        height: parent.height * 0.15
        anchors.top: rectangle_role.bottom
        anchors.topMargin: parent.height * 0.05
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.12
        Label {
            id: label_password
            text: "Password"
            color : "black"
            anchors.left: parent.left
            font.pixelSize: 30
            width: parent.width * 0.4
            height: parent.height * 0.15
        }

        Rectangle {
            width: parent.width * 0.35
            height: parent.parent.height * 0.07
            color: "white"
            anchors.left: label_password.right
            anchors.leftMargin: parent.width * 0.08
            anchors.top: rectangle_role.bottom
            anchors.topMargin: parent.height * 0.05
            border {
                   color: "black"
                   width: 1
               }
               radius: 10

            TextInput {
                id: password_input
                anchors.fill: parent
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.05
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.1
                font.pixelSize: 18
                maximumLength: 20
            }
        }
    }

    Rectangle {
        id: rectangle_add
        width: parent.width * 0.1
        height: parent.height * 0.1
        color: "red"
        anchors.top: rectangle_password.bottom
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.15
        Button {
            text: "Add"
            anchors.fill: parent
            font.pixelSize: 30
            background : color = "blue"
            onClicked:{
                var userdata = {
                   "username": userName_input.displayText,
                   "role": role_input.displayText,
                   "password": password_input.displayText
               };
                UserRequests.createUser(userdata)
                userName_input.text = ""
                password_input.text = ""
                role_input.text = ""
            }
        }
    }
    Rectangle {
        id: rectangle_return
        width: parent.width * 0.1
        height: parent.height * 0.1
        color: "purple"
        anchors.top: rectangle_password.bottom
        anchors.left: rectangle_add.right
        anchors.leftMargin: parent.width * 0.1
        Button {
            text: "Return"
            anchors.fill: parent
            font.pixelSize: 30
            background : color = "blue"
            onClicked:
                buttonReturnClicked();
        }
    }

    Image {
        id: image
        width: parent.width * 0.3
        height: parent.height * 0.5
        source: "qrc:/img/user.png"
        anchors.topMargin: parent.height * 0.18
        anchors.left: rectangle_role.right
        anchors.top: rectangle_adduser.bottom
    }
}
