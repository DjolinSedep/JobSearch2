<#import "../layout.ftlh" as main>

<#assign pageStyles>
    <link rel="stylesheet" href="/static/css/resumes/resume_detail.css" />
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
        <div class="resume-detail-container">
            <div class="resume-header">
                <div>
                    <h1 class="resume-title">
                        ${resumeDto.name}
                        <#if resumeDto.isActive?? && resumeDto.isActive>
                            <span class="status-badge status-active"><@spring.message "resume.detail.status.active"/></span>
                        <#else>
                            <span class="status-badge status-inactive"><@spring.message "resume.detail.status.inactive"/></span>
                        </#if>
                    </h1>
                    <div class="resume-meta">
                        <#if resumeDto.userName?? && resumeDto.userName?has_content>
                            <div class="resume-meta-item">
                                <i class="bi bi-person"></i>
                                <span>${resumeDto.userName}</span>
                            </div>
                        </#if>
                        <#if resumeDto.updateTime??>
                            <div class="resume-meta-item">
                                <i class="bi bi-clock"></i>
                                <span><@spring.message "resume.detail.updated"/>: ${resumeDto.updateTime}</span>
                            </div>
                        </#if>
                        <#if resumeDto.categoryName?? && resumeDto.categoryName?has_content>
                            <div class="resume-meta-item">
                                <i class="bi bi-tag"></i>
                                <span class="resume-category">${resumeDto.categoryName}</span>
                            </div>
                        </#if>
                    </div>
                    <#if resumeDto.salary??>
                        <div class="resume-salary">${resumeDto.salary} ₽</div>
                    </#if>
                </div>

                <div class="resume-actions">
                    <#if isAuthor>
                        <a href="/resumes/edit/${resumeDto.id}" class="btn btn-outline">
                            <i class="bi bi-pencil"></i> <@spring.message "resume.detail.edit"/>
                        </a>
                    </#if>
                    <a href="/resumes" class="btn btn-primary">
                        <i class="bi bi-arrow-left"></i> <@spring.message "resume.detail.back"/>
                    </a>
                </div>
            </div>


            <#if resumeDto.contactInfoList?? && resumeDto.contactInfoList?size gt 0>
                <div class="section">
                    <h2 class="section-title">
                        <i class="bi bi-person-lines-fill"></i> <@spring.message "resume.detail.contactInformation"/>
                    </h2>
                    <div class="section-content">
                        <#list resumeDto.contactInfoList as contact>
                            <#if contact?? && contact.value?? && contact.value?has_content>
                                <div class="contact-item">
                                    <div class="contact-icon">
                                        <#if contact.contactType?? && contact.contactType.type??>
                                            <#if contact.contactType.type == "Телефон">
                                                <i class="bi bi-telephone"></i>
                                            <#elseif contact.contactType.type == "Email">
                                                <i class="bi bi-envelope"></i>
                                            <#elseif contact.contactType.type == "Telegram">
                                                <i class="bi bi-telegram"></i>
                                            <#elseif contact.contactType.type == "WhatsApp">
                                                <i class="bi bi-whatsapp"></i>
                                            <#else>
                                                <i class="bi bi-chat-dots"></i>
                                            </#if>
                                        <#else>
                                            <i class="bi bi-chat-dots"></i>
                                        </#if>
                                    </div>
                                    <div class="contact-info">
                                        <div class="contact-type">
                                            ${(contact.contactType.type)!"Контакт"}
                                        </div>
                                        <div class="contact-value">
                                            ${contact.value}
                                        </div>
                                    </div>
                                </div>
                            </#if>
                        </#list>
                    </div>
                </div>
            </#if>


            <#if resumeDto.workExperienceInfoList?? && resumeDto.workExperienceInfoList?size gt 0>
                <div class="section">
                    <h2 class="section-title">
                        <i class="bi bi-briefcase"></i> <@spring.message "resume.detail.workExperience"/>
                    </h2>
                    <div class="section-content">
                        <#list resumeDto.workExperienceInfoList as experience>
                            <#if experience??>
                                <div class="experience-item">
                                    <div class="experience-header">
                                        <#if experience.companyName?? && experience.companyName?has_content>
                                            <div class="company-name">${experience.companyName}</div>
                                        </#if>
                                        <#if experience.years??>
                                            <div class="experience-years">
                                                ${experience.years}
                                                <#if experience.years == 1>
                                                    <@spring.message "resume.detail.year"/>
                                                <#elseif experience.years gt 1 && experience.years lt 5>
                                                    <@spring.message "resume.detail.years2to4"/>
                                                <#else>
                                                    <@spring.message "resume.detail.years5plus"/>
                                                </#if>
                                            </div>
                                        </#if>
                                    </div>
                                    <#if experience.position?? && experience.position?has_content>
                                        <div class="position-title">${experience.position}</div>
                                    </#if>
                                    <#if experience.responsibilities?? && experience.responsibilities?has_content>
                                        <div class="responsibilities">${experience.responsibilities}</div>
                                    </#if>
                                </div>
                            </#if>
                        </#list>
                    </div>
                </div>
            </#if>


            <#if resumeDto.educationInfoList?? && resumeDto.educationInfoList?size gt 0>
                <div class="section">
                    <h2 class="section-title">
                        <i class="bi bi-mortarboard"></i> <@spring.message "resume.detail.education"/>
                    </h2>
                    <div class="section-content">
                        <#list resumeDto.educationInfoList as education>
                            <#if education??>
                                <div class="education-item">
                                    <div class="education-header">
                                        <#if education.institution?? && education.institution?has_content>
                                            <div class="institution-name">${education.institution}</div>
                                        </#if>
                                        <div class="education-years">
                                            <#if education.startDate??>
                                                ${education.startDate?string("yyyy")}
                                            </#if>
                                            <#if education.startDate?? && education.endDate??>
                                                -
                                            </#if>
                                            <#if education.endDate??>
                                                ${education.endDate?string("yyyy")}
                                            </#if>
                                        </div>
                                    </div>
                                    <#if education.program?? && education.program?has_content>
                                        <div class="program-title">${education.program}</div>
                                    </#if>
                                    <#if education.degree?? && education.degree?has_content>
                                        <div class="degree">${education.degree}</div>
                                    </#if>
                                </div>
                            </#if>
                        </#list>
                    </div>
                </div>
            </#if>
        </div>
    </div>
</@main.layout>