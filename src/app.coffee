
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
      suffix: '?' + queryParts.join '&'
      queryParts: queryParts,
      options: [
        {
          name: "webcoin.ch"
          url: "https://webcoin.ch"
        }
        #{
        #  name: "Custom: "
        #  input: true
        #}
      ]
  
  app.get '/logos', (req, res, next) ->
    res.render 'logos'
  