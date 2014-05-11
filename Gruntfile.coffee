module.exports = (grunt) ->

  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    sass:
      styles:
        options:
          style: 'expanded'
        files:
          'lib/simditor-emoji.css': 'src/simditor-emoji.scss'
    coffee:
      emoji:
        files:
          'lib/simditor-emoji.js': 'src/simditor-emoji.coffee'
    watch:
      styles:
        files: ['src/*.scss']
        tasks: ['sass']
      scripts:
        files: ['src/*.coffee']
        tasks: ['coffee']

  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['sass', 'coffee', 'watch']
