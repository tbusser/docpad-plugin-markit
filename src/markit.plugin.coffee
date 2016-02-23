# Export Plugin
module.exports = (BasePlugin) ->
	# Define Plugin
	class Markit extends BasePlugin
		# Plugin name
		name: 'markit'

		config:
			breaks: false
			html: false
			langPrefix: 'language-'
			linkify: false
			plugins: []
			quotes: '“”‘’'
			typographer: false
			useHighlighter: false
			xhtmlOut: false

		# Render
		# Called per document, for each extension conversion. Used to render one extension to another.
		render: (opts, next) ->
			# Prepare
			config = @config
			{inExtension,outExtension,file} = opts
			highlighter = null
			if config.useHighlighter
				hljs = require('highlight.js')
				highlighter = (str, lang) ->
					if lang && hljs.getLanguage lang
						try
						  result =  hljs.highlight lang, str, true
						  return result.value
						catch error
					return ''

			# Upper case the text document's content if it is using the convention txt.(uc|uppercase)
			if inExtension in ['md','markdown'] and outExtension in ['html',null]
				# Load markdown-it and pass the configuration options along
				markedIt = require('markdown-it')({
					breaks      : config.breaks
					highlight   : highlighter
					html        : config.html
					langPrefix  : config.langPrefix
					linkify     : config.linkify
					quotes      : config.quotes
					typographer : config.typographer
					xhtmlOut    : config.xhtmlOut
				})

				# Load the plugins defined by the docpad.coffee file
				for plugin in config.plugins
					markedIt.use(require(plugin))

				# Render the markdown content
				opts.content = markedIt.render opts.content
				next()
			else
				next()