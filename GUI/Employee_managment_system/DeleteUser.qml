import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs

import "JS/EmployeeRequests.js" as EmployeeRequests
import "JS/UserRequests.js" as UserRequests
import "JS/AttendanceRequests.js" as AttendanceRequests
import "JS/DepartmentRequests.js" as DepartmentRequests


Page{
    id: deleteUser
    signal buttonReturnClicked()

    background: Rectangle {
        color: "white"
    }

    Rectangle {
        id: rectangle_edituser
        width: parent.width
        height: parent.height * 0.1
        color: "darkblue"
        Label {
            text: "Delete user"
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
               refreshUserList();
           }
       }

        Component.onCompleted: {
            userRequests.getusers(function(error, userList) {
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

        ListModel {
            id: userModel
        }

        Rectangle{
            id: rectagnle_users
            width: parent.width * 0.7
            height: parent.height * 0.5
            anchors.top: rectangle_edituser.bottom
            anchors.topMargin: parent.height * 0.07
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.15


            Rectangle {
                id: rectangle_users
                width: parent.width * 0.85
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

        Rectangle {
            id: rectangle_userDelete
            width: parent.width * 0.5
            height: parent.height * 0.15
            anchors.top: rectagnle_users.bottom
            anchors.topMargin: parent.height * 0.04
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.25
            Label {
                id: userName_label
                text: "user ID to delete"
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
                    id: userID_input
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
            anchors.top: rectangle_userDelete.bottom
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.3
            color: "red"
            Button {
                text: "Return"
                anchors.fill: parent
                font.pixelSize: 30
                background : color = "red"
                onClicked:
                    deleteUser.buttonReturnClicked();
            }
        }

        Rectangle{
            id: rectagnle_buttonDelete
            width: parent.width * 0.12
            height: parent.height * 0.12
            anchors.top: rectangle_userDelete.bottom
            anchors.left: rectagnle_buttonReturn.right
            anchors.leftMargin: parent.width * 0.1
            color: "purple"
            Button {
                text: "Delete"
                anchors.fill: parent
                font.pixelSize: 30
                background: color = "purple"
                onClicked: {
                    var userID = userID_input.text.trim();
                    userID_input.text = ""
                    if (userID !== "") {
                        UserRequests.deleteUser(userID, function(error) {
                            if (!error) {
                                for (var i = 0; i < userModel.count; ++i) {
                                    if (userModel.get(i).user_id === userID) {
                                        userModel.remove(i);
                                        console.log("user deleted successfully.");
                                        return;
                                    }
                                }
                                console.error("user not found for deletion.");
                                updateMessage("user not found for deletion.");
                            } else {
                                console.error("Error deleting user:", error);
                                updateMessage("Error deleting user.");
                            }
                        });
                    } else {
                        console.error("Please provide a user ID.");
                        updateMessage("Please provide a user ID.");
                    }
                }
            }
        }

    MessageDialog {
        id: messageDialog
        title: "Wrong User ID"
    }

    function updateMessage(message) {
        messageDialog.text = message;
        messageDialog.open();
    }

    function refreshUserList() {
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
