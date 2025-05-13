<#import "../layout.ftlh" as main>
<#assign pageStyles>
    <link rel="stylesheet" href="/static/css/resumes/resume_edit.css" />
</#assign>

<@main.layout pageStyles=pageStyles; spring>


    <div class="container py-5">
        <div class="resume-container">
            <h1 class="page-header"><@spring.message "resume.edit.title"/></h1>

            <#if error??>
                <div class="alert alert-error">
                    <i class="bi bi-exclamation-triangle me-2"></i> ${error}
                </div>
            </#if>

            <form action="/resumes/edit/${resumeDto.id}" method="post">
                <#if _csrf??>
                    <input type="hidden" name="${(_csrf.parameterName)!'csrf-param-name'}"
                           value="${(_csrf.token)!'csrf-token'}"/>
                </#if>

                <input type="hidden" name="id" value="${resumeDto.id}">

                <div class="form-section">
                    <h2 class="form-section-title">
                        <i class="bi bi-info-circle"></i> <@spring.message "resume.edit.basicInfo"/>
                    </h2>

                    <div class="mb-4">
                        <label for="name" class="form-label"><@spring.message "resume.edit.resumeName"/></label>
                        <@spring.formInput "resumeDto.name" 'id="name" class="form-control"' />
                        <@spring.showErrors "<br>" "error-message" />
                    </div>

                    <div class="mb-4">
                        <label for="categoryId" class="form-label"><@spring.message "resume.edit.category"/></label>
                        <select class="form-select" id="categoryId" name="categoryId" required>
                            <option value="" disabled><@spring.message "resume.edit.selectCategory"/></option>
                            <#if categories??>
                                <#list categories as category>
                                    <option value="${category.id}" <#if (resumeDto.categoryId)?? && resumeDto.categoryId == category.id>selected</#if>>${category.name}</option>
                                </#list>
                            </#if>
                        </select>
                    </div>

                    <div class="mb-4">
                        <label for="salary" class="form-label"><@spring.message "resume.edit.desiredSalary"/> (₽)</label>
                        <@spring.formInput "resumeDto.salary" 'id="salary" class="form-control" type="number"' />
                        <@spring.showErrors "<br>" "error-message" />
                        <div class="form-text"><@spring.message "resume.edit.salaryInRubles"/></div>
                    </div>

                    <div class="form-check form-switch mb-4">
                        <input class="form-check-input" type="checkbox" id="isActive" name="isActive" value="true" <#if (resumeDto.isActive)!false>checked</#if>>
                        <label class="form-check-label" for="isActive"><@spring.message "resume.edit.publishResume"/></label>
                        <div class="form-text">
                            <@spring.message "resume.edit.publishResumeDescription"/>
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <h2 class="form-section-title">
                        <i class="bi bi-briefcase"></i> <@spring.message "resume.edit.workExperience"/>
                    </h2>

                    <div class="card-item">
                        <div class="card-header">
                            <h3 class="card-title"><@spring.message "resume.edit.workplace"/></h3>
                        </div>

                        <div class="row mb-4">
                            <div class="col-md-6">
                                <label for="workExperienceInfoList0.companyName" class="form-label"><@spring.message "resume.edit.companyName"/></label>
                                <input type="text" class="form-control" id="workExperienceInfoList0.companyName"
                                       name="workExperienceInfoList[0].companyName"
                                       value="${(resumeDto.workExperienceInfoList[0].companyName)!''}">
                            </div>
                            <div class="col-md-6">
                                <label for="workExperienceInfoList0.position" class="form-label"><@spring.message "resume.edit.position"/></label>
                                <input type="text" class="form-control" id="workExperienceInfoList0.position"
                                       name="workExperienceInfoList[0].position"
                                       value="${(resumeDto.workExperienceInfoList[0].position)!''}">
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="workExperienceInfoList0.years" class="form-label"><@spring.message "resume.edit.yearsOfExperience"/></label>
                            <input type="number" class="form-control" id="workExperienceInfoList0.years"
                                   name="workExperienceInfoList[0].years"
                                   value="${(resumeDto.workExperienceInfoList[0].years)!''}"
                                   min="0">
                        </div>

                        <div class="mb-4">
                            <label for="workExperienceInfoList0.responsibilities" class="form-label"><@spring.message "resume.edit.responsibilities"/></label>
                            <textarea class="form-control" id="workExperienceInfoList0.responsibilities"
                                      name="workExperienceInfoList[0].responsibilities"
                                      rows="4">${(resumeDto.workExperienceInfoList[0].responsibilities)!''}</textarea>
                        </div>

                        <#if (resumeDto.workExperienceInfoList[0].id)??>
                            <input type="hidden" name="workExperienceInfoList[0].id" value="${resumeDto.workExperienceInfoList[0].id}">
                        </#if>
                    </div>
                </div>

                <div class="form-section">
                    <h2 class="form-section-title">
                        <i class="bi bi-mortarboard"></i> <@spring.message "resume.edit.education"/>
                    </h2>

                    <div class="card-item">
                        <div class="card-header">
                            <h3 class="card-title"><@spring.message "resume.edit.educationInstitution"/></h3>
                        </div>

                        <div class="row mb-4">
                            <div class="col-md-6">
                                <label for="educationInfoList0.institution" class="form-label"><@spring.message "resume.edit.institutionName"/></label>
                                <input type="text" class="form-control" id="educationInfoList0.institution"
                                       name="educationInfoList[0].institution"
                                       value="${(resumeDto.educationInfoList[0].institution)!''}">
                            </div>
                            <div class="col-md-6">
                                <label for="educationInfoList0.program" class="form-label"><@spring.message "resume.edit.program"/></label>
                                <input type="text" class="form-control" id="educationInfoList0.program"
                                       name="educationInfoList[0].program"
                                       value="${(resumeDto.educationInfoList[0].program)!''}">
                            </div>
                        </div>

                        <div class="row mb-4">
                            <div class="col-md-6">
                                <label for="educationInfoList0.startDate" class="form-label"><@spring.message "resume.edit.startDate"/></label>
                                <input type="date" class="form-control" id="educationInfoList0.startDate"
                                       name="educationInfoList[0].startDate"
                                       value="${(resumeDto.educationInfoList[0].startDate?string('yyyy-MM-dd'))!''}">
                            </div>
                            <div class="col-md-6">
                                <label for="educationInfoList0.endDate" class="form-label"><@spring.message "resume.edit.endDate"/></label>
                                <input type="date" class="form-control" id="educationInfoList0.endDate"
                                       name="educationInfoList[0].endDate"
                                       value="${(resumeDto.educationInfoList[0].endDate?string('yyyy-MM-dd'))!''}">
                                <div class="form-text"><@spring.message "resume.edit.endDateNote"/></div>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="educationInfoList0.degree" class="form-label"><@spring.message "resume.edit.degree"/></label>
                            <select class="form-select" id="educationInfoList0.degree"
                                    name="educationInfoList[0].degree">
                                <option value="" disabled <#if !(resumeDto.educationInfoList[0].degree)??>selected</#if>><@spring.message "resume.edit.selectDegree"/></option>
                                <option value="Бакалавр" <#if (resumeDto.educationInfoList[0].degree)?? && resumeDto.educationInfoList[0].degree == 'Бакалавр'>selected</#if>>Бакалавр</option>
                                <option value="Магистр" <#if (resumeDto.educationInfoList[0].degree)?? && resumeDto.educationInfoList[0].degree == 'Магистр'>selected</#if>>Магистр</option>
                                <option value="Специалист" <#if (resumeDto.educationInfoList[0].degree)?? && resumeDto.educationInfoList[0].degree == 'Специалист'>selected</#if>>Специалист</option>
                                <option value="Кандидат наук" <#if (resumeDto.educationInfoList[0].degree)?? && resumeDto.educationInfoList[0].degree == 'Кандидат наук'>selected</#if>>Кандидат наук</option>
                                <option value="Доктор наук" <#if (resumeDto.educationInfoList[0].degree)?? && resumeDto.educationInfoList[0].degree == 'Доктор наук'>selected</#if>>Доктор наук</option>
                            </select>
                        </div>

                        <#if (resumeDto.educationInfoList[0].id)??>
                            <input type="hidden" name="educationInfoList[0].id" value="${resumeDto.educationInfoList[0].id}">
                        </#if>
                    </div>
                </div>

                <div class="form-section">
                    <h2 class="form-section-title">
                        <i class="bi bi-person-lines-fill"></i> <@spring.message "resume.edit.contactInformation"/>
                    </h2>

                    <div class="card-item">
                        <div class="card-header">
                            <h3 class="card-title"><@spring.message "resume.edit.contact"/></h3>
                        </div>

                        <div class="row mb-4">
                            <div class="col-md-6">
                                <label for="contactInfoList0.contactTypeId" class="form-label"><@spring.message "resume.edit.contactType"/></label>
                                <select class="form-select" id="contactInfoList0.contactTypeId"
                                        name="contactInfoList[0].contactTypeId">
                                    <option value="" disabled <#if !(resumeDto.contactInfoList[0].contactTypeId)??>selected</#if>><@spring.message "resume.edit.selectContactType"/></option>
                                    <#if contactTypes??>
                                        <#list contactTypes as contactType>
                                            <option value="${contactType.id}" <#if (resumeDto.contactInfoList[0].contactTypeId)?? && resumeDto.contactInfoList[0].contactTypeId == contactType.id>selected</#if>>${contactType.name}</option>
                                        </#list>
                                    <#else>
                                        <option value="1" <#if (resumeDto.contactInfoList[0].contactTypeId)?? && resumeDto.contactInfoList[0].contactTypeId == 1>selected</#if>>Email</option>
                                        <option value="2" <#if (resumeDto.contactInfoList[0].contactTypeId)?? && resumeDto.contactInfoList[0].contactTypeId == 2>selected</#if>>Телефон</option>
                                        <option value="3" <#if (resumeDto.contactInfoList[0].contactTypeId)?? && resumeDto.contactInfoList[0].contactTypeId == 3>selected</#if>>Telegram</option>
                                        <option value="4" <#if (resumeDto.contactInfoList[0].contactTypeId)?? && resumeDto.contactInfoList[0].contactTypeId == 4>selected</#if>>WhatsApp</option>
                                        <option value="5" <#if (resumeDto.contactInfoList[0].contactTypeId)?? && resumeDto.contactInfoList[0].contactTypeId == 5>selected</#if>>Facebook</option>
                                        <option value="6" <#if (resumeDto.contactInfoList[0].contactTypeId)?? && resumeDto.contactInfoList[0].contactTypeId == 6>selected</#if>>LinkedIn</option>
                                        <option value="7" <#if (resumeDto.contactInfoList[0].contactTypeId)?? && resumeDto.contactInfoList[0].contactTypeId == 7>selected</#if>>Skype</option>
                                        <option value="8" <#if (resumeDto.contactInfoList[0].contactTypeId)?? && resumeDto.contactInfoList[0].contactTypeId == 8>selected</#if>>GitHub</option>
                                        <option value="9" <#if (resumeDto.contactInfoList[0].contactTypeId)?? && resumeDto.contactInfoList[0].contactTypeId == 9>selected</#if>>Личный сайт</option>
                                        <option value="10" <#if (resumeDto.contactInfoList[0].contactTypeId)?? && resumeDto.contactInfoList[0].contactTypeId == 10>selected</#if>>VK</option>
                                        <option value="11" <#if (resumeDto.contactInfoList[0].contactTypeId)?? && resumeDto.contactInfoList[0].contactTypeId == 11>selected</#if>>Instagram</option>
                                    </#if>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="contactInfoList0.value" class="form-label"><@spring.message "resume.edit.contactValue"/></label>
                                <input type="text" class="form-control" id="contactInfoList0.value"
                                       name="contactInfoList[0].value"
                                       value="${(resumeDto.contactInfoList[0].value)!''}">
                            </div>
                        </div>

                        <#if (resumeDto.contactInfoList[0].id)??>
                            <input type="hidden" name="contactInfoList[0].id" value="${resumeDto.contactInfoList[0].id}">
                        </#if>
                    </div>
                </div>

                <div class="form-actions">
                    <a href="/users/profile" class="btn btn-cancel">
                        <i class="bi bi-arrow-left"></i> <@spring.message "resume.edit.cancel"/>
                    </a>
                    <button type="submit" class="btn btn-submit">
                        <i class="bi bi-check-lg"></i> <@spring.message "resume.edit.submit"/>
                    </button>
                </div>
            </form>
        </div>
    </div>
</@main.layout>