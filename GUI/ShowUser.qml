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

    Timer {
           id: dataRefreshTimer
           interval: 1000
           running: true
           repeat: true
           onTriggered: {
               refreshuserList();
           }
       }

    ListModel {
        id: userModel
    }

    Rectangle {
        id: rectangle_showuser
        width: parent.width
        height: parent.height * 0.12
        color: "darkblue"
        Label {
            text: "Show user"
            color : "white"
            anchors.centerIn: parent
            font.pixelSize: 30
        }
    }

    Rectangle{
        id: rectagnle_users
        width: parent.width * 0.7
        height: parent.height * 0.6
        anchors.top: rectangle_showuser.bottom
        anchors.topMargin: parent.height * 0.07
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.15


        Rectangle {
            id: rectangle_users
            width: parent.width * 0.9
            height: parent.height * 0.6
            anchors.top: rectangle_showuser.bottom
            anchors.topMargin: parent.height * 0.07
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.1
        ListView {
                anchors.fill: parent
                clip: true
                model: userModel
                ScrollBar.vertical: ScrollBar {
                    policy: ScrollBar.AlwaysOn
                    active: ScrollBar.AlwaysOn
                }
                header: Row {
                    spacing: 40
                    Text { text: "      ID"; font.bold: true ; font.pixelSize: 26; color: "red"}
                    Text { text: "       Username"; font.bold: true; font.pixelSize: 26; color: "red" }
                    Text { text: "        Role"; font.bold: true ; font.pixelSize: 26; color: "red"}
                    Text { text: "              Created at"; font.bold: true; font.pixelSize: 26; color: "red" }
                    Text { text: "      Password"; font.bold: true; font.pixelSize: 26; color: "red" }
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
                            text: model.user_id
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
                            text: model.username
                            width: 130
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
                            text: model.role
                            width: 130
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
                            text: model.created_at
                            width: 210
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
                            text: model.password
                            width: 130
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
        anchors.top: rectagnle_users.bottom
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
                showUser.buttonReturnClicked();
        }
    }

    function refreshuserList() {
        UserRequests.getUsers(function(error, userList) {
            if (!error) {
                userModel.clear();
                for (var i = 0; i < userList.length; i++) {
                    userModel.append(userList[i]);
                }
            } else {
                console.error("Error fetching users:", error);
            }
        });
    }
}
