-- liquibase formatted sql
-- changeset Sedep:019

INSERT INTO vacancies (name, description, category_id, salary, exp_from, exp_to, is_active, author_id, created_date, update_time) VALUES
('Senior Java Developer', 'Требуется опытный Java разработчик для работы над высоконагруженными системами. Опыт работы с Spring Framework, Hibernate и микросервисной архитектурой обязателен. Знание Docker и Kubernetes будет преимуществом.',
(SELECT id FROM categories WHERE name = 'Разработка ПО'), 180000, 3, 6, true,
(SELECT id FROM users WHERE email = 'hr@maddevs.io'), NOW(), NOW()),
('Frontend React Developer', 'Ищем React разработчика для создания современных пользовательских интерфейсов. Требуется опыт работы с React, Redux, TypeScript и современными фронтенд-инструментами. Опыт с React Native будет плюсом.',
(SELECT id FROM categories WHERE name = 'Разработка ПО'), 150000, 1, 3, true,
(SELECT id FROM users WHERE email = 'hr@maddevs.io'), NOW(), NOW()),
('Python/Django Developer', 'Требуется разработчик Python со знанием Django для работы над коммерческими проектами. Необходимы знания REST API, PostgreSQL и опыт работы с AWS или другими облачными платформами.',
(SELECT id FROM categories WHERE name = 'Разработка ПО'), 120000, 1, 4, true,
(SELECT id FROM users WHERE email = 'jobs@zensoft.io'), NOW(), NOW()),
('DevOps Engineer', 'Ищем DevOps-инженера для автоматизации и оптимизации процессов разработки. Требуется опыт работы с CI/CD, Docker, Kubernetes, Terraform. Знание AWS, Azure или GCP обязательно.',
(SELECT id FROM categories WHERE name = 'DevOps'), 160000, 2, 5, true,
(SELECT id FROM users WHERE email = 'jobs@zensoft.io'), NOW(), NOW()),
('Junior Android Developer', 'Компания Neobis ищет начинающего Android-разработчика для работы над мобильными приложениями. Знание Kotlin, XML, Android SDK. Опыт разработки приложений будет преимуществом.',
(SELECT id FROM categories WHERE name = 'Разработка ПО'), 70000, 0, 1, true,
(SELECT id FROM users WHERE email = 'career@neobis.kg'), NOW(), NOW()),
('UI/UX Designer', 'Требуется дизайнер интерфейсов с навыками в UX. Опыт работы с Figma, Adobe XD или Sketch. Понимание принципов пользовательского опыта и интерфейсов для веб и мобильных приложений.',
(SELECT id FROM categories WHERE name = 'Дизайн и UX'), 90000, 1, 3, true,
(SELECT id FROM users WHERE email = 'career@neobis.kg'), NOW(), NOW()),
('QA Engineer', 'Ищем тестировщика ПО с опытом в ручном и автоматизированном тестировании. Знание Selenium, Postman, JIRA и инструментов отчетности. Опыт работы с Agile методологиями.',
(SELECT id FROM categories WHERE name = 'Тестирование'), 110000, 1, 3, true,
(SELECT id FROM users WHERE email = 'hr@it-attractor.com'), NOW(), NOW()),
('Full Stack JavaScript Developer', 'Требуется разработчик со знанием Node.js и React/Angular/Vue. Опыт работы с MongoDB/PostgreSQL и REST API. Понимание принципов разработки SPA и опыт работы с микросервисами.',
(SELECT id FROM categories WHERE name = 'Разработка ПО'), 140000, 2, 4, true,
(SELECT id FROM users WHERE email = 'hr@it-attractor.com'), NOW(), NOW()),
('Системный администратор', 'Компания Manaschi ищет системного администратора для поддержки IT-инфраструктуры. Опыт работы с Windows Server, Linux, сетевым оборудованием и системами виртуализации.',
(SELECT id FROM categories WHERE name = 'Системное администрирование'), 95000, 2, 5, true,
(SELECT id FROM users WHERE email = 'jobs@manaschi.dev'), NOW(), NOW()),
('Менеджер проектов', 'Требуется опытный менеджер проектов в IT сфере. Опыт управления Agile/Scrum командами, ведение документации, коммуникация с клиентами, планирование и контроль сроков.',
(SELECT id FROM categories WHERE name = 'Управление проектами'), 130000, 3, 6, true,
(SELECT id FROM users WHERE email = 'jobs@manaschi.dev'), NOW(), NOW()),
('Data Scientist', 'Ищем специалиста по данным с опытом в ML. Знание Python, pandas, scikit-learn, TensorFlow/PyTorch. Опыт работы с большими данными и нейронными сетями.',
(SELECT id FROM categories WHERE name = 'Аналитика'), 170000, 2, 5, true,
(SELECT id FROM users WHERE email = 'careers@devbridge.kg'), NOW(), NOW()),
('Специалист по информационной безопасности', 'Требуется специалист по ИБ для аудита и обеспечения безопасности систем. Знание методов защиты данных, опыт в проведении пентестов, OWASP и стандартов безопасности.',
(SELECT id FROM categories WHERE name = 'Информационная безопасность'), 160000, 3, 6, true,
(SELECT id FROM users WHERE email = 'careers@devbridge.kg'), NOW(), NOW()),
('Java Spring Developer', 'Ищем Java-разработчика со знанием Spring Framework (Boot, MVC, Security, Data) для работы над корпоративными приложениями. Опыт с REST API и SQL базами данных.',
(SELECT id FROM categories WHERE name = 'Разработка ПО'), 140000, 2, 4, true,
(SELECT id FROM users WHERE email = 'job@timelysoft.net'), NOW(), NOW()),
('Frontend Angular Developer', 'Требуется фронтенд-разработчик с опытом работы с Angular 2+. Знание TypeScript, RxJS, NgRx будет преимуществом. Опыт создания адаптивных веб-приложений.',
(SELECT id FROM categories WHERE name = 'Разработка ПО'), 130000, 1, 4, true,
(SELECT id FROM users WHERE email = 'job@timelysoft.net'), NOW(), NOW()),
('Web Developer', 'Codify ищет веб-разработчика для создания современных веб-приложений. Требуется знание HTML, CSS, JavaScript, а также одного из современных фреймворков.',
(SELECT id FROM categories WHERE name = 'Разработка ПО'), 90000, 0, 2, true,
(SELECT id FROM users WHERE email = 'team@codify.kg'), NOW(), NOW()),
('PHP Laravel Developer', 'Требуется PHP-разработчик со знанием Laravel. Опыт работы с MVC-фреймворками, MySQL/PostgreSQL, RESTful API и современными инструментами разработки.',
(SELECT id FROM categories WHERE name = 'Разработка ПО'), 110000, 1, 3, true,
(SELECT id FROM users WHERE email = 'team@codify.kg'), NOW(), NOW()),
('WordPress Developer', 'Ищем разработчика WordPress для создания и поддержки сайтов клиентов. Опыт кастомизации тем, разработки плагинов, интеграции с API и оптимизации производительности.',
(SELECT id FROM categories WHERE name = 'Разработка ПО'), 85000, 1, 3, true,
(SELECT id FROM users WHERE email = 'hr@irokez.kg'), NOW(), NOW()),
('SEO-специалист', 'Требуется SEO-специалист для оптимизации сайтов. Опыт работы с Google Analytics, Яндекс.Метрика, знание принципов SEO и опыт успешного продвижения сайтов.',
(SELECT id FROM categories WHERE name = 'Digital-маркетинг'), 90000, 1, 4, true,
(SELECT id FROM users WHERE email = 'hr@irokez.kg'), NOW(), NOW()),
('CRM-разработчик', 'Kyrgyz Concept ищет разработчика для внедрения и настройки CRM-системы. Требуется опыт работы с Bitrix24, интеграции с внешними системами и кастомизации.',
(SELECT id FROM categories WHERE name = 'Разработка ПО'), 100000, 2, 4, true,
(SELECT id FROM users WHERE email = 'it-jobs@concept.kg'), NOW(), NOW()),
('Системный аналитик', 'Требуется системный аналитик для работы с бизнес-процессами и требованиями. Опыт в моделировании бизнес-процессов, сборе и анализе требований, создании ТЗ.',
(SELECT id FROM categories WHERE name = 'Аналитика'), 120000, 2, 5, true,
(SELECT id FROM users WHERE email = 'it-jobs@concept.kg'), NOW(), NOW());