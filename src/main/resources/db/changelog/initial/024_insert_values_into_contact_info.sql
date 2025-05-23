-- liquibase formatted sql
-- changeset Sedep:024

INSERT INTO contacts_info (type_id, resume_id, contact_value) VALUES
((SELECT id FROM contact_types WHERE type = 'Email'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'alex@gmail.com' AND r.name = 'Java Developer'),
'alex@gmail.com'),
((SELECT id FROM contact_types WHERE type = 'Телефон'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'alex@gmail.com' AND r.name = 'Java Developer'),
'+996555101001'),
((SELECT id FROM contact_types WHERE type = 'Telegram'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'alex@gmail.com' AND r.name = 'Java Developer'),
'@alex_ivanov'),
((SELECT id FROM contact_types WHERE type = 'GitHub'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'alex@gmail.com' AND r.name = 'Java Developer'),
'github.com/alex-ivanov'),
((SELECT id FROM contact_types WHERE type = 'Email'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'alex@gmail.com' AND r.name = 'Android Developer'),
'alex@gmail.com'),
((SELECT id FROM contact_types WHERE type = 'Телефон'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'alex@gmail.com' AND r.name = 'Android Developer'),
'+996555101001'),
((SELECT id FROM contact_types WHERE type = 'GitHub'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'alex@gmail.com' AND r.name = 'Android Developer'),
'github.com/alex-ivanov'),
((SELECT id FROM contact_types WHERE type = 'Email'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'ekaterina@gmail.com' AND r.name = 'Frontend Developer'),
'ekaterina@gmail.com'),
((SELECT id FROM contact_types WHERE type = 'Телефон'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'ekaterina@gmail.com' AND r.name = 'Frontend Developer'),
'+996555101002'),
((SELECT id FROM contact_types WHERE type = 'LinkedIn'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'ekaterina@gmail.com' AND r.name = 'Frontend Developer'),
'linkedin.com/in/ekaterina-smirnova'),
((SELECT id FROM contact_types WHERE type = 'Email'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'ekaterina@gmail.com' AND r.name = 'UI/UX Designer'),
'ekaterina@gmail.com'),
((SELECT id FROM contact_types WHERE type = 'Телефон'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'ekaterina@gmail.com' AND r.name = 'UI/UX Designer'),
'+996555101002'),
((SELECT id FROM contact_types WHERE type = 'Личный сайт'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'ekaterina@gmail.com' AND r.name = 'UI/UX Designer'),
'ekaterina-design.com'),
((SELECT id FROM contact_types WHERE type = 'Email'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'dmitry@gmail.com' AND r.name = 'DevOps Engineer'),
'dmitry@gmail.com'),
((SELECT id FROM contact_types WHERE type = 'Телефон'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'dmitry@gmail.com' AND r.name = 'DevOps Engineer'),
'+996555101003'),
((SELECT id FROM contact_types WHERE type = 'GitHub'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'dmitry@gmail.com' AND r.name = 'DevOps Engineer'),
'github.com/dmitry-petrov'),
((SELECT id FROM contact_types WHERE type = 'Email'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'dmitry@gmail.com' AND r.name = 'System Administrator'),
'dmitry@gmail.com'),
((SELECT id FROM contact_types WHERE type = 'Телефон'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'dmitry@gmail.com' AND r.name = 'System Administrator'),
'+996555101003'),
((SELECT id FROM contact_types WHERE type = 'Email'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'anna@gmail.com' AND r.name = 'QA Engineer'),
'anna@gmail.com'),
((SELECT id FROM contact_types WHERE type = 'Телефон'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'anna@gmail.com' AND r.name = 'QA Engineer'),
'+996555101004'),
((SELECT id FROM contact_types WHERE type = 'LinkedIn'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'anna@gmail.com' AND r.name = 'QA Engineer'),
'linkedin.com/in/anna-kozlova'),
((SELECT id FROM contact_types WHERE type = 'Email'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'anna@gmail.com' AND r.name = 'Business Analyst'),
'anna@gmail.com'),
((SELECT id FROM contact_types WHERE type = 'Телефон'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'anna@gmail.com' AND r.name = 'Business Analyst'),
'+996555101004'),
((SELECT id FROM contact_types WHERE type = 'Email'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'sergey@gmail.com' AND r.name = 'Full Stack Developer'),
'sergey@gmail.com'),
((SELECT id FROM contact_types WHERE type = 'Телефон'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'sergey@gmail.com' AND r.name = 'Full Stack Developer'),
'+996555101005'),
((SELECT id FROM contact_types WHERE type = 'GitHub'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'sergey@gmail.com' AND r.name = 'Full Stack Developer'),
'github.com/sergey-novikov'),
((SELECT id FROM contact_types WHERE type = 'LinkedIn'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'sergey@gmail.com' AND r.name = 'Full Stack Developer'),
'linkedin.com/in/sergey-novikov'),
((SELECT id FROM contact_types WHERE type = 'Email'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'sergey@gmail.com' AND r.name = 'Project Manager'),
'sergey@gmail.com'),
((SELECT id FROM contact_types WHERE type = 'Телефон'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'sergey@gmail.com' AND r.name = 'Project Manager'),
'+996555101005'),
((SELECT id FROM contact_types WHERE type = 'LinkedIn'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'sergey@gmail.com' AND r.name = 'Project Manager'),
'linkedin.com/in/sergey-novikov'),
((SELECT id FROM contact_types WHERE type = 'Email'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'olga@gmail.com' AND r.name = 'Data Scientist'),
'olga@gmail.com'),
((SELECT id FROM contact_types WHERE type = 'Телефон'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'olga@gmail.com' AND r.name = 'Data Scientist'),
'+996555101006'),
((SELECT id FROM contact_types WHERE type = 'GitHub'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'olga@gmail.com' AND r.name = 'Data Scientist'),
'github.com/olga-morozova'),
((SELECT id FROM contact_types WHERE type = 'Email'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'olga@gmail.com' AND r.name = 'Python Developer'),
'olga@gmail.com'),
((SELECT id FROM contact_types WHERE type = 'Телефон'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'olga@gmail.com' AND r.name = 'Python Developer'),
'+996555101006'),
((SELECT id FROM contact_types WHERE type = 'GitHub'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'olga@gmail.com' AND r.name = 'Python Developer'),
'github.com/olga-morozova'),
((SELECT id FROM contact_types WHERE type = 'Email'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'maxim@gmail.com' AND r.name = 'Information Security Specialist'),
'maxim@gmail.com'),
((SELECT id FROM contact_types WHERE type = 'Телефон'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'maxim@gmail.com' AND r.name = 'Information Security Specialist'),
'+996555101007'),
((SELECT id FROM contact_types WHERE type = 'LinkedIn'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'maxim@gmail.com' AND r.name = 'Information Security Specialist'),
'linkedin.com/in/maxim-volkov'),
((SELECT id FROM contact_types WHERE type = 'Email'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'maxim@gmail.com' AND r.name = 'Network Administrator'),
'maxim@gmail.com'),
((SELECT id FROM contact_types WHERE type = 'Телефон'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'maxim@gmail.com' AND r.name = 'Network Administrator'),
'+996555101007'),
((SELECT id FROM contact_types WHERE type = 'Email'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'natalia@gmail.com' AND r.name = 'Content Manager'),
'natalia@gmail.com'),
((SELECT id FROM contact_types WHERE type = 'Телефон'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'natalia@gmail.com' AND r.name = 'Content Manager'),
'+996555101008'),
((SELECT id FROM contact_types WHERE type = 'Instagram'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'natalia@gmail.com' AND r.name = 'Content Manager'),
'instagram.com/natalia_zaitseva'),
((SELECT id FROM contact_types WHERE type = 'Email'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'natalia@gmail.com' AND r.name = 'SMM Specialist'),
'natalia@gmail.com'),
((SELECT id FROM contact_types WHERE type = 'Телефон'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'natalia@gmail.com' AND r.name = 'SMM Specialist'),
'+996555101008'),
((SELECT id FROM contact_types WHERE type = 'Instagram'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'natalia@gmail.com' AND r.name = 'SMM Specialist'),
'instagram.com/natalia_zaitseva'),
((SELECT id FROM contact_types WHERE type = 'Facebook'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'natalia@gmail.com' AND r.name = 'SMM Specialist'),
'facebook.com/natalia.zaitseva'),
((SELECT id FROM contact_types WHERE type = 'Email'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'andrey@gmail.com' AND r.name = 'PHP Developer'),
'andrey@gmail.com'),
((SELECT id FROM contact_types WHERE type = 'Телефон'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'andrey@gmail.com' AND r.name = 'PHP Developer'),
'+996555101009'),
((SELECT id FROM contact_types WHERE type = 'GitHub'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'andrey@gmail.com' AND r.name = 'PHP Developer'),
'github.com/andrey-sokolov'),
((SELECT id FROM contact_types WHERE type = 'Email'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'andrey@gmail.com' AND r.name = 'Database Administrator'),
'andrey@gmail.com'),
((SELECT id FROM contact_types WHERE type = 'Телефон'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'andrey@gmail.com' AND r.name = 'Database Administrator'),
'+996555101009'),
((SELECT id FROM contact_types WHERE type = 'Email'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'maria@gmail.com' AND r.name = 'Frontend React Developer'),
'maria@gmail.com'),
((SELECT id FROM contact_types WHERE type = 'Телефон'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'maria@gmail.com' AND r.name = 'Frontend React Developer'),
'+996555101010'),
((SELECT id FROM contact_types WHERE type = 'GitHub'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'maria@gmail.com' AND r.name = 'Frontend React Developer'),
'github.com/maria-kuznetsova'),
((SELECT id FROM contact_types WHERE type = 'LinkedIn'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'maria@gmail.com' AND r.name = 'Frontend React Developer'),
'linkedin.com/in/maria-kuznetsova'),
((SELECT id FROM contact_types WHERE type = 'Email'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'maria@gmail.com' AND r.name = 'Web Designer'),
'maria@gmail.com'),
((SELECT id FROM contact_types WHERE type = 'Телефон'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'maria@gmail.com' AND r.name = 'Web Designer'),
'+996555101010'),
((SELECT id FROM contact_types WHERE type = 'Личный сайт'),
(SELECT r.id FROM resumes r JOIN users u ON r.applicant_id = u.id WHERE u.email = 'maria@gmail.com' AND r.name = 'Web Designer'),
'maria-design.com');