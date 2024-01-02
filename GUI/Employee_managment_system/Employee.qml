import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs

import "JS/EmployeeRequests.js" as EmployeeRequests
import "JS/UserRequests.js" as UserRequests
import "JS/AttendanceRequests.js" as AttendanceRequests
import "JS/DepartmentRequests.js" as DepartmentRequests

Page{
    id: employee
    signal buttonReturnClicked()
    signal buttonAddEmployeeClicked()
    signal buttonShowEmployeeClicked()
    signal buttonEditEmployeeClicked()
    signal buttonDeleteEmployeeClicked()


    background: Rectangle {
        color: "white"
    }

    Rectangle {
        id: rectangle_employee
        width: parent.width
        height: parent.height * 0.15
        color: "darkblue"
        Label {
            text: "Employee"
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
                employee.buttonReturnClicked();
        }
    }

    Rectangle {
        id: rectangle_addemployee
        width: parent.width * 0.19
        height: parent.height * 0.19
        color: "brown"
        anchors.top: rectangle_employee.bottom
        anchors.topMargin: parent.height * 0.15
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.08
        Button {
            text: "Add employee"
            anchors.fill: parent
            font.pixelSize: 30
            background : color = "trasnparent"
            onClicked:
                employee.buttonAddEmployeeClicked();
        }
    }

    Rectangle {
        id: rectangle_editemployee
        width: parent.width * 0.19
        height: parent.height * 0.19
        color: "deepskyblue"
        anchors.top: rectangle_employee.bottom
        anchors.topMargin: parent.height * 0.15
        anchors.left: rectangle_addemployee.right
        anchors.leftMargin: parent.width * 0.08
        Button {
            text: "Edit employee"
            anchors.fill: parent
            font.pixelSize: 30
            background : color = "trasnparent"
            onClicked:
                buttonEditEmployeeClicked();
        }
    }

    Rectangle {
        id: rectangle_deleteemployee
        width: parent.width * 0.19
        height: parent.height * 0.19
        color: "indianred"
        anchors.top: rectangle_addemployee.bottom
        anchors.topMargin: parent.height * 0.15
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.08
        Button {
            text: "Delete employee"
            anchors.fill: parent
            font.pixelSize: 30
            background : color = "trasnparent"
            onClicked:
                buttonDeleteEmployeeClicked();
        }
    }

    Rectangle {
        id: rectangle_Showemployee
        width: parent.width * 0.19
        height: parent.height * 0.19
        color: "midnightblue"
        anchors.top: rectangle_editemployee.bottom
        anchors.topMargin: parent.height * 0.15
        anchors.left: rectangle_deleteemployee.right
        anchors.leftMargin: parent.width * 0.08
        Button {
            text: "Show employees"
            anchors.fill: parent
            font.pixelSize: 30
            background : color = "trasnparent"
            onClicked:
                buttonShowEmployeeClicked();
        }
    }

    Image {
        id: image
        width: parent.width * 0.35
        height: parent.height * 0.5
        source: "qrc:/img/employee.jpeg"
        anchors.leftMargin: parent.width * 0.08
        anchors.topMargin: parent.height * 0.18
        anchors.left: rectangle_Showemployee.right
        anchors.top: rectangle_employee.bottom
    }

}
