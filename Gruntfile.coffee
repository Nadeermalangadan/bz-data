path = require 'path'

# Build configurations.
module.exports = (grunt) ->
    grunt.initConfig
        cmpnt: grunt.file.readJSON('bower.json'),
        banner: '/*! bzData v<%= cmpnt.version %> by Vitalii Savchuk(esvit666@gmail.com) - ' +
                    'https://github.com/esvit/bz-data - New BSD License */\n',
            
        # Deletes built file and temp directories.
        clean:
            working:
                src: [
                    'bz-data.*'
                ]

        uglify:
            # concat js files before minification
            js:
                src: ['src/scripts/*.js']
                dest: 'bz-data.js'
                options:
                  sourceMap: (fileName) ->
                    fileName.replace /\.js$/, '.map'

    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-uglify'

    grunt.registerTask 'default', [
        'clean'
        'uglify'
    ]
