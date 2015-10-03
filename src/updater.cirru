
var
  Immutable $ require :immutable

var bind $ \ (v k) (k v)

= exports.updateNode $ \ (tree coord text)
  tree.setIn coord text

= exports.removeNode $ \ (tree coord)
  tree.deleteIn coord

= exports.insertBefore $ \ (tree coord node)
  cond (> coord.length 0)
    bind (- coord.length 1) $ \ (lastPointer)
      var
        lastCoord $ . coord lastPointer
        initCoord $ coord.slice 0 lastPointer
      tree.updateIn initCoord $ \ (target)
        target.splice lastPointer 0 node
    , tree

= exports.insertAfter $ \ (tree coord node)
  cond (> coord.length 0)
    bind (- coord.length 1) $ \ (lastPointer)
      var
        lastPointer $ - coord.length 1
        lastCoord $ . coord lastPointer
        initCoord $ coord.slice 0 lastPointer
      tree.updateIn initCoord $ \ (target)
        target.splice (+ lastPointer 1) 0 node
    , tree

= exports.prepend $ \ (tree coord node)
  tree.updateIn coord $ \ (target)
    target.unshift node

= exports.append $ \ (tree coord node)
  tree.updateIn coord $ \ (target)
    target.push node

= exports.foldNode $ \ (tree coord)
  tree.updateIn coord $ \ (target)
    Immutable.List $ [] target

= exports.unfoldBranch $ \ (tree coord)
  var
    lastPointer $ - coord.length 1
    lastCoord $ . coord lastPointer
    initCoord $ coord.slice 0 lastPointer
  tree.updateIn initCoord $ \ (target)
    var
      nodesBefore $ target.slice 0 lastCoord
      targetBranch $ target.get lastCoord
      nodesAfter $ target.slice (+ lastCoord 1)
    nodesBefore.concat targetBranch nodesAfter
