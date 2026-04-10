# Digital Library Audit System

## Overview

**Digital Library Audit System** is a SQL-based database solution designed for a local community college to efficiently manage book lending operations. The system tracks book loans, identifies overdue items, analyzes borrowing patterns, and maintains an active user database.

### Objectives
- Create a relational database system to manage library operations
- Implement automated tracking of overdue books (14+ days)
- Generate penalty reports for late returns
- Analyze book borrowing patterns by category
- Identify most popular genres for purchase decisions
- Maintain database hygiene by removing inactive records
- Provide data-driven insights for library management

## Features

- Track book loans with issue and return dates
- Identify overdue books not returned within 14 days
- Analyze book category popularity for purchasing decisions
- Clean up inactive student records with no activity in 3 years
- Generate reports for library management

## Tech Stack

| Technology | Purpose |
|------------|---------|
| **Oracle SQL** | Database management |
| **DDL** | Data Definition Language for structure |
| **DML** | Data Manipulation Language for operations |
| **Joins** | Relational data retrieval |
| **Aggregate Functions** | Data analysis and reporting |

## Project Structure

```
Digital-Library-Audit-System/
│
├── Library/
│   └── digital_library.sql     # Complete SQL script (DDL + DML + Queries)
│
└── README.md                  # Project documentation
```

## Database Schema

### Entity Relationship

```
books (book_id, title, category, author)
    ↓
issuedbooks (issue_id, book_id, student_id, issue_date, return_date)
    ↑
students (student_id, student_name, course, join_date)
```

### Table Specifications

#### **books Table**
- **book_id**: Primary key, unique book identifier
- **title**: Book name (VARCHAR2 100)
- **category**: Genre classification (VARCHAR2 50)
- **author**: Author name (VARCHAR2 100)

#### **students Table**
- **student_id**: Primary key, unique student identifier
- **student_name**: Student full name (VARCHAR2 100)
- **course**: Enrolled program (VARCHAR2 50)
- **join_date**: Library membership date (DATE)

#### **issuedbooks Table**
- **issue_id**: Primary key, unique transaction identifier
- **book_id**: Foreign key referencing books
- **student_id**: Foreign key referencing students
- **issue_date**: Book borrowing date (DATE)
- **return_date**: Book return date (DATE, nullable)

## Sample Dataset

### Books Catalog
| book_id | title | category | author |
|---------|-------|----------|--------|
| 1 | Basic Java | Programming | Kumar |
| 2 | English Grammar | Education | Ravi |
| 3 | World History | History | Suresh |
| 4 | Data Science Intro | Science | Anand |
| 5 | C Programming | Programming | Arun |

### Student Records
| student_id | student_name | course | join_date |
|------------|--------------|--------|-----------|
| 101 | Arun | BSc | 2021-06-10 |
| 102 | Divya | BCom | 2020-07-15 |
| 103 | Karthik | BCA | 2019-08-20 |
| 104 | Meena | BA | 2022-01-05 |
| 105 | Ramesh | BSc | 2018-03-12 |

### Transaction Log
| issue_id | book_id | student_id | issue_date | return_date |
|----------|---------|------------|------------|-------------|
| 1 | 1 | 101 | 2026-03-01 | 2026-03-10 |
| 2 | 2 | 102 | 2026-03-02 | NULL |
| 3 | 3 | 103 | 2026-02-15 | NULL |
| 4 | 4 | 104 | 2026-03-05 | 2026-03-12 |
| 5 | 5 | 101 | 2026-03-08 | NULL |

## Implementation Details

### 1. Database Setup
The system begins with creating three interconnected tables that form the foundation of the library management system. Primary and foreign key constraints ensure data integrity and maintain relationships between entities.

### 2. Data Population
Sample data is inserted to simulate real library operations, including various book categories, student enrollments from different years, and both completed and pending transactions.

### 3. Overdue Detection Logic
The system identifies overdue books by checking for transactions where:
- Return date is NULL (book not yet returned)
- Issue date is more than 14 days from current date
- Results include student name, book title, and issue date for follow-up

### 4. Popularity Analysis
Category-wise borrowing patterns are analyzed using:
- GROUP BY aggregation on book categories
- COUNT function to determine borrowing frequency
- Results ordered by popularity to guide purchasing decisions

### 5. Database Maintenance
Inactive student records are identified and updated:
- Students with no borrowing activity in 3 years
- Course field updated to 'Inactive' status
- Helps maintain database performance and relevance

## SQL Implementation File

The `digital_library.sql` file contains:
1. **Table Creation Statements** - DDL commands to create database structure
2. **Data Insertion Statements** - Sample data for testing and demonstration
3. **View Operations** - Display current database state
4. **Analytical Operations** - Overdue report generation
5. **Aggregation Operations** - Category popularity analysis
6. **Maintenance Operations** - Inactive record cleanup

## Installation & Execution


 ## Ensure the following are installed:

 - Oracle Database (11g or higher)
 - SQL client such as:
 - SQL*Plus
Oracle SQL Developer Setup Instructions
## 1. Clone the Repository 
``` bash
git clone https://github.com/your-username/igital-Library-Audit-System.git 
cd Digital-Library-Audit-System
```

## 2. Connect to Oracle Database
```bash
sqlplus username/password@database
```
## 3. Execute SQL Script
```bash
@Library/digital_library.sql
```

## Expected Outcomes

 - Track and monitor all book borrowing activities
 - Identify overdue books for effective penalty management
 - Analyze category-wise popularity to improve inventory decisions
 - Maintain a clean database by marking inactive students
