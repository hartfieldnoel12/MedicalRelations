

SELECT * FROM Patients;


SELECT * FROM Doctors;


SELECT * FROM Appointments;


SELECT * FROM MedicalRecords;


SELECT * FROM Prescriptions;

SELECT
    p.PatientID,
    CONCAT(p.FirstName, ' ', p.LastName) AS PatientName,
    CONCAT(d.FirstName, ' ', d.LastName) AS DoctorName,
    d.Specialization,
    a.AppointmentDate,
    a.Status AS AppointmentStatus,
    mr.Diagnosis,
    pr.MedicationName,
    pr.Dosage
FROM Patients p
LEFT JOIN Appointments a
    ON p.PatientID = a.PatientID
LEFT JOIN Doctors d
    ON a.DoctorID = d.DoctorID
LEFT JOIN MedicalRecords mr
    ON p.PatientID = mr.PatientID
    AND (a.AppointmentID = mr.AppointmentID
         OR mr.AppointmentID IS NULL)
LEFT JOIN Prescriptions pr
    ON mr.RecordID = pr.RecordID
ORDER BY p.PatientID, a.AppointmentDate;
