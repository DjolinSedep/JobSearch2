<#import "../layout.ftlh" as main>
<#assign pageStyles>
    <link rel="stylesheet" href="/static/css/user/profile_edit.css" />
</#assign>

<@main.layout pageStyles=pageStyles; spring>

    <div class="container py-5">
        <div class="profile-edit-container">
            <h1 class="page-header"><@spring.message "profile.edit.title"/></h1>

            <#if error??>
                <div class="alert alert-error">
                    <i class="bi bi-exclamation-triangle me-2"></i> ${error}
                </div>
            </#if>

            <form action="/users/edit" method="post" enctype="multipart/form-data">
                <#if _csrf??>
                    <input type="hidden" name="${(_csrf.parameterName)!'csrf-param-name'}"
                           value="${(_csrf.token)!'csrf-token'}"/>
                </#if>

                <div class="avatar-container">
                    <img src="/api/images/${user.avatar}" alt="<@spring.message "profile.edit.avatarAlt"/>" class="avatar-preview" id="avatar-preview">
                    <div class="avatar-upload">
                        <button type="button" class="btn btn-upload">
                            <i class="bi bi-camera"></i> <@spring.message "profile.edit.changePhoto"/>
                        </button>
                        <input type="file" name="avatar" id="avatar-input" accept="image/*">
                    </div>
                </div>

                <div class="form-section">
                    <h2 class="form-section-title">
                        <i class="bi bi-person"></i> <@spring.message "profile.edit.personalInfo"/>
                    </h2>

                    <div class="row mb-4">
                        <div class="col-md-6">
                            <div class="position-relative">
                                <i class="bi bi-person input-icon"></i>
                                <label for="name" class="form-label required-field"><@spring.message "profile.edit.name"/></label>
                                <@spring.formInput "editedUser.name" 'id="name" class="form-control"' />
                                <@spring.showErrors "<br>" "error-message" />
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="position-relative">
                                <i class="bi bi-person-badge input-icon"></i>
                                <label for="surname" class="form-label required-field"><@spring.message "profile.edit.surname"/></label>
                                <@spring.formInput "editedUser.surname" 'id="surname" class="form-control"' />
                                <@spring.showErrors "<br>" "error-message" />
                            </div>
                        </div>
                    </div>

                    <div class="mb-4">
                        <div class="position-relative">
                            <i class="bi bi-telephone input-icon"></i>
                            <label for="phoneNumber" class="form-label required-field"><@spring.message "profile.edit.phoneNumber"/></label>
                            <@spring.formInput "editedUser.phoneNumber" 'id="phoneNumber" class="form-control"' />
                            <@spring.showErrors "<br>" "error-message" />
                            <div class="form-text"><@spring.message "profile.edit.phoneFormat"/></div>
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <h2 class="form-section-title">
                        <i class="bi bi-info-circle"></i> <@spring.message "profile.edit.additionalInfo"/>
                    </h2>

                    <div class="row mb-4">
                        <div class="col-md-6">
                            <div class="position-relative">
                                <i class="bi bi-envelope input-icon"></i>
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" value="${(user.email)!}" disabled>
                                <div class="form-text"><@spring.message "profile.edit.emailCannotChange"/></div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="position-relative">
                                <i class="bi bi-person-badge input-icon"></i>
                                <label for="role" class="form-label"><@spring.message "profile.edit.accountType"/></label>
                                <input type="text" class="form-control" id="role" value="<#if user.role == 'ROLE_APPLICANT'><@spring.message "profile.edit.applicant"/><#elseif user.role == 'ROLE_EMPLOYEE'><@spring.message "profile.edit.employer"/><#else>${user.role}</#if>" disabled>
                                <div class="form-text"><@spring.message "profile.edit.accountTypeCannotChange"/></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-actions">
                    <a href="/users/profile" class="btn btn-cancel">
                        <i class="bi bi-arrow-left"></i> <@spring.message "profile.edit.cancel"/>
                    </a>
                    <button type="submit" class="btn btn-submit">
                        <i class="bi bi-check-lg"></i> <@spring.message "profile.edit.saveChanges"/>
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script>
        document.getElementById('avatar-input').addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('avatar-preview').src = e.target.result;
                }
                reader.readAsDataURL(file);
            }
        });
    </script>
</@main.layout>