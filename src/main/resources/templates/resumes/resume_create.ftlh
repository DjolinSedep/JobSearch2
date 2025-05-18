<#import "../layout.ftlh" as main>
<#assign pageStyles>
    <link rel="stylesheet" href="/static/css/resumes/resume_create.css" />
</#assign>

<@main.layout pageStyles=pageStyles; spring>


    <div class="container py-5">
        <div class="resume-container">
            <h1 class="page-header"><@spring.message "resume.create.title"/></h1>

            <#if error??>
                <div class="alert alert-error">
                    <i class="bi bi-exclamation-triangle me-2"></i> ${error}
                </div>
            </#if>

            <form action="/resumes/create" method="post">
                <#if _csrf??>
                    <input type="hidden" name="${(_csrf.parameterName)!'csrf-param-name'}"
                           value="${(_csrf.token)!'csrf-token'}"/>
                </#if>

                <div class="form-section">
                    <h2 class="form-section-title">
                        <i class="bi bi-info-circle"></i> <@spring.message "resume.create.basicInfo"/>
                    </h2>

                    <div class="mb-4">
                        <label for="name" class="form-label required-field"><@spring.message "resume.create.resumeName"/></label>
                        <@spring.formInput "resumeDto.name" 'id="name" class="form-control"' />
                        <@spring.showErrors "<br>" "error-message" />
                    </div>

                    <div class="mb-4">
                        <label for="categoryId" class="form-label required-field"><@spring.message "resume.create.category"/></label>
                        <select class="form-select" id="categoryId" name="categoryId" required>
                            <option value="" selected disabled><@spring.message "resume.create.selectCategory"/></option>
                            <#if categories??>
                                <#list categories as category>
                                    <option value="${category.id}" <#if (resumeDto.categoryId)?? && resumeDto.categoryId == category.id>selected</#if>>${category.name}</option>
                                </#list>
                            </#if>
                        </select>
                    </div>

                    <div class="mb-4">
                        <label for="salary" class="form-label required-field"><@spring.message "resume.create.desiredSalary"/> (₽)</label>
                        <@spring.formInput "resumeDto.salary" 'id="salary" class="form-control" type="number"' />
                        <@spring.showErrors "<br>" "error-message" />
                        <div class="form-text"><@spring.message "resume.create.salaryInRubles"/></div>
                    </div>

                    <div class="form-check form-switch mb-4">
                        <input class="form-check-input" type="checkbox" id="isActive" name="isActive" value="true" checked>
                        <label class="form-check-label" for="isActive"><@spring.message "resume.create.publishResume"/></label>
                        <div class="form-text">
                            <@spring.message "resume.create.publishResumeDescription"/>
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <h2 class="form-section-title">
                        <i class="bi bi-briefcase"></i> <@spring.message "resume.create.workExperience"/>
                    </h2>

                    <div class="card-item">
                        <div class="card-header">
                            <h3 class="card-title"><@spring.message "resume.create.workplace"/></h3>
                        </div>

                        <div class="row mb-4">
                            <div class="col-md-6">
                                <label for="workExperienceInfoList0.companyName" class="form-label"><@spring.message "resume.create.companyName"/></label>
                                <input type="text" class="form-control" id="workExperienceInfoList0.companyName"
                                       name="workExperienceInfoList[0].companyName">
                            </div>
                            <div class="col-md-6">
                                <label for="workExperienceInfoList0.position" class="form-label"><@spring.message "resume.create.position"/></label>
                                <input type="text" class="form-control" id="workExperienceInfoList0.position"
                                       name="workExperienceInfoList[0].position">
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="workExperienceInfoList0.years" class="form-label"><@spring.message "resume.create.yearsOfExperience"/></label>
                            <input type="number" class="form-control" id="workExperienceInfoList0.years"
                                   name="workExperienceInfoList[0].years" min="0">
                        </div>

                        <div class="mb-4">
                            <label for="workExperienceInfoList0.responsibilities" class="form-label"><@spring.message "resume.create.responsibilities"/></label>
                            <textarea class="form-control" id="workExperienceInfoList0.responsibilities"
                                      name="workExperienceInfoList[0].responsibilities"
                                      rows="4"></textarea>
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <h2 class="form-section-title">
                        <i class="bi bi-mortarboard"></i> <@spring.message "resume.create.education"/>
                    </h2>

                    <div class="card-item">
                        <div class="card-header">
                            <h3 class="card-title"><@spring.message "resume.create.educationInstitution"/></h3>
                        </div>

                        <div class="row mb-4">
                            <div class="col-md-6">
                                <label for="educationInfoList0.institution" class="form-label"><@spring.message "resume.create.institutionName"/></label>
                                <input type="text" class="form-control" id="educationInfoList0.institution"
                                       name="educationInfoList[0].institution">
                            </div>
                            <div class="col-md-6">
                                <label for="educationInfoList0.program" class="form-label"><@spring.message "resume.create.program"/></label>
                                <input type="text" class="form-control" id="educationInfoList0.program"
                                       name="educationInfoList[0].program">
                            </div>
                        </div>

                        <div class="row mb-4">
                            <div class="col-md-6">
                                <label for="educationInfoList0.startDate" class="form-label"><@spring.message "resume.create.startDate"/></label>
                                <input type="date" class="form-control" id="educationInfoList0.startDate"
                                       name="educationInfoList[0].startDate">
                            </div>
                            <div class="col-md-6">
                                <label for="educationInfoList0.endDate" class="form-label"><@spring.message "resume.create.endDate"/></label>
                                <input type="date" class="form-control" id="educationInfoList0.endDate"
                                       name="educationInfoList[0].endDate">
                                <div class="form-text"><@spring.message "resume.create.endDateNote"/></div>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="educationInfoList0.degree" class="form-label"><@spring.message "resume.create.degree"/></label>
                            <select class="form-select" id="educationInfoList0.degree"
                                    name="educationInfoList[0].degree">
                                <option value="" selected disabled><@spring.message "resume.create.selectDegree"/></option>
                                <option value="Бакалавр">Бакалавр</option>
                                <option value="Магистр">Магистр</option>
                                <option value="Специалист">Специалист</option>
                                <option value="Кандидат наук">Кандидат наук</option>
                                <option value="Доктор наук">Доктор наук</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <h2 class="form-section-title">
                        <i class="bi bi-person-lines-fill"></i> <@spring.message "resume.create.contactInformation"/>
                    </h2>

                    <div class="card-item">
                        <div class="card-header">
                            <h3 class="card-title"><@spring.message "resume.create.contact"/></h3>
                        </div>

                        <div class="row mb-4">
                            <div class="col-md-6">
                                <label for="contactInfoList0.contactTypeId" class="form-label"><@spring.message "resume.create.contactType"/></label>
                                <select class="form-select" id="contactInfoList0.contactTypeId"
                                        name="contactInfoList[0].contactType.id">
                                    <option value="" selected disabled><@spring.message "resume.create.selectContactType"/></option>
                                    <#if contactTypes??>
                                        <#list contactTypes as contactType>
                                            <option value="${contactType.id}">${contactType.name}</option>
                                        </#list>
                                    <#else>
                                        <option value="1">Email</option>
                                        <option value="2">Телефон</option>
                                        <option value="3">Telegram</option>
                                        <option value="4">WhatsApp</option>
                                        <option value="5">Facebook</option>
                                        <option value="6">LinkedIn</option>
                                        <option value="7">Skype</option>
                                        <option value="8">GitHub</option>
                                        <option value="9">Личный сайт</option>
                                        <option value="10">VK</option>
                                        <option value="11">Instagram</option>
                                    </#if>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="contactInfoList0.value" class="form-label"><@spring.message "resume.create.contactValue"/></label>
                                <input type="text" class="form-control" id="contactInfoList0.value"
                                       name="contactInfoList[0].value">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-actions">
                    <a href="/users/profile" class="btn btn-cancel">
                        <i class="bi bi-arrow-left"></i> <@spring.message "resume.create.cancel"/>
                    </a>
                    <button type="submit" class="btn btn-submit">
                        <i class="bi bi-check-lg"></i> <@spring.message "resume.create.submit"/>
                    </button>
                </div>
            </form>
        </div>
    </div>
</@main.layout>