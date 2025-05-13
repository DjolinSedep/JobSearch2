-- liquibase formatted sql
-- changeset Sedep:017

INSERT INTO users (name, surname, age, email, password, phone_number, avatar, enabled, role_id, interface_language)
VALUES
('Александр', 'Иванов', 28, 'alex@gmail.com', '$2a$12$97q2vSDxPzR1073BKAXd1OY7AurMIeNp7GufsPbxBpZSbCWjyqZyi', '+996555101001', 'default_avatar.jpg', true, (SELECT id FROM roles WHERE role = 'ROLE_APPLICANT'), 'ru'),
('Екатерина', 'Смирнова', 24, 'ekaterina@gmail.com', '$2a$12$97q2vSDxPzR1073BKAXd1OY7AurMIeNp7GufsPbxBpZSbCWjyqZyi', '+996555101002', 'default_avatar.jpg', true, (SELECT id FROM roles WHERE role = 'ROLE_APPLICANT'), 'ru'),
('Дмитрий', 'Петров', 32, 'dmitry@gmail.com', '$2a$12$97q2vSDxPzR1073BKAXd1OY7AurMIeNp7GufsPbxBpZSbCWjyqZyi', '+996555101003', 'default_avatar.jpg', true, (SELECT id FROM roles WHERE role = 'ROLE_APPLICANT'), 'ru'),
('Анна', 'Козлова', 26, 'anna@gmail.com', '$2a$12$97q2vSDxPzR1073BKAXd1OY7AurMIeNp7GufsPbxBpZSbCWjyqZyi', '+996555101004', 'default_avatar.jpg', true, (SELECT id FROM roles WHERE role = 'ROLE_APPLICANT'), 'ru'),
('Сергей', 'Новиков', 30, 'sergey@gmail.com', '$2a$12$97q2vSDxPzR1073BKAXd1OY7AurMIeNp7GufsPbxBpZSbCWjyqZyi', '+996555101005', 'default_avatar.jpg', true, (SELECT id FROM roles WHERE role = 'ROLE_APPLICANT'), 'ru'),
('Ольга', 'Морозова', 27, 'olga@gmail.com', '$2a$12$97q2vSDxPzR1073BKAXd1OY7AurMIeNp7GufsPbxBpZSbCWjyqZyi', '+996555101006', 'default_avatar.jpg', true, (SELECT id FROM roles WHERE role = 'ROLE_APPLICANT'), 'ru'),
('Максим', 'Волков', 33, 'maxim@gmail.com', '$2a$12$97q2vSDxPzR1073BKAXd1OY7AurMIeNp7GufsPbxBpZSbCWjyqZyi', '+996555101007', 'default_avatar.jpg', true, (SELECT id FROM roles WHERE role = 'ROLE_APPLICANT'), 'ru'),
('Наталья', 'Зайцева', 29, 'natalia@gmail.com', '$2a$12$97q2vSDxPzR1073BKAXd1OY7AurMIeNp7GufsPbxBpZSbCWjyqZyi', '+996555101008', 'default_avatar.jpg', true, (SELECT id FROM roles WHERE role = 'ROLE_APPLICANT'), 'ru'),
('Андрей', 'Соколов', 31, 'andrey@gmail.com', '$2a$12$97q2vSDxPzR1073BKAXd1OY7AurMIeNp7GufsPbxBpZSbCWjyqZyi', '+996555101009', 'default_avatar.jpg', true, (SELECT id FROM roles WHERE role = 'ROLE_APPLICANT'), 'ru'),
('Мария', 'Кузнецова', 25, 'maria@gmail.com', '$2a$12$97q2vSDxPzR1073BKAXd1OY7AurMIeNp7GufsPbxBpZSbCWjyqZyi', '+996555101010', 'default_avatar.jpg', true, (SELECT id FROM roles WHERE role = 'ROLE_APPLICANT'), 'ru');


INSERT INTO users (name, surname, age, email, password, phone_number, avatar, enabled, role_id, interface_language)
VALUES
('MadDevs', 'ИТ Решения', NULL, 'hr@maddevs.io', '$2a$12$97q2vSDxPzR1073BKAXd1OY7AurMIeNp7GufsPbxBpZSbCWjyqZyi', '+996555201001', 'default_avatar.jpg', true, (SELECT id FROM roles WHERE role = 'ROLE_EMPLOYEE'), 'ru'),
('Zensoft', 'ИТ-Аутсорсинг', NULL, 'jobs@zensoft.io', '$2a$12$97q2vSDxPzR1073BKAXd1OY7AurMIeNp7GufsPbxBpZSbCWjyqZyi', '+996555201002', 'default_avatar.jpg', true, (SELECT id FROM roles WHERE role = 'ROLE_EMPLOYEE'), 'ru'),
('Neobis', 'Академия', NULL, 'career@neobis.kg', '$2a$12$97q2vSDxPzR1073BKAXd1OY7AurMIeNp7GufsPbxBpZSbCWjyqZyi', '+996555201003', 'default_avatar.jpg', true, (SELECT id FROM roles WHERE role = 'ROLE_EMPLOYEE'), 'ru'),
('IT-Attractor', 'Обучение', NULL, 'hr@it-attractor.com', '$2a$12$97q2vSDxPzR1073BKAXd1OY7AurMIeNp7GufsPbxBpZSbCWjyqZyi', '+996555201004', 'default_avatar.jpg', true, (SELECT id FROM roles WHERE role = 'ROLE_EMPLOYEE'), 'ru'),
('Manaschi', 'Разработка', NULL, 'jobs@manaschi.dev', '$2a$12$97q2vSDxPzR1073BKAXd1OY7AurMIeNp7GufsPbxBpZSbCWjyqZyi', '+996555201005', 'default_avatar.jpg', true, (SELECT id FROM roles WHERE role = 'ROLE_EMPLOYEE'), 'ru'),
('DevBridge', 'Консалтинг', NULL, 'careers@devbridge.kg', '$2a$12$97q2vSDxPzR1073BKAXd1OY7AurMIeNp7GufsPbxBpZSbCWjyqZyi', '+996555201006', 'default_avatar.jpg', true, (SELECT id FROM roles WHERE role = 'ROLE_EMPLOYEE'), 'ru'),
('TimelySoft', 'Программные решения', NULL, 'job@timelysoft.net', '$2a$12$97q2vSDxPzR1073BKAXd1OY7AurMIeNp7GufsPbxBpZSbCWjyqZyi', '+996555201007', 'default_avatar.jpg', true, (SELECT id FROM roles WHERE role = 'ROLE_EMPLOYEE'), 'ru'),
('Codify', 'Академия программирования', NULL, 'team@codify.kg', '$2a$12$97q2vSDxPzR1073BKAXd1OY7AurMIeNp7GufsPbxBpZSbCWjyqZyi', '+996555201008', 'default_avatar.jpg', true, (SELECT id FROM roles WHERE role = 'ROLE_EMPLOYEE'), 'ru'),
('IROKEZ', 'Веб-студия', NULL, 'hr@irokez.kg', '$2a$12$97q2vSDxPzR1073BKAXd1OY7AurMIeNp7GufsPbxBpZSbCWjyqZyi', '+996555201009', 'default_avatar.jpg', true, (SELECT id FROM roles WHERE role = 'ROLE_EMPLOYEE'), 'ru'),
('Kyrgyz Concept', 'ИТ-отдел', NULL, 'it-jobs@concept.kg', '$2a$12$97q2vSDxPzR1073BKAXd1OY7AurMIeNp7GufsPbxBpZSbCWjyqZyi', '+996555201010', 'default_avatar.jpg', true, (SELECT id FROM roles WHERE role = 'ROLE_EMPLOYEE'), 'ru');