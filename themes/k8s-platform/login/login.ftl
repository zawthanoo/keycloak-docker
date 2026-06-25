<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password'); section>
  <#if section = "title">
    ${msg("k8sPlatformTitle")}
  <#elseif section = "brandSubtitle">
    ${msg("k8sPlatformSubtitle")}
  <#elseif section = "eyebrow">
    ${msg("k8sLoginEyebrow")}
  <#elseif section = "heroTitle">
    ${msg("k8sLoginHero")}
  <#elseif section = "heroDescription">
    ${msg("k8sLoginDescription")}
  <#elseif section = "status">
    <span class="status-pill">Protected</span>
  <#elseif section = "header">
    ${msg("k8sLoginCardTitle")}
  <#elseif section = "cardDescription">
    ${msg("k8sLoginCardDescription")}
  <#elseif section = "form">
    <form class="form" id="kc-form-login" action="${url.loginAction}" method="post">
      <#if !usernameHidden??>
        <div class="field">
          <label for="username"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
          <input
            id="username"
            name="username"
            value="${(login.username!'')}"
            type="text"
            autocomplete="username"
            autofocus
            aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
          />
          <#if messagesPerField.existsError('username','password')>
            <p class="field-error">${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}</p>
          </#if>
        </div>
      </#if>

      <div class="field">
        <label for="password">${msg("password")}</label>
        <input
          id="password"
          name="password"
          type="password"
          autocomplete="current-password"
          aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
        />
      </div>

      <div class="split">
        <#if realm.rememberMe && !usernameHidden??>
          <label class="check">
            <input id="rememberMe" name="rememberMe" type="checkbox" <#if login.rememberMe??>checked</#if> />
            ${msg("rememberMe")}
          </label>
        <#else>
          <span></span>
        </#if>
      </div>

      <#if auth.selectedCredential?has_content>
        <input type="hidden" name="credentialId" value="${auth.selectedCredential}" />
      </#if>

      <button class="btn" id="kc-login" name="login" type="submit">${msg("doLogIn")}</button>
      <p class="helper">${msg("k8sAuditNote")}</p>
    </form>
  </#if>
</@layout.registrationLayout>
