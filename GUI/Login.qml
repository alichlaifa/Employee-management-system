import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Dialogs

import "JS/UserRequests.js" as UserRequests

Page {
    id: login
    signal buttonClicked()
    background: Rectangle {
        Image {
            id: image_background
            anchors.fill: parent
            source: "qrc:/img/loginBG.jpg"
        }
    }

    Rectangle{
        id: rectangle_login
        width: parent.width * 0.55
        height: parent.height * 0.75
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        color: "steelblue"
        opacity: 0.8

        Label {
            id : label_welcome
            text: "Welcome"
            color: "white"
            font.pixelSize: 50
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.05
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: rectangle_username
            width: parent.width * 0.5
            height: parent.parent.height * 0.07
            anchors.top: label_welcome.top
            anchors.topMargin: parent.height * 0.25
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            border {
                   color: "black"
                   width: 1
               }
            radius: 60

            Image {
                id: image_username
                width: parent.width * 0.2
                height: parent.height * 0.6
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.05
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.05
                source: "qrc:/img/username.png"
            }

            TextInput {
                id: input_username
                anchors.fill: parent
                font.pixelSize: 30
                anchors.left: image_username.left
                anchors.leftMargin: parent.width * 0.3
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.2
                maximumLength: 15
            }
        }

        Rectangle {
            id: rectangle_password
            width: parent.width * 0.5
            height: parent.parent.height * 0.07
            anchors.top: rectangle_username.top
            anchors.topMargin: parent.height * 0.25
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            border {
                   color: "black"
                   width: 1
               }
            radius: 60

            Image {
                id: image_password
                width: parent.width * 0.2
                height: parent.height * 0.6
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.05
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.05
                source: "qrc:/img/password.png"
            }

            TextInput {
                id: input_password
                anchors.fill: parent
                font.pixelSize: 30
                anchors.left: image_password.left
                anchors.leftMargin: parent.width * 0.3
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.2
                maximumLength: 15
                echoMode: TextInput.Password
            }
        }

        Rectangle{
            id: rectangle_button
            anchors.top: rectangle_password.bottom
            anchors.topMargin: parent.height * 0.15
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.1
            color: "red"
            Button {
                id: button_login
                text: "Login"
                font.pixelSize: 30
                anchors.fill: parent
                onClicked:{
                    var userList = UserRequests.userList
                    UserRequests.getUsers(function(error, userList) {
                        if (!error) {
                            var username = input_username.text;
                            var password = input_password.text;

                            var userFound = userList.some(function(user) {
                                return user.username === username && user.password === password;
                            });

                            if (userFound) {
                                login.buttonClicked();
                                console.log("Login successful");
                                username_input.text = ""
                                password_input.text = ""
                            } else {
                                updateMessage("Login failed: Username or password is incorrect");
                            }
                        }
                    });
                }
            }
        }
    }

    MessageDialog {
        id: messageDialog
        title: "Login Status"
    }

    function updateMessage(message) {
        messageDialog.text = message;
        messageDialog.open();
    }
}

