-- liquibase formatted sql
-- changeset Sedep:015

INSERT INTO authorities (authority) VALUES
('CREATE_RESUME'),
('EDIT_RESUME'),
('DELETE_RESUME'),
('CREATE_VACANCY'),
('EDIT_VACANCY'),
('DELETE_VACANCY'),
('VIEW_RESUME'),
('VIEW_VACANCY'),
('APPLY_TO_VACANCY');