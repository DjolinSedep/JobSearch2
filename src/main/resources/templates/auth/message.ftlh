<#import "../layout.ftlh" as main>
<#assign pageStyles>
    <link rel="stylesheet" href="/static/css/auth/message.css" />
</#assign>

<@main.layout pageStyles=pageStyles; spring>

    <div class="container message-container">
        <div class="message-card">
            <#if message?? && message?contains("успешно")>
            <div class="message-icon success">
                <i class="bi bi-check-circle"></i>
            </div>
            <h1 class="message-title"><@spring.message "auth.message.passwordChanged"/></h1>
            <p class="message-text">${message}</p>
            <a href="/auth/login" class="btn btn-action">
                <i class="bi bi-box-arrow-in-right"></i> <@spring.message "auth.message.login"/>
            </a>
            <#elseif message?? && message?contains("Ошибка валидации")>
                <div class="message-icon error">
                    <i class="bi bi-exclamation-circle"></i>
                </div>
                <h1 class="message-title"><@spring.message "auth.message.passwordChangeError"/></h1>
                <p class="message-text">${message}</p>

                <#if errors??>
                    <div class="error-list">
                        <ul>
                            <#list errors as error>
                                <li>${error}</li>
                            </#list>
                        </ul>
                    </div>
                </#if>

                <a href="javascript:history.back()" class="btn btn-action">
                    <i class="bi bi-arrow-left"></i> <@spring.message "auth.message.tryAgain"/>
                </a>
            <#else>
            <div class="message-icon error">
                <i class="bi bi-exclamation-circle"></i>
            </div>
            <h1 class="message-title"><@spring.message "auth.message.somethingWentWrong"/></h1>
                <#assign defaultErrorMessage><@spring.message "auth.message.errorOccurred"/></#assign>
                <p class="message-text">${message!defaultErrorMessage}</p>
                <a href="/auth/forgot_password" class="btn btn-action">
                    <i class="bi bi-arrow-left"></i> <@spring.message "auth.message.backToPasswordRecovery"/>
                </a>
                </#if>
        </div>
    </div>
</@main.layout>