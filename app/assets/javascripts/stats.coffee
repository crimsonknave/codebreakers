$ ->
  stats = new Stats
  stats_field = $('.stats')
  stats_field.html(stats.calculate())

class Stats
  calculate: ->
    totals = @totals()
    table = "<table><tr><th>Count</th><th>Letters</th></tr><tr>"
    keys = _.keys(totals).sort().reverse()
    _.each(keys, (key)->
      table += "<tr><td>#{key}</td><td><ul>"
      _.each(totals[key], (val)->
        table += "<li>#{val}</li>"
      )
      table += "</ul></td></tr>"
    )
    table += "</table>"
    #_.values(_.mapObject(totals, (v, k)->
      #"#{k}: #{v}"
    #)).join(', ')


  totals: ->
    console.log 'asdf'
    totals = {}
    _.each(@counts(), (v, k)->
      if _.has(totals, v)
        totals[v].push k
      else
        totals[v] = [k]
    )
    console.log totals
    totals

  counts: ->
    ct = $.trim($('.cypher-text').text())
    counts = {}
    _.each('abcdefghijklmnopqrstuvwxyz'.split(''), (char)=>
      counts[char] = @count(ct, char)
    )
    console.log counts
    counts

  count: (string, char)->
    re = new RegExp(char, 'g')
    (string.match(re)||[]).length



