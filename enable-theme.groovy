import org.codefirst.SimpleThemeDecorator
import jenkins.model.Jenkins
import hudson.model.PageDecorator
import org.jenkinsci.plugins.simpletheme.CssUrlThemeElement;

boolean enabled = Boolean.getBoolean("io.jenkins.themes.dark.enable")

if (enabled) {
    String themeUrl = "https://cdn.jsdelivr.net/gh/jenkinsci/dark-theme@master/theme.css"
    Jenkins.instance.getExtensionList(PageDecorator.class)
        .get(SimpleThemeDecorator.class).getElements()
            .add(new CssUrlThemeElement(themeUrl))
}
