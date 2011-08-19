
fs = require 'fs'
express = require 'express'

PORT = process.env.PORT or 3000
DEBUG = ! process.env.PORT

if DEBUG
  console.log "HTTP..."
  app = express.createServer()
else
  console.log "HTTPS..."
  app = express.createServer {
    key:  fs.readFileSync "/home/a/btcio.pem"
    cert: fs.readFileSync "/home/a/btcio.crt"
  }

app.set 'views', "#{__dirname}/../views"
app.set 'view engine', 'jade'
app.use app.router
app.use express.static "#{__dirname}/../public"
if DEBUG
  app.use express.errorHandler {dumpExceptions: true, showStack: true}
else
  app.use express.errorHandler()

require('./app')(app)

app.listen PORT, () ->
  console.log "Listening on #{PORT}..."
