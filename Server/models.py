from app import db
from sqlalchemy import Interval

class Employee(db.Model):
    __tablename__ = 'employees'
    employee_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    first_name = db.Column(db.String(50))
    last_name = db.Column(db.String(50))
    email = db.Column(db.String(100))
    phone_number = db.Column(db.String(15))
    hire_date = db.Column(db.Date)
    department_id = db.Column(db.Integer, db.ForeignKey('departments.department_id'))
    salary = db.Column(db.Numeric(10, 2))
    job_title = db.Column(db.String(50))
    attendance = db.relationship('Attendance', backref='employees', cascade='all,delete-orphan')
    

    def serialize(self):
        return {
            'employee_id': self.employee_id,
            'first_name': self.first_name,
            'last_name': self.last_name,
            'email': self.email,
            'phone_number': self.phone_number,
            'hire_date': self.hire_date.strftime('%Y-%m-%d'),  
            'department_id': self.department_id,
            'salary': float(self.salary), 
            'job_title': self.job_title
        }

class Departments(db.Model):
    __tablename__ = 'departments'
    department_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    department_name = db.Column(db.String(50))
    manager_name = db.Column(db.Integer)
    location = db.Column(db.String(50))
    employees = db.relationship('Employee', backref='departments', cascade='all,delete-orphan')

    def serialize(self):
        return {
            'department_id': self.department_id,
            'department_name': self.department_name,
            'manager_name': self.manager_name,
            'location': self.location
        }

class Attendance(db.Model):
    __tablename__ = 'attendance'
    attendance_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    employee_id = db.Column(db.Integer, db.ForeignKey('employees.employee_id'))
    arrival_time = db.Column(db.DateTime)
    departure_time = db.Column(db.DateTime)
    date = db.Column(db.Date)
    hours_worked = db.Column(Interval)
    def serialize(self):
        return {
            'attendance_id': self.attendance_id,
            'employee_id': self.employee_id,
            'arrival_time': str(self.arrival_time),
            'departure_time': str(self.departure_time),
            'date': str(self.date),
            'hours_worked': str(self.hours_worked)
        }

class Users(db.Model):
    __tablename__ = 'users'
    user_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String)
    password = db.Column(db.String)
    role = db.Column(db.String)
    created_at = db.Column(db.DateTime)
    
    def serialize(self):
        return {
            'user_id': self.user_id,
            'username': self.username,
            'password': self.password,
            'role': self.role,
            'created_at': str(self.created_at)
        }
