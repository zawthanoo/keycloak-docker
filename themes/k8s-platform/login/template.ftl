<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false>
<!doctype html>
<html lang="${locale.currentLanguageTag!'en'}">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title><#nested "title"></title>
    <#if properties.styles?has_content>
      <#list properties.styles?split(' ') as style>
        <link rel="stylesheet" href="${url.resourcesPath}/${style}" />
      </#list>
    </#if>
  </head>
  <body class="${bodyClass}">
    <main class="shell">
      <section class="brand-panel">
        <a class="brand-mark" href="${(client.baseUrl)!'#'}">
          <span class="logo" aria-hidden="true">
            <svg viewBox="0 0 64 64" fill="none">
              <path d="M32 4 55.4 17.5v29L32 60 8.6 46.5v-29L32 4Z" fill="white" opacity=".96" />
              <path d="M32 12 48.5 21.5v19L32 50 15.5 40.5v-19L32 12Z" fill="#326ce5" />
              <circle cx="32" cy="31" r="6" fill="white" />
              <path d="M32 16v9M32 37v9M18.6 23.5l7.8 4.5M37.6 34l7.8 4.5M18.6 38.5l7.8-4.5M37.6 28l7.8-4.5" stroke="white" stroke-width="3" stroke-linecap="round" />
            </svg>
          </span>
          <span>
            <span class="brand-title">${msg("k8sPlatformTitle")}</span>
            <span class="brand-subtitle"><#nested "brandSubtitle"></span>
          </span>
        </a>

        <div class="hero">
          <span class="eyebrow"><#nested "eyebrow"></span>
          <h1><#nested "heroTitle"></h1>
          <p class="hero-copy"><#nested "heroDescription"></p>
        </div>

        <div class="chips">
          <span class="chip">OIDC</span>
          <span class="chip">RBAC</span>
          <span class="chip">Ingress</span>
          <span class="chip">GitOps</span>
        </div>
      </section>

      <section class="form-panel">
        <div class="card">
          <div class="card-top">
            <div class="status-line">
              <span>K8S Platform</span>
              <#nested "status">
            </div>
            <h2><#nested "header"></h2>
            <p class="card-copy"><#nested "cardDescription"></p>
          </div>

          <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
            <div class="form" style="padding-bottom:0">
              <div class="alert alert-${message.type}">
                <span>${kcSanitize(message.summary)?no_esc}</span>
              </div>
            </div>
          </#if>

          <#nested "form">
        </div>
      </section>
    </main>
  </body>
</html>
</#macro>
