
url = require 'url'
querystring = require 'querystring'


module.exports = (app) ->
  
  app.get '/', (req, res, next) ->
    res.render 'index'
  
  app.get '/pay/:address', (req, res, next) ->
    
    GET = url.parse(req.url, true).query
    GET.address = req.params.address
    queryParts = []
    for k, i in ['address', 'amount', 'label', 'message']
      if GET[k]
        queryParts.push(k + "=" + querystring.escape(GET[k]))
    
    res.render 'pay', locals:
      queryParts: queryParts,
      options: [
        {
          name: "webcoin.bitcoinjs.org"
        }
        {
          name: "instawallet.org"
        }
        {
          name: "Custom: "
          input: true
        }
      ]
  
  app.get '/logos', (req, res, next) ->
    res.render 'logos'
  