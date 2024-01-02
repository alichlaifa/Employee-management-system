import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs

import "JS/EmployeeRequests.js" as EmployeeRequests
import "JS/UserRequests.js" as UserRequests
import "JS/AttendanceRequests.js" as AttendanceRequests
import "JS/DepartmentRequests.js" as DepartmentRequests


Page{
    id: deleteDepartment
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
           refreshDepartmentList();
       }
   }

    Component.onCompleted: {
        DepartmentRequests.getDepartments(function(error, departmentList) {
            if (!error) {
                departmentModel.clear();
                for (var i = 0; i < departmentList.length; i++) {
                    departmentModel.append(departmentList[i]);
                }
            } else {
                console.error("Error fetching departments:", error);
            }
        });
    }

    ListModel {
        id: departmentModel
    }

    Rectangle {
        id: rectangle_deleteDepartment
        width: parent.width
        height: parent.height * 0.1
        color: "darkblue"
        Label {
            text: "Delete department"
            color : "white"
            anchors.centerIn: parent
            font.pixelSize: 30
        }
    }

    Rectangle{
        id: rectagnle_departments
        width: parent.width * 0.7
        height: parent.height * 0.5
        anchors.top: rectangle_deleteDepartment.bottom
        anchors.topMargin: parent.height * 0.07
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.15


        Rectangle {
            id: rectangle_departments
            width: parent.width * 0.8
            height: parent.height * 0.6
            anchors.top: rectangle_showDepartment.bottom
            anchors.topMargin: parent.height * 0.07
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.1
        ListView {
                id: list;
                anchors.fill: parent
                clip: true
                model: departmentModel
                ScrollBar.vertical: ScrollBar {
                    policy: ScrollBar.AlwaysOn
                    active: ScrollBar.AlwaysOn
                }
                header: Row {
                    spacing: 40
                    Text { text: "      ID"; font.bold: true ; font.pixelSize: 26; color: "red"}
                    Text { text: "         Name"; font.bold: true; font.pixelSize: 26; color: "red" }
                    Text { text: "                 Location"; font.bold: true ; font.pixelSize: 26; color: "red"}
                    Text { text: "       Manager Name"; font.bold: true; font.pixelSize: 26; color: "red" }
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
                            text: model.department_id
                            width: 60
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
                            width: 140
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
                            text: model.location
                            width: 200
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
                            text: model.manager_name
                            width: 200
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
        id: rectangle_departmentDelete
        width: parent.width * 0.5
        height: parent.height * 0.15
        anchors.top: rectagnle_departments.bottom
        anchors.topMargin: parent.height * 0.04
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.25
        Label {
            id: departmentName_label
            text: "Department ID to delete"
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
                id: departmentID_input
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
        anchors.top: rectangle_departmentDelete.bottom
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.3
        color: "red"
        Button {
            text: "Return"
            anchors.fill: parent
            font.pixelSize: 30
            background : color = "red"
            onClicked:
                showDepartment.buttonReturnClicked();
        }
    }

    Rectangle{
        id: rectagnle_buttonDelete
        width: parent.width * 0.12
        height: parent.height * 0.12
        anchors.top: rectangle_departmentDelete.bottom
        anchors.left: rectagnle_buttonReturn.right
        anchors.leftMargin: parent.width * 0.1
        color: "purple"
        Button {
            text: "Delete"
            anchors.fill: parent
            font.pixelSize: 30
            background: color = "purple"
            onClicked: {
                var departmentID = departmentID_input.text.trim();
                if (departmentID !== "") {
                    departmentID_input.text = ""
                    DepartmentRequests.deleteDepartment(departmentID, function(error) {
                        if (!error) {
                            for (var i = 0; i < departmentModel.count; ++i) {
                                if (departmentModel.get(i).department_id === departmentID) {
                                    departmentModel.remove(i);
                                    console.log("Department deleted successfully.");
                                    list.forceLayout();
                                    return;
                                }
                            }
                            console.error("Department not found for deletion.");
                            updateMessage("Department not found for deletion.");
                        } else {
                            console.error("Error deleting department:", error);
                            updateMessage("Error deleting department.");
                        }
                    });
                } else {
                    console.error("Please provide a department ID.");
                    updateMessage("Please provide a department ID.");
                }
            }
        }
    }

    MessageDialog {
        id: messageDialog
        title: "Wrong Department ID"
    }

    function updateMessage(message) {
        messageDialog.text = message;
        messageDialog.open();
    }

    function refreshDepartmentList() {
        DepartmentRequests.getDepartments(function(error, departmentList) {
            if (!error) {
                departmentModel.clear();
                for (var i = 0; i < departmentList.length; i++) {
                    departmentModel.append(departmentList[i]);
                }
            } else {
                console.error("Error fetching departments:", error);
            }
        });
    }
}
