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

                    <div id="work-experience-container">
                        <#if resumeDto.workExperienceInfoList?? && resumeDto.workExperienceInfoList?size gt 0>
                            <#list resumeDto.workExperienceInfoList as workExp>
                                <div class="card-item work-experience-item">
                                    <div class="card-header d-flex justify-content-between align-items-center">
                                        <h3 class="card-title"><@spring.message "resume.edit.workplace"/></h3>
                                        <button type="button" class="btn btn-sm btn-outline-danger remove-item" onclick="removeItem(this)">
                                            <i class="bi bi-trash"></i> <@spring.message "resume.create.remove"/>
                                        </button>
                                    </div>

                                    <div class="row mb-4">
                                        <div class="col-md-6">
                                            <label for="workExperienceInfoList${workExp_index}.companyName" class="form-label"><@spring.message "resume.edit.companyName"/></label>
                                            <input type="text" class="form-control" id="workExperienceInfoList${workExp_index}.companyName"
                                                   name="workExperienceInfoList[${workExp_index}].companyName"
                                                   value="${(workExp.companyName)!''}">
                                        </div>
                                        <div class="col-md-6">
                                            <label for="workExperienceInfoList${workExp_index}.position" class="form-label"><@spring.message "resume.edit.position"/></label>
                                            <input type="text" class="form-control" id="workExperienceInfoList${workExp_index}.position"
                                                   name="workExperienceInfoList[${workExp_index}].position"
                                                   value="${(workExp.position)!''}">
                                        </div>
                                    </div>

                                    <div class="mb-4">
                                        <label for="workExperienceInfoList${workExp_index}.years" class="form-label"><@spring.message "resume.edit.yearsOfExperience"/></label>
                                        <input type="number" class="form-control" id="workExperienceInfoList${workExp_index}.years"
                                               name="workExperienceInfoList[${workExp_index}].years"
                                               value="${(workExp.years)!''}"
                                               min="0">
                                    </div>

                                    <div class="mb-4">
                                        <label for="workExperienceInfoList${workExp_index}.responsibilities" class="form-label"><@spring.message "resume.edit.responsibilities"/></label>
                                        <textarea class="form-control" id="workExperienceInfoList${workExp_index}.responsibilities"
                                                  name="workExperienceInfoList[${workExp_index}].responsibilities"
                                                  rows="4">${(workExp.responsibilities)!''}</textarea>
                                    </div>

                                    <#if (workExp.id)??>
                                        <input type="hidden" name="workExperienceInfoList[${workExp_index}].id" value="${workExp.id}">
                                    </#if>
                                </div>
                            </#list>
                        </#if>
                    </div>

                    <div class="mt-3">
                        <button type="button" class="btn btn-outline-primary" onclick="addWorkExperience()">
                            <i class="bi bi-plus-circle"></i> <@spring.message "resume.create.addWorkExperience"/>
                        </button>
                    </div>
                </div>

                <div class="form-section">
                    <h2 class="form-section-title">
                        <i class="bi bi-mortarboard"></i> <@spring.message "resume.edit.education"/>
                    </h2>

                    <div id="education-container">
                        <#if resumeDto.educationInfoList?? && resumeDto.educationInfoList?size gt 0>
                            <#list resumeDto.educationInfoList as education>
                                <div class="card-item education-item">
                                    <div class="card-header d-flex justify-content-between align-items-center">
                                        <h3 class="card-title"><@spring.message "resume.edit.educationInstitution"/></h3>
                                        <button type="button" class="btn btn-sm btn-outline-danger remove-item" onclick="removeItem(this)">
                                            <i class="bi bi-trash"></i> <@spring.message "resume.create.remove"/>
                                        </button>
                                    </div>

                                    <div class="row mb-4">
                                        <div class="col-md-6">
                                            <label for="educationInfoList${education_index}.institution" class="form-label"><@spring.message "resume.edit.institutionName"/></label>
                                            <input type="text" class="form-control" id="educationInfoList${education_index}.institution"
                                                   name="educationInfoList[${education_index}].institution"
                                                   value="${(education.institution)!''}">
                                        </div>
                                        <div class="col-md-6">
                                            <label for="educationInfoList${education_index}.program" class="form-label"><@spring.message "resume.edit.program"/></label>
                                            <input type="text" class="form-control" id="educationInfoList${education_index}.program"
                                                   name="educationInfoList[${education_index}].program"
                                                   value="${(education.program)!''}">
                                        </div>
                                    </div>

                                    <div class="row mb-4">
                                        <div class="col-md-6">
                                            <label for="educationInfoList${education_index}.startDate" class="form-label"><@spring.message "resume.edit.startDate"/></label>
                                            <input type="date" class="form-control" id="educationInfoList${education_index}.startDate"
                                                   name="educationInfoList[${education_index}].startDate"
                                                   value="${(education.startDate?string('yyyy-MM-dd'))!''}">
                                        </div>
                                        <div class="col-md-6">
                                            <label for="educationInfoList${education_index}.endDate" class="form-label"><@spring.message "resume.edit.endDate"/></label>
                                            <input type="date" class="form-control" id="educationInfoList${education_index}.endDate"
                                                   name="educationInfoList[${education_index}].endDate"
                                                   value="${(education.endDate?string('yyyy-MM-dd'))!''}">
                                            <div class="form-text"><@spring.message "resume.edit.endDateNote"/></div>
                                        </div>
                                    </div>

                                    <div class="mb-4">
                                        <label for="educationInfoList${education_index}.degree" class="form-label"><@spring.message "resume.edit.degree"/></label>
                                        <select class="form-select" id="educationInfoList${education_index}.degree"
                                                name="educationInfoList[${education_index}].degree">
                                            <option value="" disabled <#if !(education.degree)??>selected</#if>><@spring.message "resume.edit.selectDegree"/></option>
                                            <option value="Бакалавр" <#if (education.degree)?? && education.degree == 'Бакалавр'>selected</#if>>Бакалавр</option>
                                            <option value="Магистр" <#if (education.degree)?? && education.degree == 'Магистр'>selected</#if>>Магистр</option>
                                            <option value="Специалист" <#if (education.degree)?? && education.degree == 'Специалист'>selected</#if>>Специалист</option>
                                            <option value="Кандидат наук" <#if (education.degree)?? && education.degree == 'Кандидат наук'>selected</#if>>Кандидат наук</option>
                                            <option value="Доктор наук" <#if (education.degree)?? && education.degree == 'Доктор наук'>selected</#if>>Доктор наук</option>
                                        </select>
                                    </div>

                                    <#if (education.id)??>
                                        <input type="hidden" name="educationInfoList[${education_index}].id" value="${education.id}">
                                    </#if>
                                </div>
                            </#list>
                        </#if>
                    </div>

                    <div class="mt-3">
                        <button type="button" class="btn btn-outline-primary" onclick="addEducation()">
                            <i class="bi bi-plus-circle"></i> <@spring.message "resume.create.addEducation"/>
                        </button>
                    </div>
                </div>

                <div class="form-section">
                    <h2 class="form-section-title">
                        <i class="bi bi-person-lines-fill"></i> <@spring.message "resume.edit.contactInformation"/>
                    </h2>

                    <div id="contact-container">
                        <#if resumeDto.contactInfoList?? && resumeDto.contactInfoList?size gt 0>
                            <#list resumeDto.contactInfoList as contact>
                                <div class="card-item contact-item">
                                    <div class="card-header d-flex justify-content-between align-items-center">
                                        <h3 class="card-title"><@spring.message "resume.edit.contact"/></h3>
                                        <button type="button" class="btn btn-sm btn-outline-danger remove-item" onclick="removeItem(this)">
                                            <i class="bi bi-trash"></i> <@spring.message "resume.create.remove"/>
                                        </button>
                                    </div>

                                    <div class="row mb-4">
                                        <div class="col-md-6">
                                            <label for="contactInfoList${contact_index}.contactTypeId" class="form-label"><@spring.message "resume.edit.contactType"/></label>
                                            <select class="form-select" id="contactInfoList${contact_index}.contactTypeId"
                                                    name="contactInfoList[${contact_index}].contactTypeId">
                                                <option value="" disabled <#if !(contact.contactTypeId)??><#if !(contact.contactType)?? || !(contact.contactType.id)??>selected</#if></#if>><@spring.message "resume.edit.selectContactType"/></option>
                                                <#if contactTypes??>
                                                    <#list contactTypes as contactType>
                                                        <option value="${contactType.id}"
                                                                <#if (contact.contactTypeId)?? && contact.contactTypeId == contactType.id>selected</#if>
                                                                <#if (contact.contactType)?? && (contact.contactType.id)?? && contact.contactType.id == contactType.id>selected</#if>
                                                        >${contactType.name}</option>
                                                    </#list>
                                                <#else>
                                                    <option value="1" <#if (contact.contactTypeId)?? && contact.contactTypeId == 1>selected<#elseif (contact.contactType)?? && (contact.contactType.id)?? && contact.contactType.id == 1>selected</#if>>Email</option>
                                                    <option value="2" <#if (contact.contactTypeId)?? && contact.contactTypeId == 2>selected<#elseif (contact.contactType)?? && (contact.contactType.id)?? && contact.contactType.id == 2>selected</#if>>Телефон</option>
                                                    <option value="3" <#if (contact.contactTypeId)?? && contact.contactTypeId == 3>selected<#elseif (contact.contactType)?? && (contact.contactType.id)?? && contact.contactType.id == 3>selected</#if>>Telegram</option>
                                                    <option value="4" <#if (contact.contactTypeId)?? && contact.contactTypeId == 4>selected<#elseif (contact.contactType)?? && (contact.contactType.id)?? && contact.contactType.id == 4>selected</#if>>WhatsApp</option>
                                                    <option value="5" <#if (contact.contactTypeId)?? && contact.contactTypeId == 5>selected<#elseif (contact.contactType)?? && (contact.contactType.id)?? && contact.contactType.id == 5>selected</#if>>Facebook</option>
                                                    <option value="6" <#if (contact.contactTypeId)?? && contact.contactTypeId == 6>selected<#elseif (contact.contactType)?? && (contact.contactType.id)?? && contact.contactType.id == 6>selected</#if>>LinkedIn</option>
                                                    <option value="7" <#if (contact.contactTypeId)?? && contact.contactTypeId == 7>selected<#elseif (contact.contactType)?? && (contact.contactType.id)?? && contact.contactType.id == 7>selected</#if>>Skype</option>
                                                    <option value="8" <#if (contact.contactTypeId)?? && contact.contactTypeId == 8>selected<#elseif (contact.contactType)?? && (contact.contactType.id)?? && contact.contactType.id == 8>selected</#if>>GitHub</option>
                                                    <option value="9" <#if (contact.contactTypeId)?? && contact.contactTypeId == 9>selected<#elseif (contact.contactType)?? && (contact.contactType.id)?? && contact.contactType.id == 9>selected</#if>>Личный сайт</option>
                                                    <option value="10" <#if (contact.contactTypeId)?? && contact.contactTypeId == 10>selected<#elseif (contact.contactType)?? && (contact.contactType.id)?? && contact.contactType.id == 10>selected</#if>>VK</option>
                                                    <option value="11" <#if (contact.contactTypeId)?? && contact.contactTypeId == 11>selected<#elseif (contact.contactType)?? && (contact.contactType.id)?? && contact.contactType.id == 11>selected</#if>>Instagram</option>
                                                </#if>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="contactInfoList${contact_index}.value" class="form-label"><@spring.message "resume.edit.contactValue"/></label>
                                            <input type="text" class="form-control" id="contactInfoList${contact_index}.value"
                                                   name="contactInfoList[${contact_index}].value"
                                                   value="${(contact.value)!''}">
                                        </div>
                                    </div>

                                    <#if (contact.id)??>
                                        <input type="hidden" name="contactInfoList[${contact_index}].id" value="${contact.id}">
                                    </#if>
                                </div>
                            </#list>
                        </#if>
                    </div>

                    <div class="mt-3">
                        <button type="button" class="btn btn-outline-primary" onclick="addContact()">
                            <i class="bi bi-plus-circle"></i> <@spring.message "resume.create.addContact"/>
                        </button>
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

    <script>
        let workExpCounter = ${(resumeDto.workExperienceInfoList?size)!0};
        let educationCounter = ${(resumeDto.educationInfoList?size)!0};
        let contactCounter = ${(resumeDto.contactInfoList?size)!0};

        const workExperienceTemplate = `
            <div class="card-item work-experience-item">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h3 class="card-title"><@spring.message "resume.edit.workplace"/></h3>
                    <button type="button" class="btn btn-sm btn-outline-danger remove-item" onclick="removeItem(this)">
                        <i class="bi bi-trash"></i> <@spring.message "resume.create.remove"/>
                    </button>
                </div>

                <div class="row mb-4">
                    <div class="col-md-6">
                        <label for="workExperienceInfoList{index}.companyName" class="form-label"><@spring.message "resume.edit.companyName"/></label>
                        <input type="text" class="form-control" id="workExperienceInfoList{index}.companyName"
                               name="workExperienceInfoList[{index}].companyName">
                    </div>
                    <div class="col-md-6">
                        <label for="workExperienceInfoList{index}.position" class="form-label"><@spring.message "resume.edit.position"/></label>
                        <input type="text" class="form-control" id="workExperienceInfoList{index}.position"
                               name="workExperienceInfoList[{index}].position">
                    </div>
                </div>

                <div class="mb-4">
                    <label for="workExperienceInfoList{index}.years" class="form-label"><@spring.message "resume.edit.yearsOfExperience"/></label>
                    <input type="number" class="form-control" id="workExperienceInfoList{index}.years"
                           name="workExperienceInfoList[{index}].years" min="0">
                </div>

                <div class="mb-4">
                    <label for="workExperienceInfoList{index}.responsibilities" class="form-label"><@spring.message "resume.edit.responsibilities"/></label>
                    <textarea class="form-control" id="workExperienceInfoList{index}.responsibilities"
                              name="workExperienceInfoList[{index}].responsibilities"
                              rows="4"></textarea>
                </div>
            </div>
        `;

        const educationTemplate = `
            <div class="card-item education-item">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h3 class="card-title"><@spring.message "resume.edit.educationInstitution"/></h3>
                    <button type="button" class="btn btn-sm btn-outline-danger remove-item" onclick="removeItem(this)">
                        <i class="bi bi-trash"></i> <@spring.message "resume.create.remove"/>
                    </button>
                </div>

                <div class="row mb-4">
                    <div class="col-md-6">
                        <label for="educationInfoList{index}.institution" class="form-label"><@spring.message "resume.edit.institutionName"/></label>
                        <input type="text" class="form-control" id="educationInfoList{index}.institution"
                               name="educationInfoList[{index}].institution">
                    </div>
                    <div class="col-md-6">
                        <label for="educationInfoList{index}.program" class="form-label"><@spring.message "resume.edit.program"/></label>
                        <input type="text" class="form-control" id="educationInfoList{index}.program"
                               name="educationInfoList[{index}].program">
                    </div>
                </div>

                <div class="row mb-4">
                    <div class="col-md-6">
                        <label for="educationInfoList{index}.startDate" class="form-label"><@spring.message "resume.edit.startDate"/></label>
                        <input type="date" class="form-control" id="educationInfoList{index}.startDate"
                               name="educationInfoList[{index}].startDate">
                    </div>
                    <div class="col-md-6">
                        <label for="educationInfoList{index}.endDate" class="form-label"><@spring.message "resume.edit.endDate"/></label>
                        <input type="date" class="form-control" id="educationInfoList{index}.endDate"
                               name="educationInfoList[{index}].endDate">
                        <div class="form-text"><@spring.message "resume.edit.endDateNote"/></div>
                    </div>
                </div>

                <div class="mb-4">
                    <label for="educationInfoList{index}.degree" class="form-label"><@spring.message "resume.edit.degree"/></label>
                    <select class="form-select" id="educationInfoList{index}.degree"
                            name="educationInfoList[{index}].degree">
                        <option value="" selected disabled><@spring.message "resume.edit.selectDegree"/></option>
                        <option value="Бакалавр">Бакалавр</option>
                        <option value="Магистр">Магистр</option>
                        <option value="Специалист">Специалист</option>
                        <option value="Кандидат наук">Кандидат наук</option>
                        <option value="Доктор наук">Доктор наук</option>
                    </select>
                </div>
            </div>
        `;

        const contactTemplate = `
            <div class="card-item contact-item">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h3 class="card-title"><@spring.message "resume.edit.contact"/></h3>
                    <button type="button" class="btn btn-sm btn-outline-danger remove-item" onclick="removeItem(this)">
                        <i class="bi bi-trash"></i> <@spring.message "resume.create.remove"/>
                    </button>
                </div>

                <div class="row mb-4">
                    <div class="col-md-6">
                        <label for="contactInfoList{index}.contactTypeId" class="form-label"><@spring.message "resume.edit.contactType"/></label>
                        <select class="form-select" id="contactInfoList{index}.contactTypeId"
                                name="contactInfoList[{index}].contactTypeId">
                            <option value="" selected disabled><@spring.message "resume.edit.selectContactType"/></option>
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
                        <label for="contactInfoList{index}.value" class="form-label"><@spring.message "resume.edit.contactValue"/></label>
                        <input type="text" class="form-control" id="contactInfoList{index}.value"
                               name="contactInfoList[{index}].value">
                    </div>
                </div>
            </div>
        `;

        function addWorkExperience() {
            const container = document.getElementById('work-experience-container');
            const html = workExperienceTemplate.replace(/{index}/g, workExpCounter);

            const temp = document.createElement('div');
            temp.innerHTML = html;

            container.appendChild(temp.firstElementChild);
            workExpCounter++;
        }

        function addEducation() {
            const container = document.getElementById('education-container');
            const html = educationTemplate.replace(/{index}/g, educationCounter);

            const temp = document.createElement('div');
            temp.innerHTML = html;

            container.appendChild(temp.firstElementChild);
            educationCounter++;
        }

        function addContact() {
            const container = document.getElementById('contact-container');
            const html = contactTemplate.replace(/{index}/g, contactCounter);

            const temp = document.createElement('div');
            temp.innerHTML = html;

            container.appendChild(temp.firstElementChild);
            contactCounter++;
        }


        function removeItem(button) {
            const item = button.closest('.card-item');

            const hiddenFields = item.querySelectorAll('input[type="hidden"][name$=".id"]');

            hiddenFields.forEach(field => {
                const name = field.getAttribute('name');
                const value = field.value;

                if (value) {
                    const deletedField = document.createElement('input');
                    deletedField.type = 'hidden';
                    deletedField.name = name.replace('.id', '.deleted');
                    deletedField.value = 'true';

                    document.querySelector('form').appendChild(deletedField);
                }
            });

            item.remove();
        }

        document.addEventListener('DOMContentLoaded', function() {
            function updateRemoveButtons() {

            }

            updateRemoveButtons();
        });
    </script>
</@main.layout>