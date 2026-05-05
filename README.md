# Arizona University Information System

## Project Overview

The Arizona University Information System is a centralized web platform designed to help Arizona high school students, transfer students, first-generation college students, international students, and families explore higher education options across Arizona universities.

Many students face difficulties when trying to compare universities because important information such as academic programs, admissions requirements, transfer pathways, financial aid opportunities, and student support programs is often spread across multiple websites. This project solves that problem by organizing reliable university information into one structured and accessible system.

The platform focuses on three major public universities in Arizona:

- University of Arizona (UofA)
- Northern Arizona University (NAU)
- Arizona State University (ASU)

The goal is to support better decision-making for students and families by simplifying university comparisons and improving access to educational resources.

---

## Technologies Used

### Frontend

- HTML5
- CSS3
- JavaScript (Vanilla JavaScript)

### Backend

- Python
- Flask Framework

### Database

- MySQL
- MySQL Workbench

### Development Tools

- Visual Studio Code
- GitHub (project backup, version control, and deployment repository)
- MySQL Workbench (database management and SQL execution)
- Render (web application deployment and hosting)
- Aiven (cloud MySQL database hosting)


---

## Database Structure

The project uses MySQL as the main database system to store university information dynamically.

### Main Tables

### 1. universities

Stores general information for each university.

- university_id
- name
- abbreviation
- location
- website
- description

### 2. academic_programs

Stores academic majors and undergraduate degree programs.

- program_id
- university_id
- program_name
- category
- degree_level
- program_url

### 3. admissions

Stores admissions requirements and student type information.

- admission_id
- university_id
- student_type
- requirements
- deadline_info
- admission_url

### 4. financial_aid

Stores scholarships, grants, loans, and financial support resources.

- aid_id
- university_id
- aid_type
- aid_name
- description
- aid_url

### 5. support_programs

Stores student success programs such as TRIO, First Cats, and mentoring resources.

- support_id
- university_id
- program_name
- target_group
- description
- program_url

---

## Main Features

### Dynamic University Pages

Each university has its own page displaying:

- Academic Programs
- Admissions Information
- Transfer Pathways
- Financial Aid
- Support Programs

All information is connected dynamically from MySQL using Flask and Jinja templates.

### University Comparison Page

Students can compare universities side by side using the Compare page, which includes:

- Academic programs
- Financial aid resources
- Support programs
- University descriptions
- General university information

### Search System

The platform includes a dynamic search feature that allows students to search academic programs by:

- Program name
- Category
- University

This improves accessibility and helps students identify which university offers their desired major.

### Responsive Navigation

The system includes navigation across all pages using a responsive layout for easier browsing.

## Live Project Access

The Arizona University Information System is deployed online and can be accessed directly through the public website link below:

[Project Website](https://arizona-university-information-system.onrender.com)

Users can explore:

- University information pages
- Academic programs
- Admissions requirements
- Financial aid resources
- Transfer pathways
- Student support programs
- University comparison tools
- Program search functionality

No local installation is required to access the system.

## Deployment Platform

The project is deployed using:

- Render (web application hosting)
- Aiven (cloud MySQL database hosting)