import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs

import "JS/EmployeeRequests.js" as EmployeeRequests
import "JS/UserRequests.js" as UserRequests
import "JS/AttendanceRequests.js" as AttendanceRequests
import "JS/DepartmentRequests.js" as DepartmentRequests

Page{
    id: addEmployee
    signal buttonReturnClicked()

    background: Rectangle {
        color: "white"
    }

    Rectangle {
        id: rectangle_addemployee
        width: parent.width
        height: parent.height * 0.15
        color: "darkblue"
        Label {
            text: "Add employee"
            color : "white"
            anchors.centerIn: parent
            font.pixelSize: 30
        }
    }

    Rectangle {
        id: rectangle_employeeFirstName
        width: parent.width * 0.5
        height: parent.height * 0.15
        anchors.top: rectangle_addemployee.bottom
        anchors.topMargin: parent.height * 0.1
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.05
        Label {
            id: employeeFirstName_label
            text: "First Name"
            color : "black"
            anchors.left: parent.left
            font.pixelSize: 30
            width: parent.width * 0.4
            height: parent.height * 0.15
        }

        Rectangle {
            width: parent.width * 0.25
            height: parent.parent.height * 0.07
            color: "white"
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.2
            anchors.top: parent.top
            border {
                   color: "black"
                   width: 1
               }
               radius: 10

            TextInput {
                id: employeeFirstName_input
                anchors.fill: parent
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.05
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.2
                font.pixelSize: 18
                maximumLength: 16
            }
        }
    }

    Rectangle {
        id: rectangle_employeeLastName
        width: parent.width * 0.5
        height: parent.height * 0.15
        anchors.top: rectangle_addemployee.bottom
        anchors.topMargin: parent.height * 0.1
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.35
        Label {
            id: employeeLastName_label
            text: "Last Name"
            color : "black"
            anchors.left: parent.left
            font.pixelSize: 30
            width: parent.width * 0.4
            height: parent.height * 0.15
        }

        Rectangle {
            width: parent.width * 0.25
            height: parent.parent.height * 0.07
            color: "white"
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.28
            anchors.top: rectangle_addemployee.bottom
            border {
                   color: "black"
                   width: 1
               }
               radius: 10

            TextInput {
                id: employeeLastName_input
                anchors.fill: parent
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.05
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.2
                font.pixelSize: 18
                maximumLength: 16
            }
        }
    }

    Rectangle {
        id: rectangle_employeeEmail
        width: parent.width * 0.5
        height: parent.height * 0.15
        anchors.top: rectangle_employeeFirstName.bottom
        anchors.topMargin: parent.height * 0.02
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.05
        Label {
            id: employeeEmail_label
            text: "Email"
            color : "black"
            anchors.left: parent.left
            font.pixelSize: 30
            width: parent.width * 0.4
            height: parent.height * 0.15
        }

        Rectangle {
            width: parent.width * 0.33
            height: parent.parent.height * 0.07
            color: "white"
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.17
            anchors.top: parent.top
            border {
                   color: "black"
                   width: 1
               }
               radius: 10

            TextInput {
                id: employeeEmail_input
                anchors.fill: parent
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.05
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.2
                font.pixelSize: 18
                maximumLength: 25
            }
        }
    }

    Rectangle {
        id: rectangle_employeePhoneNumber
        width: parent.width * 0.5
        height: parent.height * 0.15
        anchors.top: rectangle_employeeLastName.bottom
        anchors.topMargin: parent.height * 0.03
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.35
        Label {
            id: employeePhoneNumber_label
            text: "Phone Number"
            color : "black"
            anchors.left: parent.left
            font.pixelSize: 30
            width: parent.width * 0.4
            height: parent.height * 0.15
        }

        Rectangle {
            width: parent.width * 0.25
            height: parent.parent.height * 0.07
            color: "white"
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.28
            anchors.top: rectangle_employeeLastName.bottom
            border {
                   color: "black"
                   width: 1
               }
               radius: 10

            TextInput {
                id: employeePhoneNumber_input
                anchors.fill: parent
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.05
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.2
                font.pixelSize: 18
                maximumLength: 12
                validator: RegularExpressionValidator { regularExpression: /^[0-9]+/ }
            }
        }
    }

    Rectangle {
        id: rectangle_employeeHireDate
        width: parent.width * 0.5
        height: parent.height * 0.15
        anchors.top: rectangle_employeeEmail.bottom
        anchors.topMargin: parent.height * 0.02
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.05
        Label {
            id: employeeHireDate_label
            text: "Hire date"
            color : "black"
            anchors.left: parent.left
            font.pixelSize: 30
            width: parent.width * 0.4
            height: parent.height * 0.15
        }

        Rectangle {
            width: parent.width * 0.25
            height: parent.parent.height * 0.07
            color: "white"
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.2
            anchors.top: parent.top
            border {
                   color: "black"
                   width: 1
               }
               radius: 10

            TextInput {
                id: employeeHire_Date_input
                anchors.fill: parent
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.05
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.2
                font.pixelSize: 18
                maximumLength: 10
                validator: RegularExpressionValidator { regularExpression: /^(19\d{2}|20\d{2})-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])$/ }
            }
        }
    }

    Rectangle {
        id: rectangle_employeeSalary
        width: parent.width * 0.5
        height: parent.height * 0.15
        anchors.top: rectangle_employeeEmail.bottom
        anchors.topMargin: parent.height * 0.03
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.35
        Label {
            id: employeeSalary_label
            text: "Salary"
            color : "black"
            anchors.left: parent.left
            font.pixelSize: 30
            width: parent.width * 0.4
            height: parent.height * 0.15
        }

        Rectangle {
            width: parent.width * 0.25
            height: parent.parent.height * 0.07
            color: "white"
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.28
            anchors.top: rectangle_employeePhoneNumber.bottom
            border {
                   color: "black"
                   width: 1
               }
               radius: 10

            TextInput {
                id: employeeSalary_input
                anchors.fill: parent
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.05
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.2
                font.pixelSize: 18
                maximumLength: 12
                validator: RegularExpressionValidator { regularExpression: /^[0-9]+(\.[0-9]+)?$/ }
            }
        }
    }

    Rectangle {
        id: rectangle_employeeJob
        width: parent.width * 0.5
        height: parent.height * 0.15
        anchors.top: rectangle_employeeHireDate.bottom
        anchors.topMargin: parent.height * 0.02
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.05
        Label {
            id: employeeJob_label
            text: "Job"
            color : "black"
            anchors.left: parent.left
            font.pixelSize: 30
            width: parent.width * 0.4
            height: parent.height * 0.15
        }

        Rectangle {
            width: parent.width * 0.25
            height: parent.parent.height * 0.07
            color: "white"
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.2
            anchors.top: parent.top
            border {
                   color: "black"
                   width: 1
               }
               radius: 10

            TextInput {
                id: employeeJob_input
                anchors.fill: parent
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.05
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.2
                font.pixelSize: 18
                maximumLength: 16
            }
        }
    }

    Rectangle {
        id: rectangle_employeeDepartment
        width: parent.width * 0.5
        height: parent.height * 0.15
        anchors.top: rectangle_employeeSalary.bottom
        anchors.topMargin: parent.height * 0.03
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.35
        Label {
            id: employeeDepartment_label
            text: "Department ID"
            color : "black"
            anchors.left: parent.left
            font.pixelSize: 30
            width: parent.width * 0.4
            height: parent.height * 0.15
        }

        Rectangle {
            width: parent.width * 0.25
            height: parent.parent.height * 0.07
            color: "white"
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.28
            anchors.top: rectangle_employeeSalary.bottom
            border {
                   color: "black"
                   width: 1
               }
               radius: 10

            TextInput {
                id: employeeDepartmentID_input
                anchors.fill: parent
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.05
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.2
                font.pixelSize: 18
                maximumLength: 5
                validator: RegularExpressionValidator { regularExpression: /^[0-9]+(\.[0-9]+)?$/ }

            }
        }
    }

    Rectangle {
        id: rectangle_add
        width: parent.width * 0.1
        height: parent.height * 0.1
        color: "red"
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.88
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.15
        Button {
            text: "Add"
            anchors.fill: parent
            font.pixelSize: 30
            background : color = "blue"
            onClicked:{
                if(employeeHire_Date_input.length !==10){
                    messageDialogWrongDate.text = "Invalid hire date format. Please use YYYY-MM-DD.";
                    messageDialogWrongDate.open();
                }
                else if((employeeFirstName_input.length==0) || (employeeLastName_input.length==0) || (employeeEmail_input.length==0) ||
                        (employeePhoneNumber_input.length==0) || (employeeDepartmentID_input.length==0) ||
                        (employeeSalary_input.length==0) || (employeeJob_input.length==0)){
                    messageDialogEmptyData.text = "Please enter valid data";
                    messageDialogEmptyData.open();
                }

                else{
                    var employeedata = {
                       "first_name": employeeFirstName_input.displayText,
                       "last_name": employeeLastName_input.displayText,
                       "email": employeeEmail_input.displayText,
                       "phone_number": employeePhoneNumber_input.displayText,
                       "hire_date": employeeHire_Date_input.displayText,
                       "department_id": employeeDepartmentID_input.displayText,
                       "salary": employeeSalary_input.displayText,
                       "job_title": employeeJob_input.displayText,
                   };
                    EmployeeRequests.createEmployee(employeedata)
                    employeeFirstName_input.text = ""
                    employeeLastName_input.text = ""
                    employeeEmail_input.text = ""
                    employeeJob_input.text = ""
                    employeePhoneNumber_input.text = ""
                    employeeHire_Date_input.text = ""
                    employeeDepartmentID_input.text = ""
                    employeeSalary_input.text = ""
                }
            }
        }
    }
    Rectangle {
        id: rectangle_return
        width: parent.width * 0.1
        height: parent.height * 0.1
        color: "purple"
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.88
        anchors.left: rectangle_add.right
        anchors.leftMargin: parent.width * 0.1
        Button {
            text: "Return"
            anchors.fill: parent
            font.pixelSize: 30
            background : color = "blue"
            onClicked:
                buttonReturnClicked();
        }
    }

    Image {
        id: image
        width: parent.width * 0.3
        height: parent.height * 0.45
        source: "qrc:/img/employee.jpeg"
        anchors.topMargin: parent.height * 0.18
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.65
        anchors.top: rectangle_addemployee.bottom
    }

    MessageDialog {
        id: messageDialogWrongDate
        title: "Wrong Date"
    }

    MessageDialog{
        id: messageDialogEmptyData
        title: "Invalid Data"
    }

    MessageDialog{
        id: messageDialogDepartment
        title: "Wrong Department ID"
    }
}


