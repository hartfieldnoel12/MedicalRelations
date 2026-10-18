
USE PatientManagementDB;
GO


INSERT INTO Patients
    (FirstName, LastName, DateOfBirth, Gender, Phone, Email, Address)
VALUES
    ('John', 'Smith', '1990-05-14', 'Male',
     '404-555-0101', 'john.smith@example.com', 'Atlanta, GA'),

    ('Emily', 'Johnson', '1985-09-22', 'Female',
     '404-555-0102', 'emily.johnson@example.com', 'Marietta, GA'),

    ('Michael', 'Brown', '2000-02-10', 'Male',
     '404-555-0103', 'michael.brown@example.com', 'Smyrna, GA'),

    ('Sarah', 'Davis', '1995-12-03', 'Female',
     '404-555-0104', 'sarah.davis@example.com', 'Decatur, GA');


INSERT INTO Doctors
    (FirstName, LastName, Specialization, Phone, Email)
VALUES
    ('James', 'Wilson', 'Cardiology',
     '404-555-0201', 'james.wilson@example.com'),

    ('Linda', 'Martinez', 'Family Medicine',
     '404-555-0202', 'linda.martinez@example.com'),

    ('Robert', 'Taylor', 'Dermatology',
     '404-555-0203', 'robert.taylor@example.com');


INSERT INTO Appointments
    (PatientID, DoctorID, AppointmentDate,
     AppointmentReason, Status)
VALUES
    (1, 1, '2026-10-20 09:00:00',
     'Heart health consultation', 'Scheduled'),

    (2, 2, '2026-10-15 10:30:00',
     'Annual physical examination', 'Completed'),

    (3, 3, '2026-10-21 14:00:00',
     'Skin irritation', 'Scheduled'),

    (1, 2, '2026-10-10 11:00:00',
     'General health checkup', 'Completed'),

    (4, 2, '2026-10-22 13:30:00',
     'Routine checkup', 'Scheduled');


INSERT INTO MedicalRecords
    (PatientID, DoctorID, AppointmentID,
     RecordDate, Diagnosis, Treatment, Notes)
VALUES
    (2, 2, 2, '2026-10-15 11:00:00',
     'Routine examination',
     'General health assessment',
     'Sample record for a completed appointment.'),

    (1, 2, 4, '2026-10-10 11:30:00',
     'Seasonal allergies',
     'Symptom management',
     'Follow-up may be needed if symptoms persist.'),

    (3, 3, NULL, '2026-10-12 15:00:00',
     'Skin irritation',
     'Skin care evaluation',
     'Sample record not linked to a specific appointment.');


INSERT INTO Prescriptions
    (PatientID, DoctorID, RecordID, MedicationName,
     Dosage, Frequency, StartDate, EndDate, Instructions)
VALUES
    (2, 2, 1, 'Example Medication A',
     '10 mg', 'Once daily', '2026-10-15', '2026-10-22',
     'Illustrative sample only; follow the prescriber.'),

    (1, 2, 2, 'Example Medication B',
     '5 mg', 'As directed', '2026-10-10', '2026-10-17',
     'Illustrative sample only; follow the prescriber.');
GO
