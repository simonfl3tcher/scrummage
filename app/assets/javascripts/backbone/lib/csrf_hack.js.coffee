Backbone.sync = ((original) ->
  (method, model, options) ->
    options.beforeSend = (xhr) ->
      xhr.setRequestHeader "X-CSRF-Token", App.csrfToken
      return

    original method, model, options
    return
)(Backbone.sync)