
var
  assert $ require :assert
  Immutable $ require :immutable

var
  updater $ require :./updater

var initialTree $ Immutable.fromJS $ []
  , :1 :2
  [] :3 :4
    [] :5 :6
      [] :7 :8
  [] :9 :0
  , :1 :2

var testUpdateNode $ \ ()
  console.info :testUpdateNode
  var
    result $ updater.updateNode initialTree ([] 2 1) :44
    expected $ initialTree.setIn ([] 2 1) :44
  assert.ok (Immutable.is result expected) :testUpdateNode

var testRemoveNode $ \ ()
  console.info :testRemoveNode
  var
    result $ updater.removeNode initialTree $ [] 2 1
    expected $ initialTree.deleteIn $ [] 2 1
  assert.ok (Immutable.is result expected) :testRemoveNode

var testInsertBefore $ \ ()
  console.log :testInsertBefore
  var
    result $ updater.insertBefore initialTree ([] 2 1) :33
    expected $ initialTree.setIn ([] 2)
      Immutable.fromJS $ [] :3 :33 :4
        [] :5 :6
          [] :7 :8
  assert.ok (Immutable.is result expected) :testInsertBefore

var testInsertAfter $ \ ()
  console.log :testInsertAfter
  var
    result $ updater.insertAfter initialTree ([] 2 1) :33
    expected $ initialTree.setIn ([] 2)
      Immutable.fromJS $ [] :3 :4 :33
        [] :5 :6
          [] :7 :8
  assert.ok (Immutable.is result expected) :testInsertAfter

var testPrepend $ \ ()
  console.log :testPrepend
  var
    result $ updater.prepend initialTree ([] 2 2 2) :88
    expected $ initialTree.setIn ([] 2 2 2)
      Immutable.fromJS $ [] :88 :7 :8
  assert.ok (Immutable.is result expected) :testPrepend

var testAppend $ \ ()
  console.log :testAppend
  var
    result $ updater.append initialTree ([] 2 2 2) :88
    expected $ initialTree.setIn ([] 2 2 2)
      Immutable.fromJS $ [] :7 :8 :88
  assert.ok (Immutable.is result expected) :testAppend

var testFoldNode $ \ ()
  console.log :testFoldNode
  var
    result $ updater.foldNode initialTree ([] 2 2 2)
    expected $ initialTree.setIn ([] 2 2 2)
      Immutable.fromJS $ [] $ [] :7 :8
  assert.ok (Immutable.is result expected) :testFoldNode

var testUnfoldBranch $ \ ()
  console.log :testUnfoldBranch
  var
    result $ updater.unfoldBranch initialTree ([] 2 2 2)
    expected $ initialTree.setIn ([] 2 2)
      Immutable.fromJS $ [] :5 :6 :7 :8
  assert.ok (Immutable.is result expected) :testUnfoldBranch

testUpdateNode
testRemoveNode
testInsertBefore
testInsertAfter
testPrepend
testAppend
testFoldNode
testUnfoldBranch
