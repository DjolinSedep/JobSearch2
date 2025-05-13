package com.attractor.job_search.service.impl;

import com.attractor.job_search.model.Role;
import com.attractor.job_search.repository.RoleRepository;
import com.attractor.job_search.service.RoleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.NoSuchElementException;

@Slf4j
@Service
@RequiredArgsConstructor
public class RoleServiceImpl implements RoleService {
    private final RoleRepository roleRepository;

    @Override
    public Role findRoleByName(String name) {
        return roleRepository.findByRoleName(name).orElseThrow(() -> new NoSuchElementException("Role not found"));
    }
}
