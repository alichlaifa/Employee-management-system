import QtQuick 2.15
import QtQuick.Controls 2.15

import "JS/EmployeeRequests.js" as EmployeeRequests
import "JS/UserRequests.js" as UserRequests
import "JS/AttendanceRequests.js" as AttendanceRequests
import "JS/DepartmentRequests.js" as DepartmentRequests


Page{
    id: addDepartment
    signal buttonReturnClicked()

    background: Rectangle {
        color: "white"
    }

    Rectangle {
        id: rectangle_addDepartment
        width: parent.width
        height: parent.height * 0.15
        color: "darkblue"
        Label {
            text: "Add department"
            color : "white"
            anchors.centerIn: parent
            font.pixelSize: 30
        }
    }

    Rectangle {
        id: rectangle_departmentName
        width: parent.width * 0.5
        height: parent.height * 0.15
        anchors.top: rectangle_addDepartment.bottom
        anchors.topMargin: parent.height * 0.1
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.12
        Label {
            id: departmentName_label
            text: "Department Name"
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
            anchors.left: departmentName_label.right
            anchors.leftMargin: parent.width * 0.08
            anchors.top: rectangle_addDepartment.bottom
            border {
                   color: "black"
                   width: 1
               }
               radius: 10

            TextInput {
                id: departmentName_input
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
        id: rectangle_managerName
        width: parent.width * 0.5
        height: parent.height * 0.15
        anchors.top: rectangle_departmentName.bottom
        anchors.topMargin: parent.height * 0.05
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.12
        Label {
            id: managerName_label
            text: "Manager Name"
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
            anchors.left: managerName_label.right
            anchors.leftMargin: parent.width * 0.08
            anchors.top: rectangle_departmentName.bottom
            anchors.topMargin: parent.height * 0.05
            border {
                   color: "black"
                   width: 1
               }
               radius: 10

            TextInput {
                id: managerName_input
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
        id: rectangle_location
        width: parent.width * 0.5
        height: parent.height * 0.15
        anchors.top: rectangle_managerName.bottom
        anchors.topMargin: parent.height * 0.05
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.12
        Label {
            id: label_location
            text: "Location"
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
            anchors.left: label_location.right
            anchors.leftMargin: parent.width * 0.08
            anchors.top: rectangle_managerName.bottom
            anchors.topMargin: parent.height * 0.05
            border {
                   color: "black"
                   width: 1
               }
               radius: 10

            TextInput {
                id: location_input
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
        anchors.top: rectangle_location.bottom
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.15
        Button {
            text: "Add"
            anchors.fill: parent
            font.pixelSize: 30
            background : color = "blue"
            onClicked:{
                var departmentdata = {
                   "department_name": departmentName_input.displayText,
                   "manager_name": managerName_input.displayText,
                   "location": location_input.displayText
               };
                DepartmentRequests.createDepartment(departmentdata)
                departmentName_input.text = ""
                managerName_input.text = ""
                location_input.text = ""
            }
        }
    }
    Rectangle {
        id: rectangle_return
        width: parent.width * 0.1
        height: parent.height * 0.1
        color: "purple"
        anchors.top: rectangle_location.bottom
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
        source: "qrc:/img/Company.jpeg"
        anchors.topMargin: parent.height * 0.18
        anchors.left: rectangle_managerName.right
        anchors.top: rectangle_addDepartment.bottom
    }
}
