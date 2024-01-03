.pragma library

var IP = ''; //Change IP
var PORT = ''; //Change Port

function getAttendance(callback) {
    var req = new XMLHttpRequest();
    req.responseType = 'text';
    req.open('GET', IP+':'+PORT+'/attendances', true);

    req.onload = function() {
        if (req.status === 200) {
            try {
                var jsonResponse = JSON.parse(req.responseText);
                var attendanceList = [];
                for (var i = 0; i < jsonResponse.length; i++) {
                    var attendance = {
                        attendance_id: jsonResponse[i].attendance_id,
                        employee_id: jsonResponse[i].employee_id,
                        arrival_time: jsonResponse[i].arrival_time,
                        departure_time: jsonResponse[i].departure_time,
                        date: jsonResponse[i].date,
                        hours_worked: jsonResponse[i].hours_worked};
                    attendanceList.push(attendance);
                }
                callback(null, attendanceList);
            } catch (e) {
                callback("Error parsing JSON: " + e, null);
            }
        } else {
            callback("Error: " + req.status + " " + req.statusText, null);
        }
    };
    req.send();
}

function getAttendanceByEmployeeID(employeeID, callback) {
    var req = new XMLHttpRequest();
    req.responseType = 'text';
    req.open('POST', IP+':'+PORT+'/attendance/employee', true);
    req.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

    req.onreadystatechange = function() {
        if (req.readyState === XMLHttpRequest.DONE) {
            if (req.status === 200) {
                try {
                    var jsonResponse = JSON.parse(req.responseText);
                    var attendanceByEmployeeID = [];
                    for (var i = 0; i < jsonResponse.length; i++) {
                        var attendance = {
                            attendance_id: jsonResponse[i].attendance_id,
                            employee_id: jsonResponse[i].employee_id,
                            arrival_time: jsonResponse[i].arrival_time,
                            departure_time: jsonResponse[i].departure_time,
                            date: jsonResponse[i].date,
                            hours_worked: jsonResponse[i].hours_worked
                        };
                        attendanceByEmployeeID.push(attendance);
                    }
                    callback(null, attendanceByEmployeeID);
                } catch (e) {
                    callback("Error parsing JSON: " + e, null);
                }
            } else {
                callback("Error: " + req.status + " " + req.statusText, null);
            }
        }
    };
    var data = {
        "employee_id": employeeID
    };
    req.send(JSON.stringify(data));
}

function getAttendanceForDay(selectedDate, callback) {
    var xhr = new XMLHttpRequest();
    xhr.responseType = 'text';
    xhr.open('POST', IP+':'+PORT+'/attendance/day', true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

    xhr.onload = function() {
        if (xhr.status === 200) {
            try {
                var jsonResponse = JSON.parse(xhr.responseText);
                var attendanceList = [];
                for (var i = 0; i < jsonResponse.length; i++) {
                    var attendance = {
                        attendance_id: jsonResponse[i].attendance_id,
                        employee_id: jsonResponse[i].employee_id,
                        arrival_time: jsonResponse[i].arrival_time,
                        departure_time: jsonResponse[i].departure_time,
                        date: jsonResponse[i].date,
                        hours_worked: jsonResponse[i].hours_worked
                    };
                    attendanceList.push(attendance);
                }
                callback(null, attendanceList);
            } catch (e) {
                callback("Error parsing JSON: " + e, null);
            }
        } else {
            callback("Error: " + xhr.status + " " + xhr.statusText, null);
        }
    };

    xhr.send(JSON.stringify({ "date": selectedDate }));
}

function getAttendanceBetweenDates(startDate, endDate, callback) {
    var xhr = new XMLHttpRequest();
    xhr.responseType = 'text';
    xhr.open('POST', IP+':'+PORT+'/attendance/between_dates', true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

    xhr.onload = function() {
        if (xhr.status === 200) {
            try {
                var jsonResponse = JSON.parse(xhr.responseText);
                var attendanceBetweenDates = [];
                for (var i = 0; i < jsonResponse.length; i++) {
                    var attendance = {
                        attendance_id: jsonResponse[i].attendance_id,
                        employee_id: jsonResponse[i].employee_id,
                        arrival_time: jsonResponse[i].arrival_time,
                        departure_time: jsonResponse[i].departure_time,
                        date: jsonResponse[i].date,
                        hours_worked: jsonResponse[i].hours_worked
                    };
                    attendanceBetweenDates.push(attendance);
                }
                callback(null, attendanceBetweenDates);
            } catch (e) {
                callback("Error parsing JSON: " + e, null);
            }
        } else {
            callback("Error: " + xhr.status + " " + xhr.statusText, null);
        }
    };

    xhr.send(JSON.stringify({ "start_date": startDate, "end_date": endDate }));
}

function getAttendanceBetweenStartAndToday(startDate, callback) {
    var xhr = new XMLHttpRequest();
    xhr.responseType = 'text';
    xhr.open('POST', IP+':'+PORT+'/attendance/between_start_and_today', true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

    xhr.onload = function() {
        if (xhr.status === 200) {
            try {
                var jsonResponse = JSON.parse(xhr.responseText);
                var attendanceBetweenDateAndToday = [];
                for (var i = 0; i < jsonResponse.length; i++) {
                    var attendance = {
                        attendance_id: jsonResponse[i].attendance_id,
                        employee_id: jsonResponse[i].employee_id,
                        arrival_time: jsonResponse[i].arrival_time,
                        departure_time: jsonResponse[i].departure_time,
                        date: jsonResponse[i].date,
                        hours_worked: jsonResponse[i].hours_worked
                    };
                    attendanceBetweenDateAndToday.push(attendance);
                }
                callback(null, attendanceBetweenDateAndToday);
            } catch (e) {
                callback("Error parsing JSON: " + e, null);
            }
        } else {
            callback("Error: " + xhr.status + " " + xhr.statusText, null);
        }
    };

    xhr.send(JSON.stringify({ "start_date": startDate }));
}

function getNumberOfPresentEmployees(selectedDate, callback) {
    getAttendanceForDay(selectedDate, function(error, attendanceList) {
        if (!error) {
            var presentEmployeeIds = [];
            for (var i = 0; i < attendanceList.length; i++) {
                var employeeId = attendanceList[i].employee_id;
                if (!presentEmployeeIds.includes(employeeId)) {
                    presentEmployeeIds.push(employeeId);
                }
            }
            var numberOfPresentEmployees = presentEmployeeIds.length;
            callback(null, numberOfPresentEmployees);
        } else {
            callback("Error fetching attendance data for the day: " + error, null);
        }
    });
}


