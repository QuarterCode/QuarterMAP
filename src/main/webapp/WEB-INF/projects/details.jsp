<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Project <s:property value="project.name" /></title>
</head>
<body>
    <!-- Main content -->
    <div class="center">
        <table>
            <tr>
                <th>Source code</th>
                <td><a href="<s:property value="project.configuration.sourceRepository" />" target="_blank">Repository</a></td>
            </tr>
            <tr>
                <th>Continuous integration</th>
                <td><a href="<s:property value="project.configuration.continuousIntegrationJob" />" target="_blank">Job</a></td>
            </tr>
        </table>
    </div>
    <!-- Sidebar -->
    <s:if test="%{stable != null || latest != null}">
        <div class="sidebar">
            <h2 style="margin-top: 0;">Promoted Artifacts</h2>
            <s:if test="%{stable != null}">
                <s:a action="artifact?projectId=%{projectId}&version=%{stable.version}" title="View latest release" cssClass="boxlink green">
                    <span class="highlighted">Stable (Cycle <s:property value="stable.version.major" />.<s:property
                            value="stable.version.minor" />.x)
                    </span>
                    <br />
                    <span class="highlighted">Recommended</span>
                    <br />
                    <span>Version <s:property value="stable.version" /></span>
                </s:a>
            </s:if>
            <s:if test="%{latest != null}">
                <s:a action="artifact?projectId=%{projectId}&version=%{latest.version}" title="View latest preview" cssClass="boxlink red"
                    cssStyle="margin-top: 1.5em;">
                    <span class="highlighted">Latest (Cycle <s:property value="latest.version.major" />.<s:property
                            value="latest.version.minor" />.x)
                    </span>
                    <br />
                    <span class="highlighted">Development</span>
                    <br />
                    <span>Version <s:property value="latest.version" /></span>
                </s:a>
            </s:if>
            <h2>All Artifacts</h2>
            <s:a action="artifactList?projectId=%{projectId}" title="View all available artifacts" cssClass="boxlink">
                <span class="highlighted">Artifact List</span>
                <br />
                <span><s:property value="stats.artifactCount" /> artifacts</span>
            </s:a>
        </div>
    </s:if>
</body>
</html>