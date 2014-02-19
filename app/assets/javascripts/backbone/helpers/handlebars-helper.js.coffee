window.Handlebars.registerHelper "select", (value, options) ->
  $el = $("<select />").html(options.fn(this))
  $el.find("[value='" + value + "']").attr selected: "selected"
  $el.html()
  
window.Handlebars.registerHelper "ifCond", (v1, operator, v2, options) ->
  switch operator
    when "=="
      (if (v1 is v2) then options.fn(this) else options.inverse(this))
    when "==="
      (if (v1 is v2) then options.fn(this) else options.inverse(this))
    when "<"
      (if (v1 < v2) then options.fn(this) else options.inverse(this))
    when "<="
      (if (v1 <= v2) then options.fn(this) else options.inverse(this))
    when ">"
      (if (v1 > v2) then options.fn(this) else options.inverse(this))
    when ">="
      (if (v1 >= v2) then options.fn(this) else options.inverse(this))
    when "&&"
      (if (v1 and v2) then options.fn(this) else options.inverse(this))
    when "||"
      (if (v1 or v2) then options.fn(this) else options.inverse(this))
    else
      options.inverse this