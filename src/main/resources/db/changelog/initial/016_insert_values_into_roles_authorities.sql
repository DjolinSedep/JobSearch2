-- liquibase formatted sql
-- changeset Sedep:016

INSERT INTO roles_authorities (role_id, authority_id)
SELECT (SELECT id FROM roles WHERE role = 'ROLE_ADMIN'), (SELECT id FROM authorities WHERE authority = 'CREATE_RESUME');
INSERT INTO roles_authorities (role_id, authority_id)
SELECT (SELECT id FROM roles WHERE role = 'ROLE_ADMIN'), (SELECT id FROM authorities WHERE authority = 'EDIT_RESUME');
INSERT INTO roles_authorities (role_id, authority_id)
SELECT (SELECT id FROM roles WHERE role = 'ROLE_ADMIN'), (SELECT id FROM authorities WHERE authority = 'DELETE_RESUME');
INSERT INTO roles_authorities (role_id, authority_id)
SELECT (SELECT id FROM roles WHERE role = 'ROLE_ADMIN'), (SELECT id FROM authorities WHERE authority = 'CREATE_VACANCY');
INSERT INTO roles_authorities (role_id, authority_id)
SELECT (SELECT id FROM roles WHERE role = 'ROLE_ADMIN'), (SELECT id FROM authorities WHERE authority = 'EDIT_VACANCY');
INSERT INTO roles_authorities (role_id, authority_id)
SELECT (SELECT id FROM roles WHERE role = 'ROLE_ADMIN'), (SELECT id FROM authorities WHERE authority = 'DELETE_VACANCY');
INSERT INTO roles_authorities (role_id, authority_id)
SELECT (SELECT id FROM roles WHERE role = 'ROLE_ADMIN'), (SELECT id FROM authorities WHERE authority = 'VIEW_RESUME');
INSERT INTO roles_authorities (role_id, authority_id)
SELECT (SELECT id FROM roles WHERE role = 'ROLE_ADMIN'), (SELECT id FROM authorities WHERE authority = 'VIEW_VACANCY');
INSERT INTO roles_authorities (role_id, authority_id)
SELECT (SELECT id FROM roles WHERE role = 'ROLE_ADMIN'), (SELECT id FROM authorities WHERE authority = 'APPLY_TO_VACANCY');

INSERT INTO roles_authorities (role_id, authority_id)
SELECT (SELECT id FROM roles WHERE role = 'ROLE_EMPLOYEE'), (SELECT id FROM authorities WHERE authority = 'CREATE_VACANCY');
INSERT INTO roles_authorities (role_id, authority_id)
SELECT (SELECT id FROM roles WHERE role = 'ROLE_EMPLOYEE'), (SELECT id FROM authorities WHERE authority = 'EDIT_VACANCY');
INSERT INTO roles_authorities (role_id, authority_id)
SELECT (SELECT id FROM roles WHERE role = 'ROLE_EMPLOYEE'), (SELECT id FROM authorities WHERE authority = 'DELETE_VACANCY');
INSERT INTO roles_authorities (role_id, authority_id)
SELECT (SELECT id FROM roles WHERE role = 'ROLE_EMPLOYEE'), (SELECT id FROM authorities WHERE authority = 'VIEW_RESUME');

INSERT INTO roles_authorities (role_id, authority_id)
SELECT (SELECT id FROM roles WHERE role = 'ROLE_APPLICANT'), (SELECT id FROM authorities WHERE authority = 'CREATE_RESUME');
INSERT INTO roles_authorities (role_id, authority_id)
SELECT (SELECT id FROM roles WHERE role = 'ROLE_APPLICANT'), (SELECT id FROM authorities WHERE authority = 'EDIT_RESUME');
INSERT INTO roles_authorities (role_id, authority_id)
SELECT (SELECT id FROM roles WHERE role = 'ROLE_APPLICANT'), (SELECT id FROM authorities WHERE authority = 'VIEW_VACANCY');
INSERT INTO roles_authorities (role_id, authority_id)
SELECT (SELECT id FROM roles WHERE role = 'ROLE_APPLICANT'), (SELECT id FROM authorities WHERE authority = 'APPLY_TO_VACANCY');