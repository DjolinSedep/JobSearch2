<#import "../layout.ftlh" as main>
<#assign pageStyles>
    <link rel="stylesheet" href="/static/css/auth/forgot_password.css" />
</#assign>

<@main.layout pageStyles=pageStyles; spring>

    <div class="container password-recovery-container">
        <div class="password-card">
            <div class="password-header">
                <div class="password-icon">
                    <i class="bi bi-key"></i>
                </div>
                <h1 class="password-title"><@spring.message "auth.forgotPassword.title"/></h1>
                <p class="password-subtitle"><@spring.message "auth.forgotPassword.subtitle"/></p>
            </div>

            <#if message??>
                <div class="alert alert-success">
                    <i class="bi bi-check-circle me-2"></i> ${message}
                </div>
            </#if>

            <#if error??>
                <div class="alert alert-danger">
                    <i class="bi bi-exclamation-circle me-2"></i> ${error}
                </div>
            </#if>

            <form action="/auth/forgot_password" method="post">
                <#if _csrf??>
                    <input type="hidden" name="${(_csrf.parameterName)!'csrf-param-name'}" value="${(_csrf.token)!'csrf-token'}"/>
                </#if>

                <div class="form-group">
                    <label for="email" class="form-label"><@spring.message "auth.forgotPassword.email"/></label>
                    <input type="email" id="email" name="email" class="form-control" placeholder="<@spring.message "auth.forgotPassword.emailPlaceholder"/>" required autofocus>
                </div>

                <button type="submit" class="btn btn-submit">
                    <i class="bi bi-envelope me-2"></i> <@spring.message "auth.forgotPassword.submit"/>
                </button>
            </form>

            <div class="back-to-login">
                <@spring.message "auth.forgotPassword.rememberedPassword"/> <a href="/auth/login"><@spring.message "auth.forgotPassword.backToLogin"/></a>
            </div>
        </div>
    </div>
</@main.layout>