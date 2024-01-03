import QtQuick 2.15
import QtQuick.Controls 2.15

import "JS/EmployeeRequests.js" as EmployeeRequests
import "JS/UserRequests.js" as UserRequests
import "JS/AttendanceRequests.js" as AttendanceRequests
import "JS/DepartmentRequests.js" as DepartmentRequests


Page{
    id: department
    signal buttonReturnClicked()
    signal buttonAddDepartmentClicked()
    signal buttonDeleteDepartmentClicked()
    signal buttonEditDepartmentClicked()
    signal buttonShowDepartmentClicked()

    background: Rectangle {
        color: "white"
    }

    Rectangle {
        id: rectangle_department
        width: parent.width
        height: parent.height * 0.15
        color: "darkblue"
        Label {
            text: "Department"
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
                department.buttonReturnClicked();
        }
    }

    Rectangle {
        id: rectangle_addDepartment
        width: parent.width * 0.19
        height: parent.height * 0.19
        color: "brown"
        anchors.top: rectangle_department.bottom
        anchors.topMargin: parent.height * 0.15
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.08
        Button {
            text: "Add department"
            anchors.fill: parent
            font.pixelSize: 30
            background : color = "trasnparent"
            onClicked:
                department.buttonAddDepartmentClicked();
        }
    }

    Rectangle {
        id: rectangle_editDepartment
        width: parent.width * 0.19
        height: parent.height * 0.19
        color: "deepskyblue"
        anchors.top: rectangle_department.bottom
        anchors.topMargin: parent.height * 0.15
        anchors.left: rectangle_addDepartment.right
        anchors.leftMargin: parent.width * 0.08
        Button {
            text: "Edit department"
            anchors.fill: parent
            font.pixelSize: 30
            background : color = "trasnparent"
            onClicked:
                buttonEditDepartmentClicked();
        }
    }

    Rectangle {
        id: rectangle_deleteDepartment
        width: parent.width * 0.19
        height: parent.height * 0.19
        color: "indianred"
        anchors.top: rectangle_addDepartment.bottom
        anchors.topMargin: parent.height * 0.15
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.08
        Button {
            text: "Delete department"
            anchors.fill: parent
            font.pixelSize: 30
            background : color = "trasnparent"
            onClicked:
                buttonDeleteDepartmentClicked();
        }
    }

    Rectangle {
        id: rectangle_ShowDepartment
        width: parent.width * 0.19
        height: parent.height * 0.19
        color: "midnightblue"
        anchors.top: rectangle_editDepartment.bottom
        anchors.topMargin: parent.height * 0.15
        anchors.left: rectangle_deleteDepartment.right
        anchors.leftMargin: parent.width * 0.08
        Button {
            text: "Show departments"
            anchors.fill: parent
            font.pixelSize: 30
            background : color = "trasnparent"
            onClicked:
                buttonShowDepartmentClicked();
        }
    }

    Image {
        id: image
        width: parent.width * 0.35
        height: parent.height * 0.5
        source: "qrc:/img/Company.jpeg"
        anchors.leftMargin: parent.width * 0.08
        anchors.topMargin: parent.height * 0.18
        anchors.left: rectangle_ShowDepartment.right
        anchors.top: rectangle_department.bottom
    }

}
