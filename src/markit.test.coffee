# Test our plugin using DocPad's Testers
require('docpad').require('testers')
					.test(
						# Test configuration
						{
							outExpectedPath : __dirname+'/../test/out-expected-no-highlighter'
							pluginPath      : __dirname+'/..',
							pluginName      : 'markit',
							testerClass     : 'RendererTester'
							testerName      : 'Markit withhout using highlighter.js'
						}

						# Docpad configuration
						{
							plugins:
								markit:
									useHighlighter: false
						}
					)
					.test(
						# Test configuration
						{
							outExpectedPath : __dirname+'/../test/out-expected-default-highlighter'
							pluginPath      : __dirname+'/..',
							pluginName      : 'markit',
							testerName      : 'Markit using highlighter.js'
						}

						# Docpad configuration
						{
							plugins:
								markit:
									useHighlighter: true
						}
					)
					.test(
						# Test configuration
						{
							outExpectedPath : __dirname+'/../test/out-expected-custom-wrapper'
							pluginPath      : __dirname+'/..',
							pluginName      : 'markit',
							testerName      : 'Markit using highlighter.js and a custom wrapper'
						}

						# Docpad configuration
						{
							plugins:
								markit:
									highlighterWrapper : '<pre class="test"><code>{{code}}</code></pre>'
									useHighlighter     : true
						}
					)
					.test(
						# Test configuration
						{
							outExpectedPath : __dirname+'/../test/out-expected-default-highlighter'
							pluginPath      : __dirname+'/..',
							pluginName      : 'markit',
							testerName      : 'Markit using highlighter.js and an empty custom wrapper'
						}

						# Docpad configuration
						{
							plugins:
								markit:
									highlighterWrapper : ''
									useHighlighter     : true
						}
					)
					.test(
						# Test configuration
						{
							outExpectedPath : __dirname+'/../test/out-expected-default-highlighter'
							pluginPath      : __dirname+'/..',
							pluginName      : 'markit',
							testerName      : 'Markit using highlighter.js and a non-string custom wrapper'
						}

						# Docpad configuration
						{
							plugins:
								markit:
									highlighterWrapper : true
									useHighlighter     : true
						}
					)
