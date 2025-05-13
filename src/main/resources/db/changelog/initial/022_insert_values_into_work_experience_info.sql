-- liquibase formatted sql
-- changeset Sedep:022


INSERT INTO work_experience_info (resume_id, years, company_name, position, responsibilities) VALUES
((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'alex@gmail.com' AND r.name = 'Java Developer'),
 4,
 'MadDevs',
 'Java Developer',
 'Разработка высоконагруженных бэкенд-сервисов на Java и Spring Boot. Проектирование и разработка REST API. Оптимизация производительности приложений. Интеграция с внешними API и сервисами.'),
((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'alex@gmail.com' AND r.name = 'Java Developer'),
 2,
 'TimelySoft',
 'Junior Java Developer',
 'Разработка и поддержка корпоративных веб-приложений. Работа с базами данных PostgreSQL и Oracle. Участие в код-ревью и тестировании приложений.'),
((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'alex@gmail.com' AND r.name = 'Android Developer'),
 3,
 'Neobis',
 'Android Developer',
 'Разработка нативных Android-приложений на Kotlin. Внедрение архитектурных паттернов MVVM и Clean Architecture. Создание пользовательских интерфейсов, оптимизация производительности приложений.'),

((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'ekaterina@gmail.com' AND r.name = 'Frontend Developer'),
 3,
 'Zensoft',
 'Frontend Developer',
 'Разработка клиентской части веб-приложений с использованием React и Redux. Оптимизация пользовательских интерфейсов, работа с REST API. Внедрение TypeScript и настройка сборки проектов.'),

((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'ekaterina@gmail.com' AND r.name = 'UI/UX Designer'),
 2,
 'IROKEZ',
 'UI/UX Designer',
 'Проектирование пользовательских интерфейсов для мобильных и веб-приложений. Создание прототипов, вайрфреймов и дизайн-систем. Проведение UX-исследований и тестирования.'),

((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'dmitry@gmail.com' AND r.name = 'DevOps Engineer'),
 5,
 'DevBridge',
 'Senior DevOps Engineer',
 'Настройка и поддержка CI/CD пайплайнов с использованием Jenkins и GitLab CI. Управление инфраструктурой с помощью Terraform и Ansible. Администрирование Kubernetes кластеров, мониторинг.'),

((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'dmitry@gmail.com' AND r.name = 'DevOps Engineer'),
 2,
 'Manaschi',
 'System Administrator',
 'Администрирование Linux-серверов и сетевой инфраструктуры. Настройка и поддержка Docker-контейнеров. Резервное копирование и восстановление данных.'),

((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'dmitry@gmail.com' AND r.name = 'System Administrator'),
 3,
 'Kyrgyz Concept',
 'System Administrator',
 'Поддержка серверной инфраструктуры компании. Администрирование Windows Server и Active Directory. Обеспечение безопасности и доступности сервисов.'),

((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'anna@gmail.com' AND r.name = 'QA Engineer'),
 3,
 'IT-Attractor',
 'QA Engineer',
 'Ручное и автоматизированное тестирование веб-приложений. Разработка автотестов с использованием Selenium и Java. Создание тестовой документации, баг-репорты, регрессионное тестирование.'),

((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'anna@gmail.com' AND r.name = 'QA Engineer'),
 1,
 'Codify',
 'Junior QA Engineer',
 'Ручное тестирование веб-приложений. Составление тест-кейсов и чек-листов. Взаимодействие с разработчиками для исправления найденных ошибок.'),

((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'anna@gmail.com' AND r.name = 'Business Analyst'),
 2,
 'Kyrgyz Concept',
 'Business Analyst',
 'Анализ и документирование бизнес-процессов. Сбор и управление требованиями. Создание технических заданий, взаимодействие с заказчиками и разработчиками.'),

((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'sergey@gmail.com' AND r.name = 'Full Stack Developer'),
 4,
 'MadDevs',
 'Full Stack Developer',
 'Разработка полного стека веб-приложений с использованием Node.js, Express и React. Работа с MongoDB и PostgreSQL. Внедрение микросервисной архитектуры.'),

((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'sergey@gmail.com' AND r.name = 'Full Stack Developer'),
 2,
 'Zensoft',
 'Frontend Developer',
 'Разработка клиентской части веб-приложений с использованием React и Redux. Работа с API, оптимизация пользовательских интерфейсов.'),

((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'sergey@gmail.com' AND r.name = 'Project Manager'),
 3,
 'DevBridge',
 'Project Manager',
 'Управление IT-проектами с использованием Agile методологий. Планирование и контроль сроков, бюджета и ресурсов. Взаимодействие с заказчиками и командой разработки.'),

((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'olga@gmail.com' AND r.name = 'Data Scientist'),
 3,
 'DevBridge',
 'Data Scientist',
 'Построение и обучение моделей машинного обучения. Анализ больших данных с использованием Python, pandas, scikit-learn. Разработка алгоритмов прогнозирования и классификации.'),

((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'olga@gmail.com' AND r.name = 'Python Developer'),
 2,
 'Zensoft',
 'Python Developer',
 'Разработка бэкенд-сервисов на Python/Django. Создание REST API, работа с базами данных PostgreSQL. Оптимизация производительности приложений.'),

((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'maxim@gmail.com' AND r.name = 'Information Security Specialist'),
 5,
 'DevBridge',
 'Information Security Specialist',
 'Проведение аудита безопасности информационных систем. Пентестинг веб-приложений и сетевой инфраструктуры. Разработка и внедрение политик безопасности.'),

((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'maxim@gmail.com' AND r.name = 'Network Administrator'),
 3,
 'Kyrgyz Concept',
 'Network Administrator',
 'Проектирование и администрирование корпоративных сетей. Настройка сетевого оборудования Cisco. Обеспечение безопасности сетевой инфраструктуры.'),

((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'natalia@gmail.com' AND r.name = 'Content Manager'),
 3,
 'IROKEZ',
 'Content Manager',
 'Управление контентом корпоративных веб-сайтов. Создание и редактирование текстового и визуального контента. Разработка контент-стратегии, анализ эффективности.'),

((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'natalia@gmail.com' AND r.name = 'SMM Specialist'),
 2,
 'Codify',
 'SMM Specialist',
 'Ведение социальных сетей компании. Разработка и реализация SMM-стратегий. Создание и публикация контента, взаимодействие с аудиторией, аналитика.'),

((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'andrey@gmail.com' AND r.name = 'PHP Developer'),
 4,
 'Codify',
 'PHP Developer',
 'Разработка веб-приложений на PHP/Laravel. Проектирование баз данных MySQL, разработка REST API. Интеграция с внешними сервисами.'),

((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'andrey@gmail.com' AND r.name = 'PHP Developer'),
 2,
 'IROKEZ',
 'Web Developer',
 'Разработка веб-сайтов с использованием PHP, MySQL и JavaScript. Создание и поддержка WordPress сайтов, разработка плагинов.'),

((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'andrey@gmail.com' AND r.name = 'Database Administrator'),
 3,
 'TimelySoft',
 'Database Administrator',
 'Администрирование баз данных Oracle и PostgreSQL. Оптимизация запросов, резервное копирование и восстановление данных. Проектирование схем БД.'),
((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'maria@gmail.com' AND r.name = 'Frontend React Developer'),
 3,
 'TimelySoft',
 'Frontend Developer',
 'Разработка современных веб-приложений с использованием React, Redux и TypeScript. Создание адаптивных интерфейсов, работа с REST API.'),

((SELECT r.id FROM resumes r
                       JOIN users u ON r.applicant_id = u.id
  WHERE u.email = 'maria@gmail.com' AND r.name = 'Web Designer'),
 2,
 'IROKEZ',
 'Web Designer',
 'Разработка дизайна веб-сайтов и мобильных приложений. Создание прототипов, макетов и дизайн-систем. Работа с Figma, Photoshop и Illustrator.');