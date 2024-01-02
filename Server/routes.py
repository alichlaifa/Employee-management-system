from flask import render_template, request, jsonify
from app import app, db
from models import Employee, Departments, Attendance, Users
from sqlalchemy import desc
from database_functions import *


###########################  Employee  #################################
###########################  Employee  #################################
###########################  Employee  #################################

@app.route('/create_employee', methods=['POST'])
def create_employee():
    data = request.get_json()
    first_name = data['first_name']
    last_name = data['last_name']
    email = data['email']
    phone_number = data['phone_number']
    hire_date = data['hire_date']
    department_id = data['department_id']
    salary = data['salary']
    job_title = data['job_title']
    add_employee(first_name, last_name, email, phone_number, hire_date, department_id, salary, job_title)
    return jsonify({'message': 'Employee created successfully'}), 201

@app.route('/editEmployee', methods=['PUT'])
def edit_employee_route():
    employee_id = request.json.get('employee_id')
    data = request.get_json()
    if edit_employee(employee_id, data):
        return jsonify({'message': f'Employee {employee_id} updated successfully'}), 200
    else:
        return jsonify({'message': f'Employee {employee_id} not found'}), 404
    
@app.route('/deleteEmployee', methods=['POST'])
def delete_employee_route():
    data = request.get_json()
    employee_id = data['employee_id']
    result = delete_employee(employee_id)
    if result:
        return jsonify({'message': 'Employee deleted successfully'}), 200
    else:
        return jsonify({'error': 'Employee not found'}), 404

@app.route('/employees') 
def show_employees(): 
    employees = Employee.query.order_by(Employee.employee_id).all()
    employee_data = [{
        'employee_id': employee.employee_id,
        'first_name': employee.first_name,
        'last_name': employee.last_name,
        'email': employee.email,
        'phone_number': employee.phone_number,
        'hire_date': str(employee.hire_date),  
        'department_id': employee.department_id,
        'salary': str(employee.salary),  
        'job_title': employee.job_title
    } for employee in employees]
    return jsonify(employee_data)

@app.route('/getEmployees/employee_id', methods=['POST'])
def get_employee_by_id_route():
    data = request.get_json()
    employee_id = data['employee_id']
    employee_records = get_employee_by_id(employee_id)
    return jsonify([record.serialize() for record in employee_records])

@app.route('/getEmployees/first_name', methods=['POST'])
def get_employees_by_first_name_route():
    first_name = request.json.get('first_name')
    employee_records = get_employee_by_first_name(first_name)
    return jsonify([record.serialize() for record in employee_records])

@app.route('/getEmployees/last_name', methods=['POST'])
def get_employees_by_last_name_route():
    last_name = request.json.get('last_name')
    employee_records = get_employee_by_last_name(last_name)
    return jsonify([record.serialize() for record in employee_records])

@app.route('/getEmployees/email', methods=['POST'])
def get_employees_by_email_route():
    email = request.json.get('email')
    employee_records = get_employee_by_email(email)
    return jsonify([record.serialize() for record in employee_records])

@app.route('/getEmployees/phone_number', methods=['POST'])
def get_employees_by_phone_number_route():
    phone_number = request.json.get('phone_number')
    employee_records = get_employee_by_phone_number(phone_number)
    return jsonify([record.serialize() for record in employee_records])


@app.route('/getEmployees/department_id', methods=['POST'])
def get_employees_by_department_id_route():
    department_id = request.json.get('department_id')
    employee_records = get_employee_by_department_id(department_id)
    return jsonify([record.serialize() for record in employee_records])

@app.route('/getEmployees/department_name', methods=['POST'])
def get_employees_by_department_name_route():
    department_name = request.json.get('department_name')
    employee_records = get_employees_by_department_name(department_name)
    return jsonify([record.serialize() for record in employee_records])

@app.route('/getEmployees/salary', methods=['POST'])
def get_employees_by_salary_route():
    salary = request.json.get('salary')
    employee_records = get_employee_by_salary(salary)
    return jsonify([record.serialize() for record in employee_records])

@app.route('/getEmployees/job_title', methods=['POST'])
def get_employees_by_job_title_route():
    job_title = request.json.get('job_title')
    employee_records = get_employee_by_job_title(job_title)
    return jsonify([record.serialize() for record in employee_records])


@app.route('/employees_depName', methods=['GET'])
def employees_with_department_route(): 
    employees = Employee.query.order_by(Employee.employee_id).all()
    employee_data = [{
        'employee_id': employee.employee_id,
        'first_name': employee.first_name,
        'last_name': employee.last_name,
        'email': employee.email,
        'phone_number': employee.phone_number,
        'hire_date': str(employee.hire_date),  
        'department_name':getDepartmentName(employee.department_id),
        'salary': str(employee.salary),  
        'job_title': employee.job_title
    } for employee in employees]

    return jsonify(employee_data)

@app.route('/getEmployees_depName/first_name', methods=['POST'])
def get_employees_by_first_name_depName_route():
    first_name = request.json.get('first_name')
    employees = get_employee_by_first_name(first_name)
    employee_records = []
    for employee in employees:
        department_name = getDepartmentName(employee.department_id)
        serialized_employee = employee.serialize()
        serialized_employee['department_name'] = department_name if department_name else ''
        employee_records.append(serialized_employee)
    return jsonify(employee_records)

@app.route('/getEmployees_depName/last_name', methods=['POST'])
def get_employees_by_last_name_depName_route():
    last_name = request.json.get('last_name')
    employees = get_employee_by_last_name(last_name)
    employee_records = []
    for employee in employees:
        department_name = getDepartmentName(employee.department_id)
        serialized_employee = employee.serialize()
        serialized_employee['department_name'] = department_name if department_name else ''
        employee_records.append(serialized_employee)
    return jsonify(employee_records)
    
@app.route('/getEmployees_depName/department_name', methods=['POST'])
def get_employees_by_department_name_depName_route():
    department_name = request.json.get('department_name')
    department_id = get_department_id(department_name)
    employees = get_employee_by_department_id(department_id)
    employee_records = []
    for employee in employees:
        department_name = getDepartmentName(employee.department_id)
        serialized_employee = employee.serialize()
        serialized_employee['department_name'] = department_name if department_name else ''
        employee_records.append(serialized_employee)
    return jsonify(employee_records)
    
########################################################################
########################################################################
########################################################################


#########################  Department  #################################
#########################  Department  #################################
#########################  Department  #################################

@app.route('/create_department', methods=['POST'])
def create_department():
    data = request.get_json()
    add_department(data['department_name'],data['manager_name'],data['location'])
    return jsonify({'message': 'Department created successfully'}), 201

@app.route('/edit_department', methods=['POST'])
def edit_department_route():
    department_id = request.json.get('department_id')
    data = request.get_json()
    if edit_department(department_id, data):
        return jsonify({'message': f'Department {department_id} updated successfully'}), 200
    else:
        return jsonify({'message': f'Department {department_id} not found'}), 404


@app.route('/delete_department', methods=['POST'])
def delete_department_route():
    data = request.get_json()
    department_id = data.get('department_id')
    result = delete_department(department_id)
    if result:
        return jsonify({'message': 'Department deleted successfully'}), 200
    else:
        return jsonify({'error': 'Department not found'}), 404
    
@app.route('/departments')
def show_departments():
    departments = Departments.query.order_by(Departments.department_id).all()
    department_data = [{
        'department_id': department.department_id,
        'department_name': department.department_name,
        'manager_name': department.manager_name,
        'location': department.location
    } for department in departments]

    return jsonify(department_data)

########################################################################
########################################################################
########################################################################


###########################  Attendance  #################################
###########################  Attendance  #################################
###########################  Attendance  #################################

@app.route('/create_attendance', methods=['POST'])
def create_attendance():
    data = request.get_json()
    
    new_attendance = Attendance(
        employee_id=data['employee_id'],
        arrival_time=data['arrival_time'],
        departure_time=data['departure_time'],
        date=data['date'],
        hours_worked=data['hours_worked']
    )
    
    db.session.add(new_attendance)
    db.session.commit()
    
    return jsonify({'message': 'Attendance record created successfully'}), 201


@app.route('/attendance/employee', methods=['POST'])
def get_all_attendance_for_employee_route():
    employee_id = request.json.get('employee_id')
    attendance_records = get_all_attendance_for_employee(employee_id)
    return jsonify([record.serialize() for record in attendance_records])


@app.route('/attendance/day', methods=['POST'])
def get_attendance_for_day_route():
    selected_date = request.json.get('date')
    attendance_records = get_attendance_for_day(selected_date)
    return jsonify([record.serialize() for record in attendance_records])

@app.route('/attendance/between_dates', methods=['POST'])
def get_attendance_between_dates_route():
    start_date = request.json.get('start_date')
    end_date = request.json.get('end_date')
    attendance_records = get_attendance_between_dates(start_date, end_date)
    return jsonify([record.serialize() for record in attendance_records])

@app.route('/attendance/between_start_and_today', methods=['POST'])
def get_attendance_between_start_and_today_route():
    start_date = request.json.get('start_date')
    attendance_records = get_attendance_between_start_and_today(start_date)
    return jsonify([record.serialize() for record in attendance_records])

@app.route('/register_arrival', methods=['POST'])
def register_arrival_route():
    data = request.get_json()
    employee_id = data.get('employee_id')
    arrival_registered = register_arrival(employee_id)
    
    if arrival_registered:
        return jsonify({'message': 'Arrival registered successfully'}), 200
    else:
        return jsonify({'error': 'Error registering arrival'}), 500

@app.route('/register_departure', methods=['POST'])
def register_departure_route():
    data = request.get_json()
    employee_id = data.get('employee_id')
    departure_registered = register_departure(employee_id)
    
    if departure_registered:
        return jsonify({'message': 'Departure registered successfully'}), 200
    else:
        return jsonify({'error': 'Error registering departure'}), 500



@app.route('/attendances')
def show_attendance():
    attendance = Attendance.query.order_by(desc(Attendance.attendance_id)).all()
    serialized_attendance = [attendance.serialize() for attendance in attendance]
    return jsonify(serialized_attendance)

########################################################################
########################################################################
########################################################################


    
###########################  User  ####################################
###########################  User  ####################################
###########################  User  ####################################


@app.route('/create_user', methods=['POST'])
def create_user():
    data = request.get_json()
    username=data['username']
    password=data['password']
    role=data['role']
    new_user = add_user(username, password, role)
    return jsonify({'message': 'User created successfully'}), 201

@app.route('/edit_user', methods=['POST'])
def edit_user_route():
    user_id = request.json.get('user_id')
    data = request.get_json()
    if edit_user(user_id, data):
        return jsonify({'message': f'Users {user_id} updated successfully'}), 200
    else:
        return jsonify({'message': f'Users {user_id} not found'}), 404

@app.route('/delete_user', methods=['POST'])
def delete_user_route():
    data = request.get_json()
    user_id = data.get('user_id')
    result = delete_user(user_id)
    if result:
        return jsonify({'message': 'User deleted successfully'}), 200
    else:
        return jsonify({'error': 'User not found'}), 404
    
@app.route('/users')
def show_users():
    users = Users.query.order_by(Users.user_id).all()
    serialized_users = [user.serialize() for user in users]
    return jsonify(serialized_users)

########################################################################
########################################################################
########################################################################
