<#import "../layout.ftlh" as main>
<#assign pageStyles>
    <link rel="stylesheet" href="/static/css/resumes/resumes.css" />
</#assign>

<@main.layout pageStyles=pageStyles; spring>

    <div class="resumes-header">
        <h1><@spring.message "resume.list.title"/></h1>
        <p class="text-muted"><@spring.message "resume.list.subtitle"/></p>
    </div>


    <#if resumes?? && resumes.content?size gt 0>
        <div class="resume-grid">
            <#list resumes.content as resume>
                <div class="resume-card">
                    <div class="resume-header">
                        <div>
                            <h2 class="resume-title">${resume.name}</h2>
                            <div class="resume-user">
                                <i class="bi bi-person"></i> ${resume.userName}
                            </div>
                        </div>
                        <#if resume.salary??>
                            <div class="resume-salary">
                                ${resume.salary} ₽
                            </div>
                        </#if>
                    </div>

                    <#if resume.categoryName??>
                        <div class="resume-category">
                            <i class="bi bi-tag me-1"></i> ${resume.categoryName}
                        </div>
                    </#if>

                    <div class="resume-footer">
                        <div class="resume-date">
                            <i class="bi bi-calendar3"></i>
                            <#if resume.updateTime??>
                                <@spring.message "resume.list.updated"/>: ${resume.updateTime}
                            </#if>
                        </div>
                        <div>
                            <a href="#" class="btn btn-contact">
                                <i class="bi bi-envelope"></i> <@spring.message "resume.list.contact"/>
                            </a>
                            <a href="/resumes/${resume.id}" class="btn btn-view">
                                <i class="bi bi-eye"></i> <@spring.message "resume.list.view"/>
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
                    <li class="page-item <#if !resumes.hasPrevious()>disabled</#if>">
                        <a class="page-link" href="?page=${(resumes.number - 1)}" aria-label="Previous">
                            <i class="bi bi-chevron-left"></i>
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
                        <a class="page-link" href="?page=${(resumes.number + 1)}" aria-label="Next">
                            <i class="bi bi-chevron-right"></i>
                        </a>
                    </li>
                    <li class="page-item <#if !resumes.hasNext()>disabled</#if>">
                        <a class="page-link" href="?page=${(resumes.totalPages - 1)}" aria-label="Last">
                            <i class="bi bi-chevron-double-right"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </#if>
    <#else>
        <div class="no-results">
            <i class="bi bi-file-earmark-person"></i>
            <h3><@spring.message "resume.list.noResumesFound"/></h3>
            <p><@spring.message "resume.list.noResumesMessage"/></p>
        </div>
    </#if>
</@main.layout>