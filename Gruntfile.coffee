module.exports = (grunt) ->

  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    sass:
      styles:
        options:
          style: 'expanded'
          bundleExec: true
          sourcemap: 'none'
        files:
          'styles/simditor-emoji.css': 'styles/simditor-emoji.scss'
    coffee:
      src:
        options:
          bare: true
        files:
          'lib/simditor-emoji.js': 'src/simditor-emoji.coffee'
    watch:
      styles:
        files: ['styles/*.scss']
        tasks: ['sass']
      src:
        files: ['src/*.coffee']
        tasks: ['coffee:src']

  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['sass', 'coffee', 'watch']
