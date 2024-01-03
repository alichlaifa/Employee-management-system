.pragma library

var IP = ''; //Change IP
var PORT = ''; //Change Port

    function createUser(userData) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", IP+':'+PORT+'/create_user', true);
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
        xhr.send(JSON.stringify(userData));
    }

function getUsers(callback) {
    var req = new XMLHttpRequest();
    req.responseType = 'text';
    req.open('GET', IP+':'+PORT+'/users', true);

    req.onload = function() {
        if (req.status === 200) {
            try {
                var jsonResponse = JSON.parse(req.responseText);
                var userList = [];
                for (var i = 0; i < jsonResponse.length; i++) {
                    var user = {
                        username: jsonResponse[i].username,
                        role: jsonResponse[i].role,
                        password: jsonResponse[i].password,
                        created_at: jsonResponse[i].created_at,
                        user_id: jsonResponse[i].user_id,
                    };
                    userList.push(user);
                }
                callback(null, userList);
            } catch (e) {
                callback("Error parsing JSON: " + e, null);
            }
        } else {
            callback("Error: " + req.status + " " + req.statusText, null);
        }
    };

    req.send();
}

function editUser(userData) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", IP+':'+PORT+'/edit_user', true);
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
    xhr.send(JSON.stringify(userData));
}

function deleteUser(userID) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", IP+':'+PORT+'/delete_user', true);
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
        "user_id": userID
    };

    xhr.send(JSON.stringify(data));
}


