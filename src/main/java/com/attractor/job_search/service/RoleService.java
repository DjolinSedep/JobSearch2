package com.attractor.job_search.service;

import com.attractor.job_search.model.Role;

public interface RoleService {
    Role findRoleByName(String name);
}
