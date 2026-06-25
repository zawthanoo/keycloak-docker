<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
  <#if section = "title">
    ${msg("errorTitle")}
  <#elseif section = "brandSubtitle">
    ${msg("k8sErrorSubtitle")}
  <#elseif section = "eyebrow">
    ${msg("k8sErrorEyebrow")}
  <#elseif section = "heroTitle">
    ${msg("k8sErrorHero")}
  <#elseif section = "heroDescription">
    ${msg("k8sErrorDescription")}
  <#elseif section = "status">
    <span class="status-pill danger">Retry needed</span>
  <#elseif section = "header">
    ${msg("errorTitle")}
  <#elseif section = "cardDescription">
    ${msg("k8sErrorDescription")}
  <#elseif section = "form">
    <div class="form">
      <div class="error-icon" aria-hidden="true">!</div>
      <#if message?has_content>
        <p class="helper">${kcSanitize(message.summary)?no_esc}</p>
      <#else>
        <p class="helper">${msg("k8sErrorHelp")}</p>
      </#if>
      <#if url.loginRestartFlowUrl??>
        <a class="btn" href="${url.loginRestartFlowUrl}">${msg("k8sStartAgain")}</a>
      </#if>
      <#if client?? && client.baseUrl?has_content>
        <a class="btn secondary" href="${client.baseUrl}">${msg("k8sBackDashboard")}</a>
      </#if>
      <p class="footer-note">If this repeats, contact your DevOps administrator with the time of the failed login.</p>
    </div>
  </#if>
</@layout.registrationLayout>
