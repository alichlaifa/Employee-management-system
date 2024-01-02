from app import db
from models import Employee, Departments, Attendance, Users
from datetime import date, datetime

###########################  Employee  #################################
###########################  Employee  #################################
###########################  Employee  #################################

def add_employee(first_name, last_name, email, phone_number, hire_date, department_id, salary, job_title):
    max_employee_id = db.session.query(db.func.max(Employee.employee_id)).scalar() or 0
    new_employee_id = max_employee_id + 1

    new_employee = Employee(
        employee_id=new_employee_id,
        first_name=first_name,
        last_name=last_name,
        email=email,
        phone_number=phone_number,
        hire_date=hire_date,
        department_id=department_id,
        salary=salary,
        job_title=job_title
    )

    db.session.add(new_employee)
    db.session.commit()
    
    return True
    
def edit_employee(employee_id, data):
    employee = Employee.query.get(employee_id)
    if employee:
        employee.first_name = data.get('first_name', employee.first_name)
        employee.last_name = data.get('last_name', employee.last_name)
        employee.email = data.get('email', employee.email)
        employee.phone_number = data.get('phone_number', employee.phone_number)
        employee.hire_date = data.get('hire_date', employee.hire_date)
        employee.department_id = data.get('department_id', employee.department_id)
        employee.salary = data.get('salary', employee.salary)
        employee.job_title = data.get('job_title', employee.job_title)
        db.session.commit()
        return True
    return False

def delete_employee(employee_id):
    employee = Employee.query.get(employee_id)
    if employee:
        db.session.delete(employee)
        db.session.commit()
        return True
    else:
        return False

    
def get_employee_by_id(employee_id):
    employees = Employee.query.filter(Employee.employee_id == employee_id).all()
    return employees
    
def get_employee_by_first_name(first_name):
    employees = Employee.query.filter(Employee.first_name == first_name).all()
    return employees

def get_employee_by_last_name(last_name):
    employees = Employee.query.filter(Employee.last_name == last_name).all()
    return employees

def get_employee_by_email(email):
    employees = Employee.query.filter(Employee.email == email).all()
    return employees

def get_employee_by_phone_number(phone_number):
    employees = Employee.query.filter(Employee.phone_number == phone_number).all()
    return employees

def get_employee_by_hire_date(hire_date):
    employees = Employee.query.filter(Employee.hire_date == hire_date).all()
    return employees

def get_employee_by_department_id(department_id):
    employees = Employee.query.filter(Employee.department_id == department_id).all()
    return employees

def get_employees_by_department_name(department_name):
    employees = Employee.query.join(Departments).filter(Departments.department_name == department_name).all()
    return employees

def get_employee_by_salary(salary):
    employees = Employee.query.filter(Employee.salary == salary).all()
    return employees

def get_employee_by_job_title(job_title):
    employees = Employee.query.filter(Employee.job_title == job_title).all()
    return employees


########################################################################
########################################################################
########################################################################

###########################  Departments  ##############################
###########################  Departments  ##############################
###########################  Departments  ##############################
    
def add_department(department_name, manager_name, location):
    max_department_id = db.session.query(db.func.max(Departments.department_id)).scalar() or 0
    new_department_id = max_department_id + 1

    new_department = Departments(
        department_id=new_department_id,
        department_name=department_name,
        manager_name=manager_name,
        location=location
    )

    db.session.add(new_department)
    db.session.commit()
    
    return True


def edit_department(department_id, data):
    department = Departments.query.get(department_id)
    if department:
        department.department_name = data.get('department_name', department.department_name)
        department.manager_name = data.get('manager_name', department.manager_name)
        department.location = data.get('location', department.location)
        db.session.commit()
        return True
    return False

def delete_department(department_id):
    department = Departments.query.get(department_id)
    if department:
        db.session.delete(department)
        db.session.commit()
        return True
    else:
        return False

def getDepartmentName(department_id):
    department = Departments.query.filter_by(department_id=department_id).first()
    if department:
        return department.department_name
    else:
        return None
    
def get_department_id(department_name):
    department = Departments.query.filter_by(department_name=department_name).first()
    if department:
        return department.department_id
    else:
        return None
    
########################################################################
########################################################################
########################################################################
    

###########################  Attendance  #################################
###########################  Attendance  #################################
###########################  Attendance  #################################


def add_attendance(employee_id, arrival_time, departure_time, date, hours_worked):
    new_attendance = Attendance(
        employee_id=employee_id,
        arrival_time=arrival_time,
        departure_time=departure_time,
        date=date,
        hours_worked=hours_worked
    )
    db.session.add(new_attendance)
    db.session.commit()

def get_all_attendance_for_employee(employee_id):
    attendance_records = Attendance.query.filter(Attendance.employee_id == employee_id).order_by(Attendance.arrival_time.desc()).all()
    return attendance_records

def get_attendance_for_day(selected_date):
    attendance_records = Attendance.query.filter(Attendance.date == selected_date).order_by(Attendance.arrival_time.desc()).all()
    print(attendance_records)
    return attendance_records

def get_attendance_between_dates(start_date, end_date):
    attendance_records = Attendance.query.filter(
        Attendance.date.between(start_date, end_date)
    ).all()
    return attendance_records

def get_attendance_between_start_and_today(start_date):
    today = date.today()
    attendance_records = Attendance.query.filter(
        Attendance.date.between(start_date, today)
    ).all()
    return attendance_records

def register_arrival(employee_id):
    arrival_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    date = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    max_attendance_id = db.session.query(db.func.max(Attendance.attendance_id)).scalar() or 0
    new_attendance_id = max_attendance_id + 1

    new_attendance = Attendance(
        attendance_id=new_attendance_id,
        employee_id=employee_id,
        arrival_time=arrival_time,
        date=date
    )
    db.session.add(new_attendance)
    db.session.commit()
    return True

def register_departure(employee_id):
    departure_time = datetime.now()
    date = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    attendance_record = Attendance.query.filter_by(employee_id=employee_id, date=date).order_by(Attendance.arrival_time.desc()).first()

    if attendance_record:
        if not attendance_record.departure_time:
            arrival_time = attendance_record.arrival_time
            duration = departure_time - arrival_time
            hours = duration.seconds // 3600
            minutes = (duration.seconds % 3600) // 60
            hours_worked = f'{hours:02}:{minutes:02}'
            attendance_record.departure_time = departure_time.strftime("%Y-%m-%d %H:%M:%S")
            attendance_record.hours_worked = hours_worked
            db.session.commit()
            return True  
        else:
            print("Departure time already registered for today.")
            return False  
    else:
        print("No arrival record found for today")
        return None  
  



########################################################################
########################################################################
########################################################################

###########################  User  ####################################
###########################  User  ####################################
###########################  User  ####################################

def add_user(username, password, role):
    max_user_id = db.session.query(db.func.max(Users.user_id)).scalar() or 0
    new_user_id = max_user_id + 1
    new_user = Users(
        user_id=new_user_id,
        username=username,
        password=password,
        role=role,
        created_at=datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    )
    db.session.add(new_user)
    db.session.commit()

def edit_user(user_id, data):
    user = Users.query.get(user_id)
    if user:
        user.username = data.get('username', user.username)
        user.password = data.get('password', user.password)
        user.role = data.get('role', user.role)
        db.session.commit()
        return True
    return False

def delete_user(user_id):
    user = Users.query.get(user_id)
    if user:
        db.session.delete(user)
        db.session.commit()
        return True
    else:
        return False

########################################################################
########################################################################
########################################################################



