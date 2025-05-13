<#import "../layout.ftlh" as main>
<#assign pageStyles>
    <link rel="stylesheet" href="/static/css/vacancies/vacancy_edit.css" />
</#assign>

<@main.layout pageStyles=pageStyles; spring>
    <div class="container py-5">
        <div class="edit-vacancy-container">
            <h1 class="page-header"><@spring.message "vacancy.edit.title"/></h1>

            <#if error??>
                <div class="alert alert-error">
                    <i class="bi bi-exclamation-triangle me-2"></i> ${error}
                </div>
            </#if>

            <form action="/vacancies/edit/${vacancyDto.id}" method="post">
                <#if _csrf??>
                    <input type="hidden" name="${(_csrf.parameterName)!'csrf-param-name'}"
                           value="${(_csrf.token)!'csrf-token'}"/>
                </#if>
                <div class="form-section">
                    <h2 class="form-section-title">
                        <i class="bi bi-info-circle"></i> <@spring.message "vacancy.edit.basicInfo"/>
                    </h2>

                    <div class="mb-4">
                        <label for="name" class="form-label required-field"><@spring.message "vacancy.edit.vacancyName"/></label>
                        <@spring.formInput "vacancyDto.name" 'id="name" class="form-control"' />
                        <@spring.showErrors "<br>" "error-message" />
                        <div class="form-text"><@spring.message "vacancy.edit.vacancyNameHint"/></div>
                    </div>

                    <div class="mb-4">
                        <label for="category" class="form-label required-field"><@spring.message "vacancy.edit.category"/></label>
                        <select class="form-select" id="category" name="category.id" required>
                            <option value="" selected disabled><@spring.message "vacancy.edit.selectCategory"/></option>
                            <#if categories??>
                                <#list categories as category>
                                    <option value="${category.id}" <#if (vacancyDto.category)?? && vacancyDto.category.id == category.id>selected</#if>>${category.name}</option>
                                </#list>
                            </#if>
                        </select>
                    </div>

                    <div class="mb-4">
                        <label for="salary" class="form-label required-field"><@spring.message "vacancy.edit.salary"/> (₽)</label>
                        <@spring.formInput "vacancyDto.salary" 'id="salary" class="form-control"' />
                        <@spring.showErrors "<br>" "error-message" />
                        <div class="form-text"><@spring.message "vacancy.edit.salaryHint"/></div>
                    </div>
                </div>

                <div class="form-section">
                    <h2 class="form-section-title">
                        <i class="bi bi-clock-history"></i> <@spring.message "vacancy.edit.requiredExperience"/>
                    </h2>

                    <div class="experience-inputs">
                        <div class="experience-group mb-4">
                            <label for="expFrom" class="form-label required-field"><@spring.message "vacancy.edit.expFrom"/> (<@spring.message "vacancy.edit.years"/>)</label>
                            <@spring.formInput "vacancyDto.expFrom" 'id="expFrom" class="form-control" type="number" min="0"' />
                        </div>

                        <div class="experience-group mb-4">
                            <label for="expTo" class="form-label required-field"><@spring.message "vacancy.edit.expTo"/> (<@spring.message "vacancy.edit.years"/>)</label>
                            <@spring.formInput "vacancyDto.expTo" 'id="expTo" class="form-control" type="number" min="0"' />
                        </div>
                    </div>
                    <div class="form-text"><@spring.message "vacancy.edit.experienceHint"/></div>
                </div>

                <div class="form-section">
                    <h2 class="form-section-title">
                        <i class="bi bi-file-text"></i> <@spring.message "vacancy.edit.vacancyDescription"/>
                    </h2>

                    <div class="mb-4">
                        <label for="description" class="form-label required-field"><@spring.message "vacancy.edit.description"/></label>
                        <@spring.formTextarea "vacancyDto.description" 'id="description" class="form-control" rows="6"' />
                        <@spring.showErrors "<br>" "error-message" />
                        <div class="form-text">
                            <@spring.message "vacancy.edit.descriptionHint"/>
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <h2 class="form-section-title">
                        <i class="bi bi-gear"></i> <@spring.message "vacancy.edit.publishSettings"/>
                    </h2>

                    <div class="form-check form-switch">
                        <@spring.formCheckbox "vacancyDto.isActive" 'id="isActive" class="form-check-input"' />
                        <label class="form-check-label" for="isActive"><@spring.message "vacancy.edit.publishVacancy"/></label>
                    </div>
                    <div class="form-text">
                        <@spring.message "vacancy.edit.publishHint"/>
                    </div>
                </div>

                <div class="form-actions">
                    <a href="/profile" class="btn btn-cancel">
                        <i class="bi bi-arrow-left"></i> <@spring.message "vacancy.edit.cancel"/>
                    </a>
                    <button type="submit" class="btn btn-submit">
                        <i class="bi bi-check-lg"></i> <@spring.message "vacancy.edit.submit"/>
                    </button>
                </div>
            </form>
        </div>
    </div>
</@main.layout>