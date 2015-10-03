
Cirru Tree Updater
----

> Core component for Cirru Editors

### Usage

```bash
npm i -g cirru-tree-updater
```

```coffee
updater = require 'cirru-tree-updater'
Immutable = require 'immutable'

initialTree = Immutable.fromJS [['1', ['2']]]
updater.updateNode initialTree, [0, 1], '3'
# => List [['1', ['3']]]
```

Methods:

```coffee
exports.updateNode = (tree, coord, text) ->
exports.removeNode = (tree, coord) ->
exports.insertBefore = (tree, coord, node) ->
exports.insertAfter = (tree, coord, node) ->
exports.prepend = (tree, coord, node) ->
exports.append = (tree, coord, node) ->
exports.foldNode = (tree, coord) ->
exports.unfoldBranch = (tree, coord) ->
```

### License

MIT
