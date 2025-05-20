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

                    <div id="work-experience-container">

                    </div>

                    <div class="mt-3">
                        <button type="button" class="btn btn-outline-primary" onclick="addWorkExperience()">
                            <i class="bi bi-plus-circle"></i> <@spring.message "resume.create.addWorkExperience"/>
                        </button>
                    </div>
                </div>


                <div class="form-section">
                    <h2 class="form-section-title">
                        <i class="bi bi-mortarboard"></i> <@spring.message "resume.create.education"/>
                    </h2>

                    <div id="education-container">

                    </div>

                    <div class="mt-3">
                        <button type="button" class="btn btn-outline-primary" onclick="addEducation()">
                            <i class="bi bi-plus-circle"></i> <@spring.message "resume.create.addEducation"/>
                        </button>
                    </div>
                </div>


                <div class="form-section">
                    <h2 class="form-section-title">
                        <i class="bi bi-person-lines-fill"></i> <@spring.message "resume.create.contactInformation"/>
                    </h2>

                    <div id="contact-container">

                    </div>

                    <div class="mt-3">
                        <button type="button" class="btn btn-outline-primary" onclick="addContact()">
                            <i class="bi bi-plus-circle"></i> <@spring.message "resume.create.addContact"/>
                        </button>
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

    <script>
        let workExpCounter = 0;
        let educationCounter = 0;
        let contactCounter = 0;

        const workExperienceTemplate = `
            <div class="card-item work-experience-item">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h3 class="card-title"><@spring.message "resume.create.workplace"/></h3>
                    <button type="button" class="btn btn-sm btn-outline-danger remove-item" onclick="removeItem(this)">
                        <i class="bi bi-trash"></i> <@spring.message "resume.create.remove"/>
                    </button>
                </div>

                <div class="row mb-4">
                    <div class="col-md-6">
                        <label for="workExperienceInfoList{index}.companyName" class="form-label"><@spring.message "resume.create.companyName"/></label>
                        <input type="text" class="form-control" id="workExperienceInfoList{index}.companyName"
                               name="workExperienceInfoList[{index}].companyName">
                    </div>
                    <div class="col-md-6">
                        <label for="workExperienceInfoList{index}.position" class="form-label"><@spring.message "resume.create.position"/></label>
                        <input type="text" class="form-control" id="workExperienceInfoList{index}.position"
                               name="workExperienceInfoList[{index}].position">
                    </div>
                </div>

                <div class="mb-4">
                    <label for="workExperienceInfoList{index}.years" class="form-label"><@spring.message "resume.create.yearsOfExperience"/></label>
                    <input type="number" class="form-control" id="workExperienceInfoList{index}.years"
                           name="workExperienceInfoList[{index}].years" min="0">
                </div>

                <div class="mb-4">
                    <label for="workExperienceInfoList{index}.responsibilities" class="form-label"><@spring.message "resume.create.responsibilities"/></label>
                    <textarea class="form-control" id="workExperienceInfoList{index}.responsibilities"
                              name="workExperienceInfoList[{index}].responsibilities"
                              rows="4"></textarea>
                </div>
            </div>
        `;

        const educationTemplate = `
            <div class="card-item education-item">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h3 class="card-title"><@spring.message "resume.create.educationInstitution"/></h3>
                    <button type="button" class="btn btn-sm btn-outline-danger remove-item" onclick="removeItem(this)">
                        <i class="bi bi-trash"></i> <@spring.message "resume.create.remove"/>
                    </button>
                </div>

                <div class="row mb-4">
                    <div class="col-md-6">
                        <label for="educationInfoList{index}.institution" class="form-label"><@spring.message "resume.create.institutionName"/></label>
                        <input type="text" class="form-control" id="educationInfoList{index}.institution"
                               name="educationInfoList[{index}].institution">
                    </div>
                    <div class="col-md-6">
                        <label for="educationInfoList{index}.program" class="form-label"><@spring.message "resume.create.program"/></label>
                        <input type="text" class="form-control" id="educationInfoList{index}.program"
                               name="educationInfoList[{index}].program">
                    </div>
                </div>

                <div class="row mb-4">
                    <div class="col-md-6">
                        <label for="educationInfoList{index}.startDate" class="form-label"><@spring.message "resume.create.startDate"/></label>
                        <input type="date" class="form-control" id="educationInfoList{index}.startDate"
                               name="educationInfoList[{index}].startDate">
                    </div>
                    <div class="col-md-6">
                        <label for="educationInfoList{index}.endDate" class="form-label"><@spring.message "resume.create.endDate"/></label>
                        <input type="date" class="form-control" id="educationInfoList{index}.endDate"
                               name="educationInfoList[{index}].endDate">
                        <div class="form-text"><@spring.message "resume.create.endDateNote"/></div>
                    </div>
                </div>

                <div class="mb-4">
                    <label for="educationInfoList{index}.degree" class="form-label"><@spring.message "resume.create.degree"/></label>
                    <select class="form-select" id="educationInfoList{index}.degree"
                            name="educationInfoList[{index}].degree">
                        <option value="" selected disabled><@spring.message "resume.create.selectDegree"/></option>
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
                    <h3 class="card-title"><@spring.message "resume.create.contact"/></h3>
                    <button type="button" class="btn btn-sm btn-outline-danger remove-item" onclick="removeItem(this)">
                        <i class="bi bi-trash"></i> <@spring.message "resume.create.remove"/>
                    </button>
                </div>

                <div class="row mb-4">
                    <div class="col-md-6">
                        <label for="contactInfoList{index}.contactTypeId" class="form-label"><@spring.message "resume.create.contactType"/></label>
                        <select class="form-select" id="contactInfoList{index}.contactTypeId"
                                name="contactInfoList[{index}].contactType.id">
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
                        <label for="contactInfoList{index}.value" class="form-label"><@spring.message "resume.create.contactValue"/></label>
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
            item.remove();
        }



    </script>
</@main.layout>