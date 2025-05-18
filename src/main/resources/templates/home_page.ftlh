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
                    <h1 class="hero-title">Найдите работу мечты или идеального сотрудника</h1>
                    <p class="hero-subtitle">Наша платформа соединяет талантливых специалистов с лучшими компаниями. Начните свой путь к успеху прямо сейчас!</p>
                    <div class="hero-buttons">
                        <a href="/vacancies" class="btn btn-hero btn-primary-hero">
                            <i class="bi bi-search"></i> Найти вакансии
                        </a>
                        <a href="/auth/register" class="btn btn-hero btn-outline-hero">
                            <i class="bi bi-person-plus"></i> Зарегистрироваться
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
                <div class="search-tab active">Поиск вакансий</div>
                <div class="search-tab">Поиск резюме</div>
            </div>
            <form action="/vacancies" method="get" class="search-form">
                <input type="text" name="search" placeholder="Должность, компания или ключевые слова" class="search-input">
                <select name="category" class="search-select">
                    <option value=""><@spring.message "vacancies.list.allCategories"/></option>
                    <#if categories??>
                        <#list categories as category>
                            <option value="${category.id}" <#if (param.category)?? && param.category == category.id?string>selected</#if>>${category.name}</option>
                        </#list>
                    </#if>
                </select>
                <button type="submit" class="btn btn-search">
                    <i class="bi bi-search"></i> Найти
                </button>
            </form>
        </div>
    </section>

    <section class="features-section">
        <div class="container">
            <div class="section-title">
                <h2>Почему выбирают нас</h2>
                <p>Мы предлагаем современные инструменты для эффективного поиска работы и подбора персонала</p>
            </div>
            <div class="row">
                <div class="col-md-6 col-lg-3 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="bi bi-lightning-charge"></i>
                        </div>
                        <h3 class="feature-title">Быстрый поиск</h3>
                        <p class="feature-description">Находите подходящие вакансии и кандидатов за считанные минуты благодаря умным алгоритмам поиска.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="bi bi-shield-check"></i>
                        </div>
                        <h3 class="feature-title">Проверенные компании</h3>
                        <p class="feature-description">Мы сотрудничаем только с надежными работодателями, проверяя каждую компанию.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="bi bi-graph-up"></i>
                        </div>
                        <h3 class="feature-title">Аналитика</h3>
                        <p class="feature-description">Получайте статистику по просмотрам и откликам на ваши резюме и вакансии.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="bi bi-phone"></i>
                        </div>
                        <h3 class="feature-title">Мобильный доступ</h3>
                        <p class="feature-description">Управляйте своим профилем, резюме и вакансиями с любого устройства в любое время.</p>
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
                    <div class="stat-label">Активных вакансий</div>
                </div>
                <div class="stat-item">
                    <div class="stat-value">5,000+</div>
                    <div class="stat-label">Компаний</div>
                </div>
                <div class="stat-item">
                    <div class="stat-value">50,000+</div>
                    <div class="stat-label">Соискателей</div>
                </div>
                <div class="stat-item">
                    <div class="stat-value">95%</div>
                    <div class="stat-label">Успешных трудоустройств</div>
                </div>
            </div>
        </div>
    </section>

    <section class="audience-section">
        <div class="container">
            <div class="section-title">
                <h2>Для кого наш сервис</h2>
                <p>Мы создали удобную платформу как для соискателей, так и для работодателей</p>
            </div>
            <div class="row">
                <div class="col-lg-6 mb-4">
                    <div class="audience-card seekers">
                        <div class="audience-icon seekers">
                            <i class="bi bi-person"></i>
                        </div>
                        <h3 class="audience-title">Для соискателей</h3>
                        <p class="audience-description">Найдите работу своей мечты с помощью нашей платформы. Создавайте профессиональные резюме и откликайтесь на интересные вакансии.</p>
                        <div class="audience-features">
                            <div class="audience-feature">
                                <i class="bi bi-check-circle"></i>
                                <span>Создание и управление резюме</span>
                            </div>
                            <div class="audience-feature">
                                <i class="bi bi-check-circle"></i>
                                <span>Быстрый отклик на вакансии</span>
                            </div>
                            <div class="audience-feature">
                                <i class="bi bi-check-circle"></i>
                                <span>Отслеживание статуса откликов</span>
                            </div>
                            <div class="audience-feature">
                                <i class="bi bi-check-circle"></i>
                                <span>Рекомендации подходящих вакансий</span>
                            </div>
                        </div>
                        <a href="/auth/register" class="btn btn-audience">
                            <i class="bi bi-person-plus"></i> Зарегистрироваться как соискатель
                        </a>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="audience-card employers">
                        <div class="audience-icon employers">
                            <i class="bi bi-building"></i>
                        </div>
                        <h3 class="audience-title">Для работодателей</h3>
                        <p class="audience-description">Находите лучших специалистов для вашей компании. Размещайте вакансии и получайте отклики от квалифицированных кандидатов.</p>
                        <div class="audience-features">
                            <div class="audience-feature">
                                <i class="bi bi-check-circle"></i>
                                <span>Публикация и управление вакансиями</span>
                            </div>
                            <div class="audience-feature">
                                <i class="bi bi-check-circle"></i>
                                <span>Поиск по базе резюме</span>
                            </div>
                            <div class="audience-feature">
                                <i class="bi bi-check-circle"></i>
                                <span>Управление откликами кандидатов</span>
                            </div>
                            <div class="audience-feature">
                                <i class="bi bi-check-circle"></i>
                                <span>Аналитика эффективности вакансий</span>
                            </div>
                        </div>
                        <a href="/auth/register" class="btn btn-audience">
                            <i class="bi bi-building-add"></i> Зарегистрироваться как работодатель
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="categories-section">
        <div class="container">
            <div class="section-title">
                <h2>Популярные категории</h2>
                <p>Просматривайте вакансии по категориям, чтобы найти подходящую работу в вашей сфере</p>
            </div>
            <div class="row">
                <div class="col-md-6 col-lg-3 mb-4">
                    <div class="category-card">
                        <div class="category-icon">
                            <i class="bi bi-code-slash"></i>
                        </div>
                        <h3 class="category-title">IT и разработка</h3>
                        <div class="category-count">1,245 вакансий</div>
                        <a href="/vacancies?category=1" class="category-link">
                            Просмотреть вакансии <i class="bi bi-arrow-right"></i>
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 mb-4">
                    <div class="category-card">
                        <div class="category-icon">
                            <i class="bi bi-megaphone"></i>
                        </div>
                        <h3 class="category-title">Маркетинг и PR</h3>
                        <div class="category-count">856 вакансий</div>
                        <a href="/vacancies" class="category-link">
                            Просмотреть вакансии <i class="bi bi-arrow-right"></i>
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 mb-4">
                    <div class="category-card">
                        <div class="category-icon">
                            <i class="bi bi-cash-coin"></i>
                        </div>
                        <h3 class="category-title">Продажи</h3>
                        <div class="category-count">932 вакансий</div>
                        <a href="/vacancies" class="category-link">
                            Просмотреть вакансии <i class="bi bi-arrow-right"></i>
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 mb-4">
                    <div class="category-card">
                        <div class="category-icon">
                            <i class="bi bi-calculator"></i>
                        </div>
                        <h3 class="category-title">Финансы и бухгалтерия</h3>
                        <div class="category-count">578 вакансий</div>
                        <a href="/vacancies" class="category-link">
                            Просмотреть вакансии <i class="bi bi-arrow-right"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="text-center mt-4">
                <a href="/vacancies" class="btn btn-audience">
                    <i class="bi bi-grid"></i> Все категории
                </a>
            </div>
        </div>
    </section>

    <section class="cta-section">
        <div class="cta-pattern"></div>
        <div class="container cta-content">
            <h2 class="cta-title">Готовы начать свой путь к успеху?</h2>
            <p class="cta-description">Присоединяйтесь к тысячам соискателей и работодателей, которые уже используют нашу платформу для поиска работы и талантливых сотрудников.</p>
            <div class="cta-buttons">
                <a href="/auth/register" class="btn btn-hero btn-primary-hero">
                    <i class="bi bi-person-plus"></i> Зарегистрироваться
                </a>
                <a href="/auth/login" class="btn btn-hero btn-outline-hero">
                    <i class="bi bi-box-arrow-in-right"></i> Войти
                </a>
            </div>
        </div>
    </section>
</@main.layout>