[![Build Status](https://travis-ci.org/tbusser/docpad-plugin-markit.svg?branch=master)](https://travis-ci.org/tbusser/docpad-plugin-markit)

# Markit Plugin for [DocPad](http://docpad.org)
This plugin will render files with the `.md` or `.markdown` extension using [markdown-it](https://github.com/markdown-it/markdown-it).

## Install
```
docpad install markit
```

## Configure
For information on customising your plugin configuration you can refer to the [DocPad FAQ](https://github.com/bevry/docpad/wiki/FAQ)

### Markit Options
The Markit plugin supports all the options supported by the [markdown-it](https://github.com/markdown-it/markdown-it) project except `highlight`. By default the following configuration is used:
```
breaks         : false        // Convert '\n' in paragraphs into <br>

html           : false        // Enable HTML tags in source

langPrefix     : 'language-'  // CSS language prefix for fenced blocks. Can be
                              // useful for external highlighters.

linkify        : false        // Autoconvert URL-like text to links

quotes         : '“”‘’'       // Double + single quotes replacement pairs, when
                              // typographer enabled, and smartquotes on.
							  // Could be either a String or an Array.

typographer    : false        // Enable some language-neutral replacement +
                              // quotes beautification

xhtmlOut       : false        // Use '/' to close single tags (<br />).
                              // This is only for full CommonMark compatibility.
```

In addition there are some Markit custom options. These are the default configurations for these options:
```
highlighterWrapper : null     // When useHighlighter is true this option can be
                              // used to specify a custom wrapper to be used by
                              // highlighter. Make sure the custom wrapper
                              // contains the string '{{code}}', this is where
                              // the result from highlighter.js will be inserted

plugins            : []       // Array of strings, each entry should be a
                              // markdown-it plugin in

useHighlighter     : false    // When 'true' markdown-it will use highlight.js
                              // for code blocks
```

### Using markdown-it Plugins
If you want to use markdown-it plugins you can do this by installing the package in your project and overwriting the plugins configuration option.

Plugin options are specified as configuration options using the plugin name with any dashes (-) converted to underscores (_).

#### Example
Say you want to use footnotes, markdown-it has a [plugin](https://github.com/markdown-it/markdown-it-footnote) for this. To enable this plugin you will first have to install the package. You can do this by running the following command from your project folder:
```
npm install --save-dev markdown-it-footnote
```
Now that the package is installed you need to let Markit know about the plugin. To do this you need to alter the `plugin` section of the docpad.coffee file.
```
docpadConfig:
	<whatever else is in your config>
	plugins:
		<the other plugins you need to configure>
		markit:
			plugins: ['markdown-it-footnote']
            markdown_it_footnote: {...}
```

## Credits
This project was based on the [Docpad plugin example](https://github.com/docpad/docpad-plugin-yourpluginname.git) project.

## License
This project is [MIT licensed](http://www.opensource.org/licenses/mit-license.php).
