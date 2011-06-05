(function() {
  window.Todos = SC.Application.create();
  Todos.Todo = SC.Object.extend({
    title: null,
    isDone: false
  });
  Todos.todosController = SC.ArrayProxy.create({
    content: [],
    createTodo: function(title) {
      var todo;
      todo = Todos.Todo.create({
        title: title
      });
      return this.pushObject(todo);
    },
    remaining: (function() {
      return this.filterProperty('isDone', false).get('length');
    }).property('@each.isDone'),
    clearCompletedTodos: function() {
      return this.filterProperty('isDone', true).forEach(this.removeObject, this);
    },
    allAreDone: (function(key, value) {
      if (value != null) {
        this.setEach('isDone', value);
        return value;
      } else {
        return (this.get('length')) && (this.everyProperty('isDone', true));
      }
    }).property('@each.isDone')
  });
  Todos.CreateTodoView = SC.TextField.extend({
    insertNewline: function() {
      var value;
      value = this.get('value');
      if (value != null) {
        Todos.todosController.createTodo(value);
        return this.set('value', '');
      }
    }
  });
  Todos.StatsView = SC.View.extend({
    remainingBinding: 'Todos.todosController.remaining',
    remainingString: (function() {
      var remaining;
      remaining = this.get('remaining');
      return remaining + ' items';
    }).property('remaining')
  });
}).call(this);
