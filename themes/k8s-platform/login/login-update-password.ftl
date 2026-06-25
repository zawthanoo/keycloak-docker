<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
  <#if section = "title">
    ${msg("updatePasswordTitle")}
  <#elseif section = "brandSubtitle">
    ${msg("k8sUpdateSubtitle")}
  <#elseif section = "eyebrow">
    ${msg("k8sUpdateEyebrow")}
  <#elseif section = "heroTitle">
    ${msg("k8sUpdateHero")}
  <#elseif section = "heroDescription">
    ${msg("k8sUpdateDescription")}
  <#elseif section = "status">
    <span class="status-pill">One time</span>
  <#elseif section = "header">
    ${msg("updatePasswordTitle")}
  <#elseif section = "cardDescription">
    ${msg("k8sUpdateCardDescription")}
  <#elseif section = "form">
    <form class="form" id="kc-passwd-update-form" action="${url.loginAction}" method="post">
      <div class="field">
        <label for="password-new">${msg("passwordNew")}</label>
        <input
          id="password-new"
          name="password-new"
          type="password"
          autocomplete="new-password"
          autofocus
          aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
        />
        <#if messagesPerField.existsError('password')>
          <p class="field-error">${kcSanitize(messagesPerField.get('password'))?no_esc}</p>
        </#if>
      </div>

      <div class="field">
        <label for="password-confirm">${msg("passwordConfirm")}</label>
        <input
          id="password-confirm"
          name="password-confirm"
          type="password"
          autocomplete="new-password"
          aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
        />
        <#if messagesPerField.existsError('password-confirm')>
          <p class="field-error">${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}</p>
        </#if>
      </div>

      <div class="policy">
        <div class="policy-item"><span class="dot"></span> Minimum 12 characters</div>
        <div class="policy-item"><span class="dot"></span> Use letters, numbers, and symbols</div>
        <div class="policy-item"><span class="dot"></span> Avoid reused workshop passwords</div>
      </div>

      <#if isAppInitiatedAction??>
        <button class="btn" name="submitAction" type="submit" value="Save">${msg("doSubmit")}</button>
        <button class="btn secondary" name="submitAction" type="submit" value="Cancel">${msg("doCancel")}</button>
      <#else>
        <button class="btn" type="submit">${msg("doSubmit")}</button>
      </#if>
      <p class="helper">${msg("k8sPasswordNote")}</p>
    </form>
  </#if>
</@layout.registrationLayout>
