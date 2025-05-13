<#import "../layout.ftlh" as main>

<#assign pageStyles>
    <link rel="stylesheet" href="/static/css/vacancies/vacancy_detail.css" />
</#assign>

<@main.layout pageStyles=pageStyles; spring>
    <#assign known = SPRING_SECURITY_CONTEXT?? >
    <#assign isAuthor = false>
    <#if known>
        <#assign user = SPRING_SECURITY_CONTEXT.authentication.principal>
        <#if resumeDto?? && user?? && resumeDto.userEmail?? && user.username?? && resumeDto.userEmail == user.username>
            <#assign isAuthor = true>
        </#if>
    </#if>

    <div class="container py-5">
        <div class="vacancy-detail-container">
            <div class="vacancy-header">
                <div>
                    <h1 class="vacancy-title">
                        ${vacancy.name}
                        <#if vacancy.isActive?? && vacancy.isActive>
                            <span class="status-badge status-active"><@spring.message "vacancy.detail.status.active"/></span>
                        <#else>
                            <span class="status-badge status-inactive"><@spring.message "vacancy.detail.status.inactive"/></span>
                        </#if>
                    </h1>
                    <div class="vacancy-meta">
                        <#if vacancy.authorName?? && vacancy.authorName?has_content>
                            <div class="vacancy-meta-item">
                                <i class="bi bi-building"></i>
                                <span>${vacancy.authorName}</span>
                            </div>
                        </#if>
                        <#if vacancy.updateTime??>
                            <div class="vacancy-meta-item">
                                <i class="bi bi-clock"></i>
                                <span><@spring.message "vacancy.detail.updated"/>: ${vacancy.updateTime}</span>
                            </div>
                        </#if>
                        <#if vacancy.category?? && vacancy.category.name?has_content>
                            <div class="vacancy-meta-item">
                                <i class="bi bi-tag"></i>
                                <span class="vacancy-category">${vacancy.category.name}</span>
                            </div>
                        </#if>
                    </div>
                    <#if vacancy.salary?? && vacancy.salary?has_content>
                        <div class="vacancy-salary">${vacancy.salary} ₽</div>
                    </#if>
                </div>

                <div class="vacancy-actions">
                    <#if isAuthor>
                        <a href="/vacancies/edit/${vacancy.id}" class="btn btn-outline">
                        <i class="bi bi-pencil"></i> <@spring.message "vacancy.detail.edit"/>
                    </a>
                    </#if>
                    <a href="/vacancies" class="btn btn-primary">
                        <i class="bi bi-arrow-left"></i> <@spring.message "vacancy.detail.back"/>
                    </a>
                </div>
            </div>


            <div class="section">
                <h2 class="section-title">
                    <i class="bi bi-file-text"></i> <@spring.message "vacancy.detail.description"/>
                </h2>
                <div class="section-content">
                    <#if vacancy.description?? && vacancy.description?has_content>
                        <div class="description">${vacancy.description}</div>
                    <#else>
                        <div class="description"><@spring.message "vacancy.detail.noDescription"/></div>
                    </#if>
                </div>
            </div>


            <div class="section">
                <h2 class="section-title">
                    <i class="bi bi-briefcase"></i> <@spring.message "vacancy.detail.requiredExperience"/>
                </h2>
                <div class="section-content">
                    <#if vacancy.expFrom?? && vacancy.expTo??>
                        <span class="experience-badge">
                            <@spring.message "vacancy.detail.from"/> ${vacancy.expFrom}
                            <#if vacancy.expFrom == 1>
                                <@spring.message "vacancy.detail.year"/>
                            <#else>
                                <@spring.message "vacancy.detail.years"/>
                            </#if>
                            <@spring.message "vacancy.detail.to"/> ${vacancy.expTo}
                            <#if vacancy.expTo == 1>
                                <@spring.message "vacancy.detail.year"/>
                            <#else>
                                <@spring.message "vacancy.detail.years"/>
                            </#if>
                        </span>
                    <#elseif vacancy.expFrom??>
                        <span class="experience-badge">
                            <@spring.message "vacancy.detail.from"/> ${vacancy.expFrom}
                            <#if vacancy.expFrom == 1>
                                <@spring.message "vacancy.detail.year"/>
                            <#else>
                                <@spring.message "vacancy.detail.years"/>
                            </#if>
                        </span>
                    <#elseif vacancy.expTo??>
                        <span class="experience-badge">
                            <@spring.message "vacancy.detail.to"/> ${vacancy.expTo}
                            <#if vacancy.expTo == 1>
                                <@spring.message "vacancy.detail.year"/>
                            <#else>
                                <@spring.message "vacancy.detail.years"/>
                            </#if>
                        </span>
                    <#else>
                        <span class="experience-badge"><@spring.message "vacancy.detail.noExperience"/></span>
                    </#if>

                    <#if vacancy.responses??>
                        <span class="responses-badge">
                            <i class="bi bi-people"></i> ${vacancy.responses}
                            <#if vacancy.responses == 1>
                                <@spring.message "vacancy.detail.response1"/>
                            <#elseif vacancy.responses gt 1 && vacancy.responses lt 5>
                                <@spring.message "vacancy.detail.response2to4"/>
                            <#else>
                                <@spring.message "vacancy.detail.response5plus"/>
                            </#if>
                        </span>
                    </#if>
                </div>
            </div>
        </div>
    </div>
</@main.layout>