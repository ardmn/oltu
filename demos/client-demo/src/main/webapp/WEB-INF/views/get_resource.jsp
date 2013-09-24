<%--

          Copyright 2010 Newcastle University

             http://research.ncl.ac.uk/smart/

    Licensed to the Apache Software Foundation (ASF) under one or more
    contributor license agreements.  See the NOTICE file distributed with
    this work for additional information regarding copyright ownership.
    The ASF licenses this file to You under the Apache License, Version 2.0
    (the "License"); you may not use this file except in compliance with
    the License.  You may obtain a copy of the License at

         http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%--@elvariable id="oauthParams" type="org.apache.oltu.oauth2.client.demo.model.OAuthParams"--%>

<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <title>Apache Oltu - OAuth V2.0 Client Application</title>
  </head>

  <body>
    <div class="container">
      <h1>Apache Oltu - Sample OAuth V2.0 Client Application</h1>

      <h2>Web Server Flow</h2>

      <h3>Step 3. Get Resource</h3></p>

      <c:if test="${!empty oauthParams.errorMessage}">
        <div class="alert alert-danger">${oauthParams.errorMessage}</div>
      </c:if>

      <form:form commandName="oauthParams" action="/get_resource">
        <table class="table table-striped">
          <tr>
            <td>Required OAuth parameters:</td>
          </tr>
          <tr>
            <td>Resource URL:</td>
            <td><form:input size="70" path="resourceUrl" /></td>
          </tr>
          <tr>
            <td>Authenticated Request Type:</td>
            <td>
              <form:select path="requestType">
                <form:option value="headerField" />
                <form:option value="queryParameter" />
                <form:option value="bodyParameter" />
              </form:select>
            </td>
          </tr>
          <tr>
            <td>Request Method:</td>
            <td>
              <form:select path="requestMethod">
                <form:option value="GET" />
                <form:option value="POST" />
              </form:select>
            </td>
          </tr>
          <tr>
            <td>Access Token:</td>
            <td><form:input size="70" path="accessToken" readonly="true" /></td>
          </tr>
          <tr>
            <td>Expires In:</td>
            <td><form:input size="70" path="expiresIn" readonly="true" /></td>
          </tr>
          <tr>
            <td>Refresh Token:</td>
            <td><form:input size="70" path="refreshToken" readonly="true" /></td>
          </tr>
          <tr>
            <td>Requested Access Scope</td>
            <td><form:input size="70" path="scope" readonly="true" /></td>
          </tr>
          <tr>
            <td>End-User Authorization URL:</td>
            <td><form:input size="70" path="authzEndpoint" readonly="true" /></td>
          </tr>
          <tr>
            <td>Token Endpoint:</td>
            <td><form:input size="70" path="tokenEndpoint" readonly="true" /></td>
          </tr>
          <tr>
            <td>Client ID:</td>
            <td><form:input size="70" path="clientId" readonly="true" /></td>
          </tr>
          <tr>
            <td>Client Secret:</td>
            <td><form:input size="70" path="clientSecret" readonly="true" /></td>
          </tr>
          <tr>
            <td>Redirect URI:</td>
            <td><form:input size="70" path="redirectUri" readonly="true" /></td>
          </tr>
          <tr>
            <td>Client State:</td>
            <td><form:input size="70" path="state" readonly="true" /></td>
          </tr>
          <tr>
            <td colspan="2">
              <form:hidden path="application" />
              <input type="submit" class="btn btn-primary" value="Get Resource" />
            </td>
          </tr>
        </table>
      </form:form>

      <form:form commandName="oauthParams" action="/get_resource">
        <h4>OpenId Connect</h4>

        <table class="table table-striped">
          <tr>
            <td>ID Token:</td>
            <td><form:input size="70" path="idToken" readonly="true" /></td>
            <td>
              <c:if test="${oauthParams.idTokenValid}">
                <font color="green">ID Token is valid</font>
              </c:if>
              <c:if test="${!oauthParams.idTokenValid}">
                <font color="red">ID Token is NOT valid</font>
              </c:if>
            </td>
          </tr>
          <tr>
            <td>Header:</td>
            <td><textarea rows="15" cols="80" disabled="true">${oauthParams.header}</textarea></td>
          </tr>
          <tr>
            <td>Claims Set:</td>
            <td><textarea rows="15" cols="80" disabled="true">${oauthParams.claimsSet}</textarea></td>
          </tr>
        </table>
      </form:form>

    </div>
  </body>

</html>
