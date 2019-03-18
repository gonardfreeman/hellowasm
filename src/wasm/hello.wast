(module
 (import "env" "__memory_base" (global $__memory_base i32))
 (global $STACKTOP (mut i32) (i32.const 0))
 (global $STACK_MAX (mut i32) (i32.const 0))
 (export "__post_instantiate" (func $__post_instantiate))
 (export "_bar" (func $_bar))
 (func $_bar (; 0 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  ;;@ src/cpp/hello.c:4:0
  (local.set $2
   (i32.mul
    (local.get $0)
    (local.get $1)
   )
  )
  (local.get $2)
 )
 (func $__post_instantiate (; 1 ;) (; has Stack IR ;)
  (global.set $STACKTOP
   (global.get $__memory_base)
  )
  (global.set $STACK_MAX
   (i32.add
    (global.get $STACKTOP)
    (i32.const 5242880)
   )
  )
 )
)
