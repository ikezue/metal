{exec} = require 'child_process'

# Installed globablly because Meteor complains about 'require' definition in
# local node_modules directory.
Rehab = require '/usr/local/share/npm/lib/node_modules/rehab'

task 'build', 'Build coffee2js using Rehab', sbuild = ->
  console.log "Building project from src/*.coffee to lib/metal.js"

  files = new Rehab().process './src'

  to_single_file = "--join lib/metal.js"
  from_files = "--compile #{files.join ' '}"

  exec "coffee --watch #{to_single_file} #{from_files}", (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr

task 'package', 'Write package JavaScript to ./.package', ->
  exec "mkdir -p .package && cp lib/metal.js .package/metal.js"

task 'test', 'Run unit tests with mocha-web', ->
  exec "METEOR_MOCHA_TEST_DIR=tests mrt"
