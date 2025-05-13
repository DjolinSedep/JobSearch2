<#import "spring.ftl" as spring>
<#macro layout pageStyles="">

    <!DOCTYPE html>
    <html lang="${.locale}">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JobSearch</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="/static/css/style.css" />
        ${pageStyles}
    </head>

    <body>
    <nav class="navbar navbar-expand-lg sticky-top">
        <div class="container">
            <a class="navbar-brand" href="/vacancies">Job<span>Search</span></a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <#assign known = SPRING_SECURITY_CONTEXT?? >
                    <#if known>
                        <#assign user = SPRING_SECURITY_CONTEXT.authentication.principal>
                        <#if user.authorities?seq_contains("ROLE_EMPLOYEE")>
                            <li class="nav-item">
                                <a class="nav-link" href="/resumes"><@spring.message "layout.nav.resumes"/></a>
                            </li>
                        <#elseif user.authorities?seq_contains("ROLE_APPLICANT")>
                            <li class="nav-item">
                                <a class="nav-link" href="/vacancies"><@spring.message "layout.nav.vacancies"/></a>
                            </li>
                        </#if>
                    <#else>
                        <li class="nav-item">
                            <a class="nav-link" href="/vacancies"><@spring.message "layout.nav.vacancies"/></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/#"><@spring.message "layout.nav.about"/></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/#"><@spring.message "layout.nav.contacts"/></a>
                        </li>
                    </#if>
                </ul>

                <div class="d-flex align-items-center">
                    <div class="lang-dropdown me-2">
                        <div class="dropdown">
                            <button class="btn btn-light dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-globe"></i>
                                <@spring.message "layout.language"/>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="?lang=en"><@spring.message "layout.language.english"/></a></li>
                                <li><a class="dropdown-item" href="?lang=ru"><@spring.message "layout.language.russian"/></a></li>
                            </ul>
                        </div>
                    </div>

                    <#assign known = SPRING_SECURITY_CONTEXT?? >
                    <#if known>
                        <#assign user = SPRING_SECURITY_CONTEXT.authentication.principal>
                        <a class="btn btn-outline-primary me-2" href="/users/profile">
                            <i class="bi bi-person"></i> <@spring.message "layout.profile"/>
                        </a>
                        <#if _csrf??>
                            <form action="/logout" method="post">
                                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}"
                                       value="${(_csrf.token)!'--no-token--'}"/>
                                <button type="submit" class="btn btn-primary" id="logout">
                                    <i class="bi bi-box-arrow-right"></i> <@spring.message "layout.logout"/>
                                </button>
                            </form>
                        <#else>
                            <a href="/logout" class="btn btn-primary" id="logout">
                                <i class="bi bi-box-arrow-right"></i> <@spring.message "layout.logout"/>
                            </a>
                        </#if>
                    <#else>
                        <a class="btn btn-outline-primary me-2" href="/auth/login">
                            <i class="bi bi-box-arrow-in-right"></i> <@spring.message "layout.login"/>
                        </a>
                        <a class="btn btn-primary" href="/auth/register">
                            <i class="bi bi-person-plus"></i> <@spring.message "layout.register"/>
                        </a>
                    </#if>
                </div>
            </div>
        </div>
    </nav>

    <div class="content">
        <div class="container">
            <#nested spring>
        </div>
    </div>

    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 mb-4">
                    <h5 class="footer-title">JobSearch</h5>
                    <p class="text-muted"><@spring.message "layout.footer.tagline"/></p>
                    <div class="mt-3">
                        <a href="#" class="social-icon"><i class="bi bi-facebook"></i></a>
                        <a href="#" class="social-icon"><i class="bi bi-twitter"></i></a>
                        <a href="#" class="social-icon"><i class="bi bi-linkedin"></i></a>
                        <a href="#" class="social-icon"><i class="bi bi-instagram"></i></a>
                    </div>
                </div>

                <div class="col-lg-2 col-md-4 col-6 mb-4">
                    <h5 class="footer-title"><@spring.message "layout.footer.company"/></h5>
                    <a href="/about" class="footer-link"><@spring.message "layout.footer.about"/></a>
                    <a href="/team" class="footer-link"><@spring.message "layout.footer.team"/></a>
                    <a href="/careers" class="footer-link"><@spring.message "layout.footer.careers"/></a>
                    <a href="/contact" class="footer-link"><@spring.message "layout.footer.contact"/></a>
                </div>

                <div class="col-lg-2 col-md-4 col-6 mb-4">
                    <h5 class="footer-title"><@spring.message "layout.footer.resources"/></h5>
                    <a href="/#" class="footer-link"><@spring.message "layout.footer.blog"/></a>
                    <a href="/#" class="footer-link"><@spring.message "layout.footer.guides"/></a>
                    <a href="/#" class="footer-link"><@spring.message "layout.footer.faq"/></a>
                    <a href="/#" class="footer-link"><@spring.message "layout.footer.help"/></a>
                </div>

                <div class="col-lg-4 col-md-4 mb-4">
                    <h5 class="footer-title"><@spring.message "layout.footer.contactUs"/></h5>
                    <p class="mb-2"><i class="bi bi-geo-alt me-2"></i> <@spring.message "layout.footer.address"/></p>
                    <p class="mb-2"><i class="bi bi-envelope me-2"></i> info@jobsearch.com</p>
                    <p class="mb-2"><i class="bi bi-telephone me-2"></i> +7 (123) 456-7890</p>
                </div>
            </div>

            <hr>

            <div class="row">
                <div class="col-md-6 text-center text-md-start">
                    <p class="mb-0">&copy; 2023 JobSearch. <@spring.message "layout.footer.allRightsReserved"/></p>
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <a href="/#" class="text-muted me-3"><@spring.message "layout.footer.privacyPolicy"/></a>
                    <a href="/#" class="text-muted"><@spring.message "layout.footer.termsOfService"/></a>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    </html>
</#macro>