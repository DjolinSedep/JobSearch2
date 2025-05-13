<#import "../layout.ftlh" as main>
<#assign pageStyles>
    <link rel="stylesheet" href="/static/css/auth/register.css" />
</#assign>

<@main.layout pageStyles=pageStyles; spring>

    <div class="register-container">
        <div class="register-card">
            <div class="register-header">
                <h2><@spring.message "auth.register.title"/></h2>
                <p><@spring.message "auth.register.subtitle"/></p>
            </div>

            <div class="register-body">
                <form action="/auth/register" method="post">
                    <#if _csrf??>
                        <input type="hidden" name="${(_csrf.parameterName)!'csrf-param-name'}"
                               value="${(_csrf.token)!'csrf-token'}"/>
                    </#if>

                    <div class="account-type-container">
                        <h5 class="account-type-title"><@spring.message "auth.register.chooseAccountType"/></h5>
                        <div class="account-type-options">
                            <div>
                                <input type="radio" id="applicant" name="accountType" value="ROLE_APPLICANT" class="account-type-radio" checked>
                                <label for="applicant" class="account-type-label">
                                    <i class="bi bi-person account-type-icon"></i>
                                    <h5 class="account-type-name"><@spring.message "auth.register.applicant"/></h5>
                                    <p class="account-type-desc"><@spring.message "auth.register.lookingForJob"/></p>
                                </label>
                            </div>
                            <div>
                                <input type="radio" id="company" name="accountType" value="ROLE_EMPLOYEE" class="account-type-radio">
                                <label for="company" class="account-type-label">
                                    <i class="bi bi-building account-type-icon"></i>
                                    <h5 class="account-type-name"><@spring.message "auth.register.employer"/></h5>
                                    <p class="account-type-desc"><@spring.message "auth.register.lookingForEmployees"/></p>
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="position-relative">
                                <i class="bi bi-person input-icon"></i>
                                <div class="form-floating">
                                    <@spring.formInput "userRegistrationDto.name" 'id="name" class="form-control" placeholder="' + spring.message("auth.register.name") + '"' />
                                    <label for="name"><@spring.message "auth.register.name"/>: </label>
                                </div>
                                <@spring.showErrors "<br>" "error text-danger mb-3" />
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="position-relative">
                                <i class="bi bi-person-badge input-icon"></i>
                                <div class="form-floating">
                                    <@spring.formInput "userRegistrationDto.surname" 'id="surname" class="form-control" placeholder="' + spring.message("auth.register.surname") + '"' />
                                    <label for="surname"><@spring.message "auth.register.surname"/>: </label>
                                </div>
                                <@spring.showErrors "<br>" "error" />
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="position-relative">
                                <i class="bi bi-calendar input-icon"></i>
                                <div class="form-floating">
                                    <@spring.formInput "userRegistrationDto.age" 'id="age" class="form-control" placeholder="' + spring.message("auth.register.age") + '" type="number" min="18"' />
                                    <label for="age"><@spring.message "auth.register.age"/>: </label>
                                </div>
                                <@spring.showErrors "<br>" "error" />
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="position-relative">
                                <i class="bi bi-envelope input-icon"></i>
                                <div class="form-floating">
                                    <@spring.formInput "userRegistrationDto.email" 'id="email" class="form-control" placeholder="' + spring.message("auth.register.email") + '" type="email"' />
                                    <label for="email"><@spring.message "auth.register.emailShort"/>: </label>
                                </div>
                                <@spring.showErrors "<br>" "error" />
                            </div>
                            <#if emailError??>
                                <p class="error">${emailError}</p>
                            </#if>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="position-relative">
                                <i class="bi bi-telephone input-icon"></i>
                                <div class="form-floating">
                                    <@spring.formInput "userRegistrationDto.phoneNumber" 'id="phoneNumber" class="form-control" placeholder="' + spring.message("auth.register.phone") + '"' />
                                    <label for="phoneNumber"><@spring.message "auth.register.phone"/> </label>
                                </div>
                                <@spring.showErrors "<br>" "error" />
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="position-relative">
                                <i class="bi bi-lock input-icon"></i>
                                <div class="form-floating">
                                    <@spring.formPasswordInput "userRegistrationDto.password" 'id="password" class="form-control" placeholder="' + spring.message("auth.register.password") + '"' />
                                    <label for="password"><@spring.message "auth.register.password"/></label>
                                </div>
                                <@spring.showErrors "<br>" "error" />

                                <div class="password-requirements">
                                    <p class="mb-1"><i class="bi bi-info-circle me-1"></i> <@spring.message "auth.register.passwordRequirements"/>:</p>
                                    <ul>
                                        <li><@spring.message "auth.register.passwordMin6"/></li>
                                        <li><@spring.message "auth.register.passwordUppercase"/></li>
                                        <li><@spring.message "auth.register.passwordDigit"/></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="d-flex justify-content-between mt-4">
                        <a href="/auth/login" class="btn btn-back">
                            <i class="bi bi-arrow-left me-2"></i> <@spring.message "auth.register.back"/>
                        </a>
                        <button type="submit" class="btn btn-register">
                            <i class="bi bi-check-circle me-2"></i> <@spring.message "auth.register.submit"/>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</@main.layout>