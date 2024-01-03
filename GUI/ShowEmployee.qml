import QtQuick 2.15
import QtQuick.Controls 2.15

import "JS/EmployeeRequests.js" as EmployeeRequests
import "JS/UserRequests.js" as UserRequests
import "JS/AttendanceRequests.js" as AttendanceRequests
import "JS/DepartmentRequests.js" as DepartmentRequests


Page{
    id: showemployee
    signal buttonReturnClicked()

    background: Rectangle {
        color: "white"
    }

    Component.onCompleted: {
        refreshemployeeList();
    }

    ListModel {
        id: employeeModel
    }

    Rectangle {
        id: rectangle_showemployee
        width: parent.width
        height: parent.height * 0.12
        color: "darkblue"
        Label {
            text: "Show employee"
            color : "white"
            anchors.centerIn: parent
            font.pixelSize: 30
        }
    }


    Rectangle {
        id: rectangle_searchEmployee
        width: parent.width * 0.7
        height: parent.height * 0.08
        anchors.top: rectangle_showemployee.bottom
        anchors.topMargin: parent.height * 0.07
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.15
        color: "gray"
        ComboBox {
            id: combo_search
            width: parent.width * 0.15
            height: parent.height * 0.6
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.2
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.1
            model: ["All", "First Name", "Last Name","Department Name"]
            font.pixelSize: 16
        }

        Rectangle {
            id: rectangle_inputSearch
            width: parent.width * 0.4
            height: parent.height * 0.6
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.2
            anchors.left: combo_search.right
            anchors.leftMargin: parent.width * 0.05
            color: "white"
            border {
                   color: "black"
                   width: 1
               }
            radius: 10
            TextInput{
                id: input_search
                anchors.fill: parent
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.05
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.15
                color : "black"
                font.pixelSize: 20
                maximumLength: 20
            }
        }

        Rectangle {
            id: rectangle_buttonSearch
            width: parent.width * 0.2
            height: parent.height * 0.6
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.2
            anchors.left: rectangle_inputSearch.right
            anchors.leftMargin: parent.width * 0.05
            color: "purple"
            Button {
                text: "Search"
                anchors.fill: parent
                font.pixelSize: 30
                background : color = "purple"
                onClicked: {
                    var selectedOption = combo_search.currentText
                    if(selectedOption==="First Name"){
                        refreshEmployeeListByFirstName(input_search.displayText)
                        console.log("Salary : " + employeeModel.salary)
                    }
                    if(selectedOption==="Last Name")
                        refreshEmployeeListByLastName(input_search.displayText)
                    if(selectedOption==="Department Name")
                        refreshEmployeeListByDepartmentName(input_search.displayText)
                    if(selectedOption==="All")
                        refreshemployeeList()
                }

            }
        }
    }

    Rectangle{
        id: rectagnle_employees
        width: parent.width * 0.96
        height: parent.height * 0.6
        anchors.top: rectangle_searchEmployee.bottom
        anchors.topMargin: parent.height * 0.07
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.03


        Rectangle {
            id: rectangle_employees
            width: parent.width
            height: parent.height * 0.8
            anchors.top: rectangle_showemployee.bottom
            anchors.topMargin: parent.height * 0.07
            anchors.left: showEmployee.left
            anchors.leftMargin: parent.width * 0.02
            ListView {
                anchors.fill: parent
                clip: true
                model: employeeModel
                boundsBehavior: Flickable.StopAtBounds
                ScrollBar.vertical: ScrollBar {
                    policy: ScrollBar.AlwaysOn
                    active: ScrollBar.AlwaysOn
                }
                header: Row {
                    spacing: 30
                    Text { text: "    ID"; font.bold: true ; font.pixelSize: 24; color: "red"}
                    Text { text: " First Name"; font.bold: true; font.pixelSize: 24; color: "red" }
                    Text { text: "Last Name"; font.bold: true ; font.pixelSize: 24; color: "red"}
                    Text { text: "            Email"; font.bold: true; font.pixelSize: 24; color: "red" }
                    Text { text: "            Phone number"; font.bold: true; font.pixelSize: 24; color: "red" }
                    Text { text: "Hire date"; font.bold: true; font.pixelSize: 24; color: "red" }
                    Text { text: " Salary"; font.bold: true; font.pixelSize: 24; color: "red" }
                    Text { text: "        Job title"; font.bold: true; font.pixelSize: 24; color: "red" }
                    Text { text: "            Department"; font.bold: true; font.pixelSize: 24; color: "red" }
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
                            width: 30
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 22
                        }
                        Rectangle {
                            width: 6
                            height: parent.height
                            color: "black"
                        }
                        Text {
                            text: model.first_name
                            width: 100
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 22
                        }
                        Rectangle {
                            width: 6
                            height: parent.height
                            color: "black"
                        }
                        Text {
                            text: model.last_name
                            width: 100
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 22
                        }
                        Rectangle {
                            width: 6
                            height: parent.height
                            color: "black"
                        }
                        Text {
                            text: model.email
                            width: 210
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 22
                        }
                        Rectangle {
                            width: 6
                            height: parent.height
                            color: "black"
                        }
                        Text {
                            text: model.phone_number
                            width: 100
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 22
                        }
                        Rectangle {
                            width: 6
                            height: parent.height
                            color: "black"
                        }
                        Text {
                            text: model.hire_date
                            width: 100
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 22
                        }
                        Rectangle {
                            width: 6
                            height: parent.height
                            color: "black"
                        }
                        Text {
                            text: model.salary
                            width: 100
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 22
                        }
                        Rectangle {
                            width: 6
                            height: parent.height
                            color: "black"
                        }
                        Text {
                            text: model.job_title
                            width: 160
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 22
                        }
                        Rectangle {
                            width: 6
                            height: parent.height
                            color: "black"
                        }
                        Text {
                            text: model.department_name
                            width: 180
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 22
                        }
                        Rectangle {
                            width: 6
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
        width: parent.width * 0.08
        height: parent.height * 0.08
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * 0.02
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.4
        color: "red"
        Button {
            text: "Return"
            anchors.fill: parent
            font.pixelSize: 30
            background : color = "red"
            onClicked:
                showEmployee.buttonReturnClicked();
        }
    }

    function refreshemployeeList() {
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

    function refreshEmployeeListByFirstName(first_name) {
        EmployeeRequests.getEmployeesByFirstName_depName(first_name, function(error, employeeList) {
            if (!error) {
                employeeModel.clear();
                for (var i = 0; i < employeeList.length; i++) {
                    employeeList[i].salary = employeeList[i].salary.toString();
                    employeeModel.append(employeeList[i]);
                }
            } else {
                console.error("Error fetching employees:", error);
            }
        });
    }

    function refreshEmployeeListByLastName(last_name) {
        EmployeeRequests.getEmployeesByLastName_depName(last_name,function(error, employeeList) {
            if (!error) {
                employeeModel.clear();
                for (var i = 0; i < employeeList.length; i++) {
                    employeeList[i].salary = employeeList[i].salary.toString();
                    employeeModel.append(employeeList[i]);
                }
            } else {
                console.error("Error fetching employees:", error);
            }
        });
    }

    function refreshEmployeeListByDepartmentName(department_name) {
        EmployeeRequests.getEmployeesByDepartmentName_depName(department_name,function(error, employeeList) {
            if (!error) {
                employeeModel.clear();
                for (var i = 0; i < employeeList.length; i++) {
                    employeeList[i].salary = employeeList[i].salary.toString();
                    employeeModel.append(employeeList[i]);
                }
            } else {
                console.error("Error fetching employees:", error);
            }
        });
    }
}
