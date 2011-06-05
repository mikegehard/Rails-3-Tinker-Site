# See http://guides.sproutcore20.com/getting_started.html

window.Todos = SC.Application.create()

Todos.Todo = SC.Object.extend(
  title: null
  isDone: false
)

Todos.todosController = SC.ArrayProxy.create(
  content: [],
  createTodo: (title) ->
    todo = Todos.Todo.create {title: title}
    this.pushObject todo
  remaining: ( ->
    @filterProperty('isDone', false).get('length')
  ).property '@each.isDone'
  clearCompletedTodos: ->
    @filterProperty('isDone', true).forEach(@removeObject, @)
  allAreDone: ( (key, value) ->
    if value?
      @setEach('isDone', value)
      value
    else
      (@get 'length') && (@everyProperty 'isDone', true)
  ).property '@each.isDone'
)

Todos.CreateTodoView = SC.TextField.extend(
  insertNewline: ->
    value = @get 'value'

    if value?
      Todos.todosController.createTodo value
      @set 'value', ''
)

Todos.StatsView = SC.View.extend(
  remainingBinding: 'Todos.todosController.remaining',

  remainingString: ( ->
    remaining = @get('remaining')
    remaining + ' items'
  ).property 'remaining'
)