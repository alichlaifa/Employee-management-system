import QtQuick 2.15
import QtQuick.Controls 2.15

import "JS/EmployeeRequests.js" as EmployeeRequests
import "JS/UserRequests.js" as UserRequests
import "JS/AttendanceRequests.js" as AttendanceRequests
import "JS/DepartmentRequests.js" as DepartmentRequests


ApplicationWindow {
    visible: true
    width: 1600
    height: 900

    StackView{
        id: stack
        anchors.fill: parent
        initialItem: login
    }

    Login {
        id: login
        onButtonClicked:{
            stack.push(home)
        }
    }

    Home {
        id: home
        visible: false
        onButtonLogOutClicked:
            stack.pop(login);
        onButtonDepartmentClicked:
            stack.push(department);
        onButtonUserClicked:
            stack.push(user);
        onButtonEmployeeClicked:
            stack.push(employee);
        onButtonAttendancesClicked:
            stack.push(attendance);
    }

    Department {
        id: department
        visible: false
        onButtonReturnClicked:
            stack.pop(home);
        onButtonAddDepartmentClicked:
            stack.push(addDepartment);
        onButtonDeleteDepartmentClicked:
            stack.push(deleteDepartment);
        onButtonEditDepartmentClicked:
            stack.push(editDepartment);
        onButtonShowDepartmentClicked:
            stack.push(showDepartment);
    }

    AddDepartment {
        id: addDepartment
        visible: false
        onButtonReturnClicked:
            stack.pop(department);
    }

    DeleteDepartment {
        id: deleteDepartment
        visible: false
        onButtonReturnClicked:
            stack.pop(department);
    }

    EditDepartment {
        id: editDepartment
        visible: false
        onButtonReturnClicked:
            stack.pop(department);
    }

    ShowDepartment {
        id: showDepartment
        visible: false
        onButtonReturnClicked:
            stack.pop(department);
    }

    User {
        id: user
        visible: false
        onButtonReturnClicked:
            stack.pop(home);
        onButtonAdduserClicked:
            stack.push(addUser);
        onButtonShowuserClicked:
            stack.push(showUser);
        onButtonEdituserClicked:
            stack.push(editUser);
        onButtonDeleteuserClicked:
            stack.push(deleteUser);
    }

    AddUser {
        id: addUser
        visible: false
        onButtonReturnClicked:
            stack.pop(user);
    }

    ShowUser {
        id: showUser
        visible: false
        onButtonReturnClicked:
            stack.pop(user);
    }

    DeleteUser {
        id: deleteUser
        visible: false
        onButtonReturnClicked:
            stack.pop(user);
    }

    EditUser {
        id: editUser
        visible: false
        onButtonReturnClicked:
            stack.pop(user);
    }

    Employee {
        id: employee
        visible: false
        onButtonReturnClicked:
            stack.pop(home);
        onButtonAddEmployeeClicked:
            stack.push(addEmployee);
        onButtonDeleteEmployeeClicked:
            stack.push(deleteEmployee);
        onButtonShowEmployeeClicked:
            stack.push(showEmployee);
        onButtonEditEmployeeClicked:
            stack.push(editEmployee);
    }

    AddEmployee {
        id: addEmployee
        visible: false
        onButtonReturnClicked:
            stack.pop(employee);
    }

    DeleteEmployee {
        id: deleteEmployee
        visible: false
        onButtonReturnClicked:
            stack.pop(employee);
    }

    ShowEmployee {
        id: showEmployee
        visible: false
        onButtonReturnClicked:
            stack.pop(employee);
    }

    EditEmployee {
        id: editEmployee
        visible: false
        onButtonReturnClicked:
            stack.pop(employee);
    }

    Attendance {
        id: attendance
        visible: false
        onButtonReturnClicked:
            stack.pop(home);
    }

    Component.onCompleted: {
        EmployeeRequests.getEmployeeByFirstName("John", function(error, employees) {
             if (error) {
                 console.error("Error:", error);
             } else {
                 employees.forEach(function(employee) {
                     console.log("Employee:", employee);
                     console.log("  - ID:", employee.employee_id);
                     console.log("  - Name:", employee.first_name + " " + employee.last_name);
                     console.log("  - Email:", employee.email);
                     console.log("  - Phone Number:", employee.phone_number);
                     console.log("  - Hire Date:", employee.hire_date);
                     console.log("  - Department ID:", employee.department_id);
                     console.log("  - Salary:", employee.salary);
                     console.log("  - Job Title:", employee.job_title);
                 });
             }
         });
    }

}


