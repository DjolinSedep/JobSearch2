<#import "../layout.ftlh" as main>

<#assign pageStyles>
    <link rel="stylesheet" href="/static/css/user/profile_edit.css" />
</#assign>

<@main.layout pageStyles=pageStyles; spring>

    <div class="container py-5">
        <div class="user-profile-container">
            <div class="profile-banner">
                <div class="profile-banner-pattern"></div>
            </div>

            <div class="profile-card">
                <div class="profile-header">
                    <div class="profile-avatar">
                        <#if user.avatar?? && user.avatar != "">
                            <img src="/api/images/${user.avatar}" alt="${user.name}" class="profile-avatar">
                        <#else>
                            <#if user.role == "ROLE_APPLICANT">
                                <i class="bi bi-person"></i>
                            <#else>
                                <i class="bi bi-building"></i>
                            </#if>
                        </#if>
                    </div>

                    <div class="profile-info">
                        <h1 class="profile-name">
                            <#if user.role == "ROLE_APPLICANT">
                                ${user.name} ${user.surname}
                            <#else>
                                ${user.name}
                            </#if>
                        </h1>

                        <div class="profile-role">
                            <#if user.role == "ROLE_APPLICANT">
                                <i class="bi bi-person-badge"></i> <@spring.message "userProfile.applicant"/>
                            <#else>
                                <i class="bi bi-building"></i> <@spring.message "userProfile.employer"/>
                            </#if>
                        </div>

                        <div class="profile-contact">
                            <#if user.role == "ROLE_APPLICANT" && user.age??>
                                <div class="contact-item">
                                    <i class="bi bi-calendar"></i> ${user.age} <@spring.message "userProfile.years"/>
                                </div>
                            </#if>

                            <div class="contact-item">
                                <i class="bi bi-envelope"></i> ${user.email}
                            </div>

                            <#if user.phoneNumber?? && user.phoneNumber?has_content>
                                <div class="contact-item">
                                    <i class="bi bi-telephone"></i> ${user.phoneNumber}
                                </div>
                            </#if>
                        </div>
                    </div>
                </div>

                <#if user.role == "ROLE_APPLICANT">

                    <div class="profile-stats">
                        <div class="stat-item">
                            <div class="stat-value">
                                <#if resumes?? && resumes.totalElements??>
                                    ${resumes.totalElements}
                                <#else>
                                    0
                                </#if>
                            </div>
                            <div class="stat-label"><@spring.message "userProfile.resumes"/></div>
                        </div>

                        <div class="stat-item">
                            <div class="stat-value">
                                <#if resumes?? && resumes.content??>
                                    <#assign activeCount = 0>
                                    <#list resumes.content as resume>
                                        <#if resume.isActive?? && resume.isActive>
                                            <#assign activeCount = activeCount + 1>
                                        </#if>
                                    </#list>
                                    ${activeCount}
                                <#else>
                                    0
                                </#if>
                            </div>
                            <div class="stat-label"><@spring.message "userProfile.activeResumes"/></div>
                        </div>

                        <div class="stat-item">
                            <div class="stat-value">
                                <#if resumes?? && resumes.content?? && resumes.content?size gt 0>
                                    <#assign lastUpdate = resumes.content[0].updateTime>
                                    <#if lastUpdate??>
                                        ${lastUpdate}
                                    <#else>
                                        -
                                    </#if>
                                <#else>
                                    -
                                </#if>
                            </div>
                            <div class="stat-label"><@spring.message "userProfile.lastUpdate"/></div>
                        </div>
                    </div>


                    <div class="section-title">
                        <i class="bi bi-file-earmark-person"></i> <@spring.message "userProfile.resumes"/>
                    </div>

                    <#if resumes?? && resumes.content?size gt 0>
                        <div class="items-grid">
                            <#list resumes.content as resume>

                                <div class="item-card">
                                    <div class="item-header">
                                        <div class="item-title">
                                            ${resume.name}
                                            <span class="status-badge status-active">
                                                    <i class="bi bi-check-circle"></i> <@spring.message "userProfile.active"/>
                                                </span>
                                        </div>
                                    </div>

                                    <div class="item-meta">
                                        <#if resume.updateTime??>
                                            <div class="item-meta-entry">
                                                <i class="bi bi-clock"></i>
                                                <span><@spring.message "userProfile.updated"/>: ${resume.updateTime}</span>
                                            </div>
                                        </#if>
                                    </div>

                                    <#if resume.categoryName?? && resume.categoryName?has_content>
                                        <div class="item-category">
                                            <i class="bi bi-tag"></i> ${resume.categoryName}
                                        </div>
                                    </#if>

                                    <#if resume.salary??>
                                        <div class="item-salary">
                                            <i class="bi bi-cash"></i> ${resume.salary} ₽
                                        </div>
                                    </#if>

                                    <div class="item-footer">
                                        <a href="/resumes/${resume.id}" class="btn-view">
                                            <i class="bi bi-eye"></i> <@spring.message "userProfile.viewResume"/>
                                        </a>
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
                            <i class="bi bi-file-earmark-x"></i>
                            <h3><@spring.message "userProfile.noResumesAvailable"/></h3>
                            <p><@spring.message "userProfile.noResumesMessage"/></p>
                        </div>
                    </#if>
                <#else>

                    <div class="profile-stats">
                        <div class="stat-item">
                            <div class="stat-value">
                                <#if vacancies?? && vacancies.totalElements??>
                                    ${vacancies.totalElements}
                                <#else>
                                    0
                                </#if>
                            </div>
                            <div class="stat-label"><@spring.message "userProfile.vacancies"/></div>
                        </div>

                        <div class="stat-item">
                            <div class="stat-value">
                                <#if vacancies?? && vacancies.content??>
                                    <#assign activeCount = 0>
                                    <#list vacancies.content as vacancy>
                                        <#if vacancy.isActive?? && vacancy.isActive>
                                            <#assign activeCount = activeCount + 1>
                                        </#if>
                                    </#list>
                                    ${activeCount}
                                <#else>
                                    0
                                </#if>
                            </div>
                            <div class="stat-label"><@spring.message "userProfile.activeVacancies"/></div>
                        </div>

                        <div class="stat-item">
                            <div class="stat-value">
                                <#if vacancies?? && vacancies.content?? && vacancies.content?size gt 0>
                                    <#assign totalResponses = 0>
                                    <#list vacancies.content as vacancy>
                                        <#if vacancy.responses??>
                                            <#assign totalResponses = totalResponses + vacancy.responses>
                                        </#if>
                                    </#list>
                                    ${totalResponses}
                                <#else>
                                    0
                                </#if>
                            </div>
                            <div class="stat-label"><@spring.message "userProfile.totalResponses"/></div>
                        </div>
                    </div>


                    <div class="section-title">
                        <i class="bi bi-briefcase"></i> <@spring.message "userProfile.vacancies"/>
                    </div>

                    <#if vacancies?? && vacancies.content?size gt 0>
                        <div class="items-grid">
                            <#list vacancies.content as vacancy>
                                <#if vacancy.isActive?? && vacancy.isActive>
                                    <div class="item-card">
                                        <div class="item-header">
                                            <div class="item-title">
                                                ${vacancy.name}
                                                <span class="status-badge status-active">
                                                    <i class="bi bi-check-circle"></i> <@spring.message "userProfile.activeF"/>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="item-meta">
                                            <#if vacancy.updateTime??>
                                                <div class="item-meta-entry">
                                                    <i class="bi bi-clock"></i>
                                                    <span><@spring.message "userProfile.updated"/>: ${vacancy.updateTime}</span>
                                                </div>
                                            </#if>

                                            <#if vacancy.responses??>
                                                <div class="item-meta-entry">
                                                    <i class="bi bi-people"></i>
                                                    <span><@spring.message "userProfile.responses"/>: ${vacancy.responses}</span>
                                                </div>
                                            </#if>
                                        </div>

                                        <#if vacancy.category?? && vacancy.category.name?has_content>
                                            <div class="item-category">
                                                <i class="bi bi-tag"></i> ${vacancy.category.name}
                                            </div>
                                        </#if>

                                        <#if vacancy.salary?? && vacancy.salary?has_content>
                                            <div class="item-salary">
                                                <i class="bi bi-cash"></i> ${vacancy.salary} ₽
                                            </div>
                                        </#if>

                                        <#if vacancy.description?? && vacancy.description?has_content>
                                            <div class="item-description">
                                                ${vacancy.description}
                                            </div>
                                        </#if>

                                        <div class="item-footer">
                                            <a href="/vacancies/${vacancy.id}" class="btn-view">
                                                <i class="bi bi-eye"></i> <@spring.message "userProfile.viewVacancy"/>
                                            </a>
                                        </div>
                                    </div>
                                </#if>
                            </#list>
                        </div>

                        <#if vacancies.totalPages gt 1>
                            <div class="pagination-container">
                                <ul class="pagination">
                                    <li class="page-item <#if !vacancies.hasPrevious()>disabled</#if>">
                                        <a class="page-link" href="?page=0" aria-label="First">
                                            <i class="bi bi-chevron-double-left"></i>
                                        </a>
                                    </li>

                                    <#list 0..(vacancies.totalPages-1) as i>
                                        <#if i == vacancies.number - 2 || i == vacancies.number - 1 || i == vacancies.number || i == vacancies.number + 1 || i == vacancies.number + 2>
                                            <li class="page-item <#if i == vacancies.number>active</#if>">
                                                <a class="page-link" href="?page=${i}">
                                                    ${i + 1}
                                                </a>
                                            </li>
                                        </#if>
                                    </#list>

                                    <li class="page-item <#if !vacancies.hasNext()>disabled</#if>">
                                        <a class="page-link" href="?page=${(vacancies.totalPages - 1)}" aria-label="Last">
                                            <i class="bi bi-chevron-double-right"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </#if>
                    <#else>
                        <div class="no-items">
                            <i class="bi bi-briefcase-x"></i>
                            <h3><@spring.message "userProfile.noVacanciesAvailable"/></h3>
                            <p><@spring.message "userProfile.noVacanciesMessage"/></p>
                        </div>
                    </#if>
                </#if>
            </div>
        </div>
    </div>
</@main.layout>