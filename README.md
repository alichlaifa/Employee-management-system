# Employee Management System

This repository contains an Employee Management System, an application developed to manage employee data, attendance, and access control using various technologies.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Project Structure](#project-structure)

## Overview
The Employee Management System facilitates employee data management, including attendance tracking and access control. It encompasses a user-friendly interface, a backend server, a database, and an ESP32-based circuit for access management.

## Features
- User authentication and authorization
- Employee data management (addition, deletion, and editing)
- Attendance tracking with timestamps
- Access control via an ESP32-based circuit

## Technologies Used
- **Frontend:** QML for the graphical user interface
- **Backend:** Flask server for managing backend operations and API communication
- **Database:** PostgreSQL managed via Docker for efficient data storage and retrieval
- **ESP32 Circuit:** Utilized for access control and monitoring

## Project Structure
The project is organized into distinct directories:
- **Docker:** Contains Docker configuration files for PostgreSQL database setup.
- **ESP:** Includes the code for the ESP32-based circuit utilized for access control.
- **GUI:** Comprises QML files for the graphical user interface and JavaScript files for server requests.
- **Server:** Houses the Flask server code, database models, and routes.
> Note: Ensure to make necessary changes such as IP addresses, ports, and network configurations according to your specific environment.
