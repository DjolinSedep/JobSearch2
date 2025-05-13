<#import "../layout.ftlh" as main>
<#assign pageStyles>
    <link rel="stylesheet" href="/static/css/vacancies/vacancy_create.css" />
</#assign>

<@main.layout pageStyles=pageStyles; spring>

    <div class="container py-5">
        <div class="create-vacancy-container">
            <h1 class="page-header"><@spring.message "vacancy.create.title"/></h1>

            <#if error??>
                <div class="alert alert-error">
                    <i class="bi bi-exclamation-triangle me-2"></i> ${error}
                </div>
            </#if>

            <form action="/vacancies/create" method="post">
                <#if _csrf??>
                    <input type="hidden" name="${(_csrf.parameterName)!'csrf-param-name'}"
                           value="${(_csrf.token)!'csrf-token'}"/>
                </#if>
                <div class="form-section">
                    <h2 class="form-section-title">
                        <i class="bi bi-info-circle"></i> <@spring.message "vacancy.create.basicInfo"/>
                    </h2>

                    <div class="mb-1">
                        <label for="name" class="form-label required-field"><@spring.message "vacancy.create.vacancyName"/></label>
                        <@spring.formInput "vacancyDto.name" 'id="name" class="form-control"' />
                        <div class="form-text"><@spring.message "vacancy.create.vacancyNameHint"/></div>
                    </div>
                    <@spring.showErrors "<br>" "text-danger" />

                    <div class="mt-3">
                        <label for="category" class="form-label required-field"><@spring.message "vacancy.create.category"/></label>
                        <select class="form-select" id="category" name="category.id" required>
                            <option value="" selected disabled><@spring.message "vacancy.create.selectCategory"/></option>
                            <#if categories??>
                                <#list categories as category>
                                    <option value="${category.id}" <#if (vacancyDto.category)?? && vacancyDto.category.id == category.id>selected</#if>>${category.name}</option>
                                </#list>
                            </#if>
                        </select>
                    </div>

                    <div class="mt-4">
                        <label for="salary" class="form-label required-field"><@spring.message "vacancy.create.salary"/> (₽)</label>
                        <@spring.formInput "vacancyDto.salary" 'id="salary" class="form-control"' />
                        <div class="form-text"><@spring.message "vacancy.create.salaryHint"/></div>
                    </div>
                    <@spring.showErrors "<br>" "text-danger" />
                </div>

                <div class="form-section">
                    <h2 class="form-section-title">
                        <i class="bi bi-clock-history"></i> <@spring.message "vacancy.create.requiredExperience"/>
                    </h2>

                    <div class="experience-inputs">
                        <div class="experience-group mt-4">
                            <label for="expFrom" class="form-label required-field"><@spring.message "vacancy.create.expFrom"/> (<@spring.message "vacancy.create.years"/>)</label>
                            <@spring.formInput "vacancyDto.expFrom" 'id="expFrom" class="form-control" type="number" min="0"' />
                            <@spring.showErrors "<br>" "text-danger" />
                        </div>

                        <div class="experience-group mt-4">
                            <label for="expTo" class="form-label required-field"><@spring.message "vacancy.create.expTo"/> (<@spring.message "vacancy.create.years"/>)</label>
                            <@spring.formInput "vacancyDto.expTo" 'id="expTo" class="form-control" type="number" min="0"' />
                            <@spring.showErrors "<br>" "text-danger" />
                        </div>

                    </div>
                    <div class="form-text"><@spring.message "vacancy.create.experienceHint"/></div>
                </div>

                <div class="form-section">
                    <h2 class="form-section-title">
                        <i class="bi bi-file-text"></i> <@spring.message "vacancy.create.vacancyDescription"/>
                    </h2>

                    <div class="mt-4">
                        <label for="description" class="form-label required-field"><@spring.message "vacancy.create.description"/></label>
                        <@spring.formTextarea "vacancyDto.description" 'id="description" class="form-control" rows="6"' />
                        <div class="form-text">
                            <@spring.message "vacancy.create.descriptionHint"/>
                        </div>
                    </div>
                    <@spring.showErrors "<br>" "text-danger" />
                </div>

                <div class="form-section">
                    <h2 class="form-section-title">
                        <i class="bi bi-gear"></i> <@spring.message "vacancy.create.publishSettings"/>
                    </h2>

                    <div class="form-check form-switch">
                        <@spring.formCheckbox "vacancyDto.isActive" 'id="isActive" class="form-check-input"' />
                        <label class="form-check-label" for="isActive"><@spring.message "vacancy.create.publishImmediately"/></label>
                    </div>
                    <div class="form-text">
                        <@spring.message "vacancy.create.publishHint"/>
                    </div>
                </div>

                <div class="form-actions">
                    <a href="/users/profile" class="btn btn-cancel">
                        <i class="bi bi-arrow-left"></i> <@spring.message "vacancy.create.cancel"/>
                    </a>
                    <button type="submit" class="btn btn-submit">
                        <i class="bi bi-check-lg"></i> <@spring.message "vacancy.create.submit"/>
                    </button>
                </div>
            </form>
        </div>
    </div>
</@main.layout>