module.exports = (grunt) ->
	grunt.initConfig
		pkg: grunt.file.readJSON "package.json"
		concat:
			options:
				separator: ";"

			dist:
				src: ["src/**/*.js"]
				dest: "dist/<%= pkg.name %>.js"

		uglify:
			options:
				banner: "/*! <%= pkg.name %> v<%= pkg.version %>_<%= grunt.template.today(\"dd-mm-yyyy\") %> */\n"

			# Remove console from dev
			production:
				options:
					beautify: true
					compress:
						"drop_console": true
				files:
					"dist/media.soundcloud.js": ["dist/media.soundcloud.dev.js"]

			# Minified production
			minify:
				options:
					compress:
						"drop_console": true
				files:
					"dist/media.soundcloud.min.js": ["dist/media.soundcloud.js"]

		jshint:
			files: ["Gruntfile.js", "dist/**/*.js", "test/**/*.js"]
			options:

				# options here to override JSHint defaults
				globals:
					jQuery: true
					console: true
					module: true
					document: true

		watch:
			sources:
				files: ["src/*.coffee", "example/*.jade"]
				tasks: ["coffee_jshint", "compile"]
				options: livereload: true

		coffee:
			options:
				bare: true
			compile:
				files:
					"dist/media.soundcloud.dev.js": "src/media.soundcloud.coffee"

		jade:
			compile:
				files:
					"example/index.html": "example/index.jade"

		karma:
			options:
				configFile: "test/karma.conf.coffee"

			watch: {}
			single:
				singleRun: true

			# Test the compiled and uglified lib
			singleProduction:
				singleRun: true
				options:
					files: [
						"test/ressources/*.js"
						"test/ressources/*.html"
						"dist/media.soundcloud.min.js"
						"test/unit/**-spec.coffee"
					]


		coffee_jshint:
			options:
				globals:[
					"SC"
					"URI"
					"videojs"
					"window"
					"document"
					"module"
					"console"
				]
			source:
				src: "src/**/*.coffee"
			gruntfile:
				src: "Gruntfile.coffee"


	grunt.loadNpmTasks "grunt-contrib-coffee"
	grunt.loadNpmTasks "grunt-coffee-jshint"
	grunt.loadNpmTasks "grunt-contrib-uglify"
	grunt.loadNpmTasks "grunt-contrib-watch"
	grunt.loadNpmTasks "grunt-contrib-concat"
	grunt.loadNpmTasks "grunt-contrib-jade"
	grunt.loadNpmTasks "grunt-karma"

	#
	grunt.registerTask "compile", [
					"coffee"
					"uglify"
				]

	# Make the example/index.html usable
	grunt.registerTask "example", [
					"jade"
					"compile"
				]

	# Runs tests on the dev source and then compiled source
	grunt.registerTask "test", [
					"karma:single"
					"compile"
					"karma:singleProduction"
				]

	#
	grunt.registerTask "default", [
					"coffee_jshint"
					"test"
				]