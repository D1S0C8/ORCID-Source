<#--

    =============================================================================

    ORCID (R) Open Source
    http://orcid.org

    Copyright (c) 2012-2013 ORCID, Inc.
    Licensed under an MIT-Style License (MIT)
    http://orcid.org/open-source-license

    This copyright and license information (including a link to the full license)
    shall be included in its entirety in all copies or substantial portion of
    the software.

    =============================================================================

-->
<@base>
<#assign displayName = "">
<#if client_name??>
	<#assign displayName = client_name>
</#if>
<!-- colorbox-content -->
<div class="container top-green-border confirm-oauth-access" ng-controller="OauthAuthorizationController">		
	<@security.authorize ifAnyGranted="ROLE_USER">
	<div class="row top-header">
		<div class="col-md-2 col-sm-6 col-xs-12">
			<div class="logo">
	        	<h1><a href="${aboutUri}"><img src="${staticCdn}/img/orcid-logo.png" alt="ORCID logo" /></a></h1>
	        	<!-- <p>${springMacroRequestContext.getMessage("confirm-oauth-access.connectingresearchandresearchers")}</p> -->
	        </div>		
		</div>
		
	    <div class="col-md-4 col-sm-6 col-xs-12">	        
	        <div class="row">
	            <#include "includes/mini_id_banner.ftl"/>
	        </div>      
	    </div>	    
	</div>	
	<div class="app-client-name">
		<h3 ng-click="toggleClientDescription()">${client_name} - ${client_group_name}
			<a ng-show="!showClientDescription" ng-click="toggleClientDescription()" class="glyphicon glyphicon-chevron-down"></a>
			<a ng-show="showClientDescription" ng-click="toggleClientDescription()" class="glyphicon glyphicon-chevron-up"></a>
		</h3>
	</div>
	<div class="app-client-description">
		<p ng-show="showClientDescription">
			<span class="uppercase gray-bold-about"><@orcid.msg 'oauth_sign_in.about'/></span> ${client_description}
		</p>
	</div>
	<div>
		<#list scopes as scope>
			<div><span class="mini-orcid-icon"></span><@orcid.msg '${scope.declaringClass.name}.${scope.name()}'/></div>
    	</#list>				
	</div>	
	<div>
		<p><@orcid.msg 'orcid.frontend.web.oauth_is_secure'/>.<a href="${aboutUri}/footer/privacy-policy" target="_blank"><@orcid.msg 'public-layout.privacy_policy'/></a>.</p>
	</div>			
	<div id="login-buttons" ng-init="loadAndInitAuthorizationForm('${scopesString}','${redirect_uri}','${client_id}','${response_type}')">                     		            		               					
		<button class="btn btn-primary" name="authorize" value="<@orcid.msg 'confirm-oauth-access.Authorize'/>" ng-click="authorize()">
			<@orcid.msg 'confirm-oauth-access.Authorize' />
		</button>		                 	            
		<button class="btn btn-primary" name="deny" value="<@orcid.msg 'confirm-oauth-access.Deny'/>" ng-click="deny()">
			<@orcid.msg 'confirm-oauth-access.Deny' />
		</button>
	</div>					


				
				
		    
	</div>
	</@security.authorize>
</div>
</@base>