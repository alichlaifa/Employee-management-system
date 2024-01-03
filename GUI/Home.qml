import QtQuick 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15

import "JS/EmployeeRequests.js" as EmployeeRequests
import "JS/AttendanceRequests.js" as AttendanceRequests

Page{
    id: home
    signal buttonLogOutClicked;
    signal buttonDepartmentClicked;
    signal buttonUserClicked;
    signal buttonEmployeeClicked;
    signal buttonAttendancesClicked;

    property var employeeList: []
    property var previousWeekDates: []
    property var present_day_0
    property var present_day_1
    property var present_day_2
    property var present_day_3
    property var present_day_4
    property var present_day_5
    property var present_day_6
    property var num_present0


    Timer {
            id: refreshTimer
            interval: 1000
            running: true
            repeat: true

            onTriggered: {
                EmployeeRequests.getEmployees(function(error, list) {
                    if (!error) {
                        home.employeeList = list;
                        console.log("Employee list updated:", home.employeeList);
                    } else {
                        console.error("Error updating employee list:", error);
                    }
                });

                AttendanceRequests.getNumberOfPresentEmployees(EmployeeRequests.getCurrentDateYMD(),function(error, num_present) {
                    if (!error) {
                        var num_absent = home.employeeList.length - num_present;
                        label_abscent.text = "     Absent \n\n          " + num_absent;
                    } else {
                        console.error("Error fetching number of present employees:", error);
                    }
                });

                AttendanceRequests.getNumberOfPresentEmployees(previousWeekDates[6], function(error, num_present) {
                    if (!error) {
                        present_day_6 = num_present;
                        console.log(present_day_0)
                    } else {
                        console.error("Error :", error);
                    }
                });

                AttendanceRequests.getNumberOfPresentEmployees(previousWeekDates[5], function(error, num_present) {
                    if (!error) {
                        present_day_5 = num_present;
                        console.log(present_day_0)
                    } else {
                        console.error("Error :", error);
                    }
                });

                AttendanceRequests.getNumberOfPresentEmployees(previousWeekDates[4], function(error, num_present) {
                    if (!error) {
                        present_day_4 = num_present;
                    } else {
                        console.error("Error :", error);
                    }
                });

                AttendanceRequests.getNumberOfPresentEmployees(previousWeekDates[3], function(error, num_present) {
                    if (!error) {
                        present_day_3 = num_present;
                    } else {
                        console.error("Error :", error);
                    }
                });

                AttendanceRequests.getNumberOfPresentEmployees(previousWeekDates[2], function(error, num_present) {
                    if (!error) {
                        present_day_2 = num_present;
                    } else {
                        console.error("Error :", error);
                    }
                });

                AttendanceRequests.getNumberOfPresentEmployees(previousWeekDates[1], function(error, num_present) {
                    if (!error) {
                        present_day_1 = num_present;
                    } else {
                        console.error("Error :", error);
                    }
                });

                AttendanceRequests.getNumberOfPresentEmployees(previousWeekDates[0], function(error, num_present) {
                    if (!error) {
                        present_day_0 = num_present;
                    } else {
                        console.error("Error :", error);
                    }
                });

                function updatePresenceChart() {
                    bar_presence.clear();
                    for (var index = 0; index < bar_presence.count; ++index) {
                        var barSet = bar_presence.at(index);
                        if (barSet.label === "Present") {
                            bar_presence.remove(barSet);
                            break;
                        }
                        if (barSet.label === "Absent") {
                            bar_presence.remove(barSet);
                            break;
                        }
                    }
                    bar_presence.append("Present", [present_day_0, present_day_1, present_day_2, present_day_3, present_day_4, present_day_5, present_day_6]);
                    bar_presence.append("Absent", [employeeList.length - present_day_0, employeeList.length - present_day_1, employeeList.length - present_day_2, employeeList.length - present_day_3, employeeList.length - present_day_4, employeeList.length - present_day_5, employeeList.length - present_day_6]);
                }
                updatePresenceChart();
            }
        }

        Component.onCompleted: {
            EmployeeRequests.getEmployees(function(error, list) {
                if (!error) {
                    home.employeeList = list;
                    console.log("Initial employee list loaded:", home.employeeList);
                } else {
                    console.error("Error loading initial employee list:", error);
                }
            });

            EmployeeRequests.getPreviousWeekDates(function(previousWeekDates) {
                home.previousWeekDates = previousWeekDates;
            });

            AttendanceRequests.getNumberOfPresentEmployees(EmployeeRequests.getCurrentDateYMD(), function(error, num_present) {
                if (!error) {
                    console.log("Number of present employees:", num_present);
                    var num_absent = home.employeeList.length - num_present;
                    label_abscent.text = "     Absent \n\n          " + num_absent;
                    num_present0 = num_present
                } else {
                    console.error("Error fetching number of present employees:", error);
                }
            });

            EmployeeRequests.getNumberOfEmployeesByDepartment(function(error, employeeCounts) {
                if (!error) {
                    for (var departmentName in employeeCounts) {
                        console.log(departmentName + ": " + employeeCounts[departmentName]);
                        chart_employeesbyDep.append(departmentName,employeeCounts[departmentName])
                    }
                } else {
                    console.error("Error fetching employee counts:", error);
                }
            });

            AttendanceRequests.getNumberOfPresentEmployees(previousWeekDates[6], function(error, num_present) {
                if (!error) {
                    present_day_6 = num_present;
                    console.log(present_day_0)
                } else {
                    console.error("Error :", error);
                }
            });

            AttendanceRequests.getNumberOfPresentEmployees(previousWeekDates[5], function(error, num_present) {
                if (!error) {
                    present_day_5 = num_present;
                    console.log(present_day_0)
                } else {
                    console.error("Error :", error);
                }
            });

            AttendanceRequests.getNumberOfPresentEmployees(previousWeekDates[4], function(error, num_present) {
                if (!error) {
                    present_day_4 = num_present;
                } else {
                    console.error("Error :", error);
                }
            });

            AttendanceRequests.getNumberOfPresentEmployees(previousWeekDates[3], function(error, num_present) {
                if (!error) {
                    present_day_3 = num_present;
                } else {
                    console.error("Error :", error);
                }
            });

            AttendanceRequests.getNumberOfPresentEmployees(previousWeekDates[2], function(error, num_present) {
                if (!error) {
                    present_day_2 = num_present;
                } else {
                    console.error("Error :", error);
                }
            });

            AttendanceRequests.getNumberOfPresentEmployees(previousWeekDates[1], function(error, num_present) {
                if (!error) {
                    present_day_1 = num_present;
                } else {
                    console.error("Error :", error);
                }
            });

            AttendanceRequests.getNumberOfPresentEmployees(previousWeekDates[0], function(error, num_present) {
                if (!error) {
                    present_day_0 = num_present;
                } else {
                    console.error("Error :", error);
                }
            });

            function updatePresenceChart() {
                bar_presence.clear();
                for (var index = 0; index < bar_presence.count; ++index) {
                    var barSet = bar_presence.at(index);
                    if (barSet.label === "Present") {
                        bar_presence.remove(barSet);
                        break;
                    }
                    if (barSet.label === "Absent") {
                        bar_presence.remove(barSet);
                        break;
                    }
                }
                bar_presence.append("Present", [present_day_0, present_day_1, present_day_2, present_day_3, present_day_4, present_day_5, present_day_6]);
                bar_presence.append("Absent", [employeeList.length - present_day_0, employeeList.length - present_day_1, employeeList.length - present_day_2, employeeList.length - present_day_3, employeeList.length - present_day_4, employeeList.length - present_day_5, employeeList.length - present_day_6]);
            }
            updatePresenceChart();
        }

    Rectangle{
        id : rectangle_menu
        width: parent.width * 0.18
        height: parent.height
        color: "darkblue"

        Column{
            id: column_menu
            anchors.fill: parent
            Row{
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                Button {
                    text: "Employee"
                    font.pixelSize: 18
                    width: parent.width
                    height: home.height  / 5
                    palette{ button : "darkblue"}
                    onClicked:
                        home.buttonEmployeeClicked();
                }
            }
            Row{
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                Button {
                    text: "Department"
                    font.pixelSize: 18
                    width: parent.width
                    height: home.height  / 5
                    palette{ button : "darkblue"}
                    onClicked:
                        home.buttonDepartmentClicked();
                }
            }
            Row{
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                Button {
                    text: "Attendance"
                    font.pixelSize: 18
                    width: parent.width
                    height: home.height  / 5
                    palette{ button : "darkblue"}
                    onClicked:
                        home.buttonAttendancesClicked();
                }
            }
            Row{
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                Button {
                    text: "Users"
                    font.pixelSize: 18
                    width: parent.width
                    height: home.height  / 5
                    palette{ button : "darkblue"}
                    onClicked:
                        home.buttonUserClicked();
                }
            }
            Row{
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                Button {
                    text: "Log out"
                    font.pixelSize: 18
                    width: parent.width
                    height: home.height  / 5
                    palette{ button : "darkblue"}
                    onClicked:
                        home.buttonLogOutClicked();
                }
            }
        }
    }

    Rectangle{
        id: rectangle2
        height: parent.height
        width: parent.width
        anchors.left: rectangle_menu.right
        Column{
            id: column2
            anchors.fill: parent
            spacing: parent.height * 0.1
            Row{
                anchors.fill: parent
                height: home.height * 0.2
                spacing: parent.width * 0.03
                anchors.leftMargin: parent.width * 0.03
                anchors.topMargin: parent.height * 0.02
                Rectangle{
                    id: rectangle_date
                    width: home.width * 0.25
                    height: home.height * 0.2
                    border.color: "gray"
                    radius: 30
                    anchors.leftMargin: parent.width * 0.02
                    Label{
                        id: label_date
                        text: "       Date \n\n" + EmployeeRequests.getCurrentDate()
                        color: "black"
                        font.pixelSize: 18
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                Rectangle{
                    id: rectangle_employees
                    width: home.width * 0.17
                    height: home.height * 0.2
                    border.color: "gray"
                    radius: 30
                    Label{
                        id: label_employees
                        text: "       Employees \n\n             " + employeeList.length
                        color: "black"
                        font.pixelSize: 18
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                Rectangle{
                    id: rectangle_absences
                    width: home.width * 0.17
                    height: home.height * 0.2
                    border.color: "gray"
                    radius: 30
                    Label{
                        id: label_abscent
                        text: "       Abscent \n\n          " + num_absent
                        color: "black"
                        font.pixelSize: 18
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
            Row{
                id: row2
                anchors.fill: parent
                height: home.height * 0.7
                spacing: parent.width * 0.03
                anchors.topMargin: parent.height * 0.3

                Rectangle{
                    id: rectangle_chartEmployee
                    width: home.width * 0.25
                    height: home.height * 0.65
                    anchors.topMargin: parent.height * 0.05
                    anchors.left: column_menu.right
                    ChartView {
                        id: chart_employees
                        title: "Employees by department"
                        anchors.fill: parent
                        legend.alignment: Qt.AlignBottom
                        antialiasing: true
                        PieSeries {
                            id: chart_employeesbyDep
                        }
                    }
                }
                Rectangle{
                    id: rectangle_attendanceWeek
                    width: home.width * 0.55
                    height: home.height * 0.65
                    anchors.topMargin: parent.height * 0.05
                    anchors.left: home.right
                    ChartView {
                        title: "Percentage of presence"
                        anchors.fill: parent
                        legend.alignment: Qt.AlignBottom
                        antialiasing: true
                        PercentBarSeries {
                            id: bar_presence
                            axisX: BarCategoryAxis { categories: [previousWeekDates[0], previousWeekDates[1], previousWeekDates[2], previousWeekDates[3], previousWeekDates[4], previousWeekDates[5], previousWeekDates[6] ]}
                        }
                    }
                }
            }
        }
    }
}
