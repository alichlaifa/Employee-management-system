import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs

import "JS/EmployeeRequests.js" as EmployeeRequests
import "JS/UserRequests.js" as UserRequests
import "JS/AttendanceRequests.js" as AttendanceRequests
import "JS/DepartmentRequests.js" as DepartmentRequests


Page{
    id: editEmployee
    signal buttonReturnClicked()

    background: Rectangle {
        color: "white"
    }

    Component.onCompleted: {
        refreshemployeeList();
    }

    Timer {
        id: refreshTimer
        interval: 1000
        running: true
        repeat: true

        onTriggered:{
            refreshemployeeList();
        }
    }

    ListModel {
        id: employeeModel
    }

    Rectangle {
        id: rectangle_editEmployee
        width: parent.width
        height: parent.height * 0.1
        color: "darkblue"
        Label {
            text: "Edit employee"
            color : "white"
            anchors.centerIn: parent
            font.pixelSize: 30
        }
    }


    Rectangle {
        id: rectangle_searchEmployee
        width: parent.width * 0.7
        height: parent.height * 0.07
        anchors.top: rectangle_editEmployee.bottom
        anchors.topMargin: parent.height * 0.04
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
                    if(selectedOption==="First Name")
                        refreshEmployeeListByFirstName(input_search.displayText)
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
        height: parent.height * 0.4
        anchors.top: rectangle_searchEmployee.bottom
        anchors.topMargin: parent.height * 0.04
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.03


        Rectangle {
            id: rectangle_employees
            width: parent.width
            height: parent.height * 0.6
            anchors.top: rectangle_editEmployee.bottom
            anchors.topMargin: parent.height * 0.07
            anchors.left: editEmployee.left
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

    Rectangle {
        id: rectangle_employeeID_label
        width: parent.width * 0.04
        height: parent.height * 0.1
        anchors.top: rectagnle_employees.bottom
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.03
        Label {
            id: employeeID_label
            text: "ID"
            color : "black"
            anchors.fill: parent
            font.pixelSize: 26
            width: parent.width * 0.2
            height: parent.height * 0.15
        }
    }

    Rectangle {
        id: rectangle_employeeID_input
        width: parent.width * 0.05
        height: parent.height * 0.07
        color: "white"
        anchors.left: rectangle_employeeID_label.right
        anchors.top: rectangle_employeeID_label.top
        border {
               color: "black"
               width: 1
           }
           radius: 10

        TextInput {
            id: employeeID_input
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
        id: rectangle_firstName_label
        width: parent.width * 0.09
        height: parent.height * 0.1
        anchors.left: rectangle_employeeID_input.right
        anchors.leftMargin: parent.width * 0.02
        anchors.top: rectangle_employeeID_label.top
        Label {
            id: firstName_label
            text: "First Name"
            color : "black"
            anchors.fill: parent
            font.pixelSize: 26
            width: parent.width * 0.2
            height: parent.height * 0.15
        }
    }

    Rectangle {
        id: rectangle_firstName_input
        width: parent.width * 0.08
        height: parent.height * 0.07
        color: "white"
        anchors.left: rectangle_firstName_label.right
        anchors.top: rectangle_employeeID_label.top
        border {
               color: "black"
               width: 1
           }
           radius: 10

        TextInput {
            id: firstName_input
            anchors.fill: parent
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.05
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.2
            font.pixelSize: 18
            maximumLength: 10
        }
    }

    Rectangle {
        id: rectangle_lastName_label
        width: parent.width * 0.09
        height: parent.height * 0.1
        anchors.left: rectangle_firstName_input.right
        anchors.leftMargin: parent.width * 0.03
        anchors.top: rectangle_employeeID_label.top
        Label {
            id: lastName_label
            text: "Last Name"
            color : "black"
            anchors.fill: parent
            font.pixelSize: 26
            width: parent.width * 0.2
            height: parent.height * 0.15
        }
    }

    Rectangle {
        id: rectangle_lastName_input
        width: parent.width * 0.08
        height: parent.height * 0.07
        color: "white"
        anchors.left: rectangle_lastName_label.right
        anchors.top: rectangle_employeeID_label.top
        border {
               color: "black"
               width: 1
           }
           radius: 10

        TextInput {
            id: lastName_input
            anchors.fill: parent
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.05
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.2
            font.pixelSize: 18
            maximumLength: 10
        }
    }

    Rectangle {
        id: rectangle_email_label
        width: parent.width * 0.06
        height: parent.height * 0.1
        anchors.left: rectangle_lastName_input.right
        anchors.leftMargin: parent.width * 0.03
        anchors.top: rectangle_employeeID_label.top
        Label {
            id: email_label
            text: "Email"
            color : "black"
            anchors.fill: parent
            font.pixelSize: 26
            width: parent.width * 0.2
            height: parent.height * 0.15
        }
    }

    Rectangle {
        id: rectangle_email_input
        width: parent.width * 0.13
        height: parent.height * 0.07
        color: "white"
        anchors.left: rectangle_email_label.right
        anchors.top: rectangle_employeeID_label.top
        border {
               color: "black"
               width: 1
           }
           radius: 10

        TextInput {
            id: email_input
            anchors.fill: parent
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.05
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.2
            font.pixelSize: 18
            maximumLength: 20
        }
    }

    Rectangle {
        id: rectangle_phoneNumber_label
        width: parent.width * 0.125
        height: parent.height * 0.1
        anchors.left: rectangle_email_input.right
        anchors.leftMargin: parent.width * 0.03
        anchors.top: rectangle_employeeID_label.top
        Label {
            id: phoneNumber_label
            text: "Phone number"
            color : "black"
            anchors.fill: parent
            font.pixelSize: 26
            width: parent.width * 0.2
            height: parent.height * 0.15
        }
    }

    Rectangle {
        id: rectangle_phoneNumber_input
        width: parent.width * 0.1
        height: parent.height * 0.07
        color: "white"
        anchors.left: rectangle_phoneNumber_label.right
        anchors.top: rectangle_employeeID_label.top
        border {
               color: "black"
               width: 1
           }
           radius: 10

        TextInput {
            id: phoneNumber_input
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

    Rectangle {
        id: rectangle_Job_label
        width: parent.width * 0.04
        height: parent.height * 0.1
        anchors.top: rectangle_email_label.bottom
        anchors.topMargin: parent.height * 0.03
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.03
        Label {
            id: job_label
            text: "Job"
            color : "black"
            anchors.fill: parent
            font.pixelSize: 26
            width: parent.width * 0.2
            height: parent.height * 0.15
        }
    }

    Rectangle {
        id: rectangle_job_input
        width: parent.width * 0.1
        height: parent.height * 0.07
        color: "white"
        anchors.left: rectangle_employeeID_label.right
        anchors.top: rectangle_Job_label.top
        border {
               color: "black"
               width: 1
           }
           radius: 10

        TextInput {
            id: job_input
            anchors.fill: parent
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.05
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.2
            font.pixelSize: 18
            maximumLength: 12
        }
    }

    Rectangle {
        id: rectangle_hireDate_label
        width: parent.width * 0.09
        height: parent.height * 0.1
        anchors.left: rectangle_job_input.right
        anchors.leftMargin: parent.width * 0.02
        anchors.top: rectangle_Job_label.top
        Label {
            id: hireDate_label
            text: "Hire Date"
            color : "black"
            anchors.fill: parent
            font.pixelSize: 26
            width: parent.width * 0.2
            height: parent.height * 0.15
        }
    }

    Rectangle {
        id: rectangle_hireDate_input
        width: parent.width * 0.1
        height: parent.height * 0.07
        color: "white"
        anchors.left: rectangle_hireDate_label.right
        anchors.top: rectangle_Job_label.top
        border {
               color: "black"
               width: 1
           }
           radius: 10

        TextInput {
            id: hireDate_input
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

    Rectangle {
        id: rectangle_salary_label
        width: parent.width * 0.07
        height: parent.height * 0.1
        anchors.left: rectangle_hireDate_input.right
        anchors.leftMargin: parent.width * 0.02
        anchors.top: rectangle_Job_label.top
        Label {
            id: salary_label
            text: "Salary"
            color : "black"
            anchors.fill: parent
            font.pixelSize: 26
            width: parent.width * 0.2
            height: parent.height * 0.15
        }
    }

    Rectangle {
        id: rectangle_salary_input
        width: parent.width * 0.1
        height: parent.height * 0.07
        color: "white"
        anchors.left: rectangle_salary_label.right
        anchors.top: rectangle_Job_label.top
        border {
               color: "black"
               width: 1
           }
           radius: 10

        TextInput {
            id: salary_input
            anchors.fill: parent
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.05
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.2
            font.pixelSize: 18
            maximumLength: 10
            validator: RegularExpressionValidator { regularExpression: /^[0-9]+(\.[0-9]+)?$/ }
        }
    }

    Rectangle {
        id: rectangle_department_label
        width: parent.width * 0.16
        height: parent.height * 0.1
        anchors.left: rectangle_salary_input.right
        anchors.leftMargin: parent.width * 0.02
        anchors.top: rectangle_Job_label.top
        Label {
            id: department_label
            text: "Department name"
            color : "black"
            anchors.fill: parent
            font.pixelSize: 26
            width: parent.width * 0.2
            height: parent.height * 0.15
        }
    }

    Rectangle {
        id: rectangle_department_input
        width: parent.width * 0.1
        height: parent.height * 0.07
        color: "white"
        anchors.left: rectangle_department_label.right
        anchors.top: rectangle_Job_label.top
        border {
               color: "black"
               width: 1
           }
           radius: 10

        TextInput {
            id: department_input
            anchors.fill: parent
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.05
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.2
            font.pixelSize: 18
            maximumLength: 16
        }
    }

    Rectangle{
        id: rectagnle_buttonReturn
        width: parent.width * 0.08
        height: parent.height * 0.08
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * 0.02
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.37
        color: "red"
        Button {
            text: "Return"
            anchors.fill: parent
            font.pixelSize: 26
            background : color = "red"
            onClicked:
                editEmployee.buttonReturnClicked();
        }
    }

    Rectangle{
        id: rectagnle_buttonEdit
        width: parent.width * 0.08
        height: parent.height * 0.08
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * 0.02
        anchors.left: rectagnle_buttonReturn.right
        anchors.leftMargin: parent.width * 0.1
        color: "cyan"
        Button {
            text: "Edit"
            anchors.fill: parent
            font.pixelSize: 30
            background : color = "cyan"
            onClicked: {
                if(hireDate_input.length !==10){
                    messageDialogWrongDate.text = "Invalid hire date format. Please use YYYY-MM-DD.";
                    messageDialogWrongDate.open();
                }
                else if((employeeID_input.length==0) || (firstName_input.length==0) || (lastName_input.length==0) ||
                        (email_input.length==0) || (job_input.length==0) ||
                        (phoneNumber_input.length==0) || (hireDate_input.length==0) || (salary_input.length==0)){
                    messageDialogEmptyData.text = "Please enter valid data";
                    messageDialogEmptyData.open();
                }
                else {
                var employeeID = employeeID_input.text.trim();
                var firstName = firstName_input.text.trim();
                var lastName = lastName_input.text.trim();
                var email = email_input.text.trim();
                var job = job_input.text.trim();
                var phone_number = phoneNumber_input.text.trim();
                var hire_date = hireDate_input.text.trim();
                var salary = salary_input.text.trim();
                console.log(department_input)

                DepartmentRequests.getDepartmentID(department_input.text.trim(), function(error, departmentID) {
                    if (error) {
                        console.error("Error: " + error);
                        messageDialogWrongDepartmentID.text = "Invalid department name";
                        messageDialogWrongDepartmentID.open();
                    } else {
                        if (employeeID !== "") {
                            var EmployeeData = {
                                employee_id: employeeID,
                                first_name: firstName,
                                last_name: lastName,
                                email: email,
                                phone_number: phone_number,
                                hire_date: hire_date,
                                salary: salary,
                                job_title: job,
                                department_id: departmentID
                            };
                            employeeID_input.text = ""
                            firstName_input.text = ""
                            lastName_input.text = ""
                            job_input.text = ""
                            salary_input.text = ""
                            hireDate_input.text = ""
                            phoneNumber_input.text = ""
                            email_input.text = ""
                            department_input.text = ""
                            EmployeeRequests.editEmployee(EmployeeData, function(editError) {
                                if (!editError) {
                                    for (var i = 0; i < employeeModel.count; ++i) {
                                        if (employeeModel.get(i).employee_id === employeeID) {
                                            employeeModel.setProperty(i, "first_name", firstName);
                                            employeeModel.setProperty(i, "last_name", lastName);
                                            console.log("Employee edited successfully.");
                                            return;
                                        }
                                    }
                                } else {
                                    console.error("Error editing employee:", editError);
                                    messageDialogWrongEmployeeID.text = "Invalid employee ID";
                                    messageDialogWrongEmployeeID.open();
                                }
                            });
                        } else
                            console.error("Please provide a department ID.");
                    }
                });
            }
            }
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
        EmployeeRequests.getEmployeesByFirstName_depName(first_name,function(error, employeeList) {
            console.log("Entred in function")
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

    function refreshEmployeeListByLastName(last_name) {
        EmployeeRequests.getEmployeesByLastName_depName(last_name,function(error, employeeList) {
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

    function refreshEmployeeListByDepartmentName(department_name) {
        EmployeeRequests.getEmployeesByDepartmentName_depName(department_name,function(error, employeeList) {
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

    MessageDialog {
        id: messageDialogWrongEmployeeID
        title: "Wrong Employee ID"
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
        id: messageDialogWrongDepartmentID
        title: "Wrong Department ID"
    }
}

