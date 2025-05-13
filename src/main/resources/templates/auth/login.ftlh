<#import "../layout.ftlh" as main>
<#assign pageStyles>
    <link rel="stylesheet" href="/static/css/auth/login.css" />
</#assign>

<@main.layout pageStyles=pageStyles; spring>

    <div class="auth-container">
        <div class="auth-card">
            <div class="auth-header">
                <h2><@spring.message "auth.login.title"/></h2>
            </div>

            <div class="auth-body">
                <form id="login-form" action="/auth/login" method="post">
                    <#if _csrf??>
                        <input type="hidden" name="${(_csrf.parameterName)!'csrf-param-name'}"
                               value="${(_csrf.token)!'csrf-token'}"/>
                    </#if>

                    <div class="position-relative">
                        <i class="bi bi-envelope input-icon"></i>
                        <div class="form-floating">
                            <input type="email" class="form-control" id="email" name="username" placeholder="<@spring.message "auth.login.emailPlaceholder"/>" required>
                            <label for="email"><@spring.message "auth.login.email"/>: </label>
                        </div>
                    </div>

                    <div class="position-relative">
                        <i class="bi bi-lock input-icon"></i>
                        <div class="form-floating">
                            <input type="password" class="form-control" id="password" name="password" placeholder="<@spring.message "auth.login.passwordPlaceholder"/>" required>
                            <label for="password"><@spring.message "auth.login.password"/>: </label>
                        </div>
                    </div>

                    <a href="/auth/forgot_password" class="auth-link forgot-password">
                        <@spring.message "auth.login.forgotPassword"/>
                    </a>

                    <button type="submit" class="btn btn-auth">
                        <@spring.message "auth.login.submit"/>
                    </button>
                </form>

                <div class="divider">
                    <div class="divider-line"></div>
                    <span class="divider-text"><@spring.message "auth.login.or"/></span>
                    <div class="divider-line"></div>
                </div>

                <div class="auth-footer">
                    <p><@spring.message "auth.login.noAccount"/> <a href="/auth/register" class="auth-link"><@spring.message "auth.login.register"/></a></p>
                </div>
            </div>
        </div>
    </div>
</@main.layout>