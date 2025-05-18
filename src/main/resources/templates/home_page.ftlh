<#import "layout.ftlh" as main>
<#assign pageStyles>
    <link rel="stylesheet" href="/static/css/home_page.css" />
</#assign>

<@main.layout pageStyles=pageStyles; spring>

    <section class="hero-section">
        <div class="hero-pattern"></div>
        <div class="container hero-content">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <h1 class="hero-title"><@spring.message "home.hero.title"/></h1>
                    <p class="hero-subtitle"><@spring.message "home.hero.subtitle"/></p>
                    <div class="hero-buttons">
                        <a href="/vacancies" class="btn btn-hero btn-primary-hero">
                            <i class="bi bi-search"></i> <@spring.message "home.hero.findVacancies"/>
                        </a>
                        <a href="/auth/register" class="btn btn-hero btn-outline-hero">
                            <i class="bi bi-person-plus"></i> <@spring.message "home.hero.register"/>
                        </a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <img src="/static/images/jb.webp" alt="Поиск работы" class="hero-image">
                </div>
            </div>
        </div>
    </section>

    <section class="container">
        <div class="search-section">
            <div class="search-tabs">
                <div class="search-tab active"><@spring.message "home.search.vacanciesTab"/></div>
                <div class="search-tab"><@spring.message "home.search.resumesTab"/></div>
            </div>
            <form action="/vacancies" method="get" class="search-form">
                <input type="text" name="search" placeholder="<@spring.message "home.search.keywordPlaceholder"/>" class="search-input">
                <select name="category" class="search-select">
                    <option value=""><@spring.message "vacancies.list.allCategories"/></option>
                    <#if categories??>
                        <#list categories as category>
                            <option value="${category.id}" <#if (param.category)?? && param.category == category.id?string>selected</#if>>${category.name}</option>
                        </#list>
                    </#if>
                </select>
                <button type="submit" class="btn btn-search">
                    <i class="bi bi-search"></i> <@spring.message "home.search.findButton"/>
                </button>
            </form>
        </div>
    </section>

    <section class="features-section">
        <div class="container">
            <div class="section-title">
                <h2><@spring.message "home.features.title"/></h2>
                <p><@spring.message "home.features.subtitle"/></p>
            </div>
            <div class="row">
                <div class="col-md-6 col-lg-3 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="bi bi-lightning-charge"></i>
                        </div>
                        <h3 class="feature-title"><@spring.message "home.features.quickSearch.title"/></h3>
                        <p class="feature-description"><@spring.message "home.features.quickSearch.description"/></p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="bi bi-shield-check"></i>
                        </div>
                        <h3 class="feature-title"><@spring.message "home.features.verifiedCompanies.title"/></h3>
                        <p class="feature-description"><@spring.message "home.features.verifiedCompanies.description"/></p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="bi bi-graph-up"></i>
                        </div>
                        <h3 class="feature-title"><@spring.message "home.features.analytics.title"/></h3>
                        <p class="feature-description"><@spring.message "home.features.analytics.description"/></p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="bi bi-phone"></i>
                        </div>
                        <h3 class="feature-title"><@spring.message "home.features.mobileAccess.title"/></h3>
                        <p class="feature-description"><@spring.message "home.features.mobileAccess.description"/></p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="stats-section">
        <div class="container">
            <div class="stats-container">
                <div class="stat-item">
                    <div class="stat-value">10,000+</div>
                    <div class="stat-label"><@spring.message "home.stats.activeVacancies"/></div>
                </div>
                <div class="stat-item">
                    <div class="stat-value">5,000+</div>
                    <div class="stat-label"><@spring.message "home.stats.companies"/></div>
                </div>
                <div class="stat-item">
                    <div class="stat-value">50,000+</div>
                    <div class="stat-label"><@spring.message "home.stats.jobSeekers"/></div>
                </div>
                <div class="stat-item">
                    <div class="stat-value">95%</div>
                    <div class="stat-label"><@spring.message "home.stats.successfulPlacements"/></div>
                </div>
            </div>
        </div>
    </section>

    <section class="audience-section">
        <div class="container">
            <div class="section-title">
                <h2><@spring.message "home.audience.title"/></h2>
                <p><@spring.message "home.audience.subtitle"/></p>
            </div>
            <div class="row">
                <div class="col-lg-6 mb-4">
                    <div class="audience-card seekers">
                        <div class="audience-icon seekers">
                            <i class="bi bi-person"></i>
                        </div>
                        <h3 class="audience-title"><@spring.message "home.audience.seekers.title"/></h3>
                        <p class="audience-description"><@spring.message "home.audience.seekers.description"/></p>
                        <div class="audience-features">
                            <div class="audience-feature">
                                <i class="bi bi-check-circle"></i>
                                <span><@spring.message "home.audience.seekers.feature1"/></span>
                            </div>
                            <div class="audience-feature">
                                <i class="bi bi-check-circle"></i>
                                <span><@spring.message "home.audience.seekers.feature2"/></span>
                            </div>
                            <div class="audience-feature">
                                <i class="bi bi-check-circle"></i>
                                <span><@spring.message "home.audience.seekers.feature3"/></span>
                            </div>
                            <div class="audience-feature">
                                <i class="bi bi-check-circle"></i>
                                <span><@spring.message "home.audience.seekers.feature4"/></span>
                            </div>
                        </div>
                        <a href="/auth/register" class="btn btn-audience">
                            <i class="bi bi-person-plus"></i> <@spring.message "home.audience.seekers.registerButton"/>
                        </a>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="audience-card employers">
                        <div class="audience-icon employers">
                            <i class="bi bi-building"></i>
                        </div>
                        <h3 class="audience-title"><@spring.message "home.audience.employers.title"/></h3>
                        <p class="audience-description"><@spring.message "home.audience.employers.description"/></p>
                        <div class="audience-features">
                            <div class="audience-feature">
                                <i class="bi bi-check-circle"></i>
                                <span><@spring.message "home.audience.employers.feature1"/></span>
                            </div>
                            <div class="audience-feature">
                                <i class="bi bi-check-circle"></i>
                                <span><@spring.message "home.audience.employers.feature2"/></span>
                            </div>
                            <div class="audience-feature">
                                <i class="bi bi-check-circle"></i>
                                <span><@spring.message "home.audience.employers.feature3"/></span>
                            </div>
                            <div class="audience-feature">
                                <i class="bi bi-check-circle"></i>
                                <span><@spring.message "home.audience.employers.feature4"/></span>
                            </div>
                        </div>
                        <a href="/auth/register" class="btn btn-audience">
                            <i class="bi bi-building-add"></i> <@spring.message "home.audience.employers.registerButton"/>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="categories-section">
        <div class="container">
            <div class="section-title">
                <h2><@spring.message "home.popularCategories.title"/></h2>
                <p><@spring.message "home.popularCategories.subtitle"/></p>
            </div>
            <div class="row">
                <div class="col-md-6 col-lg-3 mb-4">
                    <div class="category-card">
                        <div class="category-icon">
                            <i class="bi bi-code-slash"></i>
                        </div>
                        <h3 class="category-title"><@spring.message "home.categories.it"/></h3>
                        <div class="category-count">1,245 <@spring.message "home.popularCategories.vacancies"/></div>
                        <a href="/vacancies" class="category-link">
                            <@spring.message "home.popularCategories.viewVacancies"/> <i class="bi bi-arrow-right"></i>
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 mb-4">
                    <div class="category-card">
                        <div class="category-icon">
                            <i class="bi bi-megaphone"></i>
                        </div>
                        <h3 class="category-title"><@spring.message "home.categories.marketing"/></h3>
                        <div class="category-count">856 <@spring.message "home.popularCategories.vacancies"/></div>
                        <a href="/vacancies" class="category-link">
                            <@spring.message "home.popularCategories.viewVacancies"/> <i class="bi bi-arrow-right"></i>
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 mb-4">
                    <div class="category-card">
                        <div class="category-icon">
                            <i class="bi bi-cash-coin"></i>
                        </div>
                        <h3 class="category-title"><@spring.message "home.categories.sales"/></h3>
                        <div class="category-count">932 <@spring.message "home.popularCategories.vacancies"/></div>
                        <a href="/vacancies" class="category-link">
                            <@spring.message "home.popularCategories.viewVacancies"/> <i class="bi bi-arrow-right"></i>
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 mb-4">
                    <div class="category-card">
                        <div class="category-icon">
                            <i class="bi bi-calculator"></i>
                        </div>
                        <h3 class="category-title"><@spring.message "home.categories.finance"/></h3>
                        <div class="category-count">578 <@spring.message "home.popularCategories.vacancies"/></div>
                        <a href="/vacancies" class="category-link">
                            <@spring.message "home.popularCategories.viewVacancies"/> <i class="bi bi-arrow-right"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="text-center mt-4">
                <a href="/vacancies" class="btn btn-audience">
                    <i class="bi bi-grid"></i> <@spring.message "home.popularCategories.allCategories"/>
                </a>
            </div>
        </div>
    </section>

    <section class="cta-section">
        <div class="cta-pattern"></div>
        <div class="container cta-content">
            <h2 class="cta-title"><@spring.message "home.cta.title"/></h2>
            <p class="cta-description"><@spring.message "home.cta.description"/></p>
            <div class="cta-buttons">
                <a href="/auth/register" class="btn btn-hero btn-primary-hero">
                    <i class="bi bi-person-plus"></i> <@spring.message "home.cta.register"/>
                </a>
                <a href="/auth/login" class="btn btn-hero btn-outline-hero">
                    <i class="bi bi-box-arrow-in-right"></i> <@spring.message "home.cta.login"/>
                </a>
            </div>
        </div>
    </section>
</@main.layout>