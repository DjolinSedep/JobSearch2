<#import "../layout.ftlh" as main>
<#assign pageStyles>
    <link rel="stylesheet" href="/static/css/auth/reset_password.css" />
</#assign>

<@main.layout pageStyles=pageStyles; spring>

    <div class="container password-recovery-container">
        <div class="password-card">
            <div class="password-header">
                <div class="password-icon">
                    <i class="bi bi-shield-lock"></i>
                </div>
                <h1 class="password-title"><@spring.message "auth.resetPassword.title"/></h1>
                <p class="password-subtitle"><@spring.message "auth.resetPassword.subtitle"/></p>
            </div>

            <#if error??>
                <div class="alert alert-danger">
                    <i class="bi bi-exclamation-circle me-2"></i> ${error}
                </div>
            </#if>

            <form action="/auth/reset_password" method="post">
                <#if _csrf??>
                    <input type="hidden" name="${(_csrf.parameterName)!'csrf-param-name'}" value="${(_csrf.token)!'csrf-token'}"/>
                </#if>

                <input type="hidden" name="token" value="${token!}">

                <div class="form-group">
                    <label for="password" class="form-label"><@spring.message "auth.resetPassword.newPassword"/></label>
                    <input type="password" id="password" name="password" class="form-control" placeholder="<@spring.message "auth.resetPassword.newPasswordPlaceholder"/>" required autofocus>
                </div>

                <div class="password-requirements">
                    <h3><@spring.message "auth.resetPassword.requirements.title"/>:</h3>
                    <ul>
                        <li><@spring.message "auth.resetPassword.requirements.min8"/></li>
                        <li><@spring.message "auth.resetPassword.requirements.uppercase"/></li>
                        <li><@spring.message "auth.resetPassword.requirements.lowercase"/></li>
                        <li><@spring.message "auth.resetPassword.requirements.digit"/></li>
                    </ul>
                </div>

                <button type="submit" class="btn btn-submit">
                    <i class="bi bi-check-lg me-2"></i> <@spring.message "auth.resetPassword.submit"/>
                </button>
            </form>
        </div>
    </div>
</@main.layout>