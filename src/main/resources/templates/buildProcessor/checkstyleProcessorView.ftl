[#if build.buildDefinition.customConfiguration.get('custom.checkstyle.exists')?has_content]
    [@ui.bambooInfoDisplay titleKey='CheckStyle' float=false height='80px']
    [@ww.label label='CheckStyle Output Directory' ]
            [@ww.param name='value']${build.buildDefinition.customConfiguration.get('custom.checkstyle.path')?if_exists}[/@ww.param]
    [/@ww.label]
    [@ww.label label='Base HTML Site' ]
            [@ww.param name='value']${build.buildDefinition.customConfiguration.get('custom.checkstyle.site.url')?if_exists}[/@ww.param]
    [/@ww.label]
    
    [@ww.label label='CheckStyle Error Threshold' ]
            [@ww.param name='value']${build.buildDefinition.customConfiguration.get('custom.checkstyle.threshold.error')?if_exists}[/@ww.param]
    [/@ww.label]
    [@ww.label label='CheckStyle Warning Threshold' ]
            [@ww.param name='value']${build.buildDefinition.customConfiguration.get('custom.checkstyle.threshold.warning')?if_exists}[/@ww.param]
    [/@ww.label]
    [/@ui.bambooInfoDisplay]
[/#if]