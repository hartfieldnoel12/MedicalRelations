
# Patient Management System

## Project Overview

This project is a relational database designed to
manage patient information, doctors, appointments,
medical records, and prescriptions.

The database uses primary keys and foreign keys
to establish relationships between entities and
maintain data integrity.

## Technologies Used

- Microsoft SQL Server
- SQL
- GitHub

## Database Entities

### 1. Patients
Stores patient information, including:
- Patient ID (Primary Key)
- First Name
- Last Name
- Date of Birth
- Gender
- Phone
- Email
- Address

### 2. Doctors
Stores doctor information, including:
- Doctor ID (Primary Key)
- First Name
- Last Name
- Specialization
- Phone
- Email

### 3. Appointments
Tracks appointments between patients and doctors.

- Appointment ID (Primary Key)
- Patient ID (Foreign Key)
- Doctor ID (Foreign Key)
- Appointment Date
- Appointment Reason
- Status

### 4. Medical Records
Stores diagnoses, treatments, and clinical notes.

- Record ID (Primary Key)
- Patient ID (Foreign Key)
- Doctor ID (Foreign Key)
- Appointment ID (Foreign Key, optional)
- Diagnosis
- Treatment
- Notes

### 5. Prescriptions
Tracks medication prescriptions.

- Prescription ID (Primary Key)
- Patient ID (Foreign Key)
- Doctor ID (Foreign Key)
- Record ID (Foreign Key, optional)
- Medication Name
- Dosage
- Frequency
- Start Date
- End Date
- Instructions

## Entity Relationships

| Relationship | Type |
|---|---|
| Patients → Appointments | One-to-Many |
| Doctors → Appointments | One-to-Many |
| Patients → Medical Records | One-to-Many |
| Doctors → Medical Records | One-to-Many |
| Appointments → Medical Records | One-to-Many |
| Patients → Prescriptions | One-to-Many |
| Doctors → Prescriptions | One-to-Many |
| Medical Records → Prescriptions | One-to-Many |

## Project Files

- `patient_management.sql` - Creates the database tables.
- `sample_data.sql` - Inserts fictional sample data.
- `queries.sql` - Contains example SQL queries and JOINs.

## How to Run

1. Open Microsoft SQL Server Management Studio.
2. Run `patient_management.sql` to create the database
   and tables.
3. Run `sample_data.sql` to insert sample records.
4. Run `queries.sql` to test the relationships.

## Disclaimer

All patient information and medical examples are
fictional and provided for educational purposes only.
