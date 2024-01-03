import QtQuick 2.15
import QtQuick.Controls 2.15

import "JS/EmployeeRequests.js" as EmployeeRequests
import "JS/UserRequests.js" as UserRequests
import "JS/AttendanceRequests.js" as AttendanceRequests
import "JS/DepartmentRequests.js" as DepartmentRequests


Page {
    id: attendance
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
               refreshAttendanceList();
           }
       }

    ListModel {
        id: attendanceModel
    }

    Rectangle {
        id: rectangle_attendance
        width: parent.width
        height: parent.height * 0.12
        color: "darkblue"
        Label {
            text: "Attendace"
            color : "white"
            anchors.centerIn: parent
            font.pixelSize: 30
        }
    }

    Rectangle{
        id: rectagnle_attendances
        width: parent.width * 0.86
        height: parent.height * 0.68
        anchors.top: rectangle_attendance.bottom
        anchors.topMargin: parent.height * 0.07
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.1


        Rectangle {
            id: rectangle_Attendances
            width: parent.width * 0.9
            height: parent.height * 0.8
            anchors.top: rectangle_attendance.bottom
            anchors.topMargin: parent.height * 0.07
            anchors.left: parent.left
        ListView {
                anchors.fill: parent
                clip: true
                model: attendanceModel
                ScrollBar.vertical: ScrollBar {
                    policy: ScrollBar.AlwaysOn
                    active: ScrollBar.AlwaysOn
                }
                header: Row {
                    spacing: 40
                    Text { text: "      ID"; font.bold: true ; font.pixelSize: 26; color: "red"}
                    Text { text: "   Employee ID"; font.bold: true ; font.pixelSize: 26; color: "red"}
                    Text { text: "       Arrival"; font.bold: true; font.pixelSize: 26; color: "red" }
                    Text { text: "                  Departure"; font.bold: true ; font.pixelSize: 26; color: "red"}
                    Text { text: "                    Date"; font.bold: true; font.pixelSize: 26; color: "red" }
                    Text { text: "       Hours worked"; font.bold: true; font.pixelSize: 26; color: "red" }
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
                            text: model.attendance_id
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
                            text: model.employee_id
                            width: 120
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
                            text: model.arrival_time
                            width: 220
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
                            text: model.departure_time
                            width: 220
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
                            text: model.date
                            width: 160
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
                            text: model.hours_worked
                            width: 150
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
        anchors.top: rectagnle_attendances.bottom
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.4
        color: "red"
        Button {
            text: "Return"
            anchors.fill: parent
            font.pixelSize: 30
            background : color = "red"
            onClicked:
                attendance.buttonReturnClicked();
        }
    }

    function refreshAttendanceList() {
        AttendanceRequests.getAttendance(function(error, attendanceList) {
            if (!error) {
                attendanceModel.clear();
                for (var i = 0; i < attendanceList.length; i++) {
                    attendanceModel.append(attendanceList[i]);
                }
            } else {
                console.error("Error fetching attendances:", error);
            }
        });
    }
}
