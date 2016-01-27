'use strict'

angular.module 'trackerApp'


# Somma di una lista di valori, se è presente il campo 'field' è implicito che la lista di valori
# da sommare sia un field dell'oggetto 'obj' passato
.filter 'sum', ->
  (obj, field) ->
    if angular.isDefined(obj)
      if angular.isDefined(field)
        _.reduce(_.pluck(obj, field), (sum, n) -> sum + n)
      else
        _.reduce(obj, (sum, n) -> sum + n)
    else
      undefined

# Ritorna una stringa che rappresenta i valori della lista con il separatore selezionato
# Di default il separatore è la virgola
.filter 'dataList', ->
  (data, separator) ->
    toReturn = ""
    if angular.isDefined(data)
        _.forEach(data, (d) ->
          if toReturn == ""
            toReturn = d
          else
            if angular.isDefined(separator) && typeof separator == 'string'
              toReturn += separator + d
            else
              toReturn += ", " + d
        )
        toReturn
    else
      data

.filter 'groupBy', ->
  _.memoize((data, field) ->
    _.groupBy(data, field)
  )

.filter 'capitalize', ->
  (input, scope) ->
    if input != null
      input = input.toLowerCase()
    input.substring(0, 1).toUpperCase() + input.substring(1)

