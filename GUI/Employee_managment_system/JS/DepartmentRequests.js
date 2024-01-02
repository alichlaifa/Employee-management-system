.pragma library

var IP = ''; //Change IP
var PORT = ''; //Change Port

function createDepartment(departmentData) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", IP+':'+PORT+'/create_department', true);
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
    xhr.send(JSON.stringify(departmentData));
}

function getDepartments(callback) {
    var req = new XMLHttpRequest();
    req.responseType = 'text';
    req.open('GET', IP+':'+PORT+'/departments', true);

    req.onload = function() {
        if (req.status === 200) {
            try {
                var jsonResponse = JSON.parse(req.responseText);
                var departmentList = [];
                for (var i = 0; i < jsonResponse.length; i++) {
                    var department = {
                        department_id: jsonResponse[i].department_id,
                        department_name: jsonResponse[i].department_name,
                        manager_name: jsonResponse[i].manager_name,
                        location: jsonResponse[i].location
                    };
                    departmentList.push(department);
                }
                callback(null, departmentList);
            } catch (e) {
                callback("Error parsing JSON: " + e, null);
            }
        } else {
            callback("Error: " + req.status + " " + req.statusText, null);
        }
    };
    req.send();
}

function editDepartment(departmentData) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", IP+':'+PORT+'/edit_department', true);
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
    xhr.send(JSON.stringify(departmentData));
}

function deleteDepartment(departmentID) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", IP+':'+PORT+'/delete_department', true);
    xhr.setRequestHeader("Content-Type", "application/json");

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
        "department_id": departmentID
    };

    xhr.send(JSON.stringify(data));
}

function getDepartmentID(department_name, callback) {
    var req = new XMLHttpRequest();
    req.responseType = 'text';
    req.open('GET', IP+':'+PORT+'/departments', true);

    req.onload = function() {
        if (req.status === 200) {
            try {
                var jsonResponse = JSON.parse(req.responseText);
                var departmentID = null;

                for (var i = 0; i < jsonResponse.length; i++) {
                    if (jsonResponse[i].department_name === department_name) {
                        departmentID = jsonResponse[i].department_id;
                        break;
                    }
                }

                if (departmentID !== null) {
                    callback(null, departmentID);
                } else {
                    callback("Department not found", null);
                }
            } catch (e) {
                callback("Error parsing JSON: " + e, null);
            }
        } else {
            callback("Error: " + req.status + " " + req.statusText, null);
        }
    };
    req.send();
}

