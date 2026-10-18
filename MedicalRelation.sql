
-- Create the database
CREATE DATABASE PatientManagementDB;
GO

USE PatientManagementDB;
GO

-- 1. Patients Entity
CREATE TABLE Patients (
    PatientID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender VARCHAR(20),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    Address VARCHAR(255)
);

-- 2. Doctors Entity
CREATE TABLE Doctors (
    DoctorID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Specialization VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100) UNIQUE
);

-- 3. Appointments Entity
CREATE TABLE Appointments (
    AppointmentID INT IDENTITY(1,1) PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATETIME2 NOT NULL,
    AppointmentReason VARCHAR(255),
    Status VARCHAR(20) DEFAULT 'Scheduled',

    CONSTRAINT FK_Appointments_Patients
        FOREIGN KEY (PatientID)
        REFERENCES Patients(PatientID),

    CONSTRAINT FK_Appointments_Doctors
        FOREIGN KEY (DoctorID)
        REFERENCES Doctors(DoctorID),

    CONSTRAINT CK_Appointment_Status
        CHECK (Status IN (
            'Scheduled', 'Completed',
            'Cancelled', 'No-Show'
        ))
);

-- 4. Medical Records Entity
CREATE TABLE MedicalRecords (
    RecordID INT IDENTITY(1,1) PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentID INT NULL,
    RecordDate DATETIME2 DEFAULT SYSDATETIME(),
    Diagnosis VARCHAR(255),
    Treatment TEXT,
    Notes VARCHAR(1000),

    CONSTRAINT FK_MedicalRecords_Patients
        FOREIGN KEY (PatientID)
        REFERENCES Patients(PatientID),

    CONSTRAINT FK_MedicalRecords_Doctors
        FOREIGN KEY (DoctorID)
        REFERENCES Doctors(DoctorID),

    CONSTRAINT FK_MedicalRecords_Appointments
        FOREIGN KEY (AppointmentID)
        REFERENCES Appointments(AppointmentID)
);

-- 5. Prescriptions Entity
CREATE TABLE Prescriptions (
    PrescriptionID INT IDENTITY(1,1) PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    RecordID INT NULL,
    MedicationName VARCHAR(100) NOT NULL,
    Dosage VARCHAR(100) NOT NULL,
    Frequency VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    Instructions VARCHAR(500),

    CONSTRAINT FK_Prescriptions_Patients
        FOREIGN KEY (PatientID)
        REFERENCES Patients(PatientID),

    CONSTRAINT FK_Prescriptions_Doctors
        FOREIGN KEY (DoctorID)
        REFERENCES Doctors(DoctorID),

    CONSTRAINT FK_Prescriptions_MedicalRecords
        FOREIGN KEY (RecordID)
        REFERENCES MedicalRecords(RecordID)
);
