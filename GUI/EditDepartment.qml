import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs

import "JS/EmployeeRequests.js" as EmployeeRequests
import "JS/UserRequests.js" as UserRequests
import "JS/AttendanceRequests.js" as AttendanceRequests
import "JS/DepartmentRequests.js" as DepartmentRequests


Page{
    id: editDepartment
    signal buttonReturnClicked()

    background: Rectangle {
        color: "white"
    }

    Rectangle {
        id: rectangle_editDepartment
        width: parent.width
        height: parent.height * 0.1
        color: "darkblue"
        Label {
            text: "Edit department"
            color : "white"
            anchors.centerIn: parent
            font.pixelSize: 30
        }
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

        Rectangle{
            id: rectagnle_departments
            width: parent.width * 0.7
            height: parent.height * 0.5
            anchors.top: rectangle_editDepartment.bottom
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
            id: rectangle_departmentID_label
            width: parent.width * 0.15
            height: parent.height * 0.15
            anchors.top: rectagnle_departments.bottom
            anchors.topMargin: parent.height * 0.04
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.05
            Label {
                id: departmentID_label
                text: "Department ID"
                color : "black"
                anchors.fill: parent
                font.pixelSize: 30
                width: parent.width * 0.2
                height: parent.height * 0.15
            }
        }

        Rectangle {
            id: rectangle_departmentID_input
            width: parent.width * 0.06
            height: parent.parent.height * 0.07
            color: "white"
            anchors.left: rectangle_departmentID_label.right
            anchors.top: rectangle_departmentID_label.top
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
                maximumLength: 4
                validator: RegularExpressionValidator { regularExpression: /^[0-9]+/ }
            }
        }

        Rectangle {
            id: rectangle_departmentName_label
            width: parent.width * 0.15
            height: parent.height * 0.15
            anchors.top: rectagnle_departments.bottom
            anchors.topMargin: parent.height * 0.04
            anchors.left: rectangle_departmentID_input.right
            anchors.leftMargin: parent.width * 0.03
            Label {
                id: departmentName_label
                text: "Name"
                color : "black"
                anchors.fill: parent
                font.pixelSize: 30
                width: parent.width * 0.2
                height: parent.height * 0.15
            }
        }

        Rectangle {
            id: rectangle_departmentName_input
            width: parent.width * 0.12
            height: parent.parent.height * 0.07
            color: "white"
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.36
            anchors.top: rectangle_departmentID_label.top
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
                maximumLength: 18
            }
        }

        Rectangle {
            id: rectangle_departmentLocation_label
            width: parent.width * 0.15
            height: parent.height * 0.15
            anchors.top: rectagnle_departments.bottom
            anchors.topMargin: parent.height * 0.04
            anchors.left: rectangle_departmentName_input.right
            anchors.leftMargin: parent.width * 0.03
            Label {
                id: departmentLocation_label
                text: "Location"
                color : "black"
                anchors.fill: parent
                font.pixelSize: 30
                width: parent.width * 0.2
                height: parent.height * 0.15
            }
        }

        Rectangle {
            id: rectangle_departmentLocation_input
            width: parent.width * 0.12
            height: parent.parent.height * 0.07
            color: "white"
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.6
            anchors.top: rectangle_departmentID_label.top
            border {
                   color: "black"
                   width: 1
               }
               radius: 10

            TextInput {
                id: departmentLocation_input
                anchors.fill: parent
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.05
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.2
                font.pixelSize: 18
                maximumLength: 16
            }
        }

        Rectangle {
            id: rectangle_departmentManagerID_label
            width: parent.width * 0.15
            height: parent.height * 0.15
            anchors.top: rectagnle_departments.bottom
            anchors.topMargin: parent.height * 0.04
            anchors.left: rectangle_departmentLocation_input.right
            anchors.leftMargin: parent.width * 0.02
            Label {
                id: departmentManagerID_label
                text: "Manager"
                color : "black"
                anchors.fill: parent
                font.pixelSize: 30
                width: parent.width * 0.2
                height: parent.height * 0.15
            }
        }

        Rectangle {
            id: rectangle_departmentManagerID_input
            width: parent.width * 0.12
            height: parent.parent.height * 0.07
            color: "white"
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.82
            anchors.top: rectangle_departmentID_label.top
            border {
                   color: "black"
                   width: 1
               }
               radius: 10

            TextInput {
                id: departmentManagerID_input
                anchors.fill: parent
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.05
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.2
                font.pixelSize: 18
                maximumLength: 17
            }
        }

        Rectangle{
            id: rectagnle_buttonReturn
            width: parent.width * 0.12
            height: parent.height * 0.12
            anchors.top: rectangle_departmentID_label.bottom
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
            id: rectagnle_buttonedit
            width: parent.width * 0.12
            height: parent.height * 0.12
            anchors.top: rectangle_departmentID_label.bottom
            anchors.left: rectagnle_buttonReturn.right
            anchors.leftMargin: parent.width * 0.1
            color: "cyan"
            Button {
                text: "Edit"
                anchors.fill: parent
                font.pixelSize: 30
                background: color = "cyan"
                onClicked: {
                    var departmentID = departmentID_input.text.trim();
                    var departmentName = departmentName_input.text.trim();
                    var departmentLocation = departmentLocation_input.text.trim();
                    var departmentManagerID = departmentManagerID_input.text.trim();
                    var departmentData = {
                        department_id: departmentID,
                        department_name: departmentName,
                        location: departmentLocation,
                        manager_name: departmentManagerID
                    };

                    if (departmentID !== "") {
                        departmentID_input.text = ""
                        departmentName_input.text = ""
                        departmentManagerID_input.text = ""
                        departmentLocation_input.text = ""
                        DepartmentRequests.editDepartment(departmentData, function(error) {
                            if (!error) {
                                for (var i = 0; i < departmentModel.count; ++i) {
                                    if (departmentModel.get(i).department_id === departmentID) {
                                        editDepartment(departmentData);
                                        console.log("Department edited successfully.");
                                        list.forceLayout();
                                        return;
                                    }
                                }
                                console.error("Department not found for edit.");
                                updateMessage("Department not found for edit.");
                            } else {
                                console.error("Error editing department:", error);
                                updateMessage("Error editing department.");
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
