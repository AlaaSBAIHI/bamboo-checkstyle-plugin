<html>
	<head>
		<title> [@ui.header pageKey='CheckStyle' object='${build.name} ${buildResults.buildNumber}' title=true /]</title>
		<meta name="tab" content="checkstyle"/>
	</head>
	<body>
    [#assign customDataMap=buildResults.buildResultsSummary.customBuildData /]
    
<style type="text/css">
    #summary-table {
        width: auto;
    }

    #summary-table {
        margin-top: 10px;
        margin-left: 2px;
    }

    #summary-table th {
        font-weight: bold;
        text-align: center;
    }

    #summary-table th.textLeft {
        text-align: left;
    }

    .textRight {
        text-align: right;
    }

    #summary-table tr.High th {
        background-color: #ff9999;
        color: #000;
        text-align: left;
    }

    #summary-table tr.High td {
        background-color: #ff9999;
        color: #000;
        text-align: right;
    }

    #summary-table tr.Medium th {
        background-color: #ffcc99;
        color: #000;
        text-align: left;
    }

    #summary-table tr.Medium td {
        background-color: #ffcc99;
        color: #000;
        text-align: right;
    }

    #summary-table tr.Low th {
        background-color: #ffffcc;
        color: #000;
        text-align: left;
    }

    #summary-table tr.Low td {
        background-color: #ffffcc;
        color: #000;
        text-align: right;
    }

    #summary-table tr td.vio {
        background-color: #ff9999;
        color: #000000;
    }

    #summary-table tr td.fixed {
        background-color: #a6dba6;
        color: #000000;
    }

    .width70 {
        width: 70%;
    }

    .width30 {
        width: 30%;
    }

    .width20 {
        width: 20%;
    }
</style>

    [@ui.bambooSection title="Summary"]
    <table class="aui" id="summary-table">
        <tr>
            <th>Priority</th>
            <th>Violations</th>
            <th>&Delta; Delta</th>
        </tr>

        <tr class="High">
            <th><b>ERROR</b></th>
            <td class="width20">${customDataMap.CHECKSTYLE_ERROR_PRIORITY_VIOLATIONS?if_exists}</td>
            <td class="width20">${customDataMap.CHECKSTYLE_ERROR_VIOLATION_DELTA?if_exists}</td>
        </tr>

        <tr class="Medium">
            <th><b>WARNING</b></th>
            <td class="width20">${customDataMap.CHECKSTYLE_WARNING_PRIORITY_VIOLATIONS?if_exists}</td>
            <td class="width20">${customDataMap.CHECKSTYLE_WARNING_VIOLATION_DELTA?if_exists}</td>
        </tr>

        <tr class="Low">
            <th><b>INFO</b></th>
            <td class="width20">${customDataMap.CHECKSTYLE_INFO_PRIORITY_VIOLATIONS?if_exists}</td>
            <td class="width20">${customDataMap.CHECKSTYLE_INFO_VIOLATION_DELTA?if_exists}</td>
        </tr>

        <tr>
            <th class="textLeft">TOTAL</th>
            <td class="width20 textRight">${customDataMap.CHECKSTYLE_TOTAL_VIOLATIONS?if_exists}</td>
            <td class="width20 textRight">${customDataMap.CHECKSTYLE_TOTAL_VIOLATION_DELTA?if_exists}</td>
        </tr>
    </table>
    [/@ui.bambooSection]

    [#if !topViolations.isEmpty()]
    [@ui.bambooSection title="Violations"]
    <table class="aui">
      [#if !topViolations.isEmpty()]
          <tr>
              <th>File</th>
              <th>Violations</th>
          </tr>
          [#list topViolations as violationInformation]
              <tr>
              [#if violationInformation.fileName?contains("http://")]
                  <td class="vio" title="${violationInformation.fileName?split("#")?last}"><a href="${violationInformation.fileName}">${violationInformation.fileName?split("#")?last}</a></td>
              [#else]
                   <td class="vio" title="${violationInformation.fileName?split("#")?last}">${violationInformation.fileName?split("#")?last?split("/")?last}</td>
              [/#if]
                  <td class="vio textRight">${violationInformation.numberOfViolations?string('0')}</td>
              </tr>
          [/#list]
      [#else]
          <tr>
              <td>No violators found.</td>
          </tr>
      [/#if]
    </table>
    [/@ui.bambooSection]
    [/#if]
	</body>
</html>