<#import "../layout.ftlh" as main>
<#assign pageStyles>
    <link rel="stylesheet" href="/static/css/user/profile.css" />
</#assign>

<@main.layout pageStyles=pageStyles; spring>

    <div class="container py-5">
        <div class="profile-container">
            <h1 class="profile-header">
                <#if user.role == "ROLE_APPLICANT">
                    <@spring.message "profile.header.applicant"/>
                <#else>
                    <@spring.message "profile.header.employer"/>
                </#if>
            </h1>

            <div class="profile-avatar-container">
                <div class="profile-avatar">
                    <#if user.avatar?? && user.avatar != "">
                        <img src="/api/images/${user.avatar}" alt="${user.name}" class="avatar">
                    <#else>
                        <#if user.role == "ROLE_APPLICANT">
                            <i class="bi bi-person"></i>
                        <#else>
                            <i class="bi bi-building"></i>
                        </#if>
                    </#if>
                </div>
            </div>

            <div class="profile-info">
                <div class="profile-name">
                    <#if user.role == "ROLE_APPLICANT">
                        ${user.name} ${user.surname}
                    <#else>
                        ${user.name}
                    </#if>
                </div>

                <div class="contact-info">
                    <#if user.role == "ROLE_APPLICANT" && user.age??>
                        <div class="contact-item">
                            <i class="bi bi-calendar"></i> <@spring.message "profile.age"/>: ${user.age}
                        </div>
                    </#if>

                    <div class="contact-item">
                        <i class="bi bi-envelope"></i> ${user.email}
                    </div>

                    <#if user.phoneNumber??>
                        <div class="contact-item">
                            <i class="bi bi-telephone"></i> ${user.phoneNumber}
                        </div>
                    </#if>
                </div>
            </div>

            <div class="profile-actions">
                <a href="/users/edit" class="btn btn-profile btn-edit">
                    <i class="bi bi-pencil"></i> <@spring.message "profile.editProfile"/>
                </a>

                <#if user.role == "ROLE_APPLICANT">
                    <a href="/resumes/create" class="btn btn-profile btn-create">
                        <i class="bi bi-file-earmark-plus"></i> <@spring.message "profile.createResume"/>
                    </a>

                    <a href="/responses" class="btn btn-profile btn-responses">
                        <i class="bi bi-bell"></i> <@spring.message "profile.responses"/>
                        <#if responsesForApplicant??>
                            <span class="response-count">${responsesForApplicant}</span>
                        </#if>
                    </a>
                <#else>
                    <a href="/vacancies/create" class="btn btn-profile btn-create">
                        <i class="bi bi-file-earmark-plus"></i> <@spring.message "profile.createVacancy"/>
                    </a>

                    <a href="/responses" class="btn btn-profile btn-responses">
                        <i class="bi bi-bell"></i> <@spring.message "profile.responses"/>
                        <#if responsesForCompany??>
                            <span class="response-count">${responsesForCompany}</span>
                        </#if>
                    </a>
                </#if>
            </div>

            <#if user.role == "ROLE_APPLICANT">
                <div class="items-section">
                    <h2 class="items-title">
                        <i class="bi bi-file-earmark-person me-2"></i> <@spring.message "profile.myResumes"/>
                    </h2>

                    <#if resumes?? && resumes.content?size gt 0>
                        <div class="row">
                            <#list resumes.content as resume>
                                <div class="col-md-6 col-lg-4 mb-4">
                                    <div class="item-card">
                                        <div class="item-title">${resume.name}</div>
                                        <div class="item-date">
                                            <i class="bi bi-calendar3"></i>
                                            <#if resume.updateTime??>
                                                <@spring.message "profile.updated"/>: ${resume.updateTime}
                                            </#if>
                                        </div>

                                        <#if resume.categoryName??>
                                            <div class="mb-3">
                                                <span class="badge bg-light text-primary">
                                                    <i class="bi bi-tag me-1"></i> ${resume.categoryName}
                                                </span>
                                            </div>
                                        </#if>

                                        <#if resume.salary??>
                                            <div class="mb-3 text-success fw-bold">
                                                <i class="bi bi-cash me-1"></i> ${resume.salary} ₽
                                            </div>
                                        </#if>

                                        <div class="item-actions">
                                            <a href="/resumes/update${resume.id}" class="btn-item btn-update">
                                                <i class="bi bi-arrow-clockwise"></i> <@spring.message "profile.update"/>
                                            </a>
                                            <a href="/resumes/edit/${resume.id}" class="btn-item btn-edit-item">
                                                <i class="bi bi-pencil"></i> <@spring.message "profile.edit"/>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </#list>
                        </div>

                        <#if resumes.totalPages gt 1>
                            <div class="pagination-container">
                                <ul class="pagination">
                                    <li class="page-item <#if !resumes.hasPrevious()>disabled</#if>">
                                        <a class="page-link" href="?page=0" aria-label="First">
                                            <i class="bi bi-chevron-double-left"></i>
                                        </a>
                                    </li>

                                    <#list 0..(resumes.totalPages-1) as i>
                                        <#if i == resumes.number - 2 || i == resumes.number - 1 || i == resumes.number || i == resumes.number + 1 || i == resumes.number + 2>
                                            <li class="page-item <#if i == resumes.number>active</#if>">
                                                <a class="page-link" href="?page=${i}">
                                                    ${i + 1}
                                                </a>
                                            </li>
                                        </#if>
                                    </#list>

                                    <li class="page-item <#if !resumes.hasNext()>disabled</#if>">
                                        <a class="page-link" href="?page=${(resumes.totalPages - 1)}" aria-label="Last">
                                            <i class="bi bi-chevron-double-right"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </#if>
                    <#else>
                        <div class="no-items">
                            <i class="bi bi-file-earmark-plus"></i>
                            <h3><@spring.message "profile.noResumes"/></h3>
                            <p><@spring.message "profile.noResumesMessage"/></p>
                            <a href="/resumes/create" class="btn btn-primary">
                                <i class="bi bi-plus-lg me-2"></i> <@spring.message "profile.createResume"/>
                            </a>
                        </div>
                    </#if>
                </div>
            <#else>
                <div class="items-section">
                    <h2 class="items-title">
                        <i class="bi bi-briefcase me-2"></i> <@spring.message "profile.myVacancies"/>
                    </h2>

                    <#if vacancies?? && vacancies.content?size gt 0>
                        <div class="row">
                            <#list vacancies.content as vacancy>
                                <div class="col-md-6 col-lg-4 mb-4">
                                    <div class="item-card">
                                        <div class="item-title">${vacancy.name}</div>
                                        <div class="item-date">
                                            <i class="bi bi-calendar3"></i>
                                            <#if vacancy.updateTime??>
                                                <@spring.message "profile.updated"/>: ${vacancy.updateTime}
                                            </#if>
                                        </div>

                                        <#if vacancy.category??>
                                            <div class="mb-3">
                                                <span class="badge bg-light text-primary">
                                                    <i class="bi bi-tag me-1"></i> ${vacancy.category.name}
                                                </span>
                                            </div>
                                        </#if>

                                        <#if vacancy.salary??>
                                            <div class="mb-3 text-success fw-bold">
                                                <i class="bi bi-cash me-1"></i> ${vacancy.salary} ₽
                                            </div>
                                        </#if>

                                        <#if vacancy.responses??>
                                            <div class="mb-3">
                                                <span class="badge bg-info text-white">
                                                    <i class="bi bi-people me-1"></i> <@spring.message "profile.responses"/>: ${vacancy.responses}
                                                </span>
                                            </div>
                                        </#if>

                                        <div class="item-actions">
                                            <a href="/vacancies/update/${vacancy.id}" class="btn-item btn-update">
                                                <i class="bi bi-arrow-clockwise"></i> <@spring.message "profile.update"/>
                                            </a>
                                            <a href="/vacancies/edit/${vacancy.id}" class="btn-item btn-edit-item">
                                                <i class="bi bi-pencil"></i> <@spring.message "profile.edit"/>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </#list>
                        </div>

                        <#if vacancies.totalPages gt 1>
                            <div class="pagination-container">
                                <ul class="pagination">
                                    <li class="page-item <#if !vacancies.hasPrevious()>disabled</#if>">
                                        <a class="page-link" href="?page=0&sort=${param.sort!'updateTime'}" aria-label="First">
                                            <i class="bi bi-chevron-double-left"></i>
                                        </a>
                                    </li>

                                    <#list 0..(vacancies.totalPages-1) as i>
                                        <#if i == vacancies.number - 2 || i == vacancies.number - 1 || i == vacancies.number || i == vacancies.number + 1 || i == vacancies.number + 2>
                                            <li class="page-item <#if i == vacancies.number>active</#if>">
                                                <a class="page-link" href="?page=${i}&sort=${param.sort!'updateTime'}">
                                                    ${i + 1}
                                                </a>
                                            </li>
                                        </#if>
                                    </#list>

                                    <li class="page-item <#if !vacancies.hasNext()>disabled</#if>">
                                        <a class="page-link" href="?page=${(vacancies.totalPages - 1)}&sort=${param.sort!'updateTime'}" aria-label="Last">
                                            <i class="bi bi-chevron-double-right"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </#if>
                    <#else>
                        <div class="no-items">
                            <i class="bi bi-briefcase-plus"></i>
                            <h3><@spring.message "profile.noVacancies"/></h3>
                            <p><@spring.message "profile.noVacanciesMessage"/></p>
                            <a href="/vacancies/create" class="btn btn-primary">
                                <i class="bi bi-plus-lg me-2"></i> <@spring.message "profile.createVacancy"/>
                            </a>
                        </div>
                    </#if>
                </div>
            </#if>
        </div>
    </div>
</@main.layout>