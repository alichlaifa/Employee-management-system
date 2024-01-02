.pragma library

.import "DepartmentRequests.js" as DepartmentRequests

var IP = ''; //Change IP
var PORT = ''; //Change Port

function createEmployee(employeeData) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", IP+':'+PORT+'/create_employee', true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200 || xhr.status === 201) {
                console.log("Request successful");
            } else {
                console.error("Error:", xhr.status, xhr.statusText);
            }
        }
    };

    xhr.send(JSON.stringify(employeeData));
}

function getEmployees(callback) {
    var req = new XMLHttpRequest();
    req.responseType = 'text';
    req.open('GET', IP+':'+PORT+'/employees', true);

    req.onload = function() {
        if (req.status === 200) {
            try {
                var jsonResponse = JSON.parse(req.responseText);
                var employeeList = [];
                for (var i = 0; i < jsonResponse.length; i++) {
                    var employee = {
                        employee_id: jsonResponse[i].employee_id,
                        first_name: jsonResponse[i].first_name,
                        last_name: jsonResponse[i].last_name,
                        email: jsonResponse[i].email,
                        phone_number: jsonResponse[i].phone_number,
                        hire_date: jsonResponse[i].hire_date,
                        department_id: jsonResponse[i].department_id,
                        salary: jsonResponse[i].salary,
                        job_title: jsonResponse[i].job_title
                    };
                    employeeList.push(employee);
                }
                callback(null, employeeList);
            } catch (e) {
                callback("Error parsing JSON: " + e, null);
            }
        } else {
            callback("Error: " + req.status + " " + req.statusText, null);
        }
    };
    req.send();
}

function getEmployees_depName(callback) {
    var req = new XMLHttpRequest();
    req.responseType = 'text';
    req.open('GET', IP+':'+PORT+'/employees_depName', true);

    req.onload = function() {
        if (req.status === 200) {
            try {
                var jsonResponse = JSON.parse(req.responseText);
                var employeeList = [];
                for (var i = 0; i < jsonResponse.length; i++) {
                    var employee = {
                        employee_id: jsonResponse[i].employee_id,
                        first_name: jsonResponse[i].first_name,
                        last_name: jsonResponse[i].last_name,
                        email: jsonResponse[i].email,
                        phone_number: jsonResponse[i].phone_number,
                        hire_date: jsonResponse[i].hire_date,
                        department_name: jsonResponse[i].department_name,
                        salary: jsonResponse[i].salary,
                        job_title: jsonResponse[i].job_title
                    };
                    employeeList.push(employee);
                }
                callback(null, employeeList);
            } catch (e) {
                callback("Error parsing JSON: " + e, null);
            }
        } else {
            callback("Error: " + req.status + " " + req.statusText, null);
        }
    };
    req.send();
}

function editEmployee(employeeData) {
    var xhr = new XMLHttpRequest();
    xhr.open("PUT", IP+':'+PORT+'/editEmployee', true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200 || xhr.status === 201) {
                console.log("Request successful");
            } else {
                console.error("Error:", xhr.status, xhr.statusText);
            }
        }
    };

    xhr.send(JSON.stringify(employeeData));
}

function deleteEmployee(employeeId) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", IP+':'+PORT+'/deleteEmployee', true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200 || xhr.status === 201) {
                console.log("Request successful");
            } else {
                console.error("Error:", xhr.status, xhr.statusText);
            }
        }
    };

    var data = {
        "employee_id": employeeId
    };

    xhr.send(JSON.stringify(data));
}

function getEmployeeByID(employeeId, callback) {
    var req = new XMLHttpRequest();
    req.responseType = 'text';
    req.open('POST', IP+':'+PORT+'/getEmployees/employee_id', true);
    req.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

    req.onreadystatechange = function() {
        if (req.readyState === XMLHttpRequest.DONE) {
            if (req.status === 200) {
                try {
                    var jsonResponse = JSON.parse(req.responseText);
                    employeeByIDList = [];
                    for (var i = 0; i < jsonResponse.length; i++) {
                        var employee = {
                            employee_id: jsonResponse[i].employee_id,
                            first_name: jsonResponse[i].first_name,
                            last_name: jsonResponse[i].last_name,
                            email: jsonResponse[i].email,
                            phone_number: jsonResponse[i].phone_number,
                            hire_date: jsonResponse[i].hire_date,
                            department_id: jsonResponse[i].department_id,
                            salary: jsonResponse[i].salary,
                            job_title: jsonResponse[i].job_title
                        };
                        employeeByIDList.push(employee);
                    }
                    callback(null, employeeByIDList);
                } catch (e) {
                    callback("Error parsing JSON: " + e, null);
                }
            } else {
                callback("Error: " + req.status + " " + req.statusText, null);
            }
        }
    };
    var data = {
        "employee_id": employeeId
    };
    req.send(JSON.stringify(data));
}

function getEmployeeByFirstName(firstName, callback) {
    var xhr = new XMLHttpRequest();
    xhr.responseType = 'text';
    xhr.open('POST', IP+':'+PORT+'/getEmployees/first_name', true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                try {
                    var jsonResponse = JSON.parse(xhr.responseText);
                    var employeeByFirstNameList = [];
                    for (var i = 0; i < jsonResponse.length; i++) {
                        var employee = {
                            employee_id: jsonResponse[i].employee_id,
                            first_name: jsonResponse[i].first_name,
                            last_name: jsonResponse[i].last_name,
                            email: jsonResponse[i].email,
                            phone_number: jsonResponse[i].phone_number,
                            hire_date: jsonResponse[i].hire_date,
                            department_name: jsonResponse[i].department_name,
                            salary: jsonResponse[i].salary,
                            job_title: jsonResponse[i].job_title
                        };
                        employeeByFirstNameList.push(employee);
                    }
                    callback(null, employeeByFirstNameList);
                } catch (e) {
                    callback("Error parsing JSON: " + e, null);
                }
            } else {
                callback("Error: " + xhr.status + " " + xhr.statusText, null);
            }
        }
    };
    var data = {
        "first_name": firstName
    };
    xhr.send(JSON.stringify(data));
}

function getEmployeeByLastName(lastName, callback) {
    var xhr = new XMLHttpRequest();
    xhr.responseType = 'text';
    xhr.open('POST', IP+':'+PORT+'/getEmployees/last_name', true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                try {
                    var jsonResponse = JSON.parse(xhr.responseText);
                    var employeeByLastNameList = []
                    for (var i = 0; i < jsonResponse.length; i++) {
                        var employee = {
                            employee_id: jsonResponse[i].employee_id,
                            first_name: jsonResponse[i].first_name,
                            last_name: jsonResponse[i].last_name,
                            email: jsonResponse[i].email,
                            phone_number: jsonResponse[i].phone_number,
                            hire_date: jsonResponse[i].hire_date,
                            department_name: jsonResponse[i].department_name,
                            salary: jsonResponse[i].salary,
                            job_title: jsonResponse[i].job_title
                        };
                        employeeByLastNameList.push(employee);
                    }
                    callback(null, employeeByLastNameList);
                } catch (e) {
                    callback("Error parsing JSON: " + e, null);
                }
            } else {
                callback("Error: " + xhr.status + " " + xhr.statusText, null);
            }
        }
    };

    var data = {
        "last_name": lastName
    };
    xhr.send(JSON.stringify(data));
}

function getEmployeeByEmail(email, callback) {
    var xhr = new XMLHttpRequest();
    xhr.responseType = 'text';
    xhr.open('POST', IP+':'+PORT+'/getEmployees/email', true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                try {
                    var jsonResponse = JSON.parse(xhr.responseText);
                    var employeeByEmailList = [];
                    for (var i = 0; i < jsonResponse.length; i++) {
                        var employee = {
                            employee_id: jsonResponse[i].employee_id,
                            first_name: jsonResponse[i].first_name,
                            last_name: jsonResponse[i].last_name,
                            email: jsonResponse[i].email,
                            phone_number: jsonResponse[i].phone_number,
                            hire_date: jsonResponse[i].hire_date,
                            department_id: jsonResponse[i].department_id,
                            salary: jsonResponse[i].salary,
                            job_title: jsonResponse[i].job_title
                        };
                        employeeByEmailList.push(employee);
                    }
                    callback(null, employeeByEmailList);
                } catch (e) {
                    callback("Error parsing JSON: " + e, null);
                }
            } else {
                callback("Error: " + xhr.status + " " + xhr.statusText, null);
            }
        }
    };

    var data = {
        "email": email
    };
    xhr.send(JSON.stringify(data));
}

function getEmployeeByPhoneNumber(phoneNumber, callback) {
    var xhr = new XMLHttpRequest();
    xhr.responseType = 'text';
    xhr.open('POST', IP+':'+PORT+'/getEmployees/phone_number', true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                try {
                    var jsonResponse = JSON.parse(xhr.responseText);
                    var employeeByPhoneNumberList = [];
                    for (var i = 0; i < jsonResponse.length; i++) {
                        var employee = {
                            employee_id: jsonResponse[i].employee_id,
                            first_name: jsonResponse[i].first_name,
                            last_name: jsonResponse[i].last_name,
                            email: jsonResponse[i].email,
                            phone_number: jsonResponse[i].phone_number,
                            hire_date: jsonResponse[i].hire_date,
                            department_id: jsonResponse[i].department_id,
                            salary: jsonResponse[i].salary,
                            job_title: jsonResponse[i].job_title
                        };
                        employeeByPhoneNumberList.push(employee);
                    }
                    callback(null, employeeByPhoneNumberList);
                } catch (e) {
                    callback("Error parsing JSON: " + e, null);
                }
            } else {
                callback("Error: " + xhr.status + " " + xhr.statusText, null);
            }
        }
    };

    var data = {
        "phone_number": phoneNumber
    };
    xhr.send(JSON.stringify(data));
}

function getEmployeeByDepartmentID(departmentID, callback) {
    var xhr = new XMLHttpRequest();
    xhr.responseType = 'text';
    xhr.open('POST', IP+':'+PORT+'/getEmployees/department_id', true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                try {
                    var jsonResponse = JSON.parse(xhr.responseText);
                    var employeeByDepartmentIDList = [];
                    for (var i = 0; i < jsonResponse.length; i++) {
                        var employee = {
                            employee_id: jsonResponse[i].employee_id,
                            first_name: jsonResponse[i].first_name,
                            last_name: jsonResponse[i].last_name,
                            email: jsonResponse[i].email,
                            phone_number: jsonResponse[i].phone_number,
                            hire_date: jsonResponse[i].hire_date,
                            department_id: jsonResponse[i].department_id,
                            salary: jsonResponse[i].salary,
                            job_title: jsonResponse[i].job_title
                        };
                        employeeByDepartmentIDList.push(employee);
                    }
                    callback(null, employeeByDepartmentIDList);
                } catch (e) {
                    callback("Error parsing JSON: " + e, null);
                }
            } else {
                callback("Error: " + xhr.status + " " + xhr.statusText, null);
            }
        }
    };

    var data = {
        "department_id": departmentID
    };
    xhr.send(JSON.stringify(data));
}

function getEmployeeBySalary(salary, callback) {
    var xhr = new XMLHttpRequest();
    xhr.responseType = 'text';
    xhr.open('POST', IP+':'+PORT+'/getEmployees/salary', true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                try {
                    var jsonResponse = JSON.parse(xhr.responseText);
                    var employeeBySalaryList = [];
                    for (var i = 0; i < jsonResponse.length; i++) {
                        var employee = {
                            employee_id: jsonResponse[i].employee_id,
                            first_name: jsonResponse[i].first_name,
                            last_name: jsonResponse[i].last_name,
                            email: jsonResponse[i].email,
                            phone_number: jsonResponse[i].phone_number,
                            hire_date: jsonResponse[i].hire_date,
                            department_id: jsonResponse[i].department_id,
                            salary: jsonResponse[i].salary,
                            job_title: jsonResponse[i].job_title
                        };
                        employeeBySalaryList.push(employee);
                    }
                    callback(null, employeeBySalaryList);
                } catch (e) {
                    callback("Error parsing JSON: " + e, null);
                }
            } else {
                callback("Error: " + xhr.status + " " + xhr.statusText, null);
            }
        }
    };

    var data = {
        "salary": salary
    };
    xhr.send(JSON.stringify(data));
}

function getEmployeeByJobTitle(jobTitle, callback) {
    var xhr = new XMLHttpRequest();
    xhr.responseType = 'text';
    xhr.open('POST', IP+':'+PORT+'/getEmployees/job_title', true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                try {
                    var jsonResponse = JSON.parse(xhr.responseText);
                    var employeeByJobTitleList = [];
                    for (var i = 0; i < jsonResponse.length; i++) {
                        var employee = {
                            employee_id: jsonResponse[i].employee_id,
                            first_name: jsonResponse[i].first_name,
                            last_name: jsonResponse[i].last_name,
                            email: jsonResponse[i].email,
                            phone_number: jsonResponse[i].phone_number,
                            hire_date: jsonResponse[i].hire_date,
                            department_id: jsonResponse[i].department_id,
                            salary: jsonResponse[i].salary,
                            job_title: jsonResponse[i].job_title
                        };
                        employeeByJobTitleList.push(employee);
                    }
                    callback(null, employeeByJobTitleList);
                } catch (e) {
                    callback("Error parsing JSON: " + e, null);
                }
            } else {
                callback("Error: " + xhr.status + " " + xhr.statusText, null);
            }
        }
    };

    var data = {
        "job_title": jobTitle
    };
    xhr.send(JSON.stringify(data));
}

function getEmployeesByFirstName_depName(first_name, callback) {
    var req = new XMLHttpRequest();
    req.responseType = 'text';
    req.open('POST', IP+':'+PORT+'/getEmployees_depName/first_name', true);
    req.setRequestHeader('Content-Type', 'application/json');

    req.onload = function() {
        if (req.status === 200) {
            try {
                var jsonResponse = JSON.parse(req.responseText);
                var employeeList = [];
                for (var i = 0; i < jsonResponse.length; i++) {
                    var employee = {
                        employee_id: jsonResponse[i].employee_id,
                        first_name: jsonResponse[i].first_name,
                        last_name: jsonResponse[i].last_name,
                        email: jsonResponse[i].email,
                        phone_number: jsonResponse[i].phone_number,
                        hire_date: jsonResponse[i].hire_date,
                        department_name: jsonResponse[i].department_name,
                        salary: jsonResponse[i].salary,
                        job_title: jsonResponse[i].job_title
                    };
                    employeeList.push(employee);
                }
                callback(null, employeeList);
            } catch (e) {
                callback("Error parsing JSON: " + e, null);
            }
        } else {
            callback("Error: " + req.status + " " + req.statusText, null);
        }
    };

    var requestData = JSON.stringify({ 'first_name': first_name });
    req.send(requestData);
}

function getEmployeesByLastName_depName(last_name, callback) {
    var req = new XMLHttpRequest();
    req.responseType = 'text';
    req.open('POST', IP+':'+PORT+'/getEmployees_depName/last_name', true);
    req.setRequestHeader('Content-Type', 'application/json');

    req.onload = function() {
        if (req.status === 200) {
            try {
                var jsonResponse = JSON.parse(req.responseText);
                var employeeList = [];
                for (var i = 0; i < jsonResponse.length; i++) {
                    var employee = {
                        employee_id: jsonResponse[i].employee_id,
                        first_name: jsonResponse[i].first_name,
                        last_name: jsonResponse[i].last_name,
                        email: jsonResponse[i].email,
                        phone_number: jsonResponse[i].phone_number,
                        hire_date: jsonResponse[i].hire_date,
                        department_name: jsonResponse[i].department_name,
                        salary: jsonResponse[i].salary,
                        job_title: jsonResponse[i].job_title
                    };
                    employeeList.push(employee);
                }
                callback(null, employeeList);
            } catch (e) {
                callback("Error parsing JSON: " + e, null);
            }
        } else {
            callback("Error: " + req.status + " " + req.statusText, null);
        }
    };

    var requestData = JSON.stringify({ 'last_name': last_name });
    req.send(requestData);
}

function getEmployeesByDepartmentName_depName(department_name, callback) {
    var req = new XMLHttpRequest();
    req.responseType = 'text';
    req.open('POST', IP+':'+PORT+'/getEmployees_depName/department_name', true);
    req.setRequestHeader('Content-Type', 'application/json');

    req.onload = function() {
        if (req.status === 200) {
            try {
                var jsonResponse = JSON.parse(req.responseText);
                var employeeList = [];
                for (var i = 0; i < jsonResponse.length; i++) {
                    var employee = {
                        employee_id: jsonResponse[i].employee_id,
                        first_name: jsonResponse[i].first_name,
                        last_name: jsonResponse[i].last_name,
                        email: jsonResponse[i].email,
                        phone_number: jsonResponse[i].phone_number,
                        hire_date: jsonResponse[i].hire_date,
                        department_name: jsonResponse[i].department_name,
                        salary: jsonResponse[i].salary,
                        job_title: jsonResponse[i].job_title
                    };
                    employeeList.push(employee);
                }
                callback(null, employeeList);
            } catch (e) {
                callback("Error parsing JSON: " + e, null);
            }
        } else {
            callback("Error: " + req.status + " " + req.statusText, null);
        }
    };

    var requestData = JSON.stringify({ 'department_name': department_name });
    req.send(requestData);
}

function getCurrentDate() {
    var today = new Date();
    var day = today.getDate();
    var month = today.getMonth() + 1;
    var year = today.getFullYear();

    day = (day < 10) ? "0" + day : day;
    month = (month < 10) ? "0" + month : month;

    return day + "-" + month + "-" + year;
}

function getCurrentDateYMD() {
    const now = new Date();
    const year = now.getFullYear();
    const month = String(now.getMonth() + 1).padStart(2, '0');
    const day = String(now.getDate()).padStart(2, '0');

    return `${year}-${month}-${day}`;
}

function getPreviousWeekDates(callback) {
    const dates = [];
    const currentDate = new Date(getCurrentDateYMD());

    for (let i = 0; i <= 6; i++) {
        const previousDate = new Date(currentDate);
        previousDate.setDate(currentDate.getDate() - i);
        dates.push(previousDate.toISOString().split('T')[0]);
    }
    callback(dates);
}

function getNumberOfEmployeesByDepartment(callback) {
    var departmentNames = {};
    DepartmentRequests.getDepartments(function(error, departments) {
        if (!error) {
            var departmentCount = departments.length;
            var processedDepartments = 0;

            departments.forEach(function(department) {
                getEmployeeByDepartmentID(department.department_id, function(err, employees) {
                    if (!err) {
                        departmentNames[department.department_name] = employees.length;

                        processedDepartments++;
                        if (processedDepartments === departmentCount) {
                            callback(null, departmentNames);
                        }
                    } else {
                        callback("Error fetching employees: " + err, null);
                    }
                });
            });
        } else {
            callback("Error fetching departments: " + error, null);
        }
    });
}

function objectToList(obj) {
    var list = [];
    for (var key in obj) {
        list.push({ "key": key, "value": obj[key] });
    }
    return list;
}
