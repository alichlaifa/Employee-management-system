import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs

import "JS/EmployeeRequests.js" as EmployeeRequests
import "JS/UserRequests.js" as UserRequests
import "JS/AttendanceRequests.js" as AttendanceRequests
import "JS/DepartmentRequests.js" as DepartmentRequests


Page{
    id: deleteEmployee
    signal buttonReturnClicked()

    background: Rectangle {
        color: "white"
    }

Timer {
       id: dataRefreshTimer
       interval: 1000
       running: true
       repeat: true
       onTriggered: {
           refreshEmployeeList();
       }
   }

    ListModel {
        id: employeeModel
    }

    Rectangle {
        id: rectangle_deleteemployee
        width: parent.width
        height: parent.height * 0.1
        color: "darkblue"
        Label {
            text: "Delete Employee"
            color : "white"
            anchors.centerIn: parent
            font.pixelSize: 30
        }
    }

    Rectangle{
        id: rectagnle_employees
        width: parent.width * 0.7
        height: parent.height * 0.5
        anchors.top: rectangle_deleteemployee.bottom
        anchors.topMargin: parent.height * 0.07
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.15


        Rectangle {
            id: rectangle_employees
            width: parent.width * 0.82
            height: parent.height * 0.8
            anchors.top: rectangle_showemployee.bottom
            anchors.topMargin: parent.height * 0.07
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.1
        ListView {
                id: list;
                anchors.fill: parent
                clip: true
                model: employeeModel
                ScrollBar.vertical: ScrollBar {
                    policy: ScrollBar.AlwaysOn
                    active: ScrollBar.AlwaysOn
                }
                header: Row {
                    spacing: 40
                    Text { text: "      ID"; font.bold: true ; font.pixelSize: 26; color: "red"}
                    Text { text: "             First Name"; font.bold: true; font.pixelSize: 26; color: "red" }
                    Text { text: "           Last Name"; font.bold: true ; font.pixelSize: 26; color: "red"}
                    Text { text: "    Department Name"; font.bold: true; font.pixelSize: 26; color: "red" }
                }
                delegate: Rectangle {
                    width: parent.width
                    height: 50

                    Row {
                        spacing: 20
                        Rectangle {
                            width: 6
                            height: parent.height * 2
                            color: "black"
                        }
                        Text {
                            text: model.employee_id
                            width: 80
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 26
                        }
                        Rectangle {
                            width: 8
                            height: parent.height
                            color: "black"
                        }
                        Text {
                            text: model.first_name
                            width: 190
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 26
                        }
                        Rectangle {
                            width: 8
                            height: parent.height
                            color: "black"
                        }
                        Text {
                            text: model.last_name
                            width: 190
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 26
                        }
                        Rectangle {
                            width: 8
                            height: parent.height
                            color: "black"
                        }
                        Text {
                            text: model.department_name
                            width: 230
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 26
                        }
                        Rectangle {
                            width: 8
                            height: parent.height
                            color: "black"
                        }
                    }
                }
            }
        }
    }

    Rectangle {
        id: rectangle_employeeDelete
        width: parent.width * 0.5
        height: parent.height * 0.15
        anchors.top: rectagnle_employees.bottom
        anchors.topMargin: parent.height * 0.04
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.25
        Label {
            id: employeeName_label
            text: "Employee ID to delete"
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
            anchors.left: employeeName_label.right
            anchors.leftMargin: parent.width * 0.08
            anchors.top: rectangle_addemployee.bottom
            border {
                   color: "black"
                   width: 1
               }
               radius: 10

            TextInput {
                id: employeeID_input
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

    Rectangle{
        id: rectagnle_buttonReturn
        width: parent.width * 0.12
        height: parent.height * 0.12
        anchors.top: rectangle_employeeDelete.bottom
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.3
        color: "red"
        Button {
            text: "Return"
            anchors.fill: parent
            font.pixelSize: 30
            background : color = "red"
            onClicked:
                deleteEmployee.buttonReturnClicked();
        }
    }

    Rectangle{
        id: rectagnle_buttonDelete
        width: parent.width * 0.12
        height: parent.height * 0.12
        anchors.top: rectangle_employeeDelete.bottom
        anchors.left: rectagnle_buttonReturn.right
        anchors.leftMargin: parent.width * 0.1
        color: "purple"
        Button {
            text: "Delete"
            anchors.fill: parent
            font.pixelSize: 30
            background: color = "purple"
            onClicked: {
                var employeeID = employeeID_input.text.trim();
                if (employeeID !== "") {
                    employeeID_input.text = ""
                    EmployeeRequests.deleteEmployee(employeeID, function(error) {
                        if (!error) {
                            for (var i = 0; i < employeeModel.count; ++i) {
                                if (employeeModel.get(i).employee_id === employeeID) {
                                    employeeModel.remove(i);
                                    console.log("employee deleted successfully.");
                                    return;
                                }
                            }
                            console.error("employee not found for deletion.");
                            updateMessage("employee not found for deletion.");
                        } else {
                            console.error("Error deleting employee:", error);
                            updateMessage("Error deleting employee.");
                        }
                    });
                } else {
                    console.error("Please provide a employee ID.");
                    updateMessage("Please provide a employee ID.");
                }
            }
        }
    }

    MessageDialog {
        id: messageDialog
        title: "Wrong employee ID"
    }

    function updateMessage(message) {
        messageDialog.text = message;
        messageDialog.open();
    }

    function refreshEmployeeList() {
        EmployeeRequests.getEmployees_depName(function(error, employeeList) {
            if (!error) {
                employeeModel.clear();
                for (var i = 0; i < employeeList.length; i++) {
                    employeeModel.append(employeeList[i]);
                }
            } else {
                console.error("Error fetching employees:", error);
            }
        });
    }
}
