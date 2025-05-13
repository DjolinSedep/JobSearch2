<#import "../layout.ftlh" as main>
<#assign pageStyles>
    <link rel="stylesheet" href="/static/css/vacancies/vacancies.css" />
</#assign>

<@main.layout pageStyles=pageStyles; spring>

    <div class="vacancies-header">
        <h1><@spring.message "vacancies.list.title"/></h1>
        <p class="text-muted"><@spring.message "vacancies.list.subtitle"/></p>
    </div>

    <div class="search-container">
        <form action="/vacancies" method="get" class="search-form">
            <div class="search-input">
                <i class="bi bi-search search-icon"></i>
                <input type="text" name="search" class="form-control" placeholder="<@spring.message "vacancies.list.searchPlaceholder"/>" value="${(param.search)!}">
            </div>

            <select name="category" class="form-select filter-select">
                <option value=""><@spring.message "vacancies.list.allCategories"/></option>
                <#if categories??>
                    <#list categories as category>
                        <option value="${category.id}" <#if (param.category)?? && param.category == category.id?string>selected</#if>>${category.name}</option>
                    </#list>
                </#if>
            </select>

            <select name="sort" class="form-select filter-select">
                <option value="updateTime" <#if !(param.sort)?? || param.sort == "updateTime">selected</#if>><@spring.message "vacancies.list.sortByDate"/></option>
                <option value="salary" <#if (param.sort)?? && param.sort == "salary">selected</#if>><@spring.message "vacancies.list.sortBySalary"/></option>
            </select>

            <button type="submit" class="btn search-button">
                <i class="bi bi-search me-2"></i> <@spring.message "vacancies.list.search"/>
            </button>
        </form>

        <#if (param.search)?? || (param.category)??>
            <div class="active-filters">
                <#if (param.search)?? && param.search != "">
                    <div class="active-filter">
                        <@spring.message "vacancies.list.searchFilter"/>: ${param.search}
                        <a href="?<#if (param.category)??>category=${param.category}&</#if><#if (param.sort)??>sort=${param.sort}</#if>" class="text-decoration-none">
                            <i class="bi bi-x-circle"></i>
                        </a>
                    </div>
                </#if>

                <#if (param.category)?? && param.category != "">
                    <#list categories as category>
                        <#if category.id?string == param.category>
                            <div class="active-filter">
                                <@spring.message "vacancies.list.categoryFilter"/>: ${category.name}
                                <a href="?<#if (param.search)??>search=${param.search}&</#if><#if (param.sort)??>sort=${param.sort}</#if>" class="text-decoration-none">
                                    <i class="bi bi-x-circle"></i>
                                </a>
                            </div>
                        </#if>
                    </#list>
                </#if>
            </div>
        </#if>
    </div>

    <div class="sort-options">
        <span class="sort-label"><@spring.message "vacancies.list.sortLabel"/>:</span>
        <div class="sort-links">
            <a href="?<#if (param.search)??>search=${param.search}&</#if><#if (param.category)??>category=${param.category}&</#if>sort=updateTime"
               class="sort-link <#if !(param.sort)?? || param.sort == "updateTime">active</#if>">
                <@spring.message "vacancies.list.byDate"/>
            </a>
            <a href="?<#if (param.search)??>search=${param.search}&</#if><#if (param.category)??>category=${param.category}&</#if>sort=salary"
               class="sort-link <#if (param.sort)?? && param.sort == "salary">active</#if>">
                <@spring.message "vacancies.list.bySalary"/>
            </a>
        </div>
    </div>

    <#if vacancies?? && vacancies.content?size gt 0>
        <div class="vacancies-list">
            <#list vacancies.content as vacancy>
                <div class="vacancy-card">
                    <div class="d-flex justify-content-between align-items-start">
                        <div>
                            <h2 class="vacancy-title">${vacancy.name}</h2>
                            <#if vacancy.authorName??>
                                <div class="vacancy-author">
                                    <i class="bi bi-person"></i> ${vacancy.authorName}
                                </div>
                            </#if>
                        </div>
                        <#if vacancy.salary??>
                            <div class="salary-highlight">
                                ${vacancy.salary} ₽
                            </div>
                        </#if>
                    </div>

                    <div class="vacancy-details">
                        <#if vacancy.category??>
                            <div class="category-badge">
                                <i class="bi bi-tag"></i> ${vacancy.category.name}
                            </div>
                        </#if>

                        <#if vacancy.expFrom?? && vacancy.expTo??>
                            <div class="experience-badge">
                                <i class="bi bi-clock-history me-1"></i>
                                <@spring.message "vacancies.list.experience"/>:
                                <#if vacancy.expFrom == vacancy.expTo>
                                    ${vacancy.expFrom} <@spring.message "vacancies.list.years"/>
                                <#else>
                                    <@spring.message "vacancies.list.from"/> ${vacancy.expFrom} <@spring.message "vacancies.list.to"/> ${vacancy.expTo} <@spring.message "vacancies.list.years"/>
                                </#if>
                            </div>
                        </#if>
                    </div>

                    <div class="vacancy-description">
                        ${vacancy.description}
                    </div>

                    <div class="vacancy-actions">
                        <div class="vacancy-date">
                            <i class="bi bi-calendar3"></i>
                            <#if vacancy.updateTime??>
                                <@spring.message "vacancies.list.updated"/>: ${vacancy.updateTime}
                            </#if>
                        </div>
                        <div>
                            <a href="/vacancies/${vacancy.id}" class="btn btn-save">
                                <i class="bi bi-arrow-right"></i> <@spring.message "vacancies.list.details"/>
                            </a>
                            <a href="/vacancies/${vacancy.id}" class="btn btn-apply">
                                <i class="bi bi-send"></i> <@spring.message "vacancies.list.apply"/>
                            </a>
                        </div>
                    </div>
                </div>
            </#list>
        </div>

        <#if vacancies.totalPages gt 1>
            <div class="pagination-container">
                <ul class="pagination">
                    <li class="page-item <#if !vacancies.hasPrevious()>disabled</#if>">
                        <a class="page-link" href="?page=0<#if (param.search)??>&search=${param.search}</#if><#if (param.category)??>&category=${param.category}</#if><#if (param.sort)??>&sort=${param.sort}</#if>" aria-label="First">
                            <i class="bi bi-chevron-double-left"></i>
                        </a>
                    </li>
                    <li class="page-item <#if !vacancies.hasPrevious()>disabled</#if>">
                        <a class="page-link" href="?page=${(vacancies.number - 1)}<#if (param.search)??>&search=${param.search}</#if><#if (param.category)??>&category=${param.category}</#if><#if (param.sort)??>&sort=${param.sort}</#if>" aria-label="Previous">
                            <i class="bi bi-chevron-left"></i>
                        </a>
                    </li>

                    <#list 0..(vacancies.totalPages-1) as i>
                        <#if i == vacancies.number - 2 || i == vacancies.number - 1 || i == vacancies.number || i == vacancies.number + 1 || i == vacancies.number + 2>
                            <li class="page-item <#if i == vacancies.number>active</#if>">
                                <a class="page-link" href="?page=${i}<#if (param.search)??>&search=${param.search}</#if><#if (param.category)??>&category=${param.category}</#if><#if (param.sort)??>&sort=${param.sort}</#if>">
                                    ${i + 1}
                                </a>
                            </li>
                        </#if>
                    </#list>

                    <li class="page-item <#if !vacancies.hasNext()>disabled</#if>">
                        <a class="page-link" href="?page=${(vacancies.number + 1)}<#if (param.search)??>&search=${param.search}</#if><#if (param.category)??>&category=${param.category}</#if><#if (param.sort)??>&sort=${param.sort}</#if>" aria-label="Next">
                            <i class="bi bi-chevron-right"></i>
                        </a>
                    </li>
                    <li class="page-item <#if !vacancies.hasNext()>disabled</#if>">
                        <a class="page-link" href="?page=${(vacancies.totalPages - 1)}<#if (param.search)??>&search=${param.search}</#if><#if (param.category)??>&category=${param.category}</#if><#if (param.sort)??>&sort=${param.sort}</#if>" aria-label="Last">
                            <i class="bi bi-chevron-double-right"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </#if>
    <#else>
        <div class="no-results">
            <i class="bi bi-search"></i>
            <h3><@spring.message "vacancies.list.noVacanciesFound"/></h3>
            <p><@spring.message "vacancies.list.noVacanciesMessage"/></p>
            <a href="/vacancies" class="btn btn-primary"><@spring.message "vacancies.list.showAllVacancies"/></a>
        </div>
    </#if>
</@main.layout>