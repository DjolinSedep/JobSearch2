-- liquibase formatted sql
-- changeset Sedep:021

INSERT INTO education_info (resume_id, institution, program, start_date, end_date, degree) VALUES
((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'alex@gmail.com' AND r.name = 'Java Developer'),
 'Кыргызско-Российский Славянский университет',
 'Информатика и вычислительная техника',
 '2012-09-01', '2016-06-30',
 'Бакалавр'),
((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'alex@gmail.com' AND r.name = 'Java Developer'),
 'Кыргызский Национальный Университет',
 'Программная инженерия',
 '2016-09-01', '2018-06-30',
 'Магистр'),
((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'ekaterina@gmail.com' AND r.name = 'Frontend Developer'),
 'Американский университет в Центральной Азии',
 'Компьютерные науки',
 '2015-09-01', '2019-06-30',
 'Бакалавр'),
((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'ekaterina@gmail.com' AND r.name = 'UI/UX Designer'),
 'Курсы Нетология',
 'UI/UX дизайн с нуля до PRO',
 '2019-10-01', '2020-04-30',
 'Сертификат'),
((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'dmitry@gmail.com' AND r.name = 'DevOps Engineer'),
 'Московский технический университет связи и информатики',
 'Информационные системы и технологии',
 '2010-09-01', '2015-06-30',
 'Специалист'),
((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'dmitry@gmail.com' AND r.name = 'DevOps Engineer'),
 'Linux Professional Institute',
 'LPIC-3 Enterprise DevOps Engineer',
 '2020-01-15', '2020-03-30',
 'Сертификат'),
((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'anna@gmail.com' AND r.name = 'QA Engineer'),
 'Кыргызский государственный технический университет',
 'Информационные технологии',
 '2014-09-01', '2018-06-30',
 'Бакалавр'),
((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'anna@gmail.com' AND r.name = 'QA Engineer'),
 'ISTQB',
 'Certified Tester Foundation Level',
 '2019-05-10', '2019-06-15',
 'Сертификат'),
((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'sergey@gmail.com' AND r.name = 'Full Stack Developer'),
 'Санкт-Петербургский государственный университет',
 'Прикладная математика и информатика',
 '2011-09-01', '2015-06-30',
 'Бакалавр'),
((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'sergey@gmail.com' AND r.name = 'Project Manager'),
 'Project Management Institute',
 'Project Management Professional (PMP)',
 '2018-03-01', '2018-09-30',
 'Сертификат'),
((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'olga@gmail.com' AND r.name = 'Data Scientist'),
 'Новосибирский государственный университет',
 'Прикладная математика и статистика',
 '2013-09-01', '2017-06-30',
 'Бакалавр'),
((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'olga@gmail.com' AND r.name = 'Data Scientist'),
 'Coursera',
 'Deep Learning Specialization by Andrew Ng',
 '2020-01-15', '2020-05-30',
 'Сертификат'),
((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'maxim@gmail.com' AND r.name = 'Information Security Specialist'),
 'Московский государственный технический университет им. Н.Э. Баумана',
 'Информационная безопасность',
 '2010-09-01', '2016-06-30',
 'Специалист'),
((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'maxim@gmail.com' AND r.name = 'Information Security Specialist'),
 'EC-Council',
 'Certified Ethical Hacker (CEH)',
 '2017-02-01', '2017-04-30',
 'Сертификат'),
((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'natalia@gmail.com' AND r.name = 'Content Manager'),
 'Российский государственный гуманитарный университет',
 'Журналистика',
 '2012-09-01', '2016-06-30',
 'Бакалавр'),
((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'natalia@gmail.com' AND r.name = 'SMM Specialist'),
 'GeekBrains',
 'SMM-менеджер с нуля до PRO',
 '2019-03-01', '2019-09-30',
 'Сертификат'),
((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'andrey@gmail.com' AND r.name = 'PHP Developer'),
 'Казанский федеральный университет',
 'Прикладная информатика',
 '2009-09-01', '2013-06-30',
 'Бакалавр'),
((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'andrey@gmail.com' AND r.name = 'Database Administrator'),
 'Oracle University',
 'Oracle Database Administration',
 '2015-05-01', '2015-08-30',
 'Сертификат'),
((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'maria@gmail.com' AND r.name = 'Frontend React Developer'),
 'Высшая школа экономики',
 'Программная инженерия',
 '2014-09-01', '2018-06-30',
 'Бакалавр'),
((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'maria@gmail.com' AND r.name = 'Web Designer'),
 'Skillbox',
 'Профессия Веб-дизайнер',
 '2019-10-01', '2020-06-30',
 'Сертификат');