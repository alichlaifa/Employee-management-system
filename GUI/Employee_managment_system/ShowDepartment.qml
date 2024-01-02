import QtQuick 2.15
import QtQuick.Controls 2.15

import "JS/EmployeeRequests.js" as EmployeeRequests
import "JS/UserRequests.js" as UserRequests
import "JS/AttendanceRequests.js" as AttendanceRequests
import "JS/DepartmentRequests.js" as DepartmentRequests


Page{
    id: showDepartment
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

    ListModel {
        id: departmentModel
    }

    Rectangle {
        id: rectangle_showDepartment
        width: parent.width
        height: parent.height * 0.12
        color: "darkblue"
        Label {
            text: "Show department"
            color : "white"
            anchors.centerIn: parent
            font.pixelSize: 30
        }
    }

    Rectangle{
        id: rectagnle_departments
        width: parent.width * 0.7
        height: parent.height * 0.6
        anchors.top: rectangle_showDepartment.bottom
        anchors.topMargin: parent.height * 0.07
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.15


        Rectangle {
            id: rectangle_departments
            width: parent.width * 0.8
            height: parent.height * 0.8
            anchors.top: rectangle_showDepartment.bottom
            anchors.topMargin: parent.height * 0.07
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.1

            /*Flickable {
                anchors.fill: parent
                contentWidth: textColumn.width
                contentHeight: textColumn.height
                flickableDirection: Flickable.VerticalFlick

                Text {
                    id: textColumn
                    width: showDepartment.width
                    textFormat: Text.RichText
                    wrapMode: Text.Wrap
                    text: {
                        var htmlContent = "<table border='1' style='width:100%' >" +
                                "<tr>" +
                                "<th style='width:100%;'>ID</th>" +
                                "<th style='width:30%;'>Name</th>" +
                                "<th style='width:25%;'>Manager Name</th>" +
                                "<th style='width:25%;'>Location</th>" +
                                "</tr>";

                        for (var i = 0; i < departmentModel.count; ++i) {
                            var department = departmentModel.get(i);
                            htmlContent += "<tr>" +
                                    "<td style='width:20%;'>" + department.department_id + "</td>" +
                                      "<td style='width:30%;'>" + department.department_name + "</td>" +
                                      "<td style='width:25%;'>" + department.manager_name + "</td>" +
                                      "<td style='width:25%;'>" + department.location + "</td>" +
                                       "</tr>";
                        }
                        htmlContent += "</table>";
                        return htmlContent;
                    }
                }

                ScrollBar.vertical: ScrollBar {
                    policy: ScrollBar.AlwaysOn
                    size: flickableItem.height / flickableItem.contentHeight
                    active: true
                }
            }*/

            ListView {
                anchors.fill: parent
                clip: true
                model: departmentModel
                boundsBehavior: Flickable.StopAtBounds
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

    Rectangle{
        id: rectagnle_buttonReturn
        width: parent.width * 0.12
        height: parent.height * 0.12
        anchors.top: rectagnle_departments.bottom
        anchors.topMargin: parent.height * 0.07
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.4
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
