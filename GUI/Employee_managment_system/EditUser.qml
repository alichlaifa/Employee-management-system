import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs

import "JS/EmployeeRequests.js" as EmployeeRequests
import "JS/UserRequests.js" as UserRequests
import "JS/AttendanceRequests.js" as AttendanceRequests
import "JS/DepartmentRequests.js" as DepartmentRequests


Page{
    id: editUser
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
            text: "Edit user"
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
            id: rectangle_userID_label
            width: parent.width * 0.15
            height: parent.height * 0.15
            anchors.top: rectagnle_users.bottom
            anchors.topMargin: parent.height * 0.04
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.05
            Label {
                id: userID_label
                text: "user ID"
                color : "black"
                anchors.fill: parent
                font.pixelSize: 30
                width: parent.width * 0.2
                height: parent.height * 0.15
            }
        }

        Rectangle {
            id: rectangle_userID_input
            width: parent.width * 0.06
            height: parent.parent.height * 0.07
            color: "white"
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.13
            anchors.top: rectangle_userID_label.top
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
                maximumLength: 4
                validator: RegularExpressionValidator { regularExpression: /^[0-9]+/ }
            }
        }

        Rectangle {
            id: rectangle_userName_label
            width: parent.width * 0.15
            height: parent.height * 0.15
            anchors.top: rectagnle_users.bottom
            anchors.topMargin: parent.height * 0.04
            anchors.left: rectangle_userID_input.right
            anchors.leftMargin: parent.width * 0.03
            Label {
                id: userName_label
                text: "Username"
                color : "black"
                anchors.fill: parent
                font.pixelSize: 30
                width: parent.width * 0.2
                height: parent.height * 0.15
            }
        }

        Rectangle {
            id: rectangle_userName_input
            width: parent.width * 0.12
            height: parent.parent.height * 0.07
            color: "white"
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.36
            anchors.top: rectangle_userID_label.top
            border {
                   color: "black"
                   width: 1
               }
               radius: 10

            TextInput {
                id: userName_input
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
            id: rectangle_userRole_label
            width: parent.width * 0.15
            height: parent.height * 0.15
            anchors.top: rectagnle_users.bottom
            anchors.topMargin: parent.height * 0.04
            anchors.left: rectangle_userName_input.right
            anchors.leftMargin: parent.width * 0.03
            Label {
                id: userLocation_label
                text: "Role"
                color : "black"
                anchors.fill: parent
                font.pixelSize: 30
                width: parent.width * 0.2
                height: parent.height * 0.15
            }
        }

        Rectangle {
            id: rectangle_userRole_input
            width: parent.width * 0.12
            height: parent.parent.height * 0.07
            color: "white"
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.58
            anchors.top: rectangle_userID_label.top
            border {
                   color: "black"
                   width: 1
               }
               radius: 10

            TextInput {
                id: userRole_input
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
            id: rectangle_userPassword_label
            width: parent.width * 0.15
            height: parent.height * 0.15
            anchors.top: rectagnle_users.bottom
            anchors.topMargin: parent.height * 0.04
            anchors.left: rectangle_userRole_input.right
            anchors.leftMargin: parent.width * 0.02
            Label {
                id: userManagerID_label
                text: "Password"
                color : "black"
                anchors.fill: parent
                font.pixelSize: 30
                width: parent.width * 0.2
                height: parent.height * 0.15
            }
        }

        Rectangle {
            id: rectangle_userPassword_input
            width: parent.width * 0.12
            height: parent.parent.height * 0.07
            color: "white"
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.82
            anchors.top: rectangle_userID_label.top
            border {
                   color: "black"
                   width: 1
               }
               radius: 10

            TextInput {
                id: userPassword_input
                anchors.fill: parent
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.05
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.2
                font.pixelSize: 18
                maximumLength: 10
            }
        }

        Rectangle{
            id: rectagnle_buttonReturn
            width: parent.width * 0.12
            height: parent.height * 0.12
            anchors.top: rectangle_userID_label.bottom
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.3
            color: "red"
            Button {
                text: "Return"
                anchors.fill: parent
                font.pixelSize: 30
                background : color = "red"
                onClicked:
                    editUser.buttonReturnClicked();
            }
        }

        Rectangle{
            id: rectagnle_buttonedit
            width: parent.width * 0.12
            height: parent.height * 0.12
            anchors.top: rectangle_userID_label.bottom
            anchors.left: rectagnle_buttonReturn.right
            anchors.leftMargin: parent.width * 0.1
            color: "cyan"
            Button {
                text: "Edit"
                anchors.fill: parent
                font.pixelSize: 30
                background: color = "cyan"
                onClicked: {
                    var userID = userID_input.text.trim();
                    var userName = userName_input.text.trim();
                    var password = userPassword_input.text.trim();
                    var role = userRole_input.text.trim();
                    var userData = {
                        user_id: userID,
                        username: userName,
                        password: password,
                        role: role
                    };
                    userID_input.text = ""
                    userName_input.text = ""
                    userPassword_input.text = ""
                    userRole_input.text = ""

                    if (userID !== "") {
                        UserRequests.editUser(userData, function(error) {
                            if (!error) {
                                for (var i = 0; i < userModel.count; ++i) {
                                    if (userModel.get(i).user_id === userID) {
                                        edituser(userData);
                                        console.log("user edited successfully.");
                                        list.forceLayout();
                                        return;
                                    }
                                }
                                console.error("user not found for edit.");
                                updateMessage("user not found for edit.");
                            } else {
                                console.error("Error editing user:", error);
                                updateMessage("Error editing user.");
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
            title: "Wrong user ID"
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
